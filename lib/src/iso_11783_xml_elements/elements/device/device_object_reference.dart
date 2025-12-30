// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a reference to a [DeviceProcessData] object or a
/// [DeviceProperty] object.
class DeviceObjectReference extends Iso11783Element {
  /// Default factory for creating a [DeviceObjectReference] with verified
  /// arguments.
  factory DeviceObjectReference({
    required int objectId,
  }) {
    _argumentValidator(objectId: objectId);

    return DeviceObjectReference._(
      objectId: objectId,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  DeviceObjectReference._({
    required int objectId,
  }) : super._(elementType: _elementType) {
    this.objectId = objectId;
  }

  DeviceObjectReference._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    _argumentValidator(objectId: objectId);
  }

  static void _argumentValidator({required int objectId}) {
    ArgumentValidation.checkValueInRange(
      value: objectId,
      min: 1,
      max: 65534,
      name: 'DeviceObjectReference.objectId',
    );
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.deviceObjectReference;

  /// Object ID of the [DeviceProcessData] or [DeviceProperty] that this refers
  /// to.
  int get objectId => parseInt('A');
  set objectId(int value) => setInt('A', value);
}
