// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes patterns from [LineString]s and a boundary
/// [Polygon] to use with nagivation guidance (steering).
class GuidancePattern extends Iso11783Element with _BoundaryPolygonMixin {
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
  }) : super(
         elementType: Iso11783ElementType.guidancePattern,
         description: 'GuidancePattern',
         onlyVersion4AndAbove: true,
       ) {
    this.id = id;
    this.type = type;
    this.boundaryPolygon = boundaryPolygon;
    this.designator = designator;
    this.options = options;
    this.propagationDirection = propagationDirection;
    this.extension = extension;
    this.heading = heading;
    this.radius = radius;
    this.gnssMethod = gnssMethod;
    this.horizontalAccuracy = horizontalAccuracy;
    this.verticalAccuracy = verticalAccuracy;
    this.baseStationIdRef = baseStationIdRef;
    this.originalSRID = originalSRID;
    this.numberOfSwathsLeft = numberOfSwathsLeft;
    this.numberOfSwathsRight = numberOfSwathsRight;
    children.addAll(lineStrings);
  }

  /// Regular expression matching pattern for the [id] of [GuidancePattern]s.
  static const staticIdRefPattern = '(GPN|GPN-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of [LineString]s for this.
  ///
  /// The separation spacing between the paths for each [LineString] pattern
  /// is the [LineString.width] parameter.
  List<LineString> get lineStrings => findElements(
    Iso11783ElementType.lineString.xmlTag,
  ).map((e) => e as LineString).toList();

  /// Unique identifier for this guidance pattern.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Name of the guidance pattern, description or comment.
  String? get designator => tryParseString('B');
  set designator(String? value) => setStringNullable('B', value);

  /// Which type of guidance pattern this is.
  GuidancePatternType get type => GuidancePatternType.values.firstWhere(
    (type) => type.value == parseInt('C'),
    orElse: () => throw ArgumentError(
      '''`${getAttribute('C')}` is not one of the supported values: ${GuidancePatternType.values.join(', ')}''',
    ),
  );
  set type(GuidancePatternType value) => setInt('C', value.value);

  /// Options if [type] is [GuidancePatternType.pivot].
  GuidancePatternOptions? get options => switch (tryParseInt('D')) {
    final int value => GuidancePatternOptions.values.firstWhere(
      (type) => type.value == value,
      orElse: () => throw ArgumentError(
        '''`$value` is not one of the supported values: ${GuidancePatternOptions.values.join(', ')}''',
      ),
    ),
    _ => null,
  };
  set options(GuidancePatternOptions? value) =>
      setIntNullable('D', value?.value);

  /// Which directions the pattern should propagate in, as seen from point
  /// A to the next point.
  GuidancePatternPropagationDirection?
  get propagationDirection => switch (tryParseInt('E')) {
    final int value => GuidancePatternPropagationDirection.values.firstWhere(
      (type) => type.value == value,
      orElse: () => throw ArgumentError(
        '''`$value` is not one of the supported values: ${GuidancePatternPropagationDirection.values.join(', ')}''',
      ),
    ),
    _ => null,
  };
  set propagationDirection(GuidancePatternPropagationDirection? value) =>
      setIntNullable('E', value?.value);

  /// In which ends the pattern should extend further than the start/end point.
  GuidancePatternExtension? get extension => switch (tryParseInt('F')) {
    final int value => GuidancePatternExtension.values.firstWhere(
      (type) => type.value == value,
      orElse: () => throw ArgumentError(
        '''`$value` is not one of the supported values: ${GuidancePatternExtension.values.join(', ')}''',
      ),
    ),
    _ => null,
  };
  set extension(GuidancePatternExtension? value) =>
      setIntNullable('F', value?.value);

  /// Heading/bearing of the pattern.
  double? get heading => tryParseDouble('G');
  set heading(double? value) => setDoubleNullable('G', value);

  /// Radius of the pattern in millimeters.
  int? get radius => tryParseInt('H');
  set radius(int? value) => setIntNullable('H', value);

  /// Status/quality of the GNSS positioning for this.
  GuidancePatternGnssMethod? get gnssMethod => switch (tryParseInt('I')) {
    final int value => GuidancePatternGnssMethod.values.firstWhere(
      (type) => type.value == value,
      orElse: () => throw ArgumentError(
        '''`$value` is not one of the supported values: ${GuidancePatternGnssMethod.values.join(', ')}''',
      ),
    ),
    _ => null,
  };
  set gnssMethod(GuidancePatternGnssMethod? value) =>
      setIntNullable('I', value?.value);

  /// Horizontal accuracy, from 0 to 65 meters.
  double? get horizontalAccuracy => tryParseDouble('J');
  set horizontalAccuracy(double? value) => setDoubleNullable('J', value);

  /// Vertical accuracy, from 0 to 65 meters.
  double? get verticalAccuracy => tryParseDouble('K');
  set verticalAccuracy(double? value) => setDoubleNullable('K', value);

  /// Reference to a [BaseStation].
  String? get baseStationIdRef => tryParseString('L');
  set baseStationIdRef(String? value) => setStringNullable('L', value);

  /// ID of the original Spatial-Reference system.
  ///
  /// Typically EPSG:4326.
  String? get originalSRID => tryParseString('M');
  set originalSRID(String? value) => setStringNullable('M', value);

  /// Number of swaths to the left of the reference pattern, as seen from
  /// point A to the next point.
  int? get numberOfSwathsLeft => tryParseInt('N');
  set numberOfSwathsLeft(int? value) => setIntNullable('N', value);

  /// Number of swaths to the right of the reference pattern, as seen from
  /// point A to the next point.
  int? get numberOfSwathsRight => tryParseInt('O');
  set numberOfSwathsRight(int? value) => setIntNullable('O', value);
}

