// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a measured position.
///
/// The [Position] is part of an [AllocationStamp] or [Time] specification.
/// With the [Time] specification, it can be used to, for instance, log
/// [DataLogValue]s together with aposition.

class Position extends Iso11783Element {
  /// Default factory for creating a [Position] with verified
  /// arguments.
  factory Position({
    required double north,
    required double east,
    required PositionStatus status,
    int? up,
    double? pdop,
    double? hdop,
    int? numberOfSatellites,
    int? gpsUtcTimeMs,
    int? gpsUtcDate,
  }) {
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
    if (up != null) {
      ArgumentValidation.checkValueInRange(
        value: up,
        min: -2147483647,
        max: 2147483647,
        name: 'up',
      );
    }
    if (pdop != null) {
      ArgumentValidation.checkValueInRange(
        value: pdop,
        min: 0,
        max: 99.9,
        name: 'pdop',
      );
    }
    if (hdop != null) {
      ArgumentValidation.checkValueInRange(
        value: hdop,
        min: 0,
        max: 99.9,
        name: 'hdop',
      );
    }
    if (numberOfSatellites != null) {
      ArgumentValidation.checkValueInRange(
        value: numberOfSatellites,
        min: 0,
        max: 254,
        name: 'numberOfSatellites',
      );
    }
    if (gpsUtcTimeMs != null) {
      ArgumentValidation.checkValueInRange(
        value: gpsUtcTimeMs,
        min: 0,
        max: 4294967294,
        name: 'gpsUtcTimeMs',
      );
    }
    if (gpsUtcDate != null) {
      ArgumentValidation.checkValueInRange(
        value: gpsUtcDate,
        min: 0,
        max: 65534,
        name: 'gpsUtcDate',
      );
    }

    return Position._(
      north: north,
      east: east,
      status: status,
      up: up,
      pdop: pdop,
      hdop: hdop,
      numberOfSatellites: numberOfSatellites,
      gpsUtcTimeMs: gpsUtcTimeMs,
      gpsUtcDate: gpsUtcDate,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  Position._({
    required double north,
    required double east,
    required PositionStatus status,
    int? up,
    double? pdop,
    double? hdop,
    int? numberOfSatellites,
    int? gpsUtcTimeMs,
    int? gpsUtcDate,
  }) : super(elementType: _elementType) {
    this.north = north;
    this.east = east;
    this.status = status;
    this.up = up;
    this.pdop = pdop;
    this.hdop = hdop;
    this.numberOfSatellites = numberOfSatellites;
    this.gpsUtcTimeMs = gpsUtcTimeMs;
    this.gpsUtcDate = gpsUtcDate;
  }

  Position._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    _argumentValidator();
  }

  void _argumentValidator() {
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
    if (up != null) {
      ArgumentValidation.checkValueInRange(
        value: up!,
        min: -2147483647,
        max: 2147483647,
        name: 'up',
      );
    }
    if (pdop != null) {
      ArgumentValidation.checkValueInRange(
        value: pdop!,
        min: 0,
        max: 99.9,
        name: 'pdop',
      );
    }
    if (hdop != null) {
      ArgumentValidation.checkValueInRange(
        value: hdop!,
        min: 0,
        max: 99.9,
        name: 'hdop',
      );
    }
    if (numberOfSatellites != null) {
      ArgumentValidation.checkValueInRange(
        value: numberOfSatellites!,
        min: 0,
        max: 254,
        name: 'numberOfSatellites',
      );
    }
    if (gpsUtcTimeMs != null) {
      ArgumentValidation.checkValueInRange(
        value: gpsUtcTimeMs!,
        min: 0,
        max: 4294967294,
        name: 'gpsUtcTimeMs',
      );
    }
    if (gpsUtcDate != null) {
      ArgumentValidation.checkValueInRange(
        value: gpsUtcDate!,
        min: 0,
        max: 65534,
        name: 'gpsUtcDate',
      );
    }
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.position;

  /// GNSS position north, format: WGS84 latitude
  double get north => parseDouble('A');
  set north(double value) => setDouble('A', value);

  /// GNSS position east, format: WGS84 longitude.
  double get east => parseDouble('B');
  set east(double value) => setDouble('B', value);

  /// GNSS altitude in millimeters (mm) over the WGS84 ellipsoid.
  int? get up => tryParseInt('C');
  set up(int? value) => setIntNullable('C', value);

  /// GNSS position status/quality.
  PositionStatus get status => PositionStatus.values.firstWhere(
    (type) => type.value == parseInt('D'),
    orElse: () => throw ArgumentError(
      '''`${xmlElement.getAttribute('D')}` is not one of the supported values: ${PositionStatus.values.join(', ')}''',
    ),
  );
  set status(PositionStatus value) => setInt('D', value.value);

  /// PDOP Quality information.
  ///
  /// Position dilution of position (3D).
  double? get pdop => tryParseDouble('E');
  set pdop(double? value) => setDoubleNullable('E', value);

  /// HDOP Quality information.
  ///
  /// Horizontal dilution of position (2D).
  double? get hdop => tryParseDouble('F');
  set hdop(double? value) => setDoubleNullable('F', value);

  /// Number of satellites used to get fix.
  int? get numberOfSatellites => tryParseInt('G');
  set numberOfSatellites(int? value) => setIntNullable('G', value);

  /// UTC time in milliseconds since midnight.
  int? get gpsUtcTimeMs => tryParseInt('H');
  set gpsUtcTimeMs(int? value) => setIntNullable('H', value);

  /// UTC date in days relative to `1980-01-01`.
  int? get gpsUtcDate => tryParseInt('I');
  set gpsUtcDate(int? value) => setIntNullable('I', value);
}

/// An ennumerator for the status/qualty of a [Position].
enum PositionStatus {
  /// No GNSS fix.
  noGnssFix(0, 'No GNSS fix'),

  /// GNSS fix
  gnssFix(1, 'GNSS fix'),

  /// Differential GNSS fix
  dgnssFix(2, 'DGNSS fix'),

  /// Precise GNSS
  preciseGnss(3, 'Precise GNSS'),

  /// RTK fixed integer
  rtkFixedInteger(4, 'RTK fixed integer'),

  /// RTK float
  rtkFloat(5, 'RTK float'),

  /// Estimated (Dead Reckoning) mode
  estimatedDRmode(6, 'Estimated (Dead Reckoning) mode'),

  /// Manual input
  manualInput(7, 'Manual input'),

  /// Simulation mode
  simulationMode(8, 'Simulation mode'),

  /// Reserved
  reserved(9, 'Reserved'),

  /// Reserved
  reserved10(10, 'Reserved'),

  /// Reserved
  reserved11(11, 'Reserved'),

  /// Reserved
  reserved12(12, 'Reserved'),

  /// Reserved
  reserved13(13, 'Reserved'),

  /// Error
  error(14, 'Error'),

  /// Not available
  notAvailable(15, 'Not available');

  const PositionStatus(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
