// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a complete device, like a machine or sensor
/// system.
///
/// Each [Device] shall have at least one [DeviceElement] in [elements].
class Device extends Iso11783Element {
  /// Default factory for creating a [Device] with verified
  /// arguments.
  factory Device({
    required String id,
    required String clientNAME,
    required String structureLabel,
    required String localizationLabel,
    required List<DeviceElement>? elements,
    List<DeviceProperty>? properties,
    List<DeviceProcessData>? processData,
    List<DeviceValuePresentation>? valuePresentations,
    String? designator,
    String? softwareVersion,
    String? serialNumber,
  }) {
    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
    ArgumentValidation.checkHexStringLength(
      clientNAME,
      name: 'clientNAME',
      minBytes: 8,
      maxBytes: 8,
    );
    ArgumentValidation.checkId(
      id: structureLabel,
      idRefPattern: structureLabelPattern,
      minLength: 14,
      maxLength: 78,
      idName: 'structureLabel',
    );
    ArgumentValidation.checkId(
      id: localizationLabel,
      idRefPattern: localizationLabelPattern,
      minLength: 14,
      idName: 'localizationLabel',
    );
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }

    if (elements!.isEmpty) {
      throw ArgumentError.value(
        elements,
        'elements',
        'Can not be empty',
      );
    }

    return Device._(
      id: id,
      clientNAME: clientNAME,
      structureLabel: structureLabel,
      localizationLabel: localizationLabel,
      designator: designator,
      softwareVersion: softwareVersion,
      serialNumber: serialNumber,
      elements: elements,
      properties: properties ?? const [],
      processData: processData ?? const [],
      valuePresentations: valuePresentations ?? const [],
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  Device._({
    required String id,
    required String clientNAME,
    required String structureLabel,
    required String localizationLabel,
    required List<DeviceElement>? elements,
    List<DeviceProperty>? properties,
    List<DeviceProcessData>? processData,
    List<DeviceValuePresentation>? valuePresentations,
    String? designator,
    String? softwareVersion,
    String? serialNumber,
  }) : super(elementType: Iso11783ElementType.device, description: 'Device') {
    this.id = id;
    this.clientNAME = clientNAME;
    this.structureLabel = structureLabel;
    this.localizationLabel = localizationLabel;
    this.designator = designator;
    this.softwareVersion = softwareVersion;
    this.serialNumber = serialNumber;
    if (elements != null) {
      children.addAll(elements);
    }
    if (properties != null) {
      children.addAll(properties);
    }
    if (processData != null) {
      children.addAll(processData);
    }
    if (valuePresentations != null) {
      children.addAll(valuePresentations);
    }
  }

  /// Regular expression matching pattern for the [id] of [Device]s.
  static const staticIdRefPattern = '(DVC|DVC-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Regular expression matching pattern for structure labels.
  static const structureLabelPattern =
      '''((([0-9]|[a-e]|[A-E])([0-9]|[a-f]|[A-F]))|((F|f)([0-9]|[a-e]|[A-E]))){7}(([0-9]|[a-f]|[A-F])([0-9]|[a-f]|[A-F]))*''';

  /// Regular expression matchin pattern for localization labels.
  static const localizationLabelPattern =
      '''(F|f){2}((([0-9]|[A-E]|[a-e])([0-9]|[A-F]|[a-f]))|((F|f)([0-9]|[A-E]|[a-e])))*''';

  /// A list of the [DeviceElement]s of this.
  List<DeviceElement> get elements => findElements(
    Iso11783ElementType.deviceElement.xmlTag,
  ).map((e) => e as DeviceElement).toList();

  /// A list of the [DeviceProcessData]s of this.
  List<DeviceProcessData> get processData => findElements(
    Iso11783ElementType.deviceProcessData.xmlTag,
  ).map((e) => e as DeviceProcessData).toList();

  /// A list of the [DeviceProperty]s of this.
  List<DeviceProperty> get properties => findElements(
    Iso11783ElementType.deviceProperty.xmlTag,
  ).map((e) => e as DeviceProperty).toList();

  /// A list of the [DeviceValuePresentation]s of this.
  List<DeviceValuePresentation> get valuePresentations => findElements(
    Iso11783ElementType.deviceValuePresentation.xmlTag,
  ).map((e) => e as DeviceValuePresentation).toList();

  /// Unique identifier for this device.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Name of the device, description or comment.
  String? get designator => tryParseString('B');
  set designator(String? value) => setStringNullable('B', value);

  /// Software version of the device.
  String? get softwareVersion => tryParseString('C');
  set softwareVersion(String? value) => setStringNullable('C', value);

  /// Client NAME of the device.
  ///
  /// See ISO 11783-5 for description of NAME.
  String get clientNAME => parseString('D');
  set clientNAME(String value) => setString('D', value);

  /// Serial number of the device.
  String? get serialNumber => tryParseString('E');
  set serialNumber(String? value) => setStringNullable('E', value);

  /// Label of device description structure.
  String get structureLabel => parseString('F');
  set structureLabel(String value) => setString('F', value);

  /// Label of device description localization.
  ///
  /// Bytes 1 to 6 are defined by the Language Command PGN (see ISO 11783-7).
  /// Byte 7 is reserved and set to `FF`"
  String get localizationLabel => parseString('G');
  set localizationLabel(String value) => setString('G', value);
}
