// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

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
      ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
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
  LineString._({
    required List<Point> points,
    required this.type,
    this.designator,
    this.width,
    this.length,
    this.colour,
    this.id,
  }) : super(
          elementType: Iso11783ElementType.lineString,
          description: 'LineString',
        ) {
    this.points.addAll(points);
  }

  /// Creates a [LineString] from [element].
  factory LineString.fromXmlElement(XmlElement element) =>
      _$LineStringFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [LineString]s.
  static const staticIdRefPattern = '(LSG|LSG-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// The positions along this.
  @annotation.XmlElement(name: 'PNT')
  final List<Point> points = [];

  /// Which type of line string this is.
  @annotation.XmlAttribute(name: 'A')
  final LineStringType type;

  /// Name of this, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String? designator;

  /// Width of this in millimeters, typically used as the spacing for separating
  /// adjacent path in [GuidancePattern]s.
  @annotation.XmlAttribute(name: 'C')
  final int? width;

  /// Length of this in millimeters.
  @annotation.XmlAttribute(name: 'D')
  final int? length;

  /// Colour of this.
  ///
  /// See ISO 11783-6 for colour palette, or the implementation in
  /// [Iso11783Colour].
  @annotation.XmlAttribute(name: 'E')
  final int? colour;

  /// Unique identifier for this line string.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'F')
  final String? id;


  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
        ...[
          for (final a in points.map((e) => e.selfWithRecursiveChildren)) ...a,
        ],
      ];

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
