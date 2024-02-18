// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that describes a complete device, like a machine or sensor
/// system.
///
/// Each [Device] shall have at least one [DeviceElement] in [elements].
@CopyWith()
@annotation.XmlRootElement(name: 'DVC')
@annotation.XmlSerializable(createMixin: true)
class Device extends Iso11783Element with _$DeviceXmlSerializableMixin {
  /// Default factory for creating a [Device] with verified
  /// arguments.
  factory Device({
    required String id,
    required String clientNAME,
    required String structureLabel,
    required String localizationLabel,
    required List<DeviceElement> elements,
    List<DeviceProperty>? properties,
    List<DeviceProcessData>? processData,
    List<DeviceValuePresentation>? valuePresentations,
    String? designator,
    String? softwareVersion,
    String? serialNumber,
  }) {
    ArgumentValidation.checkId(id: id, idRefPattern: idRefPattern);
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

    if (elements.isEmpty) {
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
      properties: properties,
      processData: processData,
      valuePresentations: valuePresentations,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const Device._({
    required this.id,
    required this.clientNAME,
    required this.structureLabel,
    required this.localizationLabel,
    required this.elements,
    this.properties,
    this.processData,
    this.valuePresentations,
    this.designator,
    this.softwareVersion,
    this.serialNumber,
  }) : super(tag: Iso11783Tag.device, description: 'Device');

  /// Creates a [Device] from [element].
  factory Device.fromXmlElement(XmlElement element) =>
      _$DeviceFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [Device]s.
  static const idRefPattern = '(DVC|DVC-)([0-9])+';

  /// Regular expression matching pattern for structure labels.
  static const structureLabelPattern =
      '''((([0-9]|[a-e]|[A-E])([0-9]|[a-f]|[A-F]))|((F|f)([0-9]|[a-e]|[A-E]))){7}(([0-9]|[a-f]|[A-F])([0-9]|[a-f]|[A-F]))*''';

  /// Regular expression matchin pattern for localization labels.
  static const localizationLabelPattern =
      '''(F|f){2}((([0-9]|[A-E]|[a-e])([0-9]|[A-F]|[a-f]))|((F|f)([0-9]|[A-E]|[a-e])))*''';

  /// A list of the [DeviceElement]s of this.
  @annotation.XmlElement(name: 'DET')
  final List<DeviceElement> elements;

  /// A list of the [DeviceProcessData]s of this.
  @annotation.XmlElement(name: 'DPD')
  final List<DeviceProcessData>? processData;

  /// A list of the [DeviceProperty]s of this.
  @annotation.XmlElement(name: 'DPT')
  final List<DeviceProperty>? properties;

  /// A list of the [DeviceValuePresentation]s of this.
  @annotation.XmlElement(name: 'DVP')
  final List<DeviceValuePresentation>? valuePresentations;

  /// Unique identifier for this device.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the device, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String? designator;

  /// Software version of the device.
  @annotation.XmlAttribute(name: 'C')
  final String? softwareVersion;

  /// Client NAME of the device.
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
  List<Object?> get props => super.props
    ..addAll([
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
    ]);
}

/// An element that includes information on which [Device]s the planned
/// [Task] was created for and which [Device]s were actually used during task
/// processing.
///
/// For a planned [Task] the [DeviceAllocation] describes the
/// [clientNAMEValue] and optionally a [clientNAMEMask] to enable a range of
/// NAME values which can specify [Device]s that are also allowed for the task
/// processing. During task processing the task controller modifies the
/// [clientNAMEValue] attribute to the NAME of the client that was actually used
/// to perform the task.
@CopyWith()
@annotation.XmlRootElement(name: 'DAN')
@annotation.XmlSerializable(createMixin: true)
class DeviceAllocation extends Iso11783Element
    with _$DeviceAllocationXmlSerializableMixin {
  /// Default factory for creating a [DeviceAllocation] with verified
  /// arguments.
  factory DeviceAllocation({
    required String clientNAMEValue,
    String? clientNAMEMask,
    String? deviceIdRef,
    AllocationStamp? allocationStamp,
  }) {
    ArgumentValidation.checkHexStringLength(
      clientNAMEValue,
      name: 'clientNAMEValue',
      minBytes: 8,
      maxBytes: 8,
    );
    if (clientNAMEMask != null) {
      ArgumentValidation.checkHexStringLength(
        clientNAMEMask,
        name: 'clientNAMEMask',
        minBytes: 8,
        maxBytes: 8,
      );
    }
    if (deviceIdRef != null) {
      ArgumentValidation.checkId(
        id: deviceIdRef,
        idRefPattern: Device.idRefPattern,
        idName: 'deviceIdRef',
      );
    }

    return DeviceAllocation._(
      clientNAMEValue: clientNAMEValue,
      clientNAMEMask: clientNAMEMask,
      deviceIdRef: deviceIdRef,
      allocationStamp: allocationStamp,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const DeviceAllocation._({
    required this.clientNAMEValue,
    this.clientNAMEMask,
    this.deviceIdRef,
    this.allocationStamp,
  }) : super(
          tag: Iso11783Tag.deviceAllocation,
          description: 'DeviceAllocation',
        );

  /// Creates a [DeviceAllocation] from [element].
  factory DeviceAllocation.fromXmlElement(XmlElement element) =>
      _$DeviceAllocationFromXmlElement(element);

  /// [AllocationStamp] for specifying the position and time of this allocation.
  @annotation.XmlElement(name: 'ASP', includeIfNull: false)
  final AllocationStamp? allocationStamp;

  /// NAME of the client from the [Device] the [Task] is planned for or was
  /// processed with.
  @annotation.XmlAttribute(name: 'A')
  final String clientNAMEValue;

  /// Bit-Mask, which is to be used for a logical `AND` operation to
  /// [clientNAMEValue], to allow more then one specific [Device] for the
  /// task.
  ///
  /// bit=1 => relevant bit of the [clientNAMEValue].
  /// bit=0 => bit of the [clientNAMEValue] is not relevant.
  @annotation.XmlAttribute(name: 'B')
  final String? clientNAMEMask;

  /// Reference to a [Device].
  @annotation.XmlAttribute(name: 'C')
  final String? deviceIdRef;

  @override
  List<Object?> get props => super.props
    ..addAll([
      allocationStamp,
      clientNAMEValue,
      clientNAMEMask,
      deviceIdRef,
    ]);
}

/// An element that describes the functional or physical elements of a [Device].
///
/// To establish a hierarchical structure of element groups, a [DeviceElement]
/// shall refer to another [DeviceElement] or to the [Device] itself.
@CopyWith()
@annotation.XmlRootElement(name: 'DET')
@annotation.XmlSerializable(createMixin: true)
class DeviceElement extends Iso11783Element
    with _$DeviceElementXmlSerializableMixin {
  /// Default factory for creating a [DeviceElement] with verified
  /// arguments.
  factory DeviceElement({
    required String id,
    required int objectId,
    required DeviceElementType type,
    required int number,
    required int parentObjectId,
    List<DeviceObjectReference>? objectReferences,
    String? designator,
  }) {
    ArgumentValidation.checkId(id: id, idRefPattern: idRefPattern);
    ArgumentValidation.checkValueInRange(
      value: objectId,
      min: 1,
      max: 65534,
      name: 'objectId',
    );
    ArgumentValidation.checkValueInRange(
      value: number,
      min: 0,
      max: 4095,
      name: 'number',
    );
    ArgumentValidation.checkValueInRange(
      value: parentObjectId,
      min: 0,
      max: 65534,
      name: 'parentObjectId',
    );
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }

    return DeviceElement._(
      id: id,
      objectId: objectId,
      type: type,
      number: number,
      parentObjectId: parentObjectId,
      objectReferences: objectReferences,
      designator: designator,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const DeviceElement._({
    required this.id,
    required this.objectId,
    required this.type,
    required this.number,
    required this.parentObjectId,
    this.objectReferences,
    this.designator,
  }) : super(tag: Iso11783Tag.deviceElement, description: 'DeviceElement');

  /// Creates a [DeviceElement] from [element].
  factory DeviceElement.fromXmlElement(XmlElement element) =>
      _$DeviceElementFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [DeviceElement]s.
  static const idRefPattern = '(DET|DET-)([0-9])+';

  /// A list of [DeviceObjectReference]s that describes references to
  /// [DeviceProcessData] or [DeviceProperty] elements.
  @annotation.XmlElement(name: 'DOR')
  final List<DeviceObjectReference>? objectReferences;

  /// Unique identifier for this device element.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Object ID unique inside a [Device] Description.
  @annotation.XmlAttribute(name: 'B')
  final int objectId;

  /// Which type of element this is.
  @annotation.XmlAttribute(name: 'C')
  final DeviceElementType type;

  /// Name of the device element, description or comment.
  @annotation.XmlAttribute(name: 'D')
  final String? designator;

  /// Unique number of this.
  ///
  /// Refer toISO 11783-7: [ProcessDataVariable] element numbering.
  @annotation.XmlAttribute(name: 'E')
  final int number;

  /// Object ID of a parent [DeviceElement] or [Device].
  @annotation.XmlAttribute(name: 'F')
  final int parentObjectId;

  @override
  List<Object?> get props => super.props
    ..addAll([
      objectReferences,
      id,
      objectId,
      type,
      designator,
      number,
      parentObjectId,
    ]);
}

/// An enumerator for describing what type a [DeviceElement] is.
@annotation.XmlEnum()
enum DeviceElementType {
  /// A complete [Device].
  @annotation.XmlValue('1')
  device(1, 'Device'),
  @annotation.XmlValue('2')

  /// A function of the device.
  function(2, 'Function'),
  @annotation.XmlValue('3')

  /// A bin or container for storage.
  bin(3, 'Bin, container'),
  @annotation.XmlValue('4')

  /// A section of a boom or planter etc...
  section(4, 'Section'),
  @annotation.XmlValue('5')

  ///  A single unit of a boom or planter etc...
  unit(5, 'Unit'),
  @annotation.XmlValue('6')

  /// A connector for connecting two [Device]s.
  connector(6, 'Connector'),

  /// An element that provides nagivation data.
  @annotation.XmlValue('7')
  navigation(7, 'Navigation');

  const DeviceElementType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// Short description of the value.
  final String description;
}

/// An element that describes a reference to a [DeviceProcessData] object or a
/// [DeviceProperty] object.
@CopyWith()
@annotation.XmlRootElement(name: 'DOR')
@annotation.XmlSerializable(createMixin: true)
class DeviceObjectReference extends Iso11783Element
    with _$DeviceObjectReferenceXmlSerializableMixin {
  /// Default factory for creating a [DeviceObjectReference] with verified
  /// arguments.
  factory DeviceObjectReference({required int objectId}) {
    ArgumentValidation.checkValueInRange(
      value: objectId,
      min: 1,
      max: 65534,
      name: 'objectId',
    );

    return DeviceObjectReference._(objectId: objectId);
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const DeviceObjectReference._({required this.objectId})
      : super(
          tag: Iso11783Tag.deviceObjectReference,
          description: 'DeviceObjectReference',
        );

  /// Creates a [DeviceObjectReference] from [element].
  factory DeviceObjectReference.fromXmlElement(XmlElement element) =>
      _$DeviceObjectReferenceFromXmlElement(element);

  /// Object ID of the [DeviceProcessData] or [DeviceProperty] that this refers
  /// to.
  @annotation.XmlAttribute(name: 'A')
  final int objectId;

  @override
  List<Object?> get props => super.props..addAll([objectId]);
}

/// An element that describes a property of a [DeviceElement] by means of a
/// reference and a value for a DDI.
///
/// This element is part of the device description.
@CopyWith()
@annotation.XmlRootElement(name: 'DPT')
@annotation.XmlSerializable(createMixin: true)
class DeviceProperty extends Iso11783Element
    with _$DevicePropertyXmlSerializableMixin {
  /// Default factory for creating a [DeviceProperty] with verified
  /// arguments.
  factory DeviceProperty({
    required int objectId,
    required String ddi,
    required int value,
    String? designator,
    int? valuePresentationObjectId,
  }) {
    ArgumentValidation.checkHexStringLength(
      ddi,
      name: 'ddi',
    );
    ArgumentValidation.checkValueInRange(
      value: objectId,
      min: 1,
      max: 65534,
      name: 'objectId',
    );
    ArgumentValidation.checkValueInRange(
      value: value,
      min: -2147483648,
      max: 2147483648,
      name: 'value',
    );
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }
    if (valuePresentationObjectId != null) {
      ArgumentValidation.checkValueInRange(
        value: valuePresentationObjectId,
        min: 1,
        max: 65534,
        name: 'valuePresentationObjectId',
      );
    }

    return DeviceProperty._(
      objectId: objectId,
      ddi: ddi,
      value: value,
      designator: designator,
      valuePresentationObjectId: valuePresentationObjectId,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const DeviceProperty._({
    required this.objectId,
    required this.ddi,
    required this.value,
    this.designator,
    this.valuePresentationObjectId,
  }) : super(tag: Iso11783Tag.deviceProperty, description: 'DeviceProperty');

  /// Creates a [DeviceProperty] from [element].
  factory DeviceProperty.fromXmlElement(XmlElement element) =>
      _$DevicePropertyFromXmlElement(element);

  /// Unique number inside a single [Device].
  @annotation.XmlAttribute(name: 'A')
  final int objectId;

  /// A unique Data Dictionary Identifier which identifies a
  /// [ProcessDataVariable].
  ///
  /// The [ProcessDataVariable] is found as a Device Dictionary Entity (DDE)
  /// in theISO 11783-11 online database.
  @annotation.XmlAttribute(name: 'B')
  final String ddi;

  /// Property value.
  @annotation.XmlAttribute(name: 'C')
  final int value;

  /// Name of the device property, description or comment.
  @annotation.XmlAttribute(name: 'D')
  final String? designator;

  /// Object ID of the [ValuePresentation].
  @annotation.XmlAttribute(name: 'E')
  final int? valuePresentationObjectId;

  @override
  List<Object?> get props => super.props
    ..addAll([
      objectId,
      ddi,
      value,
      designator,
      valuePresentationObjectId,
    ]);
}

/// An element that describes [ProcessDataVariable]  DDis, supported by the
/// [DeviceElement] that references this element.
///
/// The attributes specify the available trigger methods for a
/// [ProcessDataVariable] DDI.
@CopyWith()
@annotation.XmlRootElement(name: 'DPD')
@annotation.XmlSerializable(createMixin: true)
class DeviceProcessData extends Iso11783Element
    with _$DeviceProcessDataXmlSerializableMixin {
  /// Default factory for creating a [DeviceProcessData] with verified
  /// arguments.
  factory DeviceProcessData({
    required int objectId,
    required String ddi,
    required int property,
    required int triggerMethods,
    String? designator,
    int? presentationObjectId,
  }) {
    ArgumentValidation.checkHexStringLength(
      ddi,
      name: 'ddi',
    );
    ArgumentValidation.checkValueInRange(
      value: objectId,
      min: 1,
      max: 65534,
      name: 'objectId',
    );
    ArgumentValidation.checkValueInRange(
      value: property,
      min: 0,
      max: 7,
      name: 'property',
    );
    ArgumentValidation.checkValueInRange(
      value: triggerMethods,
      min: 0,
      max: 31,
      name: 'triggerMethods',
    );
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }
    if (presentationObjectId != null) {
      ArgumentValidation.checkValueInRange(
        value: presentationObjectId,
        min: 1,
        max: 65534,
        name: 'presentationObjectId',
      );
    }

    return DeviceProcessData._(
      objectId: objectId,
      ddi: ddi,
      property: property,
      triggerMethods: triggerMethods,
      designator: designator,
      presentationObjectId: presentationObjectId,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const DeviceProcessData._({
    required this.objectId,
    required this.ddi,
    required this.property,
    required this.triggerMethods,
    this.designator,
    this.presentationObjectId,
  }) : super(
          tag: Iso11783Tag.deciveProcessData,
          description: 'DeviceProcessData',
        );

  /// Creates a [DeviceProcessData] from [element].
  factory DeviceProcessData.fromXmlElement(XmlElement element) =>
      _$DeviceProcessDataFromXmlElement(element);

  /// Unique number inside a single [Device].
  @annotation.XmlAttribute(name: 'A')
  final int objectId;

  /// A unique Data Dictionary Identifier which identifies a
  /// [ProcessDataVariable].
  ///
  /// The [ProcessDataVariable] is found as a Device Dictionary Entity (DDE)
  /// in theISO 11783-11 online database.
  @annotation.XmlAttribute(name: 'B')
  final String ddi;

  /// Bit combination to specify the [ProcessDataVariable] property.
  ///
  /// 1 = belongs to default set
  /// 2 = setable
  @annotation.XmlAttribute(name: 'C')
  final int property;

  /// Bit combination to specify supported trigger methods:
  /// `1 = time interval`,
  /// `2 = distance interval`,
  /// `4 = threshold limits`,
  /// `8 = on change`,
  /// `16 = counter`
  @annotation.XmlAttribute(name: 'D')
  final int triggerMethods;

  /// Name of the device process data, description or comment.
  @annotation.XmlAttribute(name: 'E')
  final String? designator;

  ///Object ID of the [DeviceValuePresentation].
  @annotation.XmlAttribute(name: 'F')
  final int? presentationObjectId;

  @override
  List<Object?> get props => super.props
    ..addAll([
      objectId,
      ddi,
      property,
      triggerMethods,
      designator,
      presentationObjectId,
    ]);
}

/// An element that is used to specify the presentation of the data dictionary
/// entity-defined integer values that are used within a single [Device].
///
/// The presentation shall be according to the following formula:
///
/// Presented value = (int value + [offset]) * [scale]
///
/// Presented values are always rounded to the number of decimals specified in
/// the [numberOfDecimals] attribute.
@CopyWith()
@annotation.XmlRootElement(name: 'DVP')
@annotation.XmlSerializable(createMixin: true)
class DeviceValuePresentation extends Iso11783Element
    with _$DeviceValuePresentationXmlSerializableMixin {
  /// Default factory for creating a [DeviceValuePresentation] with verified
  /// arguments.
  factory DeviceValuePresentation({
    required int objectId,
    required int offset,
    required double scale,
    required int numberOfDecimals,
    String? unitDesignator,
  }) {
    ArgumentValidation.checkValueInRange(
      value: objectId,
      min: 1,
      max: 65534,
      name: 'objectId',
    );
    ArgumentValidation.checkValueInRange(
      value: offset,
      min: -2147483648,
      max: 2147483648,
      name: 'offset',
    );
    ArgumentValidation.checkValueInRange(
      value: scale,
      min: 0.000000001,
      max: 100000000,
      name: 'scale',
    );
    ArgumentValidation.checkValueInRange(
      value: numberOfDecimals,
      min: 0,
      max: 7,
      name: 'numberOfDecimals',
    );
    if (unitDesignator != null) {
      ArgumentValidation.checkStringLength(
        unitDesignator,
        name: 'unitDesignator',
      );
    }

    return DeviceValuePresentation._(
      objectId: objectId,
      offset: offset,
      scale: scale,
      numberOfDecimals: numberOfDecimals,
      unitDesignator: unitDesignator,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const DeviceValuePresentation._({
    required this.objectId,
    required this.offset,
    required this.scale,
    required this.numberOfDecimals,
    this.unitDesignator,
  }) : super(
          tag: Iso11783Tag.deviceValuePresentation,
          description: 'DeviceValuePresentation',
        );

  /// Creates a [DeviceValuePresentation] from [element].
  factory DeviceValuePresentation.fromXmlElement(XmlElement element) =>
      _$DeviceValuePresentationFromXmlElement(element);

  /// Unique number inside a single [Device].
  @annotation.XmlAttribute(name: 'A')
  final int objectId;

  /// Offset to be applied to the value for presentation.
  @annotation.XmlAttribute(name: 'B')
  final int offset;

  /// Scale to be applied to the value for presentation.
  @annotation.XmlAttribute(name: 'C')
  final double scale;

  /// Number of decimals to be presented after the decimal separator.
  @annotation.XmlAttribute(name: 'D')
  final int numberOfDecimals;

  /// Optional unit designator string.
  @annotation.XmlAttribute(name: 'E')
  final String? unitDesignator;

  @override
  List<Object?> get props => super.props
    ..addAll([
      objectId,
      offset,
      scale,
      numberOfDecimals,
      unitDesignator,
    ]);
}
