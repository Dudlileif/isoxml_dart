// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes the position and appearance of a point location.
///
/// Points of type [PointType.flag] can be used to assign a comment to the
/// position of the [Point]. This is to enable the task controller to display
/// farm-side-generated comments stored in [designator] at a certain position as
/// informational messages to the operator.
class Point extends Iso11783Element {
  /// Default factory for creating a [Point] with verified
  /// arguments.
  factory Point({
    PointType? type,
    double? north,
    double? east,
    int? up,
    String? designator,
    int? colour,
    String? id,
    double? horizontalAccuracy,
    double? verticalAccuracy,
    String? filename,
    int? fileLength,
    PointBinaryHeaderOptions? binaryHeaderOptions,
    Uint8List? byteData,
    List<Point>? binaryPoints,
  }) {
    _argumentValidator(
      type: type,
      north: north,
      east: east,
      up: up,
      designator: designator,
      colour: colour,
      id: id,
      horizontalAccuracy: horizontalAccuracy,
      verticalAccuracy: verticalAccuracy,
      filename: filename,
      fileLength: fileLength,
      binaryHeaderOptions: binaryHeaderOptions,
      byteData: byteData,
      binaryPoints: binaryPoints,
    );

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
      binaryHeaderOptions: binaryHeaderOptions,
      byteData: byteData,
      binaryPoints: binaryPoints,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  Point._({
    PointType? type,
    double? north,
    double? east,
    int? up,
    String? designator,
    int? colour,
    String? id,
    double? horizontalAccuracy,
    double? verticalAccuracy,
    String? filename,
    int? fileLength,
    this.binaryHeaderOptions,
    Uint8List? byteData,
    List<Point>? binaryPoints,
  }) : super._(elementType: _elementType) {
    this.type = type;
    this.north = north;
    this.east = east;
    this.up = up;
    this.designator = designator;
    this.colour = colour;
    this.id = id;
    this.horizontalAccuracy = horizontalAccuracy;
    this.verticalAccuracy = verticalAccuracy;
    this.filename = filename;
    this.fileLength = fileLength;
    this.byteData = byteData;
    if (binaryPoints != null) {
      this.binaryPoints.addAll(binaryPoints);
    }
  }

  Point._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    binaryHeaderOptions = PointBinaryHeaderOptions(
      readType: tryParseString('A') == '',
      readNorth: tryParseString('C') == '',
      readEast: tryParseString('D') == '',
      readUp: tryParseString('E') == '',
      readColour: tryParseString('F') == '',
      readHorizontalAccuracy: tryParseString('H') == '',
      readVerticalAccuracy: tryParseString('I') == '',
    );
    _argumentValidator(
      type: type,
      north: north,
      east: east,
      up: up,
      designator: designator,
      colour: colour,
      id: id,
      horizontalAccuracy: horizontalAccuracy,
      verticalAccuracy: verticalAccuracy,
      filename: filename,
      fileLength: fileLength,
      binaryHeaderOptions: binaryHeaderOptions,
      byteData: byteData,
      binaryPoints: binaryPoints,
    );
  }

