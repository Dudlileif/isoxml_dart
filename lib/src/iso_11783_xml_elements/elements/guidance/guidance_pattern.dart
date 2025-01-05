// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes patterns from [LineString]s and a boundary
/// [Polygon] to use with nagivation guidance (steering).
@CopyWith()
@annotation.XmlRootElement(name: 'GPN')
@annotation.XmlSerializable(createMixin: true)
class GuidancePattern extends Iso11783Element
    with _$GuidancePatternXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [GuidancePattern] with verified
  /// arguments.
  factory GuidancePattern({
    required List<LineString> lineStrings,
    required String id,
    required GuidancePatternType type,
    Polygon? boundaryPolygon,
    String? designator,
    GuidancePatternOptions? options,
    GuidancePatternPropagationDirection? propagationDirection,
    GuidancePatternExtension? extension,
    double? heading,
    int? radius,
    GuidancePatternGnssMethod? gnssMethod,
    double? horizontalAccuracy,
    double? verticalAccuracy,
    String? baseStationIdRef,
    String? originalSRID,
    int? numberOfSwathsLeft,
    int? numberOfSwathsRight,
  }) {
    if (lineStrings.isEmpty) {
      throw ArgumentError.value(
        lineStrings,
        'lineStrings',
        'Should not be empty',
      );
    }

    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }
    if (heading != null) {
      ArgumentValidation.checkValueInRange(
        value: heading,
        min: 0,
        max: 360,
        name: 'heading',
      );
    }
    if (radius != null) {
      ArgumentValidation.checkValueInRange(
        value: radius,
        min: 0,
        max: 4294967294,
        name: 'radius',
      );
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
    if (baseStationIdRef != null) {
      ArgumentValidation.checkId(
        id: baseStationIdRef,
        idRefPattern: BaseStation.staticIdRefPattern,
        idName: 'baseStationIdRef',
      );
    }
    if (originalSRID != null) {
      ArgumentValidation.checkStringLength(originalSRID, name: 'originalSRID');
    }
    if (numberOfSwathsLeft != null) {
      ArgumentValidation.checkValueInRange(
        value: numberOfSwathsLeft,
        min: 0,
        max: 4294967294,
        name: 'numberOfSwathsLeft',
      );
    }
    if (numberOfSwathsRight != null) {
      ArgumentValidation.checkValueInRange(
        value: numberOfSwathsRight,
        min: 0,
        max: 4294967294,
        name: 'numberOfSwathsRight',
      );
    }
    return GuidancePattern._(
      lineStrings: lineStrings,
      id: id,
      type: type,
      boundaryPolygon: boundaryPolygon,
      designator: designator,
      options: options,
      propagationDirection: propagationDirection,
      extension: extension,
      heading: heading,
      radius: radius,
      gnssMethod: gnssMethod,
      horizontalAccuracy: horizontalAccuracy,
      verticalAccuracy: verticalAccuracy,
      baseStationIdRef: baseStationIdRef,
      originalSRID: originalSRID,
      numberOfSwathsLeft: numberOfSwathsLeft,
      numberOfSwathsRight: numberOfSwathsRight,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  GuidancePattern._({
    required List<LineString> lineStrings,
    required this.id,
    required this.type,
    this.boundaryPolygon,
    this.designator,
    this.options,
    this.propagationDirection,
    this.extension,
    this.heading,
    this.radius,
    this.gnssMethod,
    this.horizontalAccuracy,
    this.verticalAccuracy,
    this.baseStationIdRef,
    this.originalSRID,
    this.numberOfSwathsLeft,
    this.numberOfSwathsRight,
  }) : super(
          elementType: Iso11783ElementType.guidancePattern,
          description: 'GuidancePattern',
          onlyVersion4AndAbove: true,
        ) {
    this.lineStrings.addAll(lineStrings);
  }

  /// Creates a [GuidancePattern] from [element].
  factory GuidancePattern.fromXmlElement(XmlElement element) =>
      _$GuidancePatternFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [GuidancePattern]s.
  static const staticIdRefPattern = '(GPN|GPN-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Boundary [Polygon] for this.
  @annotation.XmlElement(name: 'PLN', includeIfNull: false)
  final Polygon? boundaryPolygon;

  /// A list of [LineString]s for this.
  ///
  /// The separation spacing between the paths for each [LineString] pattern
  /// is the [LineString.width] parameter.
  @annotation.XmlElement(name: 'LSG')
  final List<LineString> lineStrings = [];

  /// Unique identifier for this guidance pattern.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the guidance pattern, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String? designator;

  /// Which type of guidance pattern this is.
  @annotation.XmlAttribute(name: 'C')
  final GuidancePatternType type;

  /// Options if [type] is [GuidancePatternType.pivot].
  @annotation.XmlAttribute(name: 'D')
  final GuidancePatternOptions? options;

  /// Which directions the pattern should propagate in, as seen from point
  /// A to the next point.
  @annotation.XmlAttribute(name: 'E')
  final GuidancePatternPropagationDirection? propagationDirection;

  /// In which ends the pattern should extend further than the start/end point.
  @annotation.XmlAttribute(name: 'F')
  final GuidancePatternExtension? extension;

  /// Heading/bearing of the pattern.
  @annotation.XmlAttribute(name: 'G')
  final double? heading;

  /// Radius of the pattern in millimeters.
  @annotation.XmlAttribute(name: 'H')
  final int? radius;

  /// Status/quality of the GNSS positioning for this.
  @annotation.XmlAttribute(name: 'I')
  final GuidancePatternGnssMethod? gnssMethod;

  /// Horizontal accuracy, from 0 to 65 meters.
  @annotation.XmlAttribute(name: 'J')
  final double? horizontalAccuracy;

  /// Vertical accuracy, from 0 to 65 meters.
  @annotation.XmlAttribute(name: 'K')
  final double? verticalAccuracy;

  /// Reference to a [BaseStation].
  @annotation.XmlAttribute(name: 'L')
  final String? baseStationIdRef;

  /// ID of the original Spatial-Reference system.
  ///
  /// Typically EPSG:4326.
  @annotation.XmlAttribute(name: 'M')
  final String? originalSRID;

  /// Number of swaths to the left of the reference pattern, as seen from
  /// point A to the next point.
  @annotation.XmlAttribute(name: 'N')
  final int? numberOfSwathsLeft;

  /// Number of swaths to the right of the reference pattern, as seen from
  /// point A to the next point.
  @annotation.XmlAttribute(name: 'O')
  final int? numberOfSwathsRight;

  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
        ...[
          for (final a in lineStrings.map((e) => e.selfWithRecursiveChildren))
            ...a,
        ],
        if (boundaryPolygon != null)
          ...boundaryPolygon!.selfWithRecursiveChildren,
      ];

  @override
  List<Object?> get props => [
        boundaryPolygon,
        lineStrings,
        id,
        designator,
        type,
        options,
        propagationDirection,
        extension,
        heading,
        radius,
        gnssMethod,
        horizontalAccuracy,
        verticalAccuracy,
        baseStationIdRef,
        originalSRID,
        numberOfSwathsLeft,
        numberOfSwathsRight,
      ];
}

