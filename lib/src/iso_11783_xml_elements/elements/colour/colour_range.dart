// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that specifies what colour to use to display values within a
/// certain value range on a grid map.
///
/// The colour palette, 0 to 254, corresponds to the palette given in the
///ISO 11783-6 standard.
@CopyWith()
@annotation.XmlRootElement(name: 'CRG')
@annotation.XmlSerializable(createMixin: true)
class ColourRange extends Iso11783Element
    with _$ColourRangeXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [ColourLegend] with verified arguments.
  factory ColourRange({
    required int minimumValue,
    required int maximumValue,
    required int colour,
  }) {
    ArgumentValidation.checkValueInRange(
      value: minimumValue,
      min: -2147483647,
      max: 2147483647,
      name: 'minimumValue',
    );
    ArgumentValidation.checkValueInRange(
      value: maximumValue,
      min: -2147483647,
      max: 2147483647,
      name: 'maximumValue',
    );
    ArgumentValidation.checkValueInRange(
      value: colour,
      min: 0,
      max: 254,
      name: 'colour',
    );

    return ColourRange._(
      minimumValue: minimumValue,
      maximumValue: maximumValue,
      colour: colour,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const ColourRange._({
    required this.minimumValue,
    required this.maximumValue,
    required this.colour,
  }) : super(
         elementType: Iso11783ElementType.colourRange,
         description: 'ColourRange',
       );

  /// Creates a [ColourRange] from [element].
  factory ColourRange.fromXmlElement(XmlElement element) =>
      _$ColourRangeFromXmlElement(element);

  /// Minimum value in the range.
  @annotation.XmlAttribute(name: 'A')
  final int minimumValue;

  /// Maximum value in the range.
  @annotation.XmlAttribute(name: 'B')
  final int maximumValue;

  /// Colour for the range. Value from 0 to 254 for palette given in
  /// ISO 11783-6 standard, or the implementation in [Iso11783Colour].
  @annotation.XmlAttribute(name: 'C')
  final int colour;
  @override
  List<Object?> get props => [
    minimumValue,
    maximumValue,
    colour,
  ];
}
