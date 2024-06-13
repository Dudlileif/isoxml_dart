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
    ArgumentValidation.checkId(id: id, idRefPattern: idRefPattern);
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
  const LinkGroup._({
    required this.id,
    required this.type,
    this.links,
    this.manufacturerGLN,
    this.namespace,
    this.designator,
  }) : super(
          tag: Iso11783XmlTag.linkGroup,
          description: 'LinkGroup',
          onlyVersion4AndAbove: true,
        );

  /// Creates a [LinkGroup] from [element].
  factory LinkGroup.fromXmlElement(XmlElement element) =>
      _$LinkGroupFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [LinkGroup]s.
  static const idRefPattern = '(LGP|LGP-)([0-9])+';

  /// A list of the [Link]s in this.
  @annotation.XmlElement(name: 'LNK')
  final List<Link>? links;

  /// Unique identifier for this link group.
  ///
  /// Records generated on MICS have negative IDs.
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