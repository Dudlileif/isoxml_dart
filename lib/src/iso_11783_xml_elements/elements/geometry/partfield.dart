// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a partfield.
///
/// [Partfield]s can only refer to [Polygon]s, [LineString]s and [Point]s that
/// are not related to [TreatmentZone]s.
class Partfield extends Iso11783Element {
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
    _argumentValidator(
      id: id,
      designator: designator,
      area: area,
      lineStrings: lineStrings,
      polygons: polygons,
      points: points,
      guidanceGroups: guidanceGroups,
      code: code,
      customerIdRef: customerIdRef,
      farmIdRef: farmIdRef,
      cropTypeIdRef: cropTypeIdRef,
      cropVarietyIdRef: cropVarietyIdRef,
      fieldIdRef: fieldIdRef,
    );

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
  }) : super._(elementType: _elementType) {
    this.id = id;
    this.designator = designator;
    this.area = area;
    this.code = code;
    this.customerIdRef = customerIdRef;
    this.farmIdRef = farmIdRef;
    this.cropTypeIdRef = cropTypeIdRef;
    this.cropVarietyIdRef = cropVarietyIdRef;
    this.fieldIdRef = fieldIdRef;
    this.polygons.addAll(polygons);
    this.points.addAll(points);
    this.lineStrings.addAll(lineStrings);
    this.guidanceGroups.addAll(guidanceGroups);
  }

  Partfield._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    polygons.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.polygon.xmlTag,
          )
          .map(Polygon._fromXmlElement)
          .toList(),
    );
    points.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.point.xmlTag,
          )
          .map(Point._fromXmlElement)
          .toList(),
    );
    lineStrings.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.lineString.xmlTag,
          )
          .map(LineString._fromXmlElement)
          .toList(),
    );
    guidanceGroups.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.guidanceGroup.xmlTag,
          )
          .map(GuidanceGroup._fromXmlElement)
          .toList(),
    );
    _argumentValidator(
      id: id,
      designator: designator,
      area: area,
      lineStrings: lineStrings,
      polygons: polygons,
      points: points,
      guidanceGroups: guidanceGroups,
      code: code,
      customerIdRef: customerIdRef,
      farmIdRef: farmIdRef,
      cropTypeIdRef: cropTypeIdRef,
      cropVarietyIdRef: cropVarietyIdRef,
      fieldIdRef: fieldIdRef,
    );
  }

  static void _argumentValidator({
    required String id,
    required String designator,
    required int area,
    required List<LineString>? lineStrings,
    required List<Polygon>? polygons,
    required List<Point>? points,
    required List<GuidanceGroup>? guidanceGroups,
    required String? code,
    required String? customerIdRef,
    required String? farmIdRef,
    required String? cropTypeIdRef,
    required String? cropVarietyIdRef,
    required String? fieldIdRef,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
      idName: 'Partfield.id',
      designatorName: 'Partfield.designator',
    );
    ArgumentValidation.checkValueInRange(
      value: area,
      min: 0,
      max: 4294967294,
      name: 'Partfield.area',
    );
    if (code != null) {
      ArgumentValidation.checkStringLength(code, name: 'Partfield.code');
    }
    if (customerIdRef != null) {
      ArgumentValidation.checkId(
        id: customerIdRef,
        idRefPattern: Customer.staticIdRefPattern,
        name: 'Partfield.customerIdRef',
      );
    }
    if (farmIdRef != null) {
      ArgumentValidation.checkId(
        id: farmIdRef,
        idRefPattern: Farm.staticIdRefPattern,
        name: 'Partfield.farmIdRef',
      );
    }
    if (cropTypeIdRef != null) {
      ArgumentValidation.checkId(
        id: cropTypeIdRef,
        idRefPattern: CropType.staticIdRefPattern,
        name: 'Partfield.cropTypeIdRef',
      );
    }
    if (cropVarietyIdRef != null) {
      ArgumentValidation.checkId(
        id: cropVarietyIdRef,
        idRefPattern: CropVariety.staticIdRefPattern,
        name: 'Partfield.cropVarietyIdRef',
      );
    }
    if (fieldIdRef != null) {
      ArgumentValidation.checkId(
        id: fieldIdRef,
        idRefPattern: staticIdRefPattern,
        name: 'Partfield.fieldIdRef',
      );
    }
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.partfield;

  /// Regular expression matching pattern for the [id] of [Partfield]s.
  static const staticIdRefPattern = '(PFD|PFD-)[0-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of [Polygon]s that this is made of.
  late final polygons = _XmlSyncedList<Polygon>(
    xmlElement: xmlElement,
    xmlTag: Polygon._elementType.xmlTag,
  );

  /// A list of [Point]s that this is made of.
  late final points = _XmlSyncedList<Point>(
    xmlElement: xmlElement,
    xmlTag: Point._elementType.xmlTag,
  );

  /// A list of [LineString] that this is made of.
  late final lineStrings = _XmlSyncedList<LineString>(
    xmlElement: xmlElement,
    xmlTag: LineString._elementType.xmlTag,
  );

  /// A list of [GuidanceGroup]s for use in this.
  late final guidanceGroups = _XmlSyncedList<GuidanceGroup>(
    xmlElement: xmlElement,
    xmlTag: GuidanceGroup._elementType.xmlTag,
  );

  /// Unique identifier for this partfield.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Partfield number from the FMIS.
  String? get code => tryParseString('B');
  set code(String? value) => setStringNullable('B', value);

  /// Name of the partfield, description or comment.
  String get designator => parseString('C');
  set designator(String value) => setString('C', value);

  /// The size of this in m².
  int get area => parseInt('D');
  set area(int value) => setInt('D', value);

  /// Reference to a [Customer].
  String? get customerIdRef => tryParseString('E');
  set customerIdRef(String? value) => setStringNullable('E', value);

  /// Reference to a [Farm].
  String? get farmIdRef => tryParseString('F');
  set farmIdRef(String? value) => setStringNullable('F', value);

  /// Reference to a [CropType].
  String? get cropTypeIdRef => tryParseString('G');
  set cropTypeIdRef(String? value) => setStringNullable('G', value);

  /// Reference to a [CropVariety].
  String? get cropVarietyIdRef => tryParseString('H');
  set cropVarietyIdRef(String? value) => setStringNullable('H', value);

  /// Reference to a parent [Partfield].
  String? get fieldIdRef => tryParseString('I');
  set fieldIdRef(String? value) => setStringNullable('I', value);
}
