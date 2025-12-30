// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso_11783_element.dart';

/// An element for describing the base station of the positioning system.
///
/// Contains positional information for latitude, longitude and height.

class BaseStation extends Iso11783Element {
  /// Default factory for creating a [BaseStation] with verified arguments.
  factory BaseStation({
    required String id,
    required String designator,
    required double north,
    required double east,
    required int up,
  }) {
    _argumentValidator(
      id: id,
      designator: designator,
      north: north,
      east: east,
      up: up,
    );

    return BaseStation._(
      id: id,
      designator: designator,
      north: north,
      east: east,
      up: up,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  BaseStation._({
    required String id,
    required String designator,
    required double north,
    required double east,
    required int up,
  }) : super._(elementType: _elementType) {
    this.id = id;
    this.designator = designator;
    this.north = north;
    this.east = east;
    this.up = up;
  }

  BaseStation._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    _argumentValidator(
      id: id,
      designator: designator,
      north: north,
      east: east,
      up: up,
    );
  }

  static void _argumentValidator({
    required String id,
    required String designator,
    required double north,
    required double east,
    required int up,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
      idName: 'BaseStation.id',
      designatorName: 'BaseStation.designator',
    );
    ArgumentValidation.checkValueInRange(
      value: north,
      min: -90,
      max: 90,
      name: 'BaseStation.north',
    );
    ArgumentValidation.checkValueInRange(
      value: east,
      min: -180,
      max: 180,
      name: 'BaseStation.east',
    );
    ArgumentValidation.checkValueInRange(
      value: up,
      min: -2147483647,
      max: 2147483647,
      name: 'BaseStation.up',
    );
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.baseStation;

  /// Regular expression matching pattern for the [id] of [BaseStation]s.
  static const String staticIdRefPattern = '(BSN|BSN-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this base station.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Name of the base station, description or comment.
  String get designator => parseString('B');
  set designator(String value) => setString('B', value);

  /// GNSS position north, format: WGS84 latitude
  double get north => parseDouble('C');
  set north(double value) => setDouble('C', value);

  /// GNSS position east, format: WGS84 longitude.
  double get east => parseDouble('D');
  set east(double value) => setDouble('D', value);

  /// GNSS altitude in millimeters (mm) over the WGS84 ellipsoid.
  int get up => parseInt('E');
  set up(int value) => setInt('E', value);
}
