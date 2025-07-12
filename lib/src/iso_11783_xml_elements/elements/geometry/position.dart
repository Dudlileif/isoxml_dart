// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a measured position.
///
/// The [Position] is part of an [AllocationStamp] or [Time] specification.
/// With the [Time] specification, it can be used to, for instance, log
/// [DataLogValue]s together with aposition.
@CopyWith()
@annotation.XmlRootElement(name: 'PTN')
@annotation.XmlSerializable(createMixin: true)
class Position extends Iso11783Element
    with _$PositionXmlSerializableMixin, EquatableMixin {
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
  const Position._({
    required this.north,
    required this.east,
    required this.status,
    this.up,
    this.pdop,
    this.hdop,
    this.numberOfSatellites,
    this.gpsUtcTimeMs,
    this.gpsUtcDate,
  }) : super(
         elementType: Iso11783ElementType.position,
         description: 'Position',
       );

  /// Creates a [Position] from [element].
  factory Position.fromXmlElement(XmlElement element) {
    final north = element.getAttribute('A')!;
    final east = element.getAttribute('B')!;
    final up = element.getAttribute('C');
    final status = element.getAttribute('D')!;
    final pdop = element.getAttribute('E');
    final hdop = element.getAttribute('F');
    final numberOfSatellites = element.getAttribute('G');
    final gpsUtcTimeMs = element.getAttribute('H');
    final gpsUtcDate = element.getAttribute('I');
    return Position(
      north: double.parse(north),
      east: double.parse(east),
      up: up != null ? num.tryParse(up)?.round() : null,
      status: $PositionStatusEnumMap.entries
          .singleWhere(
            (positionStatusEnumMapEntry) =>
                positionStatusEnumMapEntry.value == status,
            orElse: () => throw ArgumentError(
              '''`$status` is not one of the supported values: ${$PositionStatusEnumMap.values.join(', ')}''',
            ),
          )
          .key,
      pdop: pdop != null ? double.parse(pdop) : null,
      hdop: hdop != null ? double.parse(hdop) : null,
      numberOfSatellites: numberOfSatellites != null
          ? int.parse(numberOfSatellites)
          : null,
      gpsUtcTimeMs: gpsUtcTimeMs != null ? int.parse(gpsUtcTimeMs) : null,
      gpsUtcDate: gpsUtcDate != null ? int.parse(gpsUtcDate) : null,
    );
  }

  /// GNSS position north, format: WGS84 latitude
  @annotation.XmlAttribute(name: 'A')
  final double north;

  /// GNSS position east, format: WGS84 longitude.
  @annotation.XmlAttribute(name: 'B')
  final double east;

  /// GNSS altitude in millimeters (mm) over the WGS84 ellipsoid.
  @annotation.XmlAttribute(name: 'C')
  final int? up;

  /// GNSS position status/quality.
  @annotation.XmlAttribute(name: 'D')
  final PositionStatus status;

  /// PDOP Quality information.
  ///
  /// Position dilution of position (3D).
  @annotation.XmlAttribute(name: 'E')
  final double? pdop;

  /// HDOP Quality information.
  ///
  /// Horizontal dilution of position (2D).
  @annotation.XmlAttribute(name: 'F')
  final double? hdop;

  /// Number of satellites used to get fix.
  @annotation.XmlAttribute(name: 'G')
  final int? numberOfSatellites;

  /// UTC time in milliseconds since midnight.
  @annotation.XmlAttribute(name: 'H')
  final int? gpsUtcTimeMs;

  /// UTC date in days relative to `1980-01-01`.
  @annotation.XmlAttribute(name: 'I')
  final int? gpsUtcDate;

  @override
  List<Object?> get props => [
    north,
    east,
    up,
    status,
    pdop,
    hdop,
    numberOfSatellites,
    gpsUtcTimeMs,
    gpsUtcDate,
  ];
}

/// An ennumerator for the status/qualty of a [Position].
@annotation.XmlEnum()
enum PositionStatus {
  /// No GNSS fix.
  @annotation.XmlValue('0')
  noGnssFix(0, 'No GNSS fix'),

  /// GNSS fix
  @annotation.XmlValue('1')
  gnssFix(1, 'GNSS fix'),

  /// Differential GNSS fix
  @annotation.XmlValue('2')
  dgnssFix(2, 'DGNSS fix'),

  /// Precise GNSS
  @annotation.XmlValue('3')
  preciseGnss(3, 'Precise GNSS'),

  /// RTK fixed integer
  @annotation.XmlValue('4')
  rtkFixedInteger(4, 'RTK fixed integer'),

  /// RTK float
  @annotation.XmlValue('5')
  rtkFloat(5, 'RTK float'),

  /// Estimated (Dead Reckoning) mode
  @annotation.XmlValue('6')
  estimatedDRmode(6, 'Estimated (Dead Reckoning) mode'),

  /// Manual input
  @annotation.XmlValue('7')
  manualInput(7, 'Manual input'),

  /// Simulation mode
  @annotation.XmlValue('8')
  simulationMode(8, 'Simulation mode'),

  /// Reserved
  @annotation.XmlValue('9')
  reserved(9, 'Reserved'),

  /// Reserved
  @annotation.XmlValue('10')
  reserved10(10, 'Reserved'),

  /// Reserved
  @annotation.XmlValue('11')
  reserved11(11, 'Reserved'),

  /// Reserved
  @annotation.XmlValue('12')
  reserved12(12, 'Reserved'),

  /// Reserved
  @annotation.XmlValue('13')
  reserved13(13, 'Reserved'),

  /// Error
  @annotation.XmlValue('14')
  error(14, 'Error'),

  /// Not available
  @annotation.XmlValue('15')
  notAvailable(15, 'Not available');

  const PositionStatus(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
