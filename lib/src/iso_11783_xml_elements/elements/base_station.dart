// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso_11783_element.dart';

/// An element for describing the base station of the positioning system.
///
/// Contains positional information for latitude, longitude and height.
@CopyWith()
@annotation.XmlRootElement(name: 'BSN')
@annotation.XmlSerializable(createMixin: true)
class BaseStation extends Iso11783Element
    with _$BaseStationXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [BaseStation] with verified arguments.
  factory BaseStation({
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
    );
    ArgumentValidation.checkValueInRange(
      value: north,
      min: -90,
      max: 90,
      name: 'north',
    );
    ArgumentValidation.checkValueInRange(
      value: east,
      min: -180,
      max: 180,
      name: 'east',
    );
    ArgumentValidation.checkValueInRange(
      value: up,
      min: -2147483647,
      max: 2147483647,
      name: 'up',
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
  const BaseStation._({
    required this.id,
    required this.designator,
    required this.north,
    required this.east,
    required this.up,
  }) : super(
         elementType: Iso11783ElementType.baseStation,
         description: 'BaseStation',
         onlyVersion4AndAbove: true,
       );

  /// Creates a [BaseStation] from [element].
  factory BaseStation.fromXmlElement(XmlElement element) {
    final id = element.getAttribute('A')!;
    final designator = element.getAttribute('B')!;
    final north = element.getAttribute('C')!;
    final east = element.getAttribute('D')!;
    final up = element.getAttribute('E')!;
    return BaseStation(
      id: id,
      designator: designator,
      north: double.parse(north),
      east: double.parse(east),
      up: num.parse(up).round(),
    );
  }

  /// Regular expression matching pattern for the [id] of [BaseStation]s.
  static const String staticIdRefPattern = '(BSN|BSN-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this base station.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the base station, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  /// GNSS position north, format: WGS84 latitude
  @annotation.XmlAttribute(name: 'C')
  final double north;

  /// GNSS position east, format: WGS84 longitude.
  @annotation.XmlAttribute(name: 'D')
  final double east;

  /// GNSS altitude in millimeters (mm) over the WGS84 ellipsoid.
  @annotation.XmlAttribute(name: 'E')
  final int up;

  @override
  List<Object?> get props => [
    id,
    designator,
    north,
    east,
    up,
  ];
}
