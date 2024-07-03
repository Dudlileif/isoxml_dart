// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

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
          elementType: Iso11783ElementType.deciveProcessData,
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
  /// in the ISO 11783-11 database.
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
