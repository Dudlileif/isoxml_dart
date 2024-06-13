// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'version.g.dart';

/// An enumerator for the supported ISO 11783-10 XML major versions.
@annotation.XmlEnum()
enum VersionMajor {
  /// Version 3.X
  @annotation.XmlValue('3')
  three(3),

  /// Version 4.X
  @annotation.XmlValue('4')
  four(4);

  const VersionMajor(this.value);

  /// XML attribute value.
  final int value;
}

/// An enumerator for the supported ISO 11783-10 XML minor versions.
@annotation.XmlEnum()
enum VersionMinor {
  /// Version X.0
  @annotation.XmlValue('0')
  zero,

  /// Version X.1
  @annotation.XmlValue('1')
  one,

  /// Version X.2
  @annotation.XmlValue('2')
  two,

  /// Version X.3
  @annotation.XmlValue('3')
  three;
}
