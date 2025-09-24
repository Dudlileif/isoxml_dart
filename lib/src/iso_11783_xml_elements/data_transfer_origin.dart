// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part 'data_transfer_origin.g.dart';

/// An enumerator for the creation origin of XML task data files.
enum DataTransferOrigin {
  /// Farm Management software, typically computer or web browser.
  ///
  /// IDs generated with this will be positive.
  fmis(1, 'FMIS, Farming Software'),

  /// Machine terminal.
  ///
  /// IDs generated with this will be negative.
  mics(2, 'MICS, Machine Terminal');

  const DataTransferOrigin(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
