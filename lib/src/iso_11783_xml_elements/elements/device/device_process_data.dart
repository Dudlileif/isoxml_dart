// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes [ProcessDataVariable]  DDis, supported by the
/// [DeviceElement] that references this element.
///
/// The attributes specify the available trigger methods for a
/// [ProcessDataVariable] DDI.

class DeviceProcessData extends Iso11783Element {
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
  DeviceProcessData._({
    required int objectId,
    required String ddi,
    required int property,
    required int triggerMethods,
    String? designator,
    int? presentationObjectId,
  }) : super(
         elementType: Iso11783ElementType.deviceProcessData,
         description: 'DeviceProcessData',
       ) {
    this.objectId = objectId;
    this.ddi = ddi;
    this.property = property;
    this.triggerMethods = triggerMethods;
    this.designator = designator;
    this.presentationObjectId = presentationObjectId;
  }

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

  /// Bit combination to specify the [ProcessDataVariable] property.
  ///
  /// 1 = belongs to default set
  /// 2 = setable
  int get property => parseInt('C');
  set property(int value) => setInt('C', value);

  /// Bit combination to specify supported trigger methods:
  /// `1 = time interval`,
  /// `2 = distance interval`,
  /// `4 = threshold limits`,
  /// `8 = on change`,
  /// `16 = counter`
  int get triggerMethods => parseInt('D');
  set triggerMethods(int value) => setInt('D', value);

  /// Name of the device process data, description or comment.
  String? get designator => tryParseString('E');
  set designator(String? value) => setStringNullable('E', value);

  ///Object ID of the [DeviceValuePresentation].
  int? get presentationObjectId => tryParseInt('F');
  set presentationObjectId(int? value) => setIntNullable('F', value);
}
