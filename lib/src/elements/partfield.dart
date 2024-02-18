// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

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
    List<LineString>? lineStrings,
    List<Polygon>? polygons,
    List<Point>? points,
    List<GuidanceGroup>? guidanceGroups,
    String? code,
    int? area,
    String? customerIdRef,
    String? farmIdRef,
    String? cropTypeIdRef,
    String? cropVarietyIdRef,
    String? fieldIdRef,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: idRefPattern,
      designator: designator,
    );
    if (code != null) {
      ArgumentValidation.checkStringLength(code, name: 'code');
    }
    if (area != null) {
      ArgumentValidation.checkValueInRange(
        value: area,
        min: 0,
        max: 4294967294,
        name: 'area',
      );
    }
    if (customerIdRef != null) {
      ArgumentValidation.checkId(
        id: customerIdRef,
        idRefPattern: Customer.idRefPattern,
        idName: 'customerIdRef',
      );
    }
    if (farmIdRef != null) {
      ArgumentValidation.checkId(
        id: farmIdRef,
        idRefPattern: Farm.idRefPattern,
        idName: 'farmIdRef',
      );
    }
    if (cropTypeIdRef != null) {
      ArgumentValidation.checkId(
        id: cropTypeIdRef,
        idRefPattern: CropType.idRefPattern,
        idName: 'cropTypeIdRef',
      );
    }
    if (cropVarietyIdRef != null) {
      ArgumentValidation.checkId(
        id: cropVarietyIdRef,
        idRefPattern: CropVariety.idRefPattern,
        idName: 'cropVarietyIdRef',
      );
    }
    if (fieldIdRef != null) {
      ArgumentValidation.checkId(
        id: fieldIdRef,
        idRefPattern: idRefPattern,
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
  const Partfield._({
    required this.id,
    required this.designator,
    this.lineStrings,
    this.polygons,
    this.points,
    this.guidanceGroups,
    this.code,
    this.area,
    this.customerIdRef,
    this.farmIdRef,
    this.cropTypeIdRef,
    this.cropVarietyIdRef,
    this.fieldIdRef,
  }) : super(tag: Iso11783Tag.partfield, description: 'Partfield');

  /// Creates a [Partfield] from [element].
  factory Partfield.fromXmlElement(XmlElement element) =>
      _$PartfieldFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [Partfield]s.
  static const idRefPattern = '(PFD|PFD-)([0-9])+';

  /// A list of [Polygon]s that this is made of.
  @annotation.XmlElement(name: 'PLN')
  final List<Polygon>? polygons;

  /// A list of [Point]s that this is made of.
  @annotation.XmlElement(name: 'PNT')
  final List<Point>? points;

  /// A list of [LineString] that this is made of.
  @annotation.XmlElement(name: 'LSG')
  final List<LineString>? lineStrings;

  /// A list of [GuidanceGroup]s for use in this.
  @annotation.XmlElement(name: 'GGP')
  final List<GuidanceGroup>? guidanceGroups;

  /// Unique identifier for this partfield.
  ///
  /// Records generated on MICS have negative IDs.
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
  final int? area;

  /// Reference to a [Customer].
  @annotation.XmlAttribute(name: 'E')
  final String? customerIdRef;

  /// Reference to a [Farm].
  @annotation.XmlAttribute(name: 'F')
  final String? farmIdRef;

  /// Reference to a [CropType].
  @annotation.XmlAttribute(name: 'G')
  final String? cropTypeIdRef;

  /// Reference to a [CropVariety].
  @annotation.XmlAttribute(name: 'H')
  final String? cropVarietyIdRef;

  /// Reference to a parent [Partfield].
  @annotation.XmlAttribute(name: 'I')
  final String? fieldIdRef;

  @override
  List<Object?> get props => super.props
    ..addAll([
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
    ]);
}
