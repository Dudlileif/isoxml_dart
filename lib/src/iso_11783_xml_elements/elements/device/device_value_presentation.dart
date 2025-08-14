// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that is used to specify the presentation of the data dictionary
/// entity-defined integer values that are used within a single [Device].
///
/// The presentation shall be according to the following formula:
///
/// Presented value = (int value + [offset]) * [scale]
///
/// Presented values are always rounded to the number of decimals specified in
/// the [numberOfDecimals] attribute.
@CopyWith()
@annotation.XmlRootElement(name: 'DVP')
@annotation.XmlSerializable(createMixin: true)
class DeviceValuePresentation extends Iso11783Element
    with _$DeviceValuePresentationXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [DeviceValuePresentation] with verified
  /// arguments.
  factory DeviceValuePresentation({
    required int objectId,
    required int offset,
    required double scale,
    required int numberOfDecimals,
    String? unitDesignator,
    List<XmlAttribute>? customAttributes,
  }) {
    ArgumentValidation.checkValueInRange(
      value: objectId,
      min: 1,
      max: 65534,
      name: 'objectId',
    );
    ArgumentValidation.checkValueInRange(
      value: offset,
      min: -2147483648,
      max: 2147483648,
      name: 'offset',
    );
    ArgumentValidation.checkValueInRange(
      value: scale,
      min: 0.000000001,
      max: 100000000,
      name: 'scale',
    );
    ArgumentValidation.checkValueInRange(
      value: numberOfDecimals,
      min: 0,
      max: 7,
      name: 'numberOfDecimals',
    );
    if (unitDesignator != null) {
      ArgumentValidation.checkStringLength(
        unitDesignator,
        name: 'unitDesignator',
      );
    }

    return DeviceValuePresentation._(
      objectId: objectId,
      offset: offset,
      scale: scale,
      numberOfDecimals: numberOfDecimals,
      unitDesignator: unitDesignator,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const DeviceValuePresentation._({
    required this.objectId,
    required this.offset,
    required this.scale,
    required this.numberOfDecimals,
    this.unitDesignator,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.deviceValuePresentation,
         description: 'DeviceValuePresentation',
       );

  /// Creates a [DeviceValuePresentation] from [element].
  factory DeviceValuePresentation.fromXmlElement(XmlElement element) {
    final objectId = element.getAttribute('A')!;
    final offset = element.getAttribute('B')!;
    final scale = element.getAttribute('C')!;
    final numberOfDecimals = element.getAttribute('D')!;
    final unitDesignator = element.getAttribute('E');
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return DeviceValuePresentation(
      objectId: int.parse(objectId),
      offset: int.parse(offset),
      scale: double.parse(scale),
      numberOfDecimals: int.parse(numberOfDecimals),
      unitDesignator: unitDesignator,
      customAttributes: customAttributes,
    );
  }

  /// Unique number inside a single [Device].
  @annotation.XmlAttribute(name: 'A')
  final int objectId;

  /// Offset to be applied to the value for presentation.
  @annotation.XmlAttribute(name: 'B')
  final int offset;

  /// Scale to be applied to the value for presentation.
  @annotation.XmlAttribute(name: 'C')
  final double scale;

  /// Number of decimals to be presented after the decimal separator.
  @annotation.XmlAttribute(name: 'D')
  final int numberOfDecimals;

  /// Optional unit designator string.
  @annotation.XmlAttribute(name: 'E')
  final String? unitDesignator;

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$DeviceValuePresentationBuildXmlChildren(
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
    final attributes = _$DeviceValuePresentationToXmlAttributes(
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
    offset,
    scale,
    numberOfDecimals,
    unitDesignator,
  ];
}
