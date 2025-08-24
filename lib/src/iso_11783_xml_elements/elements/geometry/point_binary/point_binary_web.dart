// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:isoxml_dart/iso_11783_xml_elements.dart';
import 'package:isoxml_dart/src/lossy_web_int64.dart';

/// Extension for parsing [binaryPoints] from [byteData] and in reverse
/// exporting the byte data of the same points.
///
/// When compiling to WASM the normal int64 methods are used, but when compiling
/// to js the [LossyWebInt64] methods are used to circumvent problems with
/// values > 2^53 and the lack of int64 support.
extension PointBinaryParser on Point {
  /// Parses [binaryPoints] from [byteData] with [binaryHeaderOptions].
  void parseData() {
    if (byteData != null &&
        binaryHeaderOptions != null &&
        binaryRecordLength != null) {
      const compileTarget = bool.fromEnvironment('dart.tool.dart2wasm')
          ? _WebCompileTarget.wasm
          : _WebCompileTarget.js;
      binaryPoints.clear();
      var currentOffset = 0;
      final data = byteData!.buffer.asByteData(0, byteData!.lengthInBytes);

      while (currentOffset + binaryRecordLength! <= data.lengthInBytes) {
        final parsedType = binaryHeaderOptions!.readType
            ? PointType.values.firstWhereOrNull(
                (type) => type.value == data.getUint8(currentOffset),
              )
            : type;
        if (binaryHeaderOptions!.readType) {
          currentOffset++;
        }

        final parsedNorth = binaryHeaderOptions!.readNorth
            ? switch (compileTarget) {
                    _WebCompileTarget.wasm => data.getInt64(
                      currentOffset,
                      Endian.little,
                    ),
                    _WebCompileTarget.js => data.getDoubleFromTwoInt32(
                      currentOffset,
                      Endian.little,
                    ),
                  } /
                  1e16
            : north;
        if (binaryHeaderOptions!.readNorth) {
          currentOffset += 8;
        }

        final parsedEast = binaryHeaderOptions!.readEast
            ? switch (compileTarget) {
                    _WebCompileTarget.wasm => data.getInt64(
                      currentOffset,
                      Endian.little,
                    ),
                    _WebCompileTarget.js => data.getDoubleFromTwoInt32(
                      currentOffset,
                      Endian.little,
                    ),
                  } /
                  1e16
            : east;
        if (binaryHeaderOptions!.readEast) {
          currentOffset += 8;
        }

        final parsedUp = binaryHeaderOptions!.readUp
            ? data.getInt32(currentOffset, Endian.little)
            : up;
        if (binaryHeaderOptions!.readUp) {
          currentOffset += 4;
        }

        final parsedColour = binaryHeaderOptions!.readColour
            ? data.getUint8(currentOffset)
            : colour;
        if (binaryHeaderOptions!.readColour) {
          currentOffset += 1;
        }

        final parsedHorizontalAccuracy =
            binaryHeaderOptions!.readHorizontalAccuracy
            ? data.getUint16(currentOffset, Endian.little) / 1e3
            : horizontalAccuracy;
        if (binaryHeaderOptions!.readHorizontalAccuracy) {
          currentOffset += 2;
        }
        final parsedVerticalAccuracy = binaryHeaderOptions!.readVerticalAccuracy
            ? data.getUint16(currentOffset, Endian.little) / 1e3
            : verticalAccuracy;
        if (binaryHeaderOptions!.readVerticalAccuracy) {
          currentOffset += 2;
        }

        binaryPoints.add(
          Point(
            type: parsedType,
            north: parsedNorth,
            east: parsedEast,
            up: parsedUp,
            colour: parsedColour,
            horizontalAccuracy: parsedHorizontalAccuracy,
            verticalAccuracy: parsedVerticalAccuracy,
          ),
        );
      }
    }
  }

  /// Convert the [binaryPoints] to bytes for exporting/saving to a binary file.
  Uint8List? get binaryPointsBytes {
    final recordLength = binaryRecordLength;
    if (binaryHeaderOptions != null && recordLength != null) {
      const compileTarget = bool.fromEnvironment('dart.tool.dart2wasm')
          ? _WebCompileTarget.wasm
          : _WebCompileTarget.js;
      final length = binaryPoints.length * recordLength;
      final byteData = ByteData(length);
      var currentOffset = 0;
      for (final point in binaryPoints) {
        if (binaryHeaderOptions!.readType) {
          byteData.setUint8(
            currentOffset,
            point.type!.value,
          );
          currentOffset++;
        }
        if (binaryHeaderOptions!.readNorth) {
          switch (compileTarget) {
            case _WebCompileTarget.wasm:
              byteData.setInt64(
                currentOffset,
                (point.north! * 1e16).round(),
                Endian.little,
              );
            case _WebCompileTarget.js:
              byteData.setTwoInt32FromDouble(
                currentOffset,
                point.north! * 1e16,
                Endian.little,
              );
          }
          currentOffset += 8;
        }
        if (binaryHeaderOptions!.readEast) {
          switch (compileTarget) {
            case _WebCompileTarget.wasm:
              byteData.setInt64(
                currentOffset,
                (point.east! * 1e16).round(),
                Endian.little,
              );
            case _WebCompileTarget.js:
              byteData.setTwoInt32FromDouble(
                currentOffset,
                point.east! * 1e16,
                Endian.little,
              );
          }
          currentOffset += 8;
        }
        if (binaryHeaderOptions!.readUp) {
          byteData.setInt32(currentOffset, point.up ?? 0, Endian.little);
          currentOffset += 4;
        }
        if (binaryHeaderOptions!.readColour) {
          byteData.setUint8(currentOffset, point.colour!);
          currentOffset++;
        }
        if (binaryHeaderOptions!.readHorizontalAccuracy) {
          byteData.setUint16(
            currentOffset,
            ((point.horizontalAccuracy ?? 0) * 1e3).round(),
            Endian.little,
          );
          currentOffset += 2;
        }
        if (binaryHeaderOptions!.readVerticalAccuracy) {
          byteData.setUint16(
            currentOffset,
            ((point.verticalAccuracy ?? 0) * 1e3).round(),
            Endian.little,
          );
          currentOffset += 2;
        }
      }
      return byteData.buffer.asUint8List(0, currentOffset);
    }
    return null;
  }
}

enum _WebCompileTarget { js, wasm }
