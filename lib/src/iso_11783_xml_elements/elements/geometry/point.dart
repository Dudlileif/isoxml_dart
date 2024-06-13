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
  }) : super(tag: Iso11783XmlTag.point, description: 'Point');

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
    assert(
      north != null && east != null,
      'north and east must not be null: $north | $east',
    );
    return Point(
      type: $PointTypeEnumMap.entries
          .singleWhere(
            (pointTypeEnumMapEntry) => pointTypeEnumMapEntry.value == type,
            orElse: () => throw ArgumentError(
              '''`$type` is not one of the supported values: ${$PointTypeEnumMap.values.join(', ')}''',
            ),
          )
          .key,
      designator: designator,
      north: double.parse(north!),
      east: double.parse(east!),
      up: up != null ? num.tryParse(up)?.round() : null,
      colour: colour != null ? int.parse(colour) : null,
      id: id,
      horizontalAccuracy:
          horizontalAccuracy != null ? double.parse(horizontalAccuracy) : null,
      verticalAccuracy:
          verticalAccuracy != null ? double.parse(verticalAccuracy) : null,
      filename: filename,
      fileLength: fileLength != null ? int.parse(fileLength) : null,
    );
  }

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
  /// See ISO 11783-6 for colour palette, or the implementation in
  /// [Iso11783Colour].
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