  static void _argumentValidator({
    required PointType? type,
    required double? north,
    required double? east,
    required int? up,
    required String? designator,
    required int? colour,
    required String? id,
    required double? horizontalAccuracy,
    required double? verticalAccuracy,
    required String? filename,
    required int? fileLength,
    required PointBinaryHeaderOptions? binaryHeaderOptions,
    required Uint8List? byteData,
    required List<Point>? binaryPoints,
  }) {
    if (filename == null && (north == null || east == null || type == null)) {
      throw ArgumentError(
        'north, east and type must not be null if filename is null',
      );
    }
    if (north != null) {
      ArgumentValidation.checkValueInRange(
        value: north,
        min: -90,
        max: 90,
        name: 'Point.north',
      );
    }
    if (east != null) {
      ArgumentValidation.checkValueInRange(
        value: east,
        min: -180,
        max: 180,
        name: 'Point.east',
      );
    }
    if (up != null) {
      ArgumentValidation.checkValueInRange(
        value: up,
        min: -2147483647,
        max: 2147483647,
        name: 'Point.up',
      );
    }
    if (designator != null) {
      ArgumentValidation.checkStringLength(
        designator,
        name: 'Point.designator',
      );
    }
    if (colour != null) {
      ArgumentValidation.checkValueInRange(
        value: colour,
        min: 0,
        max: 254,
        name: 'Point.colour',
      );
    }
    if (id != null) {
      ArgumentValidation.checkId(
        id: id,
        idRefPattern: staticIdRefPattern,
        name: 'Point.id',
      );
    }
    if (horizontalAccuracy != null) {
      ArgumentValidation.checkValueInRange(
        value: horizontalAccuracy,
        min: 0,
        max: 65,
        name: 'Point.horizontalAccuracy',
      );
    }
    if (verticalAccuracy != null) {
      ArgumentValidation.checkValueInRange(
        value: verticalAccuracy,
        min: 0,
        max: 65,
        name: 'Point.verticalAccuracy',
      );
    }
    if (filename != null) {
      ArgumentValidation.checkId(
        id: filename,
        idRefPattern: filenamePattern,
        name: 'Point.filename',
        minLength: 8,
        maxLength: 8,
      );
    }
    if (fileLength != null) {
      ArgumentValidation.checkValueInRange(
        value: fileLength,
        min: 0,
        max: 4294967294,
        name: 'Point.fileLength',
      );
    }
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.point;

  /// Regular expression matching pattern for the [id] of [Point]s.
  static const staticIdRefPattern = '(PNT|PNT-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Regular expression matching pattern for filenames for [Point]s.
  static const filenamePattern = 'PNT([0-9]){5}';

  /// Which type of point this is.
  PointType? get type => switch (tryParseInt('A')) {
    final int value => PointType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => throw ArgumentError.value(
        xmlElement.getAttribute('A'),
        'Point.type',
        'is not one of the supported values: ${PointType.values.join(', ')}',
      ),
    ),
    _ => null,
  };
  set type(PointType? value) => setIntNullable('A', value?.value);

  /// Name of this, description or comment.
  String? get designator => tryParseString('B');
  set designator(String? value) => setStringNullable('B', value);

  /// GNSS position north, format: WGS84 latitude
  double? get north => tryParseDouble('C');
  set north(double? value) => setDoubleNullable('C', value);

  /// GNSS position east, format: WGS84 longitude.
  double? get east => tryParseDouble('D');
  set east(double? value) => setDoubleNullable('D', value);

  /// GNSS altitude in millimeters (mm) over the WGS84 ellipsoid.
  int? get up => tryParseInt('E');
  set up(int? value) => setIntNullable('E', value);

  /// Colour of this.
  ///
  /// See ISO 11783-6 for colour palette, or the implementation in
  /// [Iso11783Colour].
  int? get colour => tryParseInt('F');
  set colour(int? value) => setIntNullable('F', value);

  /// Unique identifier for this point.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String? get id => tryParseString('G');
  set id(String? value) => setStringNullable('G', value);

  /// Horizontal accuracy, (RMS error) in meters.
  double? get horizontalAccuracy => tryParseDouble('H');
  set horizontalAccuracy(double? value) => setDoubleNullable('H', value);

  /// Vertical accuracy, (RMS error) in meters.
  double? get verticalAccuracy => tryParseDouble('I');
  set verticalAccuracy(double? value) => setDoubleNullable('I', value);

  /// Filename for external file.
  ///
  /// Only supported in version 4 of the standard.
  String? get filename => tryParseString('J');
  set filename(String? value) => setStringNullable('J', value);

  /// Length of external file in bytes.
  ///
  /// Only supported in version 4 of the standard.
  int? get fileLength => tryParseInt('K');
  set fileLength(int? value) => setIntNullable('K', value);

  /// A header to use when storing the points in a binary file with higher
  /// precision.
  ///
  /// Only supported with version 4 of the standard.
  PointBinaryHeaderOptions? binaryHeaderOptions;