/// An enumeration for the type of [GuidancePattern].
@annotation.XmlEnum()
enum GuidancePatternType {
  /// AB-line, straight from A to B.
  @annotation.XmlValue('1')
  ab(1, 'AB'),

  /// A+ or A*, A with heading/bearing.
  @annotation.XmlValue('2')
  aPlus(2, 'A+'),

  /// Curve, a curve from a start to an end point.
  @annotation.XmlValue('3')
  curve(3, 'Curve'),

  /// Pivot, a circle around a center/pivot point.
  @annotation.XmlValue('4')
  pivot(4, 'Pivot'),

  /// Spiral, a spiral out from a center point.
  @annotation.XmlValue('5')
  spiral(5, 'Spiral'),
  ;

  const GuidancePatternType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An enumerator with pattern options for a [GuidancePattern] with type
/// [GuidancePatternType.pivot].
@annotation.XmlEnum()
enum GuidancePatternOptions {
  /// Clockwise, for [GuidancePatternType.pivot] only.
  @annotation.XmlValue('1')
  clockwise(1, 'Clocwise - for pivot'),

  /// Counter-clockwise, for [GuidancePatternType.pivot] only.
  @annotation.XmlValue('2')
  counterClockwise(2, 'Counter-clockwise - for pivot'),

  /// Full circle, for [GuidancePatternType.pivot] only.
  @annotation.XmlValue('3')
  fullCircle(3, 'Full Circle - for pivot'),
  ;

