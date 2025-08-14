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
@CopyWith()
@annotation.XmlRootElement(name: 'PNT')
@annotation.XmlSerializable()
class Point extends Iso11783Element with EquatableMixin {
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
    List<XmlAttribute>? customAttributes,
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
        name: 'north',
      );
    }
    if (east != null) {
      ArgumentValidation.checkValueInRange(
        value: east,
        min: -180,
        max: 180,
        name: 'east',
      );
    }
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
      ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
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
      binaryHeaderOptions: binaryHeaderOptions,
      byteData: byteData,
      binaryPoints: binaryPoints,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  Point._({
    this.type,
    this.north,
    this.east,
    this.designator,
    this.up,
    this.colour,
    this.id,
    this.horizontalAccuracy,
    this.verticalAccuracy,
    this.filename,
    this.fileLength,
    this.binaryHeaderOptions,
    this.byteData,
    List<Point>? binaryPoints,
    super.customAttributes,
  }) : super(elementType: Iso11783ElementType.point, description: 'Point') {
    if (binaryPoints != null) {
      this.binaryPoints.addAll(binaryPoints);
    }
    if (byteData != null && (binaryPoints == null || binaryPoints.isEmpty)) {
      parseData();
    }
  }

  /// Creates a [Point] from [element].
  factory Point.fromXmlElement(XmlElement element) {
    final type = element.getAttribute('A');
    final designator = element.getAttribute('B');
    final north = element.getAttribute('C');
    final east = element.getAttribute('D');
    final up = element.getAttribute('E');
    final colour = element.getAttribute('F');
    final id = element.getAttribute('G');
    final horizontalAccuracy = element.getAttribute('H');
    final verticalAccuracy = element.getAttribute('I');
    final filename = element.getAttribute('J');
    final fileLength = element.getAttribute('K');
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    final point = Point(
      type: type != null && type.isNotEmpty
          ? PointType.values.singleWhere(
              (entry) => entry.value == int.tryParse(type),
              orElse: () => throw ArgumentError(
                '''`$type` is not one of the supported values: ${PointType.values.join(', ')}''',
              ),
            )
          : null,
      designator: designator,
      north: north != null ? double.tryParse(north) : null,
      east: east != null ? double.tryParse(east) : null,
      up: up != null ? num.tryParse(up)?.round() : null,
      colour: colour != null ? int.tryParse(colour) : null,
      id: id,
      horizontalAccuracy: horizontalAccuracy != null
          ? double.tryParse(horizontalAccuracy)
          : null,
      verticalAccuracy: verticalAccuracy != null
          ? double.tryParse(verticalAccuracy)
          : null,
      filename: filename,
      fileLength: fileLength != null ? int.tryParse(fileLength) : null,
      customAttributes: customAttributes,
    );
    if (point.filename != null) {
      return point.copyWith(
        binaryHeaderOptions: PointBinaryHeaderOptions(
          readType: point.type == null,
          readNorth: point.north == null,
          readEast: point.east == null,
          readUp: point.up == null && up != null && up.isEmpty,
          readColour: point.colour == null && colour != null && colour.isEmpty,
          readHorizontalAccuracy:
              point.horizontalAccuracy == null &&
              horizontalAccuracy != null &&
              horizontalAccuracy.isEmpty,
          readVerticalAccuracy:
              point.verticalAccuracy == null &&
              verticalAccuracy != null &&
              verticalAccuracy.isEmpty,
        ),
      );
    }
    return point;
  }

  /// Regular expression matching pattern for the [id] of [Point]s.
  static const staticIdRefPattern = '(PNT|PNT-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Regular expression matching pattern for filenames for [Point]s.
  static const filenamePattern = 'PNT([0-9]){5}';

  /// Which type of point this is.
  @annotation.XmlAttribute(name: 'A')
  final PointType? type;

  /// Name of this, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String? designator;

  /// GNSS position north, format: WGS84 latitude
  @annotation.XmlAttribute(name: 'C')
  final double? north;

  /// GNSS position east, format: WGS84 longitude.
  @annotation.XmlAttribute(name: 'D')
  final double? east;

  /// GNSS altitude in millimeters (mm) over the WGS84 ellipsoid.
  @annotation.XmlAttribute(name: 'E')
  final int? up;

  /// Colour of this.
  ///
  /// See ISO 11783-6 for colour palette, or the implementation in
  /// [Iso11783Colour].
  @annotation.XmlAttribute(name: 'F')
  final int? colour;

  /// Unique identifier for this point.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'G')
  final String? id;

  /// Horizontal accuracy, (RMS error) in meters.
  @annotation.XmlAttribute(name: 'H')
  final double? horizontalAccuracy;

  /// Vertical accuracy, (RMS error) in meters.
  @annotation.XmlAttribute(name: 'I')
  final double? verticalAccuracy;

  /// Filename for external file.
  ///
  /// Only supported in version 4 of the standard.
  @annotation.XmlAttribute(name: 'J')
  final String? filename;

  /// Length of external file in bytes.
  ///
  /// Only supported in version 4 of the standard.
  @annotation.XmlAttribute(name: 'K')
  final int? fileLength;

  /// A header to use when storing the points in a binary file with higher
  /// precision.
  ///
  /// Only supported with version 4 of the standard.
  final PointBinaryHeaderOptions? binaryHeaderOptions;

  /// Bytes of the binary file, if there is one.
  ///
  /// Only supported with version 4 of the standard.
  final Uint8List? byteData;

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

  /// Builds the XML children of this on the [builder].
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    final typeSerialized = type != null ? $PointTypeEnumMap[type]! : null;
    if (typeSerialized != null) {
      builder.attribute('A', typeSerialized);
    }
    final designatorSerialized = designator;
    if (designatorSerialized != null) {
      builder.attribute('B', designatorSerialized);
    }
    final northSerialized = north?.toString();
    if (northSerialized != null) {
      builder.attribute('C', northSerialized);
    }
    final eastSerialized = east?.toString();
    if (eastSerialized != null) {
      builder.attribute('D', eastSerialized);
    }
    final upSerialized = up?.toString();
    if (upSerialized != null) {
      builder.attribute('E', upSerialized);
    }
    final colourSerialized = colour?.toString();
    if (colourSerialized != null) {
      builder.attribute('F', colourSerialized);
    }
    final idSerialized = id;
    if (idSerialized != null) {
      builder.attribute('G', idSerialized);
    }
    final horizontalAccuracySerialized = horizontalAccuracy?.toString();
    if (horizontalAccuracySerialized != null) {
      builder.attribute('H', horizontalAccuracySerialized);
    }
    final verticalAccuracySerialized = verticalAccuracy?.toString();
    if (verticalAccuracySerialized != null) {
      builder.attribute('I', verticalAccuracySerialized);
    }
    final filenameSerialized = filename;
    if (filenameSerialized != null) {
      builder.attribute('J', filenameSerialized);
    }
    final fileLengthSerialized = fileLength?.toString();
    if (fileLengthSerialized != null) {
      builder.attribute('K', fileLengthSerialized);
    }
    if (customAttributes != null && customAttributes!.isNotEmpty) {
      for (final attribute in customAttributes!) {
        builder.attribute(attribute.name.local, attribute.value);
      }
    }
  }

  /// Builds the XML element of this on the [builder].
  void buildXmlElement(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    builder.element(
      'PNT',
      namespaces: namespaces,
      nest: () {
        buildXmlChildren(builder, namespaces: namespaces);
      },
    );
  }

  /// Returns a list of the XML attributes of this.
  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    final attributes = <XmlAttribute>[];
    final typeSerialized = type != null ? $PointTypeEnumMap[type]! : null;
    final typeConstructed = typeSerialized != null
        ? XmlAttribute(XmlName('A'), typeSerialized)
        : null;
    if (typeConstructed != null) {
      attributes.add(typeConstructed);
    }
    final designatorSerialized = designator;
    final designatorConstructed = designatorSerialized != null
        ? XmlAttribute(XmlName('B'), designatorSerialized)
        : null;
    if (designatorConstructed != null) {
      attributes.add(designatorConstructed);
    }
    final northSerialized = north?.toString();
    final northConstructed = northSerialized != null
        ? XmlAttribute(XmlName('C'), northSerialized)
        : null;
    if (northConstructed != null) {
      attributes.add(northConstructed);
    }
    final eastSerialized = east?.toString();
    final eastConstructed = eastSerialized != null
        ? XmlAttribute(XmlName('D'), eastSerialized)
        : null;
    if (eastConstructed != null) {
      attributes.add(eastConstructed);
    }
    final upSerialized = up?.toString();
    final upConstructed = upSerialized != null
        ? XmlAttribute(XmlName('E'), upSerialized)
        : null;
    if (upConstructed != null) {
      attributes.add(upConstructed);
    }
    final colourSerialized = colour?.toString();
    final colourConstructed = colourSerialized != null
        ? XmlAttribute(XmlName('F'), colourSerialized)
        : null;
    if (colourConstructed != null) {
      attributes.add(colourConstructed);
    }
    final idSerialized = id;
    final idConstructed = idSerialized != null
        ? XmlAttribute(XmlName('G'), idSerialized)
        : null;
    if (idConstructed != null) {
      attributes.add(idConstructed);
    }
    final horizontalAccuracySerialized = horizontalAccuracy?.toString();
    final horizontalAccuracyConstructed = horizontalAccuracySerialized != null
        ? XmlAttribute(XmlName('H'), horizontalAccuracySerialized)
        : null;
    if (horizontalAccuracyConstructed != null) {
      attributes.add(horizontalAccuracyConstructed);
    }
    final verticalAccuracySerialized = verticalAccuracy?.toString();
    final verticalAccuracyConstructed = verticalAccuracySerialized != null
        ? XmlAttribute(XmlName('I'), verticalAccuracySerialized)
        : null;
    if (verticalAccuracyConstructed != null) {
      attributes.add(verticalAccuracyConstructed);
    }
    final filenameSerialized = filename;
    final filenameConstructed = filenameSerialized != null
        ? XmlAttribute(XmlName('J'), filenameSerialized)
        : null;
    if (filenameConstructed != null) {
      attributes.add(filenameConstructed);
    }
    final fileLengthSerialized = fileLength?.toString();
    final fileLengthConstructed = fileLengthSerialized != null
        ? XmlAttribute(XmlName('K'), fileLengthSerialized)
        : null;
    if (fileLengthConstructed != null) {
      attributes.add(fileLengthConstructed);
    }
    if (customAttributes != null) {
      attributes.addAll(customAttributes!);
    }
    return attributes;
  }

  /// Returns a list of the XML children of this.
  List<XmlNode> toXmlChildren({
    Map<String, String?> namespaces = const {},
  }) {
    final children = <XmlNode>[];
    return children;
  }

  /// Returns a structured XML element that represents this.
  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) {
    final element = XmlElement(
      XmlName.fromString('PNT'),
      [...namespaces.toXmlAttributes()],
    )..setAttribute('A', type?.value.toString() ?? '');
    if (designator != null) {
      element.setAttribute('B', designator);
    }
    element
      ..setAttribute('C', north?.toString() ?? '')
      ..setAttribute('D', east?.toString() ?? '');

    if (up != null || (binaryHeaderOptions?.readUp ?? false)) {
      element.setAttribute('E', up?.toString() ?? '');
    }
    if (colour != null || (binaryHeaderOptions?.readColour ?? false)) {
      element.setAttribute('F', colour?.toString() ?? '');
    }
    if (id != null) {
      element.setAttribute('G', id);
    }
    if (horizontalAccuracy != null ||
        (binaryHeaderOptions?.readHorizontalAccuracy ?? false)) {
      element.setAttribute('H', horizontalAccuracy?.toString() ?? '');
    }
    if (verticalAccuracy != null ||
        (binaryHeaderOptions?.readVerticalAccuracy ?? false)) {
      element.setAttribute('I', verticalAccuracy?.toString() ?? '');
    }
    if (filename != null) {
      element.setAttribute('J', filename);
    }
    if (fileLength != null) {
      element.setAttribute('K', fileLength!.toString());
    }
    return element;
  }

  @override
  List<Object?> get props => [
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
    binaryHeaderOptions,
    byteData,
    binaryPoints,
  ];
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

  /// Obstacle
  @annotation.XmlValue('5')
  obstacle(5, 'Obstacle'),

  /// Guidance reference A
  @annotation.XmlValue('6')
  guidanceReferenceA(6, 'Guidance Reference A'),

  /// Guidance reference B
  @annotation.XmlValue('7')
  guidanceReferenceB(7, 'Guidance Reference B'),

  /// Guidance reference center
  @annotation.XmlValue('8')
  guidanceReferenceCenter(8, 'Guidance Reference Center'),

  /// Guidance point, but not A, B or Center.
  @annotation.XmlValue('9')
  guidancePoint(9, 'Guidance Point'),

  /// Partfield reference point
  @annotation.XmlValue('10')
  partfieldReferencePoint(10, 'Partfield Reference Point'),

  /// Homebase
  @annotation.XmlValue('11')
  homebase(11, 'Homebase');

  const PointType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// Short description of the value.
  final String description;
}

/// A header that describes how [Point]s should be read from a binary file.
class PointBinaryHeaderOptions extends Equatable {
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
  List<Object?> get props => [
    readType,
    readNorth,
    readEast,
    readUp,
    readColour,
    readHorizontalAccuracy,
    readVerticalAccuracy,
  ];
}