  /// Bytes of the binary file, if there is one.
  ///
  /// Only supported with version 4 of the standard.
  Uint8List? get byteData => _byteData;

  set byteData(Uint8List? value) {
    _byteData = value;
    parseData();
  }

  Uint8List? _byteData;

  /// Parsed [Point]s from the [byteData].
  ///
  /// Only supported with version 4 of the standard.
  final List<Point> binaryPoints = [];

  /// The length of a record in [byteData], as given by what to read in
  /// [binaryHeaderOptions].
  int? get binaryRecordLength {
    if (binaryHeaderOptions != null) {
      var length = 0;
      if (binaryHeaderOptions!.readType) {
        length++;
      }
      if (binaryHeaderOptions!.readNorth) {
        length += 8;
      }
      if (binaryHeaderOptions!.readEast) {
        length += 8;
      }
      if (binaryHeaderOptions!.readUp) {
        length += 4;
      }
      if (binaryHeaderOptions!.readColour) {
        length++;
      }
      if (binaryHeaderOptions!.readHorizontalAccuracy) {
        length += 2;
      }
      if (binaryHeaderOptions!.readVerticalAccuracy) {
        length += 2;
      }
      return length;
    }
    return null;
  }
}

/// An enumerator for what type a [Point] is.
enum PointType {
  /// Flag
  flag(1, 'Flag'),

  /// Other
  other(2, 'Other'),

  /// Field access
  fieldAccess(3, 'Field Access'),

  /// Storage
  storage(4, 'Storage'),

  /// Obstacle
  obstacle(5, 'Obstacle'),

  /// Guidance reference A
  guidanceReferenceA(6, 'Guidance Reference A'),

  /// Guidance reference B
  guidanceReferenceB(7, 'Guidance Reference B'),

  /// Guidance reference center
  guidanceReferenceCenter(8, 'Guidance Reference Center'),

  /// Guidance point, but not A, B or Center.
  guidancePoint(9, 'Guidance Point'),

  /// Partfield reference point
  partfieldReferencePoint(10, 'Partfield Reference Point'),

  /// Homebase
  homebase(11, 'Homebase');

  const PointType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// Short description of the value.
  final String description;
}

@immutable
/// A header that describes how [Point]s should be read from a binary file.
class PointBinaryHeaderOptions {
  /// A header that describes how [Point]s should be read from a binary file.
  const PointBinaryHeaderOptions({
    this.readType = false,
    this.readNorth = false,
    this.readEast = false,
    this.readUp = false,
    this.readColour = false,
    this.readHorizontalAccuracy = false,
    this.readVerticalAccuracy = false,
  });

  /// Whether [Point.type] should be read from the binary data.
  final bool readType;

  /// Whether [Point.north] should be read from the binary data.
  final bool readNorth;

  /// Whether [Point.east] should be read from the binary data.
  final bool readEast;

  /// Whether [Point.up] should be read from the binary data.
  final bool readUp;

  /// Whether [Point.colour] should be read from the binary data.
  final bool readColour;

  /// Whether [Point.horizontalAccuracy] should be read from the binary data.
  final bool readHorizontalAccuracy;

  /// Whether [Point.verticalAccuracy] should be read from the binary data.
  final bool readVerticalAccuracy;

  @override
  int get hashCode => Object.hashAll([
    readType,
    readNorth,
    readEast,
    readUp,
    readColour,
    readHorizontalAccuracy,
    readVerticalAccuracy,
  ]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PointBinaryHeaderOptions &&
          const ListEquality<bool>().equals(
            [
              readType,
              readNorth,
              readEast,
              readUp,
              readColour,
              readHorizontalAccuracy,
              readVerticalAccuracy,
            ],
            [
              other.readType,
              other.readNorth,
              other.readEast,
              other.readUp,
              other.readColour,
              other.readHorizontalAccuracy,
              other.readVerticalAccuracy,
            ],
          );
}
