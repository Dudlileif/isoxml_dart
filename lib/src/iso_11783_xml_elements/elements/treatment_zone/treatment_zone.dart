// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

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
class TreatmentZone extends Iso11783Element {
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
  TreatmentZone._({
    required int code,
    List<Polygon>? polygons,
    List<ProcessDataVariable>? processDataVariables,
    String? designator,
    int? colour,
  }) : super(elementType: _elementType) {
    this.code = code;
    this.designator = designator;
    this.colour = colour;
    this.polygons.addAll(polygons);
    this.processDataVariables.addAll(processDataVariables);
  }

  TreatmentZone._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    polygons.addAll(
      xmlElement
          .findElements(Iso11783ElementType.polygon.xmlTag)
          .map(Polygon._fromXmlElement)
          .toList(),
    );
    processDataVariables.addAll(
      xmlElement
          .findElements(Iso11783ElementType.processDataVariable.xmlTag)
          .map(ProcessDataVariable._fromXmlElement)
          .toList(),
    );
    _argumentValidator();
  }

  void _argumentValidator() {
    ArgumentValidation.checkValueInRange(
      value: code,
      min: 0,
      max: 254,
      name: 'code',
    );

    if (designator != null) {
      ArgumentValidation.checkStringLength(designator!);
    }
    if (colour != null) {
      ArgumentValidation.checkValueInRange(
        value: colour!,
        min: 0,
        max: 254,
        name: 'colour',
      );
    }
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.treatmentZone;

  /// A list of [Polygon]s for this.
  late final polygons = _XmlSyncedList<Polygon>(xmlElement: xmlElement);

  /// A list of [ProcessDataVariable]s for this.
  late final processDataVariables = _XmlSyncedList<ProcessDataVariable>(
    xmlElement: xmlElement,
  );

  /// A unique [TreatmentZone] code inside a single [Task].
  int get code => parseInt('A');
  set code(int value) => setInt('A', value);

  /// Name of the treatment zone, description or comment.
  String? get designator => tryParseString('B');
  set designator(String? value) => setStringNullable('B', value);

  /// Colour of this.
  ///
  /// See ISO 11783-6 for colour palette, or the implementation in
  /// [Iso11783Colour].
  int? get colour => tryParseInt('C');
  set colour(int? value) => setIntNullable('C', value);
}
