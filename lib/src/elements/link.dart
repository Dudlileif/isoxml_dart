// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that links an [Iso11783Element] to a usually unique identifier.
///
// TODO(dudlileif): Needs better documentation.
@CopyWith()
@annotation.XmlRootElement(name: 'LNK')
@annotation.XmlSerializable(createMixin: true)
class Link extends Iso11783Element with _$LinkXmlSerializableMixin {
  /// Default factory for creating a [Link] with verified
  /// arguments.
  factory Link({
    required String objectIdRef,
    required String value,
    String? designator,
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
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const Link._({
    required this.objectIdRef,
    required this.value,
    this.designator,
  }) : super(
          tag: Iso11783Tag.link,
          description: 'Link',
          onlyVersion4AndAbove: true,
        );

  /// Creates a [Link] from [element].
  factory Link.fromXmlElement(XmlElement element) =>
      _$LinkFromXmlElement(element);

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

  @override
  List<Object?> get props => super.props
    ..addAll([
      objectIdRef,
      value,
      designator,
    ]);
}

/// An element for grouping [Link]s of the same [type].
///
// TODO(dudlileif): Needs better documentation.
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
          tag: Iso11783Tag.linkGroup,
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

  /// Global Location Number for the manufacturer.
  @annotation.XmlAttribute(name: 'C')
  final String? manufacturerGLN;

  /// Namespace for this.
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

/// An enumerator for which type of identifier a [LinkGroup] should use.
@annotation.XmlEnum()
enum LinkGroupType {
  /// Universally Unique IDentifiers.
  @annotation.XmlValue('1')
  uuids(1, 'UUIDs'),

  /// Manufacturer proprietary values.
  @annotation.XmlValue('2')
  manufacturerProprietary(2, 'Manufacturer Proprietary'),

  /// Unique resolvable URIs.
  @annotation.XmlValue('3')
  uniqueResolvableUris(3, 'Unique Resolvable URIs'),

  /// Information resolvable URIs.
  @annotation.XmlValue('4')
  informationalResolvableUris(4, 'Informational Resolvable URIs'),
  ;

  const LinkGroupType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An element that describes the `LINKLIST.xml` file that contains [LinkGroup]s
/// with [Link]s to external files.
// TODO(dudlileif): Needs better documentation.
@CopyWith()
@annotation.XmlRootElement(name: 'ISO11783LinkList')
@annotation.XmlSerializable(createMixin: true)
class Iso11783LinkList extends Iso11783Element
    with _$Iso11783LinkListXmlSerializableMixin {
  /// Default factory for creating an [Iso11783LinkList] with verified
  /// arguments.
  factory Iso11783LinkList({
    required VersionMajor versionMajor,
    required VersionMinor versionMinor,
    required String managementSoftwareManufacturer,
    required String managementSoftwareVersion,
    required DataTransferOrigin dataTransferOrigin,
    List<LinkGroup>? linkGroups,
    String? taskControllerManufacturer,
    String? taskControllerVersion,
    String? fileVersion,
  }) {
    ArgumentValidation.checkStringLength(
      managementSoftwareManufacturer,
      name: 'managementSoftwareManufacturer',
    );
    ArgumentValidation.checkStringLength(
      managementSoftwareVersion,
      name: 'managementSoftwareVersion',
    );
    if (taskControllerManufacturer != null) {
      ArgumentValidation.checkStringLength(
        taskControllerManufacturer,
        name: 'taskControllerManufacturer',
      );
    }
    if (taskControllerVersion != null) {
      ArgumentValidation.checkStringLength(
        taskControllerVersion,
        name: 'taskControllerVersion',
      );
    }
    if (fileVersion != null) {
      ArgumentValidation.checkStringLength(
        fileVersion,
        name: 'fileVersion',
      );
    }

    return Iso11783LinkList._(
      versionMajor: versionMajor,
      versionMinor: versionMinor,
      managementSoftwareManufacturer: managementSoftwareManufacturer,
      managementSoftwareVersion: managementSoftwareVersion,
      dataTransferOrigin: dataTransferOrigin,
      linkGroups: linkGroups,
      taskControllerManufacturer: taskControllerManufacturer,
      taskControllerVersion: taskControllerVersion,
      fileVersion: fileVersion,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const Iso11783LinkList._({
    required this.versionMajor,
    required this.versionMinor,
    required this.managementSoftwareManufacturer,
    required this.managementSoftwareVersion,
    required this.dataTransferOrigin,
    this.linkGroups,
    this.taskControllerManufacturer,
    this.taskControllerVersion,
    this.fileVersion,
  }) : super(
          tag: Iso11783Tag.linkList,
          description: 'ISO 11783 Link List File',
          onlyVersion4AndAbove: true,
        );

  /// Creates an [Iso11783LinkList] from [element].
  factory Iso11783LinkList.fromXmlElement(XmlElement element) =>
      _$Iso11783LinkListFromXmlElement(element);

  /// Creates an [Iso11783LinkList] from [document].
  static Iso11783LinkList? fromXmlDocument(XmlDocument document) {
    final element = document.getElement(Iso11783Tag.linkList.name);
    if (element == null) {
      return null;
    }
    return Iso11783LinkList.fromXmlElement(element);
  }

  /// A list of [LinkGroup]s of this.
  @annotation.XmlElement(name: 'LGP')
  final List<LinkGroup>? linkGroups;

  /// Major version of the standard.
  @annotation.XmlAttribute(name: 'VersionMajor')
  final VersionMajor versionMajor;

  /// Minor version of the standard.
  @annotation.XmlAttribute(name: 'VersionMinor')
  final VersionMinor versionMinor;

  /// Name of the Management Software manufacturer.
  @annotation.XmlAttribute(name: 'ManagementSoftwareManufacturer')
  final String managementSoftwareManufacturer;

  /// Version of the Management Software.
  @annotation.XmlAttribute(name: 'ManagementSoftwareVersion')
  final String managementSoftwareVersion;

  /// Name of the Task Controller software.
  @annotation.XmlAttribute(name: 'TaskControllerManufacturer')
  final String? taskControllerManufacturer;

  /// Version of the Task Controller software.
  @annotation.XmlAttribute(name: 'TaskControllerVersion')
  final String? taskControllerVersion;

  /// Version of the `LINKLIST.xml` file
  @annotation.XmlAttribute(name: 'FileVersion')
  final String? fileVersion;

  /// The creation origin of this.
  @annotation.XmlAttribute(name: 'DataTransferOrigin')
  final DataTransferOrigin dataTransferOrigin;

  /// A structured XML document that represents this.
  XmlDocument toXmlDocument() {
    final builder = XmlBuilder()
      ..processing('xml', 'version="1.0" encoding="UTF-8"');
    builder.element(tag.name, nest: () => buildXmlChildren(builder));
    return builder.buildDocument();
  }

  @override
  List<Object?> get props => super.props
    ..addAll([
      linkGroups,
      versionMajor,
      versionMinor,
      managementSoftwareManufacturer,
      managementSoftwareVersion,
      taskControllerManufacturer,
      taskControllerVersion,
      fileVersion,
      dataTransferOrigin,
    ]);
}
