// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that specifies how two [Device]s are connected to each other
/// within a single [Task].
///
/// A connection specification consists of references to the two
/// [DeviceElement]s of type [DeviceElementType.connector] of the two devices
/// which are connected. The connection specification enables the task
/// controller to determine the position of [DeviceElement]s of one device
/// relative to the position of, for instance, the `NavigationReferencePoint` of
/// another device. The referenced [DeviceElement] in [deviceElementIdRef0]
/// shall be part of the device referenced
/// in [deviceIdRef0] and shall be of the type [DeviceElementType.connector].
/// The referenced [DeviceElement] in [deviceElementIdRef1] shall be part of
/// the device referenced in [deviceIdRef1] and shall also be of type
/// [DeviceElementType.connector].
///
/// See the ISO 11783-10 standard for info about the `NavigationReferencePoint`.
class Connection extends Iso11783Element {
  /// Default factory for creating a [Connection] with verified arguments.
  factory Connection({
    required String deviceIdRef0,
    required String deviceElementIdRef0,
    required String deviceIdRef1,
    required String deviceElementIdRef1,
  }) {
    ArgumentValidation.checkId(
      id: deviceIdRef0,
      idRefPattern: Device.staticIdRefPattern,
      idName: 'deviceIdRef0',
    );
    ArgumentValidation.checkId(
      id: deviceElementIdRef0,
      idRefPattern: DeviceElement.staticIdRefPattern,
      idName: 'deviceElementIdRef0',
    );
    ArgumentValidation.checkId(
      id: deviceIdRef1,
      idRefPattern: Device.staticIdRefPattern,
      idName: 'deviceIdRef1',
    );
    ArgumentValidation.checkId(
      id: deviceElementIdRef1,
      idRefPattern: DeviceElement.staticIdRefPattern,
      idName: 'deviceElementIdRef1',
    );

    return Connection._(
      deviceIdRef0: deviceIdRef0,
      deviceElementIdRef0: deviceElementIdRef0,
      deviceIdRef1: deviceIdRef1,
      deviceElementIdRef1: deviceElementIdRef1,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  Connection._({
    required String deviceIdRef0,
    required String deviceElementIdRef0,
    required String deviceIdRef1,
    required String deviceElementIdRef1,
  }) : super(elementType: _elementType) {
    this.deviceIdRef0 = deviceIdRef0;
    this.deviceElementIdRef0 = deviceElementIdRef0;
    this.deviceIdRef1 = deviceIdRef1;
    this.deviceElementIdRef1 = deviceElementIdRef1;
  }

  Connection._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    _argumentValidator();
  }

  void _argumentValidator() {
    ArgumentValidation.checkId(
      id: deviceIdRef0,
      idRefPattern: Device.staticIdRefPattern,
      idName: 'deviceIdRef0',
    );
    ArgumentValidation.checkId(
      id: deviceElementIdRef0,
      idRefPattern: DeviceElement.staticIdRefPattern,
      idName: 'deviceElementIdRef0',
    );
    ArgumentValidation.checkId(
      id: deviceIdRef1,
      idRefPattern: Device.staticIdRefPattern,
      idName: 'deviceIdRef1',
    );
    ArgumentValidation.checkId(
      id: deviceElementIdRef1,
      idRefPattern: DeviceElement.staticIdRefPattern,
      idName: 'deviceElementIdRef1',
    );
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.connection;

  /// An ID reference to the first device.
  String get deviceIdRef0 => parseString('A');
  set deviceIdRef0(String value) => setString('A', value);

  /// An ID reference to the first device element.
  String get deviceElementIdRef0 => parseString('B');
  set deviceElementIdRef0(String value) => setString('B', value);

  /// An ID reference to the second device.
  String get deviceIdRef1 => parseString('C');
  set deviceIdRef1(String value) => setString('C', value);

  /// An ID reference to the second device element.
  String get deviceElementIdRef1 => parseString('D');
  set deviceElementIdRef1(String value) => setString('D', value);
}
