// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that specifies what colour to use to display values within a
/// certain value range on a grid map.
///
/// The colour palette, 0 to 254, corresponds to the palette given in the
///ISO 11783-6 standard.

class ColourRange extends Iso11783Element {
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
  ColourRange._({
    required int minimumValue,
    required int maximumValue,
    required int colour,
  }) : super(
         elementType: _elementType,
       ) {
    this.minimumValue = minimumValue;
    this.maximumValue = maximumValue;
    this.colour = colour;
  }

  ColourRange._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    _argumentValidator();
  }

  void _argumentValidator() {
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
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.colourRange;

  /// Minimum value in the range.
  int get minimumValue => parseInt('A');
  set minimumValue(int value) => setInt('A', value);

  /// Maximum value in the range.
  int get maximumValue => parseInt('B');
  set maximumValue(int value) => setInt('B', value);

  /// Colour for the range. Value from 0 to 254 for palette given in
  /// ISO 11783-6 standard, or the implementation in [Iso11783Colour].
  int get colour => parseInt('C');
  set colour(int value) => setInt('C', value);
}
