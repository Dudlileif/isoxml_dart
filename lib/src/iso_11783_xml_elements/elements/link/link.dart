// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that links an [Iso11783Element] with an external object outside
/// the scope of ISO 11783.
///
/// The link value type is determined by the parent [LinkGroup.type], and the
/// full link value may be a concatenation with prefix [LinkGroup.namespace].
@CopyWith()
@annotation.XmlRootElement(name: 'LNK')
@annotation.XmlSerializable(createMixin: true)
class Link extends Iso11783Element
    with _$LinkXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [Link] with verified
  /// arguments.
  factory Link({
    required String objectIdRef,
    required String value,
    String? designator,
    List<XmlAttribute>? customAttributes,
  }) {
    ArgumentValidation.checkId(
      id: objectIdRef,
      idRefPattern: objectIdRefPattern,
      idName: 'objectIdRef',
    );
    ArgumentValidation.checkStringLength(value, maxLength: 255, name: 'value');
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }
    return Link._(
      objectIdRef: objectIdRef,
      value: value,
      designator: designator,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const Link._({
    required this.objectIdRef,
    required this.value,
    this.designator,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.link,
         description: 'Link',
         onlyVersion4AndAbove: true,
       );

  /// Creates a [Link] from [element].
  factory Link.fromXmlElement(XmlElement element) {
    final objectIdRef = element.getAttribute('A')!;
    final value = element.getAttribute('B')!;
    final designator = element.getAttribute('C');
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return Link(
      objectIdRef: objectIdRef,
      value: value,
      designator: designator,
      customAttributes: customAttributes,
    );
  }

  /// Regular expression matching pattern for the [objectIdRef].
  static const objectIdRefPattern =
      '''(AFE|BSN|CCT|CCG|CCL|CLD|CTP|CVT|CPC|CTR|DET|DVC|FRM|GGP|GPN|LSG|OTQ|PFD|PNT|PLN|PDT|PGP|TLG|TSK|VPN|WKR)(|-)([0-9])+''';

  /// Reference to another object ([Iso11783Element]).
  @annotation.XmlAttribute(name: 'A')
  final String objectIdRef;

  /// Identifier for the object.
  @annotation.XmlAttribute(name: 'B')
  final String value;

  /// Name of the link, description or comment.
  @annotation.XmlAttribute(name: 'C')
  final String? designator;

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$LinkBuildXmlChildren(this, builder, namespaces: namespaces);
    if (customAttributes != null && customAttributes!.isNotEmpty) {
      for (final attribute in customAttributes!) {
        builder.attribute(attribute.name.local, attribute.value);
      }
    }
  }

  /// Returns a list of the XML attributes of this.
  @override
  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    final attributes = _$LinkToXmlAttributes(
      this,
      namespaces: namespaces,
    );
    if (customAttributes != null) {
      attributes.addAll(customAttributes!);
    }
    return attributes;
  }

  @override
  List<Object?> get props => [
    objectIdRef,
    value,
    designator,
  ];
}
