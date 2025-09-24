// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part 'version.g.dart';

/// An enumerator for the supported ISO 11783-10 XML major versions.
enum VersionMajor {
  /// Version 3.X
  three(3),

  /// Version 4.X
  four(4);

  const VersionMajor(this.value);

  /// XML attribute value.
  final int value;
}

/// An enumerator for the supported ISO 11783-10 XML minor versions.
enum VersionMinor {
  /// Version X.0
  zero(0),

  /// Version X.1
  one(1),

  /// Version X.2
  two(2),

  /// Version X.3
  three(3);

  const VersionMinor(this.value);

  /// XML attribute value.
  final int value;
}
