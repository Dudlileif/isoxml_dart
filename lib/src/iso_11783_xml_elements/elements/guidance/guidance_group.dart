// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element for grouping [GuidancePattern]s and a boundary [Polygon] used for
/// guidance.
///
/// The [patterns] are intended to be used simultaneously.
@CopyWith()
@annotation.XmlRootElement(name: 'GGP')
@annotation.XmlSerializable(createMixin: true)
class GuidanceGroup extends Iso11783Element
    with _$GuidanceGroupXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [GuidanceGroup] with verified
  /// arguments.
  factory GuidanceGroup({
    required String id,
    List<GuidancePattern>? patterns,
    Polygon? boundaryPolygon,
    String? designator,
    List<XmlAttribute>? customAttributes,
  }) {
    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }

    return GuidanceGroup._(
      id: id,
      patterns: patterns,
      boundaryPolygon: boundaryPolygon,
      designator: designator,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  GuidanceGroup._({
    required this.id,
    List<GuidancePattern>? patterns,
    this.boundaryPolygon,
    this.designator,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.guidanceGroup,
         description: 'GuidanceGroup',
         onlyVersion4AndAbove: true,
       ) {
    if (patterns != null) {
      this.patterns.addAll(patterns);
    }
  }

  /// Creates a [GuidanceGroup] from [element].
  factory GuidanceGroup.fromXmlElement(XmlElement element) {
    final patterns = element.getElements('GPN');
    final boundaryPolygon = element.getElement('PLN');
    final id = element.getAttribute('A')!;
    final designator = element.getAttribute('B');
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return GuidanceGroup(
      patterns: patterns?.map(GuidancePattern.fromXmlElement).toList(),
      boundaryPolygon: boundaryPolygon != null
          ? Polygon.fromXmlElement(boundaryPolygon)
          : null,
      id: id,
      designator: designator,
      customAttributes: customAttributes,
    );
  }

  /// Regular expression matching pattern for the [id] of [GuidanceGroup]s.
  static const staticIdRefPattern = '(GGP|GGP-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of [GuidancePattern]s for this.
  @annotation.XmlElement(name: 'GPN')
  final List<GuidancePattern> patterns = [];

  /// Boundary [Polygon] for this.
  @annotation.XmlElement(name: 'PLN', includeIfNull: false)
  final Polygon? boundaryPolygon;

  /// Unique identifier for this guidance group.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the guidance group, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String? designator;

  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
    ...[
      for (final a in patterns.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
    if (boundaryPolygon != null) ...boundaryPolygon!.selfWithRecursiveChildren,
  ];

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$GuidanceGroupBuildXmlChildren(this, builder, namespaces: namespaces);
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
    final attributes = _$GuidanceGroupToXmlAttributes(
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
    patterns,
    boundaryPolygon,
    id,
    designator,
  ];
}
