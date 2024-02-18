// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that describes a colour legend that can be used to display values
/// in different colours on a grid map.
///
/// The [ColourRange]s [ranges] specifies the colour for different value ranges.
/// If there is a value that falls outside all of the ranges, it will use the
/// [defaultColour].
@CopyWith()
@annotation.XmlRootElement(name: 'CLD')
@annotation.XmlSerializable(createMixin: true)
class ColourLegend extends Iso11783Element
    with _$ColourLegendXmlSerializableMixin {
  /// Default factory for creating a [ColourLegend] with verified arguments.
  factory ColourLegend({
    required List<ColourRange> ranges,
    required String id,
    int? defaultColour,
  }) {
    if (ranges.isEmpty) {
      throw ArgumentError.value(ranges, 'ranges', "List can't be empty");
    }
    ArgumentValidation.checkId(id: id, idRefPattern: idRefPattern);

    if (defaultColour != null) {
      ArgumentValidation.checkValueInRange(
        value: defaultColour,
        min: 0,
        max: 254,
        name: 'defaultColour',
      );
    }

    return ColourLegend._(
      ranges: ranges,
      id: id,
      defaultColour: defaultColour,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const ColourLegend._({
    required this.ranges,
    required this.id,
    this.defaultColour,
  }) : super(tag: Iso11783Tag.colourLegend, description: 'ColourLegend');

  /// Creates a [ColourLegend] from [element].
  factory ColourLegend.fromXmlElement(XmlElement element) =>
      _$ColourLegendFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [ColourLegend]s.
  static const idRefPattern = '(CLD|CLD-)([0-9])+';

  /// A list of [ColourRange]s that are used with this.
  @annotation.XmlElement(name: 'CRG')
  final List<ColourRange> ranges;

  /// Unique identifier for this colour legend.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Default colour to fall back to if a value is not in any of the [ranges].
  @annotation.XmlAttribute(name: 'B')
  final int? defaultColour;
  @override
  List<Object?> get props => super.props
    ..addAll([
      ranges,
      id,
      defaultColour,
    ]);
}

/// An element that specifies what colour to use to display values within a
/// certain value range on a grid map.
///
/// The colour palette, 0 to 254, corresponds to the palette given in the
///ISO 11783-6 standard.
@CopyWith()
@annotation.XmlRootElement(name: 'CRG')
@annotation.XmlSerializable(createMixin: true)
class ColourRange extends Iso11783Element
    with _$ColourRangeXmlSerializableMixin {
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
  }) : super(tag: Iso11783Tag.colourRange, description: 'ColourRange');

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
  ///ISO 11783-6 standard.
  @annotation.XmlAttribute(name: 'C')
  final int colour;
  @override
  List<Object?> get props => super.props
    ..addAll([
      minimumValue,
      maximumValue,
      colour,
    ]);
}
