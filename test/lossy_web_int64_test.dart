// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

@TestOn('vm')
library;

import 'dart:typed_data';

import 'package:isoxml_dart/src/iso_11783_xml_elements/utils/lossy_web_int64.dart';
import 'package:test/test.dart';

void main() {
  test(
    '''Convert to and from lossy values equals using Int64 and Float64 with Endian.little''',
    () {
      var value = 0.1234657890123456789 * 1e16;
      final byteData = ByteData(24)
        ..setTwoInt32FromDouble(0, value, Endian.little)
        ..setInt64(8, value.toInt(), Endian.little)
        ..setFloat64(16, value, Endian.little);

      expect(
        byteData,
        isA<ByteData>()
            .having(
              (byteData) =>
                  byteData.getDoubleFromTwoInt32(0, Endian.little) / 1e16,
              'Lossy value is correct',
              equals(0.1234657890123456),
            )
            .having(
              (byteData) => byteData.getInt64(8, Endian.little) / 1e16,
              'Int64 based value is correct',
              equals(0.1234657890123456),
            )
            .having(
              (byteData) =>
                  byteData.getFloat64(16, Endian.little).floor() / 1e16,
              'Float64 based value is correct',
              equals(0.1234657890123456),
            ),
      );

      value = -150.1234657890123456789 * 1e16;
      byteData
        ..setTwoInt32FromDouble(0, value, Endian.little)
        ..setInt64(8, value.toInt(), Endian.little)
        ..setFloat64(16, value, Endian.little);

      expect(
        byteData,
        isA<ByteData>()
            .having(
              (byteData) =>
                  byteData.getDoubleFromTwoInt32(0, Endian.little) / 1e16,
              'Lossy value is correct',
              equals(-150.12346578901236),
            )
            .having(
              (byteData) => byteData.getInt64(8, Endian.little) / 1e16,
              'Int64 based value is correct',
              equals(-150.12346578901236),
            )
            .having(
              (byteData) => byteData.getFloat64(16, Endian.little) / 1e16,
              'Float64 based value is correct',
              equals(-150.12346578901236),
            ),
      );
    },
  );

  test(
    '''Convert to and from lossy values equals using Int64 and Float64 with Endian.big''',
    () {
      var value = 0.1234657890123456789 * 1e16;
      final byteData = ByteData(24)
        ..setTwoInt32FromDouble(0, value)
        ..setInt64(8, value.toInt())
        ..setFloat64(16, value);

      expect(
        byteData,
        isA<ByteData>()
            .having(
              (byteData) => byteData.getDoubleFromTwoInt32(0) / 1e16,
              'Lossy value is correct',
              equals(0.1234657890123456),
            )
            .having(
              (byteData) => byteData.getInt64(8) / 1e16,
              'Int64 based value is correct',
              equals(0.1234657890123456),
            )
            .having(
              (byteData) => byteData.getFloat64(16).floor() / 1e16,
              'Float64 based value is correct',
              equals(0.1234657890123456),
            ),
      );

      value = -150.1234657890123456789 * 1e16;
      byteData
        ..setTwoInt32FromDouble(0, value)
        ..setInt64(8, value.toInt())
        ..setFloat64(16, value);

      expect(
        byteData,
        isA<ByteData>()
            .having(
              (byteData) => byteData.getDoubleFromTwoInt32(0) / 1e16,
              'Lossy value is correct',
              equals(-150.12346578901236),
            )
            .having(
              (byteData) => byteData.getInt64(8) / 1e16,
              'Int64 based value is correct',
              equals(-150.12346578901236),
            )
            .having(
              (byteData) => byteData.getFloat64(16) / 1e16,
              'Float64 based value is correct',
              equals(-150.12346578901236),
            ),
      );
    },
  );
}
