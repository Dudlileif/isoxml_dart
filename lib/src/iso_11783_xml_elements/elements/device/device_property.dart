// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a property of a [DeviceElement] by means of a
/// reference and a value for a DDI.
///
/// This element is part of the device description.

class DeviceProperty extends Iso11783Element {
  /// Default factory for creating a [DeviceProperty] with verified
  /// arguments.
  factory DeviceProperty({
    required int objectId,
    required String ddi,
    required int propertyValue,
    String? designator,
    int? valuePresentationObjectId,
  }) {
    _argumentValidator(
      objectId: objectId,
      ddi: ddi,
      propertyValue: propertyValue,
      designator: designator,
      valuePresentationObjectId: valuePresentationObjectId,
    );

    return DeviceProperty._(
      objectId: objectId,
      ddi: ddi,
      propertyValue: propertyValue,
      designator: designator,
      valuePresentationObjectId: valuePresentationObjectId,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  DeviceProperty._({
    required int objectId,
    required String ddi,
    required int propertyValue,
    String? designator,
    int? valuePresentationObjectId,
  }) : super._(elementType: _elementType) {
    this.objectId = objectId;
    this.ddi = ddi;
    this.propertyValue = propertyValue;
    this.designator = designator;
    this.valuePresentationObjectId = valuePresentationObjectId;
  }

  DeviceProperty._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    _argumentValidator(
      objectId: objectId,
      ddi: ddi,
      propertyValue: propertyValue,
      designator: designator,
      valuePresentationObjectId: valuePresentationObjectId,
    );
  }

  static void _argumentValidator({
    required int objectId,
    required String ddi,
    required int propertyValue,
    required String? designator,
    required int? valuePresentationObjectId,
  }) {
    ArgumentValidation.checkHexStringLength(
      ddi,
      name: 'DeviceProperty.ddi',
    );
    ArgumentValidation.checkValueInRange(
      value: objectId,
      min: 1,
      max: 65534,
      name: 'DeviceProperty.objectId',
    );
    ArgumentValidation.checkValueInRange(
      value: propertyValue,
      min: -2147483648,
      max: 2147483648,
      name: 'DeviceProperty.propertyValue',
    );
    if (designator != null) {
      ArgumentValidation.checkStringLength(
        designator,
        name: 'DeviceProperty.designator',
      );
    }
    if (valuePresentationObjectId != null) {
      ArgumentValidation.checkValueInRange(
        value: valuePresentationObjectId,
        min: 1,
        max: 65534,
        name: 'DeviceProperty.valuePresentationObjectId',
      );
    }
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.deviceProperty;

  /// Unique number inside a single [Device].
  int get objectId => parseInt('A');
  set objectId(int value) => setInt('A', value);

  /// A unique Data Dictionary Identifier which identifies a
  /// [ProcessDataVariable].
  ///
  /// The [ProcessDataVariable] is found as a Device Dictionary Entity (DDE)
  /// in the ISO 11783-11 database.
  String get ddi => parseString('B');
  set ddi(String value) => setString('B', value);

  /// Property value.
  int get propertyValue => parseInt('C');
  set propertyValue(int value) => setInt('C', value);

  /// Name of the device property, description or comment.
  String? get designator => tryParseString('D');
  set designator(String? value) => setStringNullable('D', value);

  /// Object ID of the [ValuePresentation].
  int? get valuePresentationObjectId => tryParseInt('E');
  set valuePresentationObjectId(int? value) => setIntNullable('E', value);
}
