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
/// another device. The referenced [DeviceElement] in [deviceElementIdRef_0]
/// shall be part of the device referenced
/// in [deviceIdRef_0] and shall be of the type [DeviceElementType.connector].
/// The referenced [DeviceElement] in [deviceElementIdRef_1] shall be part of
/// the device referenced in [deviceIdRef_1] and shall also be of type
/// [DeviceElementType.connector].
///
/// See the ISO 11783-10 standard for info about the `NavigationReferencePoint`.
@CopyWith()
@annotation.XmlRootElement(name: 'CNN')
@annotation.XmlSerializable(createMixin: true)
class Connection extends Iso11783Element
    with _$ConnectionXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [Connection] with verified arguments.
  factory Connection({
    required String deviceIdRef_0,
    required String deviceElementIdRef_0,
    required String deviceIdRef_1,
    required String deviceElementIdRef_1,
  }) {
    ArgumentValidation.checkId(
      id: deviceIdRef_0,
      idRefPattern: Device.staticIdRefPattern,
      idName: 'deviceIdRef_0',
    );
    ArgumentValidation.checkId(
      id: deviceElementIdRef_0,
      idRefPattern: DeviceElement.staticIdRefPattern,
      idName: 'deviceElementIdRef_0',
    );
    ArgumentValidation.checkId(
      id: deviceIdRef_1,
      idRefPattern: Device.staticIdRefPattern,
      idName: 'deviceIdRef_1',
    );
    ArgumentValidation.checkId(
      id: deviceElementIdRef_1,
      idRefPattern: DeviceElement.staticIdRefPattern,
      idName: 'deviceElementIdRef_1',
    );

    return Connection._(
      deviceIdRef_0: deviceIdRef_0,
      deviceElementIdRef_0: deviceElementIdRef_0,
      deviceIdRef_1: deviceIdRef_1,
      deviceElementIdRef_1: deviceElementIdRef_1,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const Connection._({
    required this.deviceIdRef_0,
    required this.deviceElementIdRef_0,
    required this.deviceIdRef_1,
    required this.deviceElementIdRef_1,
  }) : super(
          elementType: Iso11783ElementType.connection,
          description: 'Connection',
        );

  /// Creates a [Connection] from [element].
  factory Connection.fromXmlElement(XmlElement element) =>
      _$ConnectionFromXmlElement(element);

  /// An ID reference to the first device.
  @annotation.XmlAttribute(name: 'A')
  final String deviceIdRef_0;

  /// An ID reference to the first device element.
  @annotation.XmlAttribute(name: 'B')
  final String deviceElementIdRef_0;

  /// An ID reference to the second device.
  @annotation.XmlAttribute(name: 'C')
  final String deviceIdRef_1;

  /// An ID reference to the second device element.
  @annotation.XmlAttribute(name: 'D')
  final String deviceElementIdRef_1;

  @override
  List<Object?> get props => [
        deviceIdRef_0,
        deviceElementIdRef_0,
        deviceIdRef_1,
        deviceElementIdRef_1,
      ];
}
