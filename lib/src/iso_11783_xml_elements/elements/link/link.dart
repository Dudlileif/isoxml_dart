// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that links an [Iso11783Element] with an external object outside
/// the scope of ISO 11783.
///
/// The link value type is determined by the parent [LinkGroup.type], and the
/// full link value may be a concatenation with prefix [LinkGroup.namespace].

class Link extends Iso11783Element {
  /// Default factory for creating a [Link] with verified
  /// arguments.
  factory Link({
    required String objectIdRef,
    required String linkValue,
    String? designator,
  }) {
    _argumentValidator(
      objectIdRef: objectIdRef,
      linkValue: linkValue,
      designator: designator,
    );

    return Link._(
      objectIdRef: objectIdRef,
      linkValue: linkValue,
      designator: designator,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  Link._({
    required String objectIdRef,
    required String linkValue,
    String? designator,
  }) : super._(elementType: _elementType) {
    this.objectIdRef = objectIdRef;
    this.linkValue = linkValue;
    this.designator = designator;
  }

  Link._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    _argumentValidator(
      objectIdRef: objectIdRef,
      linkValue: linkValue,
      designator: designator,
    );
  }

  static void _argumentValidator({
    required String objectIdRef,
    required String linkValue,
    required String? designator,
  }) {
    ArgumentValidation.checkId(
      id: objectIdRef,
      idRefPattern: objectIdRefPattern,
      name: 'Link.objectIdRef',
    );
    ArgumentValidation.checkStringLength(
      linkValue,
      maxLength: 255,
      name: 'Link.linkValue',
    );
    if (designator != null) {
      ArgumentValidation.checkStringLength(
        designator,
        name: 'Link.designator',
      );
    }
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.link;

  /// Regular expression matching pattern for the [objectIdRef].
  static const objectIdRefPattern =
      '''(AFE|BSN|CCT|CCG|CCL|CLD|CTP|CVT|CPC|CTR|DET|DVC|FRM|GGP|GPN|LSG|OTQ|PFD|PNT|PLN|PDT|PGP|TLG|TSK|VPN|WKR)(|-)([0-9])+''';

  /// Reference to another object ([Iso11783Element]).
  String get objectIdRef => parseString('A');
  set objectIdRef(String value) => setString('A', value);

  /// Identifier for the object.
  String get linkValue => parseString('B');
  set linkValue(String value) => setString('B', value);

  /// Name of the link, description or comment.
  String? get designator => tryParseString('C');
  set designator(String? value) => setStringNullable('C', value);
}
