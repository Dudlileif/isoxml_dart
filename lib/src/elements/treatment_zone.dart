// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that describes an area to be treated with
/// the same processDataDDIs and the same values.
///
/// Inside a [Task], two [TreatmentZone]s can be referenced. The
/// DefaultTreatmentZone has a special meaning concerning the included
/// [ProcessDataVariable]s. The values of those [ProcessDataVariable]s are to
/// be applied globally to the whole task. Usually, all [ProcessDataVariable]
/// values inside the DefaultTreatmentZone are sent by the task controller to
/// all appropriate working sets on starting and/or resuming a [Task].
/// A DefaultTreatmentZone can exist for non-site-specific tasks.
/// Non-site-specific tasks are [Task]s without any [Polygon]s or [Grid]
/// defined. The PositionLostTreatmentZone contains the [ProcessDataVariable]s
/// that shall be sent to the working sets when the positioning becomes
/// unavailable. The  specification of the PositionLostTreatmentZone is
/// intended for site-specific tasks only.
@CopyWith()
@annotation.XmlRootElement(name: 'TZN')
@annotation.XmlSerializable(createMixin: true)
class TreatmentZone extends Iso11783Element
    with _$TreatmentZoneXmlSerializableMixin {
  /// Default factory for creating a [TreatmentZone] with verified
  /// arguments.
  factory TreatmentZone({
    required int code,
    List<Polygon>? polygons,
    List<ProcessDataVariable>? processDataVariables,
    String? designator,
    int? colour,
  }) {
    ArgumentValidation.checkValueInRange(
      value: code,
      min: 0,
      max: 254,
      name: 'code',
    );

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
    return TreatmentZone._(
      code: code,
      polygons: polygons,
      processDataVariables: processDataVariables,
      designator: designator,
      colour: colour,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const TreatmentZone._({
    required this.code,
    this.polygons,
    this.processDataVariables,
    this.designator,
    this.colour,
  }) : super(tag: Iso11783Tag.treatmentZone, description: 'TreatmentZone');

  /// Creates a [TreatmentZone] from [element].
  factory TreatmentZone.fromXmlElement(XmlElement element) =>
      _$TreatmentZoneFromXmlElement(element);

  /// A list of [Polygon]s for this.
  @annotation.XmlElement(name: 'PLN')
  final List<Polygon>? polygons;

  /// A list of [ProcessDataVariable]s for this.
  @annotation.XmlElement(name: 'PDV')
  final List<ProcessDataVariable>? processDataVariables;

  /// A unique [TreatmentZone] code inside a single [Task].
  @annotation.XmlAttribute(name: 'A')
  final int code;

  /// Name of the treatment zone, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String? designator;

  /// Colour of this.
  ///
  /// See colour palette inISO 11783-6.
  @annotation.XmlAttribute(name: 'C')
  final int? colour;

  @override
  List<Object?> get props => super.props
    ..addAll([
      polygons,
      processDataVariables,
      code,
      designator,
      colour,
    ]);
}
