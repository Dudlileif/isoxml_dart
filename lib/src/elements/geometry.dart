// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that describes the position and appearance of a point location.
///
/// Points of type [PointType.flag] can be used to assign a comment to the
/// position of the [Point]. This is to enable the task controller to display
/// farm-side-generated comments stored in [designator] at a certain position as
/// informational messages to the operator.
@CopyWith()
@annotation.XmlRootElement(name: 'PNT')
@annotation.XmlSerializable(createMixin: true)
class Point extends Iso11783Element with _$PointXmlSerializableMixin {
  /// Default factory for creating a [Point] with verified
  /// arguments.
  factory Point({
    required PointType type,
    required double north,
    required double east,
    int? up,
    String? designator,
    int? colour,
    String? id,
    double? horizontalAccuracy,
    double? verticalAccuracy,
    String? filename,
    int? fileLength,
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
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }
    if (colour != null) {
      ArgumentValidation.checkValueInRange(
        value: colour,
        min: 0,
        max: 254,
        name: 'colour',
      );
    }
    if (id != null) {
      ArgumentValidation.checkId(id: id, idRefPattern: idRefPattern);
    }
    if (horizontalAccuracy != null) {
      ArgumentValidation.checkValueInRange(
        value: horizontalAccuracy,
        min: 0,
        max: 65,
        name: 'horizontalAccuracy',
      );
    }
    if (verticalAccuracy != null) {
      ArgumentValidation.checkValueInRange(
        value: verticalAccuracy,
        min: 0,
        max: 65,
        name: 'verticalAccuracy',
      );
    }
    if (filename != null) {
      ArgumentValidation.checkId(
        id: filename,
        idRefPattern: filenamePattern,
        idName: 'filename',
        minLength: 8,
        maxLength: 8,
      );
    }
    if (fileLength != null) {
      ArgumentValidation.checkValueInRange(
        value: fileLength,
        min: 0,
        max: 4294967294,
        name: 'fileLength',
      );
    }

    return Point._(
      type: type,
      north: north,
      east: east,
      designator: designator,
      up: up,
      colour: colour,
      id: id,
      horizontalAccuracy: horizontalAccuracy,
      verticalAccuracy: verticalAccuracy,
      filename: filename,
      fileLength: fileLength,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const Point._({
    required this.type,
    required this.north,
    required this.east,
    this.designator,
    this.up,
    this.colour,
    this.id,
    this.horizontalAccuracy,
    this.verticalAccuracy,
    this.filename,
    this.fileLength,
  }) : super(tag: Iso11783Tag.point, description: 'Point');

  /// Creates a [Point] from [element].
  factory Point.fromXmlElement(XmlElement element) =>
      _$PointFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [Point]s.
  static const idRefPattern = '(PNT|PNT-)([0-9])+';

  /// Regular expression matching pattern for filenames for [Point]s.
  static const filenamePattern = 'PNT([0-9]){5}';

  /// Which type of point this is.
  @annotation.XmlAttribute(name: 'A')
  final PointType type;

  /// Name of this, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String? designator;

  /// GNSS position north, format: WGS84 latitude
  @annotation.XmlAttribute(name: 'C')
  final double north;

  /// GNSS position east, format: WGS84 longitude.
  @annotation.XmlAttribute(name: 'D')
  final double east;

  /// GNSS altitude in millimeters (mm) over the WGS84 ellipsoid.
  @annotation.XmlAttribute(name: 'E')
  final int? up;

  /// Colour of this.
  ///
  /// See colour palette inISO 11783-6.
  @annotation.XmlAttribute(name: 'F')
  final int? colour;

  /// Unique identifier for this point.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'G')
  final String? id;

  /// Horizontal accuracy.
  @annotation.XmlAttribute(name: 'H')
  final double? horizontalAccuracy;

  /// Vertical accuracy.
  @annotation.XmlAttribute(name: 'I')
  final double? verticalAccuracy;

  /// Filename for external file.
  @annotation.XmlAttribute(name: 'J')
  final String? filename;

  /// Length of external file in bytes.
  @annotation.XmlAttribute(name: 'K')
  final int? fileLength;

  @override
  List<Object?> get props => super.props
    ..addAll([
      type,
      designator,
      north,
      east,
      up,
      colour,
      id,
      horizontalAccuracy,
      verticalAccuracy,
      filename,
      fileLength,
    ]);
}

/// An enumerator for what type a [Point] is.
@annotation.XmlEnum()
enum PointType {
  /// Flag
  @annotation.XmlValue('1')
  flag(1, 'Flag'),

  /// Other
  @annotation.XmlValue('2')
  other(2, 'Other'),

  /// Field access
  @annotation.XmlValue('3')
  fieldAccess(3, 'Field Access'),

  /// Storage
  @annotation.XmlValue('4')
  storage(4, 'Storage'),
  @annotation.XmlValue('5')

  /// Obstacle
  obstacle(5, 'Obstacle'),
  @annotation.XmlValue('6')

  /// Guidance reference A
  guidanceReferenceA(6, 'Guidance Reference A'),
  @annotation.XmlValue('7')

  /// Guidance reference B
  guidanceReferenceB(7, 'Guidance Reference B'),
  @annotation.XmlValue('8')

  /// Guidance refernce center
  guidanceReferenceCenter(8, 'Guidance Reference Center'),
  @annotation.XmlValue('9')

  /// Partfield reference point
  partfieldReferencePoint(9, 'Partfield Reference Point'),
  @annotation.XmlValue('10')

  /// Homebase
  homebase(10, 'Homebase');

  const PointType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// Short description of the value.
  final String description;
}

/// An element that describes the position, length and appearance of a line.
///
/// Linestrings of the type [LineStringType.flag] can be used to assign a
/// comment to all positions of the linestring. This is to enable the task
/// controller to display farm-side-generated comments stored in the
/// [designator] at certain positions as informational messages to the operator.
@CopyWith()
@annotation.XmlRootElement(name: 'LSG')
@annotation.XmlSerializable(createMixin: true)
class LineString extends Iso11783Element with _$LineStringXmlSerializableMixin {
  /// Default factory for creating a [LineString] with verified
  /// arguments.
  factory LineString({
    required List<Point> points,
    required LineStringType type,
    String? designator,
    int? width,
    int? length,
    int? colour,
    String? id,
  }) {
    if (points.isEmpty) {
      throw ArgumentError.value(points, 'points', 'Should not be empty');
    }
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }
    if (width != null) {
      ArgumentValidation.checkValueInRange(
        value: width,
        min: 0,
        max: 4294967294,
        name: 'wdith',
      );
    }
    if (length != null) {
      ArgumentValidation.checkValueInRange(
        value: length,
        min: 0,
        max: 4294967294,
        name: 'length',
      );
    }
    if (colour != null) {
      ArgumentValidation.checkValueInRange(
        value: colour,
        min: 0,
        max: 254,
        name: 'colour',
      );
    }
    if (id != null) {
      ArgumentValidation.checkId(id: id, idRefPattern: idRefPattern);
    }

    return LineString._(
      points: points,
      type: type,
      designator: designator,
      width: width,
      length: length,
      colour: colour,
      id: id,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const LineString._({
    required this.points,
    required this.type,
    this.designator,
    this.width,
    this.length,
    this.colour,
    this.id,
  }) : super(tag: Iso11783Tag.lineString, description: 'LineString');

  /// Creates a [LineString] from [element].
  factory LineString.fromXmlElement(XmlElement element) =>
      _$LineStringFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [LineString]s.
  static const idRefPattern = '(LSG|LSG-)([0-9])+';

  /// The positions along this.
  @annotation.XmlElement(name: 'PNT')
  final List<Point> points;

  /// Which type of line string this is.
  @annotation.XmlAttribute(name: 'A')
  final LineStringType type;

  /// Name of this, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String? designator;

  /// Width of this in millimeters.
  @annotation.XmlAttribute(name: 'C')
  final int? width;

  /// Length of this in millimeters.
  @annotation.XmlAttribute(name: 'D')
  final int? length;

  /// Colour of this.
  ///
  /// SeeISO 11783-6 for colour palette.
  @annotation.XmlAttribute(name: 'E')
  final int? colour;

  /// Unique identifier for this line string.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'F')
  final String? id;

  @override
  List<Object?> get props => super.props
    ..addAll([
      points,
      type,
      designator,
      width,
      length,
      colour,
      id,
    ]);
}

/// An enumerator for which type a [LineString] is.
@annotation.XmlEnum()
enum LineStringType {
  /// The exterior of a [Polygon].
  @annotation.XmlValue('1')
  polygonExterior(1, 'Polygon Exterior'),

  /// An interior of a [Polygon].
  @annotation.XmlValue('2')
  polygonInterior(2, 'Polygon Interior'),

  /// A tramline in a field.
  @annotation.XmlValue('3')
  tramline(3, 'Tramline'),

  /// A sampling route.
  @annotation.XmlValue('4')
  samplingRoute(4, 'Sampling Route'),

  /// A guidance pattern.
  @annotation.XmlValue('5')
  guidancePattern(5, 'Guidance Pattern'),

  /// A drainage indication line.
  @annotation.XmlValue('6')
  drainage(6, 'Drainage'),

  /// A fence.
  @annotation.XmlValue('7')
  fence(7, 'Fence'),

  /// A flag to show comments on positions.
  @annotation.XmlValue('8')
  flag(8, 'Flag'),

  /// An obstacle to avoid.
  @annotation.XmlValue('9')
  obstacle(9, 'Obstacle'),
  ;

  const LineStringType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An element that describes areas by inclusion of [LineString]s.
///
/// A [Polygon] can be used to specify the boundary of a [Partfield] or the
/// area of a [TreatmentZone].
///
/// Polygons of type [PolygonType.flag] can be used to assign a comment to all
/// positions inside the polygon. This is to enablethe task controller to
/// display farm-side-generated comments stored in [designator] at certain
/// positions as informational messages to the operator.
@CopyWith()
@annotation.XmlRootElement(name: 'PLN')
@annotation.XmlSerializable(createMixin: true)
class Polygon extends Iso11783Element with _$PolygonXmlSerializableMixin {
  /// Default factory for creating a [Polygon] with verified
  /// arguments.
  factory Polygon({
    required PolygonType type,
    List<LineString>? lineStrings,
    String? designator,
    int? area,
    int? colour,
    String? id,
  }) {
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }
    if (area != null) {
      ArgumentValidation.checkValueInRange(
        value: area,
        min: 0,
        max: 4294967294,
        name: 'area',
      );
    }
    if (colour != null) {
      ArgumentValidation.checkValueInRange(
        value: colour,
        min: 0,
        max: 254,
        name: 'colour',
      );
    }
    if (id != null) {
      ArgumentValidation.checkId(id: id, idRefPattern: idRefPattern);
    }
    return Polygon._(
      type: type,
      lineStrings: lineStrings,
      designator: designator,
      area: area,
      colour: colour,
      id: id,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const Polygon._({
    required this.type,
    this.lineStrings,
    this.designator,
    this.area,
    this.colour,
    this.id,
  }) : super(tag: Iso11783Tag.polygon, description: 'Polygon');

  /// Creates a [Polygon] from [element].
  factory Polygon.fromXmlElement(XmlElement element) =>
      _$PolygonFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [Polygon]s.
  static const idRefPattern = '(PLN|PLN-)([0-9])+';

  /// The line strins that makes up this polygon.
  @annotation.XmlElement(name: 'LSG')
  final List<LineString>? lineStrings;

  /// Which type of polygon this is.
  @annotation.XmlAttribute(name: 'A')
  final PolygonType type;

  /// Name of the polygon, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String? designator;

  /// Area of the polygon in m².
  @annotation.XmlAttribute(name: 'C')
  final int? area;

  /// Colour of this.
  ///
  /// See colour palette inISO 11783-6.
  @annotation.XmlAttribute(name: 'D')
  final int? colour;

  /// Unique identifier for this polygon.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'E')
  final String? id;

  @override
  List<Object?> get props => super.props
    ..addAll([
      lineStrings,
      type,
      designator,
      area,
      colour,
      id,
    ]);
}

/// An enumerator for which type a [Polygon] is.
@annotation.XmlEnum()
enum PolygonType {
  /// Boundary of a [Partfield].
  @annotation.XmlValue('1')
  partfieldBoundary(1, 'Partfield Boundary'),

  /// [TreatmentZone]
  @annotation.XmlValue('2')
  treatmentZone(2, 'Treatment Zone'),

  /// Water surface
  @annotation.XmlValue('3')
  waterSurface(3, 'Water Surface'),

  /// Building
  @annotation.XmlValue('4')
  building(4, 'Building'),

  /// Road
  @annotation.XmlValue('5')
  road(5, 'Road'),

  /// An obstacle to avoid.
  @annotation.XmlValue('6')
  obstacle(6, 'Obstacle'),

  /// Flag
  @annotation.XmlValue('7')
  flag(7, 'Flag'),

  /// Other
  @annotation.XmlValue('8')
  other(8, 'Other'),

  /// Mainfield
  @annotation.XmlValue('9')
  mainfield(9, 'Mainfield'),

  /// Headland
  @annotation.XmlValue('10')
  headland(10, 'Headland'),

  /// Buffer zone
  @annotation.XmlValue('11')
  bufferZone(11, 'Buffer Zone'),

  /// Windbreak
  @annotation.XmlValue('12')
  windbreak(12, 'Windbreak'),
  ;

  const PolygonType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
