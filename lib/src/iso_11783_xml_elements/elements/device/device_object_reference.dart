// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

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
          tag: Iso11783XmlTag.deviceObjectReference,
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
