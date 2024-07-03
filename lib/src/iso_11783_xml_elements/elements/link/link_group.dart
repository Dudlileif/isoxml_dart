// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element for grouping and describing [Link]s of the same [type] and with
/// the same [namespace].
@CopyWith()
@annotation.XmlRootElement(name: 'GP')
@annotation.XmlSerializable(createMixin: true)
class LinkGroup extends Iso11783Element with _$LinkGroupXmlSerializableMixin {
  /// Default factory for creating a [LinkGroup] with verified
  /// arguments.
  factory LinkGroup({
    required String id,
    required LinkGroupType type,
    List<Link>? links,
    String? manufacturerGLN,
    String? namespace,
    String? designator,
  }) {
    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
    if (manufacturerGLN != null) {
      ArgumentValidation.checkStringLength(
        manufacturerGLN,
        maxLength: 64,
        name: 'manufacturerGLN',
      );
    }
    if ((type == LinkGroupType.uniqueResolvableUris ||
            type == LinkGroupType.informationalResolvableUris) &&
        namespace == null) {
      throw ArgumentError.value(
        namespace,
        'namespace',
        "namespace can't be null when type is resolvable.",
      );
    }
    if (namespace != null) {
      ArgumentValidation.checkStringLength(
        namespace,
        maxLength: 255,
        name: 'namespace',
      );
    }
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }

    return LinkGroup._(
      id: id,
      type: type,
      links: links,
      manufacturerGLN: manufacturerGLN,
      namespace: namespace,
      designator: designator,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  LinkGroup._({
    required this.id,
    required this.type,
    List<Link>? links,
    this.manufacturerGLN,
    this.namespace,
    this.designator,
  }) : super(
          elementType: Iso11783ElementType.linkGroup,
          description: 'LinkGroup',
          onlyVersion4AndAbove: true,
        ) {
    if (links != null) {
      this.links.addAll(links);
    }
  }

  /// Creates a [LinkGroup] from [element].
  factory LinkGroup.fromXmlElement(XmlElement element) {
    final links = element.getElements('LNK');
    final id = element.getAttribute('A')!;
    final type = element.getAttribute('B')!;
    final manufacturerGLN = element.getAttribute('C');
    final namespace = element.getAttribute('D');
    final designator = element.getAttribute('E');
    return LinkGroup(
      links: links?.map(Link.fromXmlElement).toList(),
      id: id,
      type: $LinkGroupTypeEnumMap.entries
          .singleWhere(
            (linkGroupTypeEnumMapEntry) =>
                linkGroupTypeEnumMapEntry.value == type,
            orElse: () => throw ArgumentError(
              '''`$type` is not one of the supported values: ${$LinkGroupTypeEnumMap.values.join(', ')}''',
            ),
          )
          .key,
      manufacturerGLN: manufacturerGLN,
      namespace: namespace,
      designator: designator,
    );
  }

  /// Regular expression matching pattern for the [id] of [LinkGroup]s.
  static const staticIdRefPattern = '(LGP|LGP-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of the [Link]s in this.
  @annotation.XmlElement(name: 'LNK')
  final List<Link> links = [];

  /// Unique identifier for this link group.
  ///
  /// Records generated on MICS have negative IDs.
  @override
@annotation.XmlAttribute(name: 'A')
  final String id;


  /// What type of identifiers/[Link.value]s are used with the [links].
  @annotation.XmlAttribute(name: 'B')
  final LinkGroupType type;

  /// GS1 Global Location Number for the manufacturer.
  @annotation.XmlAttribute(name: 'C')
  final String? manufacturerGLN;

  /// Namespace for resolvable [LinkGroupType.uniqueResolvableUris] and
  /// [LinkGroupType.informationalResolvableUris].
  ///
  /// This is a prefix that should be applied to the [Link.value] of the
  /// [links].
  ///
  /// If [type] is [LinkGroupType.uniqueResolvableUris] the URI up to and
  /// including the last colon must be included.
  @annotation.XmlAttribute(name: 'D')
  final String? namespace;

  /// Name of the link group, description or comment.
  @annotation.XmlAttribute(name: 'E')
  final String? designator;

  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
        for (final a in links.map((e) => e.selfWithRecursiveChildren)) ...a,
      ];

  @override
  List<Object?> get props => super.props
    ..addAll([
      links,
      id,
      type,
      manufacturerGLN,
      namespace,
      designator,
    ]);

}

/// An enumerator for which type of external object key a [LinkGroup] uses.
@annotation.XmlEnum()
enum LinkGroupType {
  /// Universally Unique IDentifiers, UUID v4 (random) only.
  @annotation.XmlValue('1')
  uuids(1, 'UUIDs'),

  /// Manufacturer proprietary values. A valid manufacturer GLN is required for
  /// this.
  @annotation.XmlValue('2')
  manufacturerProprietary(2, 'Manufacturer Proprietary'),

  /// Unique resolvable URIs. GS1 codes, the full link value is the
  /// concatenation of [LinkGroup.namespace] and [Link.value].
  @annotation.XmlValue('3')
  uniqueResolvableUris(3, 'Unique Resolvable URIs'),

  /// Information resolvable URIs. Disjoint set of information link, the full
  /// link value is the concatenation of [LinkGroup.namespace] and [Link.value].
  @annotation.XmlValue('4')
  informationalResolvableUris(4, 'Informational Resolvable URIs'),
  ;

  const LinkGroupType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
