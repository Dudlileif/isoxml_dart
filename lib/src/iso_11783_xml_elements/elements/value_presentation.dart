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

class ValuePresentation extends Iso11783Element {
  /// Default factory for creating a [ValuePresentation] with verified
  /// arguments.
  factory ValuePresentation({
    required String id,
    required int offset,
    required double scale,
    required int numberOfDecimals,
    String? unitDesignator,
    String? colourLegendIdRef,
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
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  ValuePresentation._({
    required String id,
    required int offset,
    required double scale,
    required int numberOfDecimals,
    String? unitDesignator,
    String? colourLegendIdRef,
  }) : super(elementType: _elementType) {
    this.id = id;
    this.offset = offset;
    this.scale = scale;
    this.numberOfDecimals = numberOfDecimals;
    this.unitDesignator = unitDesignator;
    this.colourLegendIdRef = colourLegendIdRef;
  }

  ValuePresentation._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    _argumentValidator();
  }

  void _argumentValidator() {
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
        unitDesignator!,
        name: 'unitDesignator',
      );
    }
    if (colourLegendIdRef != null) {
      ArgumentValidation.checkId(
        id: colourLegendIdRef!,
        idRefPattern: ColourLegend.staticIdRefPattern,
        idName: 'colourLegendIdRef',
      );
    }
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.valuePresentation;

  /// Regular expression matching pattern for the [id] of [ValuePresentation]s.
  static const staticIdRefPattern = '(VPN|VPN-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this value presentation.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Offset to be applied to the value for presentation.
  int get offset => parseInt('B');
  set offset(int value) => setInt('B', value);

  /// Scale to be applied to the value for presentation.
  double get scale => parseDouble('C');
  set scale(double value) => setDouble('C', value);

  /// Number of decimals to be presented after the decimal separator.
  int get numberOfDecimals => parseInt('D');
  set numberOfDecimals(int value) => setInt('D', value);

  /// Optional unit designator string.
  String? get unitDesignator => tryParseString('E');
  set unitDesignator(String? value) => setStringNullable('E', value);

  /// Reference to a [ColourLegend].
  String? get colourLegendIdRef => tryParseString('F');
  set colourLegendIdRef(String? value) => setStringNullable('F', value);
}
