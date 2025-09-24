// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes areas by inclusion of [LineString]s.
///
/// A [Polygon] can be used to specify the boundary of a [Partfield] or the
/// area of a [TreatmentZone].
///
/// Polygons of type [PolygonType.flag] can be used to assign a comment to all
/// positions inside the polygon. This is to enablethe task controller to
/// display farm-side-generated comments stored in [designator] at certain
/// positions as informational messages to the operator.
class Polygon extends Iso11783Element {
  /// Default factory for creating a [Polygon] with verified
  /// arguments.
  factory Polygon({
    required PolygonType type,
    required List<LineString> lineStrings,
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
      ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
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
  Polygon._({
    required PolygonType type,
    required List<LineString> lineStrings,
    String? designator,
    int? area,
    int? colour,
    String? id,
  }) : super(
         elementType: Iso11783ElementType.polygon,
         description: 'Polygon',
       ) {
    this.type = type;
    this.designator = designator;
    this.area = area;
    this.colour = colour;
    this.id = id;
    children.addAll(lineStrings);
  }

  /// Regular expression matching pattern for the [id] of [Polygon]s.
  static const staticIdRefPattern = '(PLN|PLN-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// The line strins that makes up this polygon.
  List<LineString> get lineStrings => findElements(
    Iso11783ElementType.lineString.xmlTag,
  ).map((e) => e as LineString).toList();

  /// Which type of polygon this is.
  PolygonType get type => PolygonType.values.firstWhere(
    (type) => type.value == parseInt('A'),
    orElse: () => throw ArgumentError(
      '''`${getAttribute('A')}` is not one of the supported values: ${PolygonType.values.join(', ')}''',
    ),
  );
  set type(PolygonType value) => setInt('A', value.value);

  /// Name of the polygon, description or comment.
  String? get designator => tryParseString('B');
  set designator(String? value) => setStringNullable('B', value);

  /// Area of the polygon in m².
  int? get area => tryParseInt('C');
  set area(int? value) => setIntNullable('C', value);

  /// Colour of this.
  ///
  /// See ISO 11783-6 for colour palette, or the implementation in
  /// [Iso11783Colour].
  int? get colour => tryParseInt('D');
  set colour(int? value) => setIntNullable('D', value);

  /// Unique identifier for this polygon.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String? get id => tryParseString('E');
  set id(String? value) => setStringNullable('E', value);
}

/// An enumerator for which type a [Polygon] is.
enum PolygonType {
  /// Boundary of a [Partfield].
  partfieldBoundary(1, 'Partfield Boundary'),

  /// [TreatmentZone]
  treatmentZone(2, 'Treatment Zone'),

  /// Water surface
  waterSurface(3, 'Water Surface'),

  /// Building
  building(4, 'Building'),

  /// Road
  road(5, 'Road'),

  /// An obstacle to avoid.
  obstacle(6, 'Obstacle'),

  /// Flag
  flag(7, 'Flag'),

  /// Other
  other(8, 'Other'),

  /// Mainfield
  mainfield(9, 'Mainfield'),

  /// Headland
  headland(10, 'Headland'),

  /// Buffer zone
  bufferZone(11, 'Buffer Zone'),

  /// Windbreak
  windbreak(12, 'Windbreak');

  const PolygonType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