/// An enumeration for the type of [GuidancePattern].
enum GuidancePatternType {
  /// AB-line, straight from A to B.
  ab(1, 'AB'),

  /// A+ or A*, A with heading/bearing.
  aPlus(2, 'A+'),

  /// Curve, a curve from a start to an end point.
  curve(3, 'Curve'),

  /// Pivot, a circle around a center/pivot point.
  pivot(4, 'Pivot'),

  /// Spiral, a spiral out from a center point.
  spiral(5, 'Spiral');

  const GuidancePatternType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An enumerator with pattern options for a [GuidancePattern] with type
/// [GuidancePatternType.pivot].
enum GuidancePatternOptions {
  /// Clockwise, for [GuidancePatternType.pivot] only.
  clockwise(1, 'Clocwise - for pivot'),

  /// Counter-clockwise, for [GuidancePatternType.pivot] only.
  counterClockwise(2, 'Counter-clockwise - for pivot'),

  /// Full circle, for [GuidancePatternType.pivot] only.
  fullCircle(3, 'Full Circle - for pivot');

  const GuidancePatternOptions(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An enumeration for which direction a [GuidancePattern] should propagate,
/// as seen from the direction from point A to the next point.
enum GuidancePatternPropagationDirection {
  /// In both directions from the reference pattern.
  both(1, 'Both diretions'),

  /// To the left of the reference pattern only, as seen from A to the next
  /// point.
  leftOnly(2, 'Left direction only'),

  /// To the right of the reference pattern only, as seen from A to the next
  /// point.
  rightOnly(3, 'Right direction only'),

  /// No propagation, i.e. only the reference line will be used.
  noPropagation(4, 'No propagation');

  const GuidancePatternPropagationDirection(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An enumeration for if the [GuidancePattern] should extend at the
/// start and end points.
enum GuidancePatternExtension {
  /// Extend from both start (A) and end (B) points.
  fromBoth(1, 'From both first and last points'),

  /// Extend from start point (A) only.
  fromAOnly(2, 'From first point (A) only'),

  /// Extend from end point (B) only.
  fromBOnly(3, 'From last point (B) only'),

  /// No extension from any points.
  noExtensions(4, 'No extensions');

  const GuidancePatternExtension(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An enumeration for the status/quality of positioning in a [GuidancePattern].
enum GuidancePatternGnssMethod {
  /// 'No GNSS fix
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

  /// Desktop generated data
  desktopGeneratedData(16, 'Desktop generated data'),

  /// Other
  other(17, 'Other');

  const GuidancePatternGnssMethod(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
