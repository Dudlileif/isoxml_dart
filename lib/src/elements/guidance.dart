// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that describes the allocation of [GuidanceGroup]s and
/// [GuidanceShift]s to a [Task].
///
/// The [allocationStamps] list has entries that describes the start/stop times
/// of guidance allocations and the changes of the [GuidanceAllocation] inside
/// a [Task].
///
// TODO(dudlileif): Needs better documentation.
@CopyWith()
@annotation.XmlRootElement(name: 'GAN')
@annotation.XmlSerializable(createMixin: true)
class GuidanceAllocation extends Iso11783Element
    with _$GuidanceAllocationXmlSerializableMixin {
  /// Default factory for creating a [GuidanceAllocation] with verified
  /// arguments.
  factory GuidanceAllocation({
    required List<AllocationStamp> allocationStamps,
    required String groupIdRef,
    List<GuidanceShift>? shifts,
  }) {
    if (allocationStamps.isEmpty) {
      throw ArgumentError.value(
        allocationStamps,
        'allocationStamps',
        'Should not be empty',
      );
    }
    ArgumentValidation.checkId(
      id: groupIdRef,
      idRefPattern: GuidanceGroup.idRefPattern,
      idName: 'groupIdRef',
    );
    return GuidanceAllocation._(
      allocationStamps: allocationStamps,
      shifts: shifts,
      groupIdRef: groupIdRef,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const GuidanceAllocation._({
    required this.allocationStamps,
    required this.groupIdRef,
    this.shifts,
  }) : super(
          tag: Iso11783Tag.guidanceAllocation,
          description: 'GuidanceAllocation',
          onlyVersion4AndAbove: true,
        );

  /// Creates a [GuidanceAllocation] from [element].
  factory GuidanceAllocation.fromXmlElement(XmlElement element) =>
      _$GuidanceAllocationFromXmlElement(element);

  /// A list of [AllocationStamp]s for this.
  @annotation.XmlElement(name: 'ASP')
  final List<AllocationStamp> allocationStamps;

  /// A list of [GuidanceShift]s for this.
  @annotation.XmlElement(name: 'GST')
  final List<GuidanceShift>? shifts;

  /// Reference to a [GuidanceGroup].
  @annotation.XmlAttribute(name: 'A')
  final String groupIdRef;

  @override
  List<Object?> get props => super.props
    ..addAll([
      allocationStamps,
      shifts,
      groupIdRef,
    ]);
}

/// An element for grouping [GuidancePattern]s and a boundary [Polygon] used for
/// guidance.
///
// TODO(dudlileif): Needs better documentation.
@CopyWith()
@annotation.XmlRootElement(name: 'GGP')
@annotation.XmlSerializable(createMixin: true)
class GuidanceGroup extends Iso11783Element
    with _$GuidanceGroupXmlSerializableMixin {
  /// Default factory for creating a [GuidanceGroup] with verified
  /// arguments.
  factory GuidanceGroup({
    required String id,
    List<GuidancePattern>? patterns,
    Polygon? boundaryPolygon,
    String? designator,
  }) {
    ArgumentValidation.checkId(id: id, idRefPattern: idRefPattern);
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }

    return GuidanceGroup._(
      id: id,
      patterns: patterns,
      boundaryPolygon: boundaryPolygon,
      designator: designator,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const GuidanceGroup._({
    required this.id,
    this.patterns,
    this.boundaryPolygon,
    this.designator,
  }) : super(
          tag: Iso11783Tag.guidanceGroup,
          description: 'GuidanceGroup',
          onlyVersion4AndAbove: true,
        );

  /// Creates a [GuidanceGroup] from [element].
  factory GuidanceGroup.fromXmlElement(XmlElement element) =>
      _$GuidanceGroupFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [GuidanceGroup]s.
  static const idRefPattern = '(GGP|GGP-)([0-9])+';

  /// A list of [GuidancePattern]s for this.
  @annotation.XmlElement(name: 'GPN')
  final List<GuidancePattern>? patterns;

  /// Boundary [Polygon] for this.
  @annotation.XmlElement(name: 'PLN', includeIfNull: false)
  final Polygon? boundaryPolygon;

  /// Unique identifier for this guidance group.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the guidance group, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String? designator;

  @override
  List<Object?> get props => super.props
    ..addAll([
      patterns,
      boundaryPolygon,
      id,
      designator,
    ]);
}

/// An element that describes patterns from [LineString]s and a boundary
/// [Polygon] to use with nagivation guidance (steering).
///
// TODO(dudlileif): Needs better documentation.
@CopyWith()
@annotation.XmlRootElement(name: 'GPN')
@annotation.XmlSerializable(createMixin: true)
class GuidancePattern extends Iso11783Element
    with _$GuidancePatternXmlSerializableMixin {
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

    ArgumentValidation.checkId(id: id, idRefPattern: idRefPattern);
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
        idRefPattern: BaseStation.idRefPattern,
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
  const GuidancePattern._({
    required this.lineStrings,
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
          tag: Iso11783Tag.guidancePattern,
          description: 'GuidancePattern',
          onlyVersion4AndAbove: true,
        );

  /// Creates a [GuidancePattern] from [element].
  factory GuidancePattern.fromXmlElement(XmlElement element) =>
      _$GuidancePatternFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [GuidancePattern]s.
  static const idRefPattern = '(GPN|GPN-)([0-9])+';

  /// Boundary [Polygon] for this.
  @annotation.XmlElement(name: 'PLN', includeIfNull: false)
  final Polygon? boundaryPolygon;

  /// A list of [LineString]s for this.
  @annotation.XmlElement(name: 'LSG')
  final List<LineString> lineStrings;

  /// Unique identifier for this guidance pattern.
  ///
  /// Records generated on MICS have negative IDs.
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

  /// Which directions the pattern should propagate in.
  @annotation.XmlAttribute(name: 'E')
  final GuidancePatternPropagationDirection? propagationDirection;

  /// In which ends the pattern should extend further than the start/end point.
  @annotation.XmlAttribute(name: 'F')
  final GuidancePatternExtension? extension;

  /// Heading/bearing of the pattern.
  @annotation.XmlAttribute(name: 'G')
  final double? heading;

  /// Radius of the pattern.
  @annotation.XmlAttribute(name: 'H')
  final int? radius;

  /// Status/quality of the GNSS positioning for this.
  @annotation.XmlAttribute(name: 'I')
  final GuidancePatternGnssMethod? gnssMethod;

  /// Horizontal accuracy.
  @annotation.XmlAttribute(name: 'J')
  final double? horizontalAccuracy;

  /// Vertical accuracy.
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

  /// Number of swaths to the left of the reference pattern.
  @annotation.XmlAttribute(name: 'N')
  final int? numberOfSwathsLeft;

  /// Number of swaths to the right of the reference pattern.
  @annotation.XmlAttribute(name: 'O')
  final int? numberOfSwathsRight;

  @override
  List<Object?> get props => super.props
    ..addAll([
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
    ]);
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

/// An enumeration for which direction a [GuidancePattern] should propagate.
@annotation.XmlEnum()
enum GuidancePatternPropagationDirection {
  /// In both directions from the reference pattern.
  @annotation.XmlValue('1')
  both(1, 'Both diretions'),

  /// To the left of the reference pattern only.
  @annotation.XmlValue('2')
  leftOnly(2, 'Left direction only'),

  /// To the right of the reference pattern only.
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

  /// Extend from start points (A) only.
  @annotation.XmlValue('2')
  fromAOnly(2, 'From first point (A) only'),

  /// Extend from end points (B) only.
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

/// An element for describing a shift/move of a [GuidancePattern] or
/// [GuidanceGroup].
///
// TODO(dudlileif): Need better documentation.
@CopyWith()
@annotation.XmlRootElement(name: 'GST')
@annotation.XmlSerializable(createMixin: true)
class GuidanceShift extends Iso11783Element
    with _$GuidanceShiftXmlSerializableMixin {
  /// Default factory for creating a [GuidanceShift] with verified
  /// arguments.
  factory GuidanceShift({
    AllocationStamp? allocationStamp,
    String? groupIdRef,
    String? patternIdRef,
    int? eastShift,
    int? northShift,
    int? propagationOffset,
  }) {
    if (groupIdRef != null) {
      ArgumentValidation.checkId(
        id: groupIdRef,
        idRefPattern: GuidanceGroup.idRefPattern,
        idName: 'groupIdRef',
      );
    }
    if (patternIdRef != null) {
      ArgumentValidation.checkId(
        id: patternIdRef,
        idRefPattern: GuidancePattern.idRefPattern,
        idName: 'patternIdRef',
      );
    }
    if (eastShift != null) {
      ArgumentValidation.checkValueInRange(
        value: eastShift,
        min: -2147483648,
        max: 2147483647,
        name: 'eastShift',
      );
    }
    if (northShift != null) {
      ArgumentValidation.checkValueInRange(
        value: northShift,
        min: -2147483648,
        max: 2147483647,
        name: 'northShift',
      );
    }
    if (propagationOffset != null) {
      ArgumentValidation.checkValueInRange(
        value: propagationOffset,
        min: -2147483648,
        max: 2147483647,
        name: 'propagationOffset',
      );
    }
    return GuidanceShift._(
      allocationStamp: allocationStamp,
      groupIdRef: groupIdRef,
      patternIdRef: patternIdRef,
      eastShift: eastShift,
      northShift: northShift,
      propagationOffset: propagationOffset,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const GuidanceShift._({
    this.allocationStamp,
    this.groupIdRef,
    this.patternIdRef,
    this.eastShift,
    this.northShift,
    this.propagationOffset,
  }) : super(
          tag: Iso11783Tag.guidanceShift,
          description: 'GuidanceShift',
          onlyVersion4AndAbove: true,
        );

  /// Creates a [GuidanceShift] from [element].
  factory GuidanceShift.fromXmlElement(XmlElement element) =>
      _$GuidanceShiftFromXmlElement(element);

  /// [AllocationStamp] for position and time of this.
  @annotation.XmlElement(name: 'ASP', includeIfNull: false)
  final AllocationStamp? allocationStamp;

  /// Reference to a [GuidanceGroup].
  @annotation.XmlAttribute(name: 'A')
  final String? groupIdRef;

  /// Reference to a [GuidancePattern].
  @annotation.XmlAttribute(name: 'B')
  final String? patternIdRef;

  /// Distance in millimeters? of this shift in the east direction.
  ///
  // TODO(dudlileif): Unknow unit.
  @annotation.XmlAttribute(name: 'C')
  final int? eastShift;

  /// Distance in millimeters? of this shift in the north direction.
  ///
  // TODO(dudlileif): Unknow unit.
  @annotation.XmlAttribute(name: 'D')
  final int? northShift;

  /// Propagation offset of this.
  ///
  // TODO(dudlileif): Unknown unit.
  @annotation.XmlAttribute(name: 'E')
  final int? propagationOffset;

  @override
  List<Object?> get props => super.props
    ..addAll([
      allocationStamp,
      groupIdRef,
      patternIdRef,
      eastShift,
      northShift,
      propagationOffset,
    ]);
}
