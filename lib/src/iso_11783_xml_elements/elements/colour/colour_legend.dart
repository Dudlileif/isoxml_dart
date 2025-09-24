// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a colour legend that can be used to display values
/// in different colours on a grid map.
///
/// The [ColourRange]s [ranges] specifies the colour for different value ranges.
/// If there is a value that falls outside all of the ranges, it will use the
/// [defaultColour].

class ColourLegend extends Iso11783Element {
  /// Default factory for creating a [ColourLegend] with verified arguments.
  factory ColourLegend({
    required List<ColourRange> ranges,
    required String id,
    int? defaultColour,
  }) {
    if (ranges.isEmpty) {
      throw ArgumentError.value(ranges, 'ranges', "List can't be empty");
    }
    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);

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
  ColourLegend._({
    required List<ColourRange> ranges,
    required String id,
    int? defaultColour,
  }) : super(
         elementType: Iso11783ElementType.colourLegend,
         description: 'ColourLegend',
       ) {
    this.id = id;
    this.defaultColour = defaultColour;
    children.addAll(ranges);
  }

  /// Regular expression matching pattern for the [id] of [ColourLegend]s.
  static const staticIdRefPattern = '(CLD|CLD-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of [ColourRange]s that are used with this.
  List<ColourRange> get ranges => findElements(
    Iso11783ElementType.colourRange.xmlTag,
  ).map((e) => e as ColourRange).toList();

  /// Unique identifier for this colour legend.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Default colour to fall back to if a value is not in any of the [ranges].
  int? get defaultColour => tryParseInt('B');
  set defaultColour(int? value) => setIntNullable('B', value);
}
