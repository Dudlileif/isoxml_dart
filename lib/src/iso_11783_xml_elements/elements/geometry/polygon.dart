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
@CopyWith()
@annotation.XmlRootElement(name: 'PLN')
@annotation.XmlSerializable(createMixin: true)
class Polygon extends Iso11783Element
    with _$PolygonXmlSerializableMixin, EquatableMixin {
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
    required this.type,
    required List<LineString> lineStrings,
    this.designator,
    this.area,
    this.colour,
    this.id,
  }) : super(
         elementType: Iso11783ElementType.polygon,
         description: 'Polygon',
       ) {
    this.lineStrings.addAll(lineStrings);
  }

  /// Creates a [Polygon] from [element].
  factory Polygon.fromXmlElement(XmlElement element) =>
      _$PolygonFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [Polygon]s.
  static const staticIdRefPattern = '(PLN|PLN-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// The line strins that makes up this polygon.
  @annotation.XmlElement(name: 'LSG')
  final List<LineString> lineStrings = [];

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
  /// See ISO 11783-6 for colour palette, or the implementation in
  /// [Iso11783Colour].
  @annotation.XmlAttribute(name: 'D')
  final int? colour;

  /// Unique identifier for this polygon.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'E')
  final String? id;

  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
    ...[
      for (final a in lineStrings.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
  ];

  @override
  List<Object?> get props => [
    lineStrings,
    type,
    designator,
    area,
    colour,
    id,
  ];
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
  windbreak(12, 'Windbreak');

  const PolygonType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
