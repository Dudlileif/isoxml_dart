// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:typed_data';

import 'package:isoxml_dart/iso_11783_xml_elements.dart';

/// Extension for parsing [binaryPoints] from [byteData] and in reverse
/// exporting the byte data of the same points.
extension PointBinaryParser on Point {
  /// Parses [binaryPoints] from [byteData] with [binaryHeaderOptions].
  void parseData() {}

  /// Convert the [binaryPoints] to bytes for exporting/saving to a binary file.
  Uint8List? get binaryPointsBytes => null;
}
