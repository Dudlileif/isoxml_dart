// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that is included in a [TreatmentZone].
///
/// It contains the [ddi] accompanied by its [value] and optional references
/// [productIdRef] and [deviceElementIdRef] for [Product] and
/// [DeviceElement] information to be used in this [TreatmentZone].
/// A [ProcessDataVariable] can contain another [ProcessDataVariable]s to
/// describe the planned allocation of multiple [Product]s to a single
/// [DeviceElement]. In that case, the `parent` [ProcessDataVariable] specifies
/// the [ddi] to be sent by the TaskController to a [DeviceElement] while the
/// `child` [ProcessDataVariable]s contain the product specifications.
@CopyWith()
@annotation.XmlRootElement(name: 'PDV')
@annotation.XmlSerializable(createMixin: true)
class ProcessDataVariable extends Iso11783Element
    with _$ProcessDataVariableXmlSerializableMixin {
  /// Default factory for creating a [ProcessDataVariable] with verified
  /// arguments.
  factory ProcessDataVariable({
    required String ddi,
    required int value,
    List<ProcessDataVariable>? processDataVariables,
    String? productIdRef,
    String? deviceElementIdRef,
    String? valuePresentationIdRef,
    int? actualCulturalPracticeValue,
    int? elementTypeInstanceValue,
  }) {
    ArgumentValidation.checkHexStringLength(
      ddi,
      name: 'ddi',
    );
    ArgumentValidation.checkValueInRange(
      value: value,
      min: -2147483648,
      max: 2147483647,
      name: 'value',
    );
    if (productIdRef != null) {
      ArgumentValidation.checkId(
        id: productIdRef,
        idRefPattern: Product.idRefPattern,
        idName: 'productIdRef',
      );
    }
    if (deviceElementIdRef != null) {
      ArgumentValidation.checkId(
        id: deviceElementIdRef,
        idRefPattern: DeviceElement.idRefPattern,
        idName: 'deviceElementIdRef',
      );
    }
    if (valuePresentationIdRef != null) {
      ArgumentValidation.checkId(
        id: valuePresentationIdRef,
        idRefPattern: ValuePresentation.idRefPattern,
        idName: 'valuePresentationIdRef',
      );
    }
    if (actualCulturalPracticeValue != null) {
      ArgumentValidation.checkValueInRange(
        value: actualCulturalPracticeValue,
        min: -2147483648,
        max: 2147483647,
        name: 'actualCulturalPracticeValue',
      );
    }
    if (elementTypeInstanceValue != null) {
      ArgumentValidation.checkValueInRange(
        value: elementTypeInstanceValue,
        min: -2147483648,
        max: 2147483647,
        name: 'elementTypeInstanceValue',
      );
    }

    return ProcessDataVariable._(
      ddi: ddi,
      value: value,
      processDataVariables: processDataVariables,
      productIdRef: productIdRef,
      deviceElementIdRef: deviceElementIdRef,
      valuePresentationIdRef: valuePresentationIdRef,
      actualCulturalPracticeValue: actualCulturalPracticeValue,
      elementTypeInstanceValue: elementTypeInstanceValue,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const ProcessDataVariable._({
    required this.ddi,
    required this.value,
    this.processDataVariables,
    this.productIdRef,
    this.deviceElementIdRef,
    this.valuePresentationIdRef,
    this.actualCulturalPracticeValue,
    this.elementTypeInstanceValue,
  }) : super(
          tag: Iso11783Tag.processDataVariable,
          description: 'ProcessDataVariable',
        );

  /// Creates a [ProcessDataVariable] from [element].
  factory ProcessDataVariable.fromXmlElement(XmlElement element) =>
      _$ProcessDataVariableFromXmlElement(element);

  /// A list of child [ProcessDataVariable]s.
  @annotation.XmlElement(name: 'PDV')
  final List<ProcessDataVariable>? processDataVariables;

  /// A unique Data Dictionary Identifier which identifies this.
  ///
  /// This can be found as a Device Dictionary Entity (DDE)
  /// in theISO 11783-11 online database.
  @annotation.XmlAttribute(name: 'A')
  final String ddi;

  /// Value of the Process Data DDI.
  @annotation.XmlAttribute(name: 'B')
  final int value;

  /// Reference to a [Product].
  @annotation.XmlAttribute(name: 'C')
  final String? productIdRef;

  /// Reference to a [DeviceElement].
  @annotation.XmlAttribute(name: 'D')
  final String? deviceElementIdRef;

  /// Reference to a [ValuePresentation].
  @annotation.XmlAttribute(name: 'E')
  final String? valuePresentationIdRef;

  /// A value for a [CulturalPractice].
  ///
  // TODO(dudlileif): Needs better documentation.
  @annotation.XmlAttribute(name: 'F')
  final int? actualCulturalPracticeValue;

  /// A value for the element type instance.
  ///
  // TODO(dudlileif): Needs better documentation.
  @annotation.XmlAttribute(name: 'G')
  final int? elementTypeInstanceValue;

  @override
  List<Object?> get props => super.props
    ..addAll([
      processDataVariables,
      ddi,
      value,
      productIdRef,
      deviceElementIdRef,
      valuePresentationIdRef,
      actualCulturalPracticeValue,
      elementTypeInstanceValue,
    ]);
}
