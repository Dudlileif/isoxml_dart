// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes the functional or physical elements of a [Device].
///
/// To establish a hierarchical structure of element groups, a [DeviceElement]
/// shall refer to another [DeviceElement] or to the [Device] itself.

class DeviceElement extends Iso11783Element {
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
    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
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
  DeviceElement._({
    required String id,
    required int objectId,
    required DeviceElementType type,
    required int number,
    required int parentObjectId,
    List<DeviceObjectReference>? objectReferences,
    String? designator,
  }) : super(elementType: _elementType) {
    this.id = id;
    this.objectId = objectId;
    this.type = type;
    this.number = number;
    this.parentObjectId = parentObjectId;
    this.designator = designator;
    this.objectReferences.addAll(objectReferences);
  }

  DeviceElement._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    objectReferences.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.deviceObjectReference.xmlTag,
          )
          .map(DeviceObjectReference._fromXmlElement)
          .toList(),
    );
    _argumentValidator();
  }

  void _argumentValidator() {
    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
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
      ArgumentValidation.checkStringLength(designator!);
    }
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.deviceElement;

  /// Regular expression matching pattern for the [id] of [DeviceElement]s.
  static const staticIdRefPattern = '(DET|DET-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of [DeviceObjectReference]s that describes references to
  /// [DeviceProcessData] or [DeviceProperty] elements.
  late final objectReferences = _XmlSyncedList<DeviceObjectReference>(
    xmlElement: xmlElement,
  );

  /// Unique identifier for this device element.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Object ID unique inside a [Device] Description.
  int get objectId => parseInt('B');
  set objectId(int value) => setInt('B', value);

  /// Which type of element this is.
  DeviceElementType get type => DeviceElementType.values.firstWhere(
    (type) => type.value == parseInt('C'),
    orElse: () => throw ArgumentError(
      '''`${xmlElement.getAttribute('C')}` is not one of the supported values: ${DeviceElementType.values.join(', ')}''',
    ),
  );
  set type(DeviceElementType value) => setInt('C', value.value);

  /// Name of the device element, description or comment.
  String? get designator => tryParseString('D');
  set designator(String? value) => setStringNullable('D', value);

  /// Unique number of this.
  ///
  /// Refer to ISO 11783-7: [ProcessDataVariable] element numbering.
  int get number => parseInt('E');
  set number(int value) => setInt('E', value);

  /// Object ID of a parent [DeviceElement] or [Device].
  int get parentObjectId => parseInt('F');
  set parentObjectId(int value) => setInt('F', value);
}

/// An enumerator for describing what type a [DeviceElement] is.
enum DeviceElementType {
  /// A complete [Device].
  device(1, 'Device'),

  /// A function of the device.
  function(2, 'Function'),

  /// A bin or container for storage.
  bin(3, 'Bin, container'),

  /// A section of a boom or planter etc...
  section(4, 'Section'),

  /// A single unit of a boom or planter etc...
  unit(5, 'Unit'),

  /// A connector for connecting two [Device]s.
  connector(6, 'Connector'),

  /// An element that provides nagivation data.
  navigation(7, 'Navigation');

  const DeviceElementType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// Short description of the value.
  final String description;
}
