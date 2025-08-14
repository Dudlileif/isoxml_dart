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
    with _$DeviceProcessDataXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [DeviceProcessData] with verified
  /// arguments.
  factory DeviceProcessData({
    required int objectId,
    required String ddi,
    required int property,
    required int triggerMethods,
    String? designator,
    int? presentationObjectId,
    List<XmlAttribute>? customAttributes,
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
      customAttributes: customAttributes,
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
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.deciveProcessData,
         description: 'DeviceProcessData',
       );

  /// Creates a [DeviceProcessData] from [element].
  factory DeviceProcessData.fromXmlElement(XmlElement element) {
    final objectId = element.getAttribute('A')!;
    final ddi = element.getAttribute('B')!;
    final property = element.getAttribute('C')!;
    final triggerMethods = element.getAttribute('D')!;
    final designator = element.getAttribute('E');
    final presentationObjectId = element.getAttribute('F');
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return DeviceProcessData(
      objectId: int.parse(objectId),
      ddi: ddi,
      property: int.parse(property),
      triggerMethods: int.parse(triggerMethods),
      designator: designator,
      presentationObjectId: presentationObjectId != null
          ? int.parse(presentationObjectId)
          : null,
      customAttributes: customAttributes,
    );
  }

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

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$DeviceProcessDataBuildXmlChildren(this, builder, namespaces: namespaces);
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
    final attributes = _$DeviceProcessDataToXmlAttributes(
      this,
      namespaces: namespaces,
    );
    if (customAttributes != null) {
      attributes.addAll(customAttributes!);
    }
    return attributes;
  }

  @override
  List<Object?> get props => [
    objectId,
    ddi,
    property,
    triggerMethods,
    designator,
    presentationObjectId,
  ];
}
