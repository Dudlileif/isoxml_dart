// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element for grouping and describing [Link]s of the same [type] and with
/// the same [namespace].
class LinkGroup extends Iso11783Element {
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
    _argumentValidator(
      id: id,
      type: type,
      links: links,
      manufacturerGLN: manufacturerGLN,
      namespace: namespace,
      designator: designator,
    );

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
    required String id,
    required LinkGroupType type,
    List<Link>? links,
    String? manufacturerGLN,
    String? namespace,
    String? designator,
  }) : super._(elementType: _elementType) {
    this.id = id;
    this.type = type;
    this.manufacturerGLN = manufacturerGLN;
    this.namespace = namespace;
    this.designator = designator;
    this.links.addAll(links);
  }

  LinkGroup._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    links.addAll(
      xmlElement
          .findElements(Iso11783ElementType.link.xmlTag)
          .map(Link._fromXmlElement)
          .toList(),
    );
    _argumentValidator(
      id: id,
      type: type,
      links: links,
      manufacturerGLN: manufacturerGLN,
      namespace: namespace,
      designator: designator,
    );
  }

  static void _argumentValidator({
    required String id,
    required LinkGroupType type,
    required List<Link>? links,
    required String? manufacturerGLN,
    required String? namespace,
    required String? designator,
  }) {
    ArgumentValidation.checkId(
      id: id,
      idRefPattern: staticIdRefPattern,
      name: 'LinkGroup.id',
    );
    if (manufacturerGLN != null) {
      ArgumentValidation.checkStringLength(
        manufacturerGLN,
        maxLength: 64,
        name: 'LinkGroup.manufacturerGLN',
      );
    }
    if ((type == LinkGroupType.uniqueResolvableUris ||
            type == LinkGroupType.informationalResolvableUris) &&
        namespace == null) {
      throw ArgumentError.value(
        namespace,
        'LinkGroup.namespace',
        "namespace can't be null when type is resolvable.",
      );
    }
    if (namespace != null) {
      ArgumentValidation.checkStringLength(
        namespace,
        maxLength: 255,
        name: 'LinkGroup.namespace',
      );
    }
    if (designator != null) {
      ArgumentValidation.checkStringLength(
        designator,
        name: 'LinkGroup.designator',
      );
    }
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.linkGroup;

  /// Regular expression matching pattern for the [id] of [LinkGroup]s.
  static const staticIdRefPattern = '(LGP|LGP-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of the [Link]s in this.
  late final links = _XmlSyncedList<Link>(
    xmlElement: xmlElement,
    xmlTag: Link._elementType.xmlTag,
  );

  /// Unique identifier for this link group.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// What type of identifiers/[Link].value are used wiyth the [links].
  LinkGroupType get type => LinkGroupType.values.firstWhere(
    (type) => type.value == parseInt('B'),
    orElse: () => throw ArgumentError.value(
      xmlElement.getAttribute('B'),
      'LinkGroup.type',
      '''is not one of the supported values: ${LinkGroupType.values.join(', ')}''',
    ),
  );
  set type(LinkGroupType value) => setInt('B', value.value);

  /// GS1 Global Location Number for the manufacturer.
  String? get manufacturerGLN => tryParseString('C');
  set manufacturerGLN(String? value) => setStringNullable('C', value);

  /// Namespace for resolvable [LinkGroupType.uniqueResolvableUris] and
  /// [LinkGroupType.informationalResolvableUris].
  ///
  /// This is a prefix that should be applied to the [Link].value of the
  /// [links].
  ///
  /// If [type] is [LinkGroupType.uniqueResolvableUris] the URI up to and
  /// including the last colon must be included.
  String? get namespace => tryParseString('D');
  set namespace(String? value) => setStringNullable('D', value);

  /// Name of the link group, description or comment.
  String? get designator => tryParseString('E');
  set designator(String? value) => setStringNullable('E', value);
}

/// An enumerator for which type of external object key a [LinkGroup] uses.
enum LinkGroupType {
  /// Universally Unique IDentifiers, UUID v4 (random) only.
  uuids(1, 'UUIDs'),

  /// Manufacturer proprietary values. A valid manufacturer GLN is required for
  /// this.
  manufacturerProprietary(2, 'Manufacturer Proprietary'),

  /// Unique resolvable URIs. GS1 codes, the full link value is the
  /// concatenation of [LinkGroup.namespace] and [Link].value.
  uniqueResolvableUris(3, 'Unique Resolvable URIs'),

  /// Information resolvable URIs. Disjoint set of information link, the full
  /// link value is the concatenation of [LinkGroup.namespace] and [Link].value.
  informationalResolvableUris(4, 'Informational Resolvable URIs');

  const LinkGroupType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
