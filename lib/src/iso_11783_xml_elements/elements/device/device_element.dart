// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes the functional or physical elements of a [Device].
///
/// To establish a hierarchical structure of element groups, a [DeviceElement]
/// shall refer to another [DeviceElement] or to the [Device] itself.
@CopyWith()
@annotation.XmlRootElement(name: 'DET')
@annotation.XmlSerializable(createMixin: true)
class DeviceElement extends Iso11783Element
    with _$DeviceElementXmlSerializableMixin, EquatableMixin {
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
      objectReferences: objectReferences ?? const [],
      designator: designator,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  DeviceElement._({
    required this.id,
    required this.objectId,
    required this.type,
    required this.number,
    required this.parentObjectId,
    List<DeviceObjectReference>? objectReferences,
    this.designator,
  }) : super(
         elementType: Iso11783ElementType.deviceElement,
         description: 'DeviceElement',
       ) {
    if (objectReferences != null) {
      this.objectReferences.addAll(objectReferences);
    }
  }

  /// Creates a [DeviceElement] from [element].
  factory DeviceElement.fromXmlElement(XmlElement element) {
    final objectReferences = element.getElements('DOR');
    final id = element.getAttribute('A')!;
    final objectId = element.getAttribute('B')!;
    final type = element.getAttribute('C')!;
    final designator = element.getAttribute('D');
    final number = element.getAttribute('E')!;
    final parentObjectId = element.getAttribute('F')!;
    return DeviceElement(
      objectReferences: objectReferences
          ?.map(DeviceObjectReference.fromXmlElement)
          .toList(),
      id: id,
      objectId: int.parse(objectId),
      type: $DeviceElementTypeEnumMap.entries
          .singleWhere(
            (deviceElementTypeEnumMapEntry) =>
                deviceElementTypeEnumMapEntry.value == type,
            orElse: () => throw ArgumentError(
              '''`$type` is not one of the supported values: ${$DeviceElementTypeEnumMap.values.join(', ')}''',
            ),
          )
          .key,
      designator: designator,
      number: int.parse(number),
      parentObjectId: int.parse(parentObjectId),
    );
  }

  /// Regular expression matching pattern for the [id] of [DeviceElement]s.
  static const staticIdRefPattern = '(DET|DET-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of [DeviceObjectReference]s that describes references to
  /// [DeviceProcessData] or [DeviceProperty] elements.
  @annotation.XmlElement(name: 'DOR')
  final List<DeviceObjectReference> objectReferences = [];

  /// Unique identifier for this device element.
  ///
  /// Records generated on MICS have negative IDs.
  @override
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
  /// Refer to ISO 11783-7: [ProcessDataVariable] element numbering.
  @annotation.XmlAttribute(name: 'E')
  final int number;

  /// Object ID of a parent [DeviceElement] or [Device].
  @annotation.XmlAttribute(name: 'F')
  final int parentObjectId;

  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
    ...[
      for (final a in objectReferences.map((e) => e.selfWithRecursiveChildren))
        ...a,
    ],
  ];

  @override
  List<Object?> get props => [
    objectReferences,
    id,
    objectId,
    type,
    designator,
    number,
    parentObjectId,
  ];
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
  /// A single unit of a boom or planter etc...
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
