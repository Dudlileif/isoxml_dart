// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes the `LINKLIST.xml` file that contains [LinkGroup]s
/// with [Link]s to associate [Iso11783Element]s with external objects outside
/// the scope of ISO 11783.
class Iso11783LinkList extends Iso11783Element with _DocumentMixin {
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
      linkGroups: linkGroups ?? const [],
      taskControllerManufacturer: taskControllerManufacturer,
      taskControllerVersion: taskControllerVersion,
      fileVersion: fileVersion,
    );
  }

  /// Creates an [Iso11783LinkList] from [document].
  factory Iso11783LinkList.fromXmlDocument(XmlDocument document) {
    final element = document.getElement(Iso11783ElementType.linkList.xmlTag)!;
    return Iso11783LinkList._fromXmlElement(element);
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  Iso11783LinkList._({
    required VersionMajor versionMajor,
    required VersionMinor versionMinor,
    required String managementSoftwareManufacturer,
    required String managementSoftwareVersion,
    required DataTransferOrigin dataTransferOrigin,
    List<LinkGroup>? linkGroups,
    String? taskControllerManufacturer,
    String? taskControllerVersion,
    String? fileVersion,
  }) : super(elementType: _elementType) {
    this.versionMajor = versionMajor;
    this.versionMinor = versionMinor;
    this.managementSoftwareManufacturer = managementSoftwareManufacturer;
    this.managementSoftwareVersion = managementSoftwareVersion;
    this.dataTransferOrigin = dataTransferOrigin;
    this.taskControllerManufacturer = taskControllerManufacturer;
    this.taskControllerVersion = taskControllerVersion;
    this.fileVersion = fileVersion;
    this.linkGroups.addAll(linkGroups);
  }

  Iso11783LinkList._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    linkGroups.addAll(
      xmlElement
          .findElements(Iso11783ElementType.linkGroup.xmlTag)
          .map(LinkGroup._fromXmlElement)
          .toList(),
    );
    _argumentValidator();
  }

  void _argumentValidator() {
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
        taskControllerManufacturer!,
        name: 'taskControllerManufacturer',
      );
    }
    if (taskControllerVersion != null) {
      ArgumentValidation.checkStringLength(
        taskControllerVersion!,
        name: 'taskControllerVersion',
      );
    }
    if (fileVersion != null) {
      ArgumentValidation.checkStringLength(
        fileVersion!,
        name: 'fileVersion',
      );
    }
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.linkList;

  /// A structured XML document that represents this.
  XmlDocument toXmlDocument() => XmlDocument([
    XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
    xmlElement.copy(),
  ]);

  /// A list of [LinkGroup]s of this.
  late final linkGroups = _XmlSyncedList<LinkGroup>(xmlElement: xmlElement);

  /// Version of the `LINKLIST.xml` file
  String? get fileVersion => tryParseString('FileVersion');
  set fileVersion(String? value) => setStringNullable('FileVersion', value);
}