  const GuidancePatternOptions(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An enumeration for which direction a [GuidancePattern] should propagate,
/// as seen from the direction from point A to the next point.
@annotation.XmlEnum()
enum GuidancePatternPropagationDirection {
  /// In both directions from the reference pattern.
  @annotation.XmlValue('1')
  both(1, 'Both diretions'),

  /// To the left of the reference pattern only, as seen from A to the next
  /// point.
  @annotation.XmlValue('2')
  leftOnly(2, 'Left direction only'),

  /// To the right of the reference pattern only, as seen from A to the next
  /// point.
  @annotation.XmlValue('3')
  rightOnly(3, 'Right direction only'),

  /// No propagation, i.e. only the reference line will be used.
  @annotation.XmlValue('4')
  noPropagation(4, 'No propagation'),
  ;

  const GuidancePatternPropagationDirection(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An enumeration for if the [GuidancePattern] should extend at the
/// start and end points.
@annotation.XmlEnum()
enum GuidancePatternExtension {
  /// Extend from both start (A) and end (B) points.
  @annotation.XmlValue('1')
  fromBoth(1, 'From both first and last points'),

  /// Extend from start point (A) only.
  @annotation.XmlValue('2')
  fromAOnly(2, 'From first point (A) only'),

  /// Extend from end point (B) only.
  @annotation.XmlValue('3')
  fromBOnly(3, 'From last point (B) only'),

  /// No extension from any points.
  @annotation.XmlValue('4')
  noExtensions(4, 'No extensions'),
  ;

  const GuidancePatternExtension(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An enumeration for the status/quality of positioning in a [GuidancePattern].
@annotation.XmlEnum()
enum GuidancePatternGnssMethod {
  /// 'No GNSS fix
  @annotation.XmlValue('0')
  noGnssFix(0, 'No GNSS fix'),
  @annotation.XmlValue('1')

  /// GNSS fix
  gnssFix(1, 'GNSS fix'),
  @annotation.XmlValue('2')

  /// Differential GNSS fix
  dgnssFix(2, 'DGNSS fix'),
  @annotation.XmlValue('3')

  /// Precise GNSS
  preciseGnss(3, 'Precise GNSS'),
  @annotation.XmlValue('4')

  /// RTK fixed integer
  rtkFixedInteger(4, 'RTK fixed integer'),
  @annotation.XmlValue('5')

  /// RTK float
  rtkFloat(5, 'RTK float'),
  @annotation.XmlValue('6')

  /// Estimated (Dead Reckoning) mode
  estimatedDRmode(6, 'Estimated (Dead Reckoning) mode'),
  @annotation.XmlValue('7')

  /// Manual input
  manualInput(7, 'Manual input'),
  @annotation.XmlValue('8')

  /// Simulation mode
  simulationMode(8, 'Simulation mode'),
  @annotation.XmlValue('16')

  /// Desktop generated data
  desktopGeneratedData(16, 'Desktop generated data'),

  /// Other
  @annotation.XmlValue('17')
  other(17, 'Other'),
  ;

  const GuidancePatternGnssMethod(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
