// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
import 'package:collection/collection.dart';
import 'package:xml/xml.dart';

/// An extension on iterables of [XmlAttribute] to make common filtering
/// operations easier.
extension XmlAttritubeFilter on Iterable<XmlAttribute> {
  /// Returns a list of [XmlAttribute] that have names that are not on the form
  /// `A`, `B`, `C` etc. If no such attributes exits, null is returned.
  List<XmlAttribute>? get nonSingleAlphabeticNames {
    final list = whereNot(
      (attribute) => const [
        'A',
        'B',
        'C',
        'D',
        'E',
        'F',
        'G',
        'H',
        'I',
        'J',
        'K',
        'L',
        'M',
        'N',
        'O',
        'P',
        'Q',
        'R',
        'S',
        'T',
        'U',
        'V',
        'W',
        'X',
        'Y',
        'Z',
      ].contains(attribute.name.local),
    ).toList();
    return list.isNotEmpty ? list : null;
  }
}
