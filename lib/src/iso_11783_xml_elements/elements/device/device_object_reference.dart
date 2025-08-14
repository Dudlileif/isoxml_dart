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
    with _$DeviceObjectReferenceXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [DeviceObjectReference] with verified
  /// arguments.
  factory DeviceObjectReference({
    required int objectId,
    List<XmlAttribute>? customAttributes,
  }) {
    ArgumentValidation.checkValueInRange(
      value: objectId,
      min: 1,
      max: 65534,
      name: 'objectId',
    );

    return DeviceObjectReference._(
      objectId: objectId,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const DeviceObjectReference._({
    required this.objectId,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.deviceObjectReference,
         description: 'DeviceObjectReference',
       );

  /// Creates a [DeviceObjectReference] from [element].
  factory DeviceObjectReference.fromXmlElement(XmlElement element) {
    final objectId = element.getAttribute('A')!;
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return DeviceObjectReference(
      objectId: int.parse(objectId),
      customAttributes: customAttributes,
    );
  }

  /// Object ID of the [DeviceProcessData] or [DeviceProperty] that this refers
  /// to.
  @annotation.XmlAttribute(name: 'A')
  final int objectId;

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$DeviceObjectReferenceBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
    if (customAttributes != null && customAttributes!.isNotEmpty) {
      for (final attribute in customAttributes!) {
        builder.attribute(attribute.name.local, attribute.value);
      }
    }
  }

  /// Returns a list of the XML attributes of this.
  @override
  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    final attributes = _$DeviceObjectReferenceToXmlAttributes(
      this,
      namespaces: namespaces,
    );
    if (customAttributes != null) {
      attributes.addAll(customAttributes!);
    }
    return attributes;
  }

  @override
  List<Object?> get props => [objectId];
}
