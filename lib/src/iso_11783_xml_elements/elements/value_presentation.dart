// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso_11783_element.dart';

/// An element that is used to specify the presentation of data dictionary
/// entity-defined integer values.
///
/// The presentation shall be according to the following formula:
///
/// Presented value = (int value + [offset]) * [scale]
///
/// Presented values are always rounded to the number of decimals specified in
/// the [numberOfDecimals] attribute.
@CopyWith()
@annotation.XmlRootElement(name: 'VPN')
@annotation.XmlSerializable(createMixin: true)
class ValuePresentation extends Iso11783Element
    with _$ValuePresentationXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [ValuePresentation] with verified
  /// arguments.
  factory ValuePresentation({
    required String id,
    required int offset,
    required double scale,
    required int numberOfDecimals,
    String? unitDesignator,
    String? colourLegendIdRef,
    List<XmlAttribute>? customAttributes,
  }) {
    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
    ArgumentValidation.checkValueInRange(
      value: offset,
      min: -2147483648,
      max: 2147483647,
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
    if (colourLegendIdRef != null) {
      ArgumentValidation.checkId(
        id: colourLegendIdRef,
        idRefPattern: ColourLegend.staticIdRefPattern,
        idName: 'colourLegendIdRef',
      );
    }

    return ValuePresentation._(
      id: id,
      offset: offset,
      scale: scale,
      numberOfDecimals: numberOfDecimals,
      unitDesignator: unitDesignator,
      colourLegendIdRef: colourLegendIdRef,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const ValuePresentation._({
    required this.id,
    required this.offset,
    required this.scale,
    required this.numberOfDecimals,
    this.unitDesignator,
    this.colourLegendIdRef,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.valuePresentation,
         description: 'ValuePresentation',
       );

  /// Creates a [ValuePresentation] from [element].
  factory ValuePresentation.fromXmlElement(XmlElement element) {
    final id = element.getAttribute('A')!;
    final offset = element.getAttribute('B')!;
    final scale = element.getAttribute('C')!;
    final numberOfDecimals = element.getAttribute('D')!;
    final unitDesignator = element.getAttribute('E');
    final colourLegendIdRef = element.getAttribute('F');
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return ValuePresentation(
      id: id,
      offset: int.parse(offset),
      scale: double.parse(scale),
      numberOfDecimals: int.parse(numberOfDecimals),
      unitDesignator: unitDesignator,
      colourLegendIdRef: colourLegendIdRef,
      customAttributes: customAttributes,
    );
  }

  /// Regular expression matching pattern for the [id] of [ValuePresentation]s.
  static const staticIdRefPattern = '(VPN|VPN-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this value presentation.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'A')
  final String id;

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

  /// Reference to a [ColourLegend].
  @annotation.XmlAttribute(name: 'F')
  final String? colourLegendIdRef;

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$ValuePresentationBuildXmlChildren(this, builder, namespaces: namespaces);
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
    final attributes = _$ValuePresentationToXmlAttributes(
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
    id,
    offset,
    scale,
    numberOfDecimals,
    unitDesignator,
    colourLegendIdRef,
  ];
}
