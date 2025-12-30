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
class LineString extends Iso11783Element {
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
    _argumentValidator(
      points: points,
      type: type,
      designator: designator,
      width: width,
      length: length,
      colour: colour,
      id: id,
    );

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
    required LineStringType type,
    String? designator,
    int? width,
    int? length,
    int? colour,
    String? id,
  }) : super._(elementType: _elementType) {
    this.type = type;
    this.designator = designator;
    this.width = width;
    this.length = length;
    this.colour = colour;
    this.id = id;
    this.points.addAll(points);
  }

  LineString._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    final test = xmlElement
        .findElements(
          Iso11783ElementType.point.xmlTag,
        )
        .map(Point._fromXmlElement)
        .toList();
    points.addAll(test);
    _argumentValidator(
      points: points,
      type: type,
      designator: designator,
      width: width,
      length: length,
      colour: colour,
      id: id,
    );
  }

  static void _argumentValidator({
    required List<Point> points,
    required LineStringType type,
    required String? designator,
    required int? width,
    required int? length,
    required int? colour,
    required String? id,
  }) {
    if (points.isEmpty) {
      throw ArgumentError.value(
        points,
        'LineString.points',
        'Should not be empty',
      );
    }
    if (designator != null) {
      ArgumentValidation.checkStringLength(
        designator,
        name: 'LineString.designator',
      );
    }
    if (width != null) {
      ArgumentValidation.checkValueInRange(
        value: width,
        min: 0,
        max: 4294967294,
        name: 'LineString.width',
      );
    }
    if (length != null) {
      ArgumentValidation.checkValueInRange(
        value: length,
        min: 0,
        max: 4294967294,
        name: 'LineString.length',
      );
    }
    if (colour != null) {
      ArgumentValidation.checkValueInRange(
        value: colour,
        min: 0,
        max: 254,
        name: 'LineString.colour',
      );
    }
    if (id != null) {
      ArgumentValidation.checkId(
        id: id,
        idRefPattern: staticIdRefPattern,
        name: 'LineString.id',
      );
    }
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.lineString;

  /// Regular expression matching pattern for the [id] of [LineString]s.
  static const staticIdRefPattern = '(LSG|LSG-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// The position points along this.
  late final points = _XmlSyncedList<Point>(
    xmlElement: xmlElement,
    xmlTag: Point._elementType.xmlTag,
  );

  /// Which type of line string this is.
  LineStringType get type => LineStringType.values.firstWhere(
    (type) => type.value == parseInt('A'),
    orElse: () => throw ArgumentError.value(
      xmlElement.getAttribute('A'),
      'LineString.type',
      'is not one of the supported values: ${LineStringType.values.join(', ')}',
    ),
  );
  set type(LineStringType value) => setInt('A', value.value);

  /// Name of this, description or comment.
  String? get designator => tryParseString('B');
  set designator(String? value) => setStringNullable('B', value);

  /// Width of this in millimeters, typically used as the spacing for separating
  /// adjacent path in [GuidancePattern]s.
  int? get width => tryParseInt('C');
  set width(int? value) => setIntNullable('C', value);

  /// Length of this in millimeters.
  int? get length => tryParseInt('D');
  set length(int? value) => setIntNullable('D', value);

  /// Colour of this.
  ///
  /// See ISO 11783-6 for colour palette, or the implementation in
  /// [Iso11783Colour].
  int? get colour => tryParseInt('E');
  set colour(int? value) => setIntNullable('E', value);

  /// Unique identifier for this line string.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String? get id => tryParseString('F');
  set id(String? value) => setStringNullable('F', value);
}

/// An enumerator for which type a [LineString] is.
enum LineStringType {
  /// The exterior of a [Polygon].
  polygonExterior(1, 'Polygon Exterior'),

  /// An interior of a [Polygon].
  polygonInterior(2, 'Polygon Interior'),

  /// A tramline in a field.
  tramline(3, 'Tramline'),

  /// A sampling route.
  samplingRoute(4, 'Sampling Route'),

  /// A guidance pattern.
  guidancePattern(5, 'Guidance Pattern'),

  /// A drainage indication line.
  drainage(6, 'Drainage'),

  /// A fence.
  fence(7, 'Fence'),

  /// A flag to show comments on positions.
  flag(8, 'Flag'),

  /// An obstacle to avoid.
  obstacle(9, 'Obstacle');

  const LineStringType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
