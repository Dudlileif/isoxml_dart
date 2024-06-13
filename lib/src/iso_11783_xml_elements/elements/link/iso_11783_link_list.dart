// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes the `LINKLIST.xml` file that contains [LinkGroup]s
/// with [Link]s to associate [Iso11783Element]s with external objects outside
/// the scope of ISO 11783.
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
          tag: Iso11783XmlTag.linkList,
          description: 'ISO 11783 Link List File',
          onlyVersion4AndAbove: true,
        );

  /// Creates an [Iso11783LinkList] from [element].
  factory Iso11783LinkList.fromXmlElement(XmlElement element) =>
      _$Iso11783LinkListFromXmlElement(element);

  /// Creates an [Iso11783LinkList] from [document].
  static Iso11783LinkList? fromXmlDocument(XmlDocument document) {
    final element = document.getElement(Iso11783XmlTag.linkList.name);
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
