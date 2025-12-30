// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:typed_data';

/// 2^32
int _twoPow32 = 4294967296;

/// An extension on [ByteData] for storing doubles in a way that is compatible
/// with Int64 reading and setting.
///
/// The method is lossy vs operating with
/// straight Int64 when the value is above 2^53, but the loss is deemed
/// neglibigle for this project.
///
/// This was inspired by these libraries in the stdlib-js:
/// [github.com/stdlib-js/number-float64-base-from-int64-bytes]
/// [github.com/stdlib-js/number-float64-base-to-int64-bytes]
extension LossyWebInt64 on ByteData {
  /// The (possibly negative) float represented by the eight bytes at
  /// the specified [byteOffset] in this object, in two's complement 32 bit
  /// binary form.
  ///
  /// The [byteOffset] must be non-negative, and
  /// `byteOffset + 8` must be less than or equal to the length of this object.
  double getDoubleFromTwoInt32(
    int byteOffset, [
    Endian endian = Endian.big,
  ]) {
    var low = switch (endian) {
      Endian.little => getInt32(byteOffset, endian),
      Endian.big || _ => getInt32(byteOffset + 4, endian),
    };
    if (low < 0) low += _twoPow32;
    final high = switch (endian) {
      Endian.little => getInt32(byteOffset + 4, endian),
      Endian.big || _ => getInt32(byteOffset, endian),
    };

    return (low + high * _twoPow32).toDouble();
  }

  /// Sets the eight bytes starting at the specified [byteOffset] in this
  /// object to the two's complement 32 bit binary representation of the
  /// specified [value.
  ///
  /// The [byteOffset] must be non-negative, and
  /// `byteOffset + 8` must be less than or equal to the length of this object.
  void setTwoInt32FromDouble(
    int byteOffset,
    double value, [
    Endian endian = Endian.big,
  ]) {
    final low = value.toInt() & 0xFFFFFFFF;
    final high = (value / _twoPow32).floor();

    switch (endian) {
      case Endian.little:
        setInt32(byteOffset, low, endian);
        setInt32(byteOffset + 4, high, endian);
      case Endian.big:
        setInt32(byteOffset, high, endian);
        setInt32(byteOffset + 4, low, endian);
    }
  }
}
