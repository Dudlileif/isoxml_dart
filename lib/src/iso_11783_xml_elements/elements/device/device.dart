// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a complete device, like a machine or sensor
/// system.
///
/// Each [Device] shall have at least one [DeviceElement] in [elements].
@CopyWith()
@annotation.XmlRootElement(name: 'DVC')
@annotation.XmlSerializable(createMixin: true)
class Device extends Iso11783Element
    with _$DeviceXmlSerializableMixin, EquatableMixin {
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
    List<XmlAttribute>? customAttributes,
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
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  Device._({
    required this.id,
    required this.clientNAME,
    required this.structureLabel,
    required this.localizationLabel,
    required List<DeviceElement>? elements,
    List<DeviceProperty>? properties,
    List<DeviceProcessData>? processData,
    List<DeviceValuePresentation>? valuePresentations,
    this.designator,
    this.softwareVersion,
    this.serialNumber,
    super.customAttributes,
  }) : super(elementType: Iso11783ElementType.device, description: 'Device') {
    if (elements != null) {
      this.elements.addAll(elements);
    }
    if (properties != null) {
      this.properties.addAll(properties);
    }
    if (processData != null) {
      this.processData.addAll(processData);
    }
    if (valuePresentations != null) {
      this.valuePresentations.addAll(valuePresentations);
    }
  }

  /// Creates a [Device] from [element].
  factory Device.fromXmlElement(XmlElement element) {
    final elements = element.getElements('DET')!;
    final processData = element.getElements('DPD');
    final properties = element.getElements('DPT');
    final valuePresentations = element.getElements('DVP');
    final id = element.getAttribute('A')!;
    final designator = element.getAttribute('B');
    final softwareVersion = element.getAttribute('C');
    final clientNAME = element.getAttribute('D')!;
    final serialNumber = element.getAttribute('E');
    final structureLabel = element.getAttribute('F')!;
    final localizationLabel = element.getAttribute('G')!;
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return Device(
      elements: elements.map(DeviceElement.fromXmlElement).toList(),
      processData: processData?.map(DeviceProcessData.fromXmlElement).toList(),
      properties: properties?.map(DeviceProperty.fromXmlElement).toList(),
      valuePresentations: valuePresentations
          ?.map(DeviceValuePresentation.fromXmlElement)
          .toList(),
      id: id,
      designator: designator,
      softwareVersion: softwareVersion,
      clientNAME: clientNAME,
      serialNumber: serialNumber,
      structureLabel: structureLabel,
      localizationLabel: localizationLabel,
      customAttributes: customAttributes,
    );
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
  @annotation.XmlElement(name: 'DET')
  final List<DeviceElement> elements = [];

  /// A list of the [DeviceProcessData]s of this.
  @annotation.XmlElement(name: 'DPD')
  final List<DeviceProcessData> processData = [];

  /// A list of the [DeviceProperty]s of this.
  @annotation.XmlElement(name: 'DPT')
  final List<DeviceProperty> properties = [];

  /// A list of the [DeviceValuePresentation]s of this.
  @annotation.XmlElement(name: 'DVP')
  final List<DeviceValuePresentation> valuePresentations = [];

  /// Unique identifier for this device.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the device, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String? designator;

  /// Software version of the device.
  @annotation.XmlAttribute(name: 'C')
  final String? softwareVersion;

  /// Client NAME of the device.
  ///
  /// See ISO 11783-5 for description of NAME.
  @annotation.XmlAttribute(name: 'D')
  final String clientNAME;

  /// Serial number of the device.
  @annotation.XmlAttribute(name: 'E')
  final String? serialNumber;

  /// Label of device description structure.
  @annotation.XmlAttribute(name: 'F')
  final String structureLabel;

  /// Label of device description localization.
  ///
  /// Bytes 1 to 6 are defined by the Language Command PGN (see ISO 11783-7).
  /// Byte 7 is reserved and set to `FF`"
  @annotation.XmlAttribute(name: 'G')
  final String localizationLabel;

  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
    ...[
      for (final a in elements.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
    ...[
      for (final a in processData.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
    ...[
      for (final a in properties.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
    ...[
      for (final a in valuePresentations.map(
        (e) => e.selfWithRecursiveChildren,
      ))
        ...a,
    ],
  ];

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$DeviceBuildXmlChildren(this, builder, namespaces: namespaces);
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
    final attributes = _$DeviceToXmlAttributes(
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
    elements,
    processData,
    properties,
    valuePresentations,
    id,
    designator,
    softwareVersion,
    clientNAME,
    serialNumber,
    structureLabel,
    localizationLabel,
  ];
}
