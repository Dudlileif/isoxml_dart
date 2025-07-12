// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a property of a [DeviceElement] by means of a
/// reference and a value for a DDI.
///
/// This element is part of the device description.
@CopyWith()
@annotation.XmlRootElement(name: 'DPT')
@annotation.XmlSerializable(createMixin: true)
class DeviceProperty extends Iso11783Element
    with _$DevicePropertyXmlSerializableMixin, EquatableMixin {
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
  }) : super(
         elementType: Iso11783ElementType.deviceProperty,
         description: 'DeviceProperty',
       );

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
  /// in the ISO 11783-11 database.
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
  List<Object?> get props => [
    objectId,
    ddi,
    value,
    designator,
    valuePresentationObjectId,
  ];
}
