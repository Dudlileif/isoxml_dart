// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a partfield.
///
/// [Partfield]s can only refer to [Polygon]s, [LineString]s and [Point]s that
/// are not related to [TreatmentZone]s.
@CopyWith()
@annotation.XmlRootElement(name: 'PFD')
@annotation.XmlSerializable(createMixin: true)
class Partfield extends Iso11783Element with _$PartfieldXmlSerializableMixin {
  /// Default factory for creating a [Partfield] with verified
  /// arguments.
  factory Partfield({
    required String id,
    required String designator,
    required int area,
    List<LineString>? lineStrings,
    List<Polygon>? polygons,
    List<Point>? points,
    List<GuidanceGroup>? guidanceGroups,
    String? code,
    String? customerIdRef,
    String? farmIdRef,
    String? cropTypeIdRef,
    String? cropVarietyIdRef,
    String? fieldIdRef,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );
    ArgumentValidation.checkValueInRange(
      value: area,
      min: 0,
      max: 4294967294,
      name: 'area',
    );
    if (code != null) {
      ArgumentValidation.checkStringLength(code, name: 'code');
    }
    if (customerIdRef != null) {
      ArgumentValidation.checkId(
        id: customerIdRef,
        idRefPattern: Customer.staticIdRefPattern,
        idName: 'customerIdRef',
      );
    }
    if (farmIdRef != null) {
      ArgumentValidation.checkId(
        id: farmIdRef,
        idRefPattern: Farm.staticIdRefPattern,
        idName: 'farmIdRef',
      );
    }
    if (cropTypeIdRef != null) {
      ArgumentValidation.checkId(
        id: cropTypeIdRef,
        idRefPattern: CropType.staticIdRefPattern,
        idName: 'cropTypeIdRef',
      );
    }
    if (cropVarietyIdRef != null) {
      ArgumentValidation.checkId(
        id: cropVarietyIdRef,
        idRefPattern: CropVariety.staticIdRefPattern,
        idName: 'cropVarietyIdRef',
      );
    }
    if (fieldIdRef != null) {
      ArgumentValidation.checkId(
        id: fieldIdRef,
        idRefPattern: staticIdRefPattern,
        idName: 'fieldIdRef',
      );
    }

    return Partfield._(
      id: id,
      designator: designator,
      lineStrings: lineStrings,
      polygons: polygons,
      points: points,
      guidanceGroups: guidanceGroups,
      code: code,
      area: area,
      customerIdRef: customerIdRef,
      farmIdRef: farmIdRef,
      cropTypeIdRef: cropTypeIdRef,
      cropVarietyIdRef: cropVarietyIdRef,
      fieldIdRef: fieldIdRef,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  Partfield._({
    required this.id,
    required this.designator,
    required this.area,
    List<LineString>? lineStrings,
    List<Polygon>? polygons,
    List<Point>? points,
    List<GuidanceGroup>? guidanceGroups,
    this.code,
    this.customerIdRef,
    this.farmIdRef,
    this.cropTypeIdRef,
    this.cropVarietyIdRef,
    this.fieldIdRef,
  }) : super(
          elementType: Iso11783ElementType.partfield,
          description: 'Partfield',
        ) {
    if (lineStrings != null) {
      this.lineStrings.addAll(lineStrings);
    }
    if (polygons != null) {
      this.polygons.addAll(polygons);
    }
    if (points != null) {
      this.points.addAll(points);
    }
    if (guidanceGroups != null) {
      this.guidanceGroups.addAll(guidanceGroups);
    }
  }

  /// Creates a [Partfield] from [element].
  factory Partfield.fromXmlElement(XmlElement element) {
    final polygons = element.getElements('PLN');
    final points = element.getElements('PNT');
    final lineStrings = element.getElements('LSG');
    final guidanceGroups = element.getElements('GGP');
    final id = element.getAttribute('A')!;
    final code = element.getAttribute('B');
    final designator = element.getAttribute('C')!;
    final area = element.getAttribute('D')!;
    final customerIdRef = element.getAttribute('E');
    final farmIdRef = element.getAttribute('F');
    final cropTypeIdRef = element.getAttribute('G');
    final cropVarietyIdRef = element.getAttribute('H');
    final fieldIdRef = element.getAttribute('I');
    return Partfield(
      polygons: polygons?.map(Polygon.fromXmlElement).toList(),
      points: points?.map(Point.fromXmlElement).toList(),
      lineStrings: lineStrings?.map(LineString.fromXmlElement).toList(),
      guidanceGroups:
          guidanceGroups?.map(GuidanceGroup.fromXmlElement).toList(),
      id: id,
      code: code,
      designator: designator,
      area: int.parse(area),
      customerIdRef: customerIdRef,
      farmIdRef: farmIdRef,
      cropTypeIdRef: cropTypeIdRef,
      cropVarietyIdRef: cropVarietyIdRef,
      fieldIdRef: fieldIdRef,
    );
  }

  /// Regular expression matching pattern for the [id] of [Partfield]s.
  static const staticIdRefPattern = '(PFD|PFD-)[0-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of [Polygon]s that this is made of.
  @annotation.XmlElement(name: 'PLN')
  final List<Polygon> polygons = [];

  /// A list of [Point]s that this is made of.
  @annotation.XmlElement(name: 'PNT')
  final List<Point> points = [];

  /// A list of [LineString] that this is made of.
  @annotation.XmlElement(name: 'LSG')
  final List<LineString> lineStrings = [];

  /// A list of [GuidanceGroup]s for use in this.
  @annotation.XmlElement(name: 'GGP')
  final List<GuidanceGroup> guidanceGroups = [];

  /// Unique identifier for this partfield.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Partfield number from the FMIS.
  @annotation.XmlAttribute(name: 'B')
  final String? code;

  /// Name of the partfield, description or comment.
  @annotation.XmlAttribute(name: 'C')
  final String designator;

  /// The size of this in m².
  @annotation.XmlAttribute(name: 'D')
  int area;

  /// Reference to a [Customer].
  @annotation.XmlAttribute(name: 'E')
  String? customerIdRef;

  /// Reference to a [Farm].
  @annotation.XmlAttribute(name: 'F')
  String? farmIdRef;

  /// Reference to a [CropType].
  @annotation.XmlAttribute(name: 'G')
  String? cropTypeIdRef;

  /// Reference to a [CropVariety].
  @annotation.XmlAttribute(name: 'H')
  String? cropVarietyIdRef;

  /// Reference to a parent [Partfield].
  @annotation.XmlAttribute(name: 'I')
  String? fieldIdRef;

  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
        ...[
          for (final a in polygons.map((e) => e.selfWithRecursiveChildren))
            ...a,
        ],
        ...[
          for (final a in lineStrings.map((e) => e.selfWithRecursiveChildren))
            ...a,
        ],
        ...[
          for (final a in points.map((e) => e.selfWithRecursiveChildren)) ...a,
        ],
        ...[
          for (final a
              in guidanceGroups.map((e) => e.selfWithRecursiveChildren))
            ...a,
        ],
      ];

  /// The list of properties that will be used to determine whether
  /// two instances are equal.
  List<Object?> get props => [
        polygons,
        lineStrings,
        points,
        guidanceGroups,
        id,
        code,
        designator,
        area,
        customerIdRef,
        farmIdRef,
        cropTypeIdRef,
        cropVarietyIdRef,
        fieldIdRef,
      ];

  /// Returns a string for [props].
  @override
  String toString() => mapPropsToString(runtimeType, props);
}
