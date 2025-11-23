// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that is included in a [TreatmentZone].
///
/// It contains the [ddi] accompanied by its value [variableValue] and optional
/// references [productIdRef] and [deviceElementIdRef] for [Product] and
/// [DeviceElement] information to be used in this [TreatmentZone].
/// A [ProcessDataVariable] can contain another [ProcessDataVariable]s to
/// describe the planned allocation of multiple [Product]s to a single
/// [DeviceElement]. In that case, the `parent` [ProcessDataVariable] specifies
/// the [ddi] to be sent by the TaskController to a [DeviceElement] while the
/// `child` [ProcessDataVariable]s contain the product specifications.

class ProcessDataVariable extends Iso11783Element {
  /// Default factory for creating a [ProcessDataVariable] with verified
  /// arguments.
  factory ProcessDataVariable({
    required String ddi,
    required int variableValue,
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
      value: variableValue,
      min: -2147483648,
      max: 2147483647,
      name: 'variableValue',
    );
    if (productIdRef != null) {
      ArgumentValidation.checkId(
        id: productIdRef,
        idRefPattern: Product.staticIdRefPattern,
        idName: 'productIdRef',
      );
    }
    if (deviceElementIdRef != null) {
      ArgumentValidation.checkId(
        id: deviceElementIdRef,
        idRefPattern: DeviceElement.staticIdRefPattern,
        idName: 'deviceElementIdRef',
      );
    }
    if (valuePresentationIdRef != null) {
      ArgumentValidation.checkId(
        id: valuePresentationIdRef,
        idRefPattern: ValuePresentation.staticIdRefPattern,
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
      variableValue: variableValue,
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
  ProcessDataVariable._({
    required String ddi,
    required int variableValue,
    List<ProcessDataVariable>? processDataVariables,
    String? productIdRef,
    String? deviceElementIdRef,
    String? valuePresentationIdRef,
    int? actualCulturalPracticeValue,
    int? elementTypeInstanceValue,
  }) : super(elementType: _elementType) {
    this.ddi = ddi;
    this.variableValue = variableValue;
    this.productIdRef = productIdRef;
    this.deviceElementIdRef = deviceElementIdRef;
    this.valuePresentationIdRef = valuePresentationIdRef;
    this.actualCulturalPracticeValue = actualCulturalPracticeValue;
    this.elementTypeInstanceValue = elementTypeInstanceValue;
    this.processDataVariables.addAll(processDataVariables);
  }

  ProcessDataVariable._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    processDataVariables.addAll(
      xmlElement
          .findElements(Iso11783ElementType.processDataVariable.xmlTag)
          .map(ProcessDataVariable._fromXmlElement)
          .toList(),
    );
    _argumentValidator();
  }

  void _argumentValidator() {
    ArgumentValidation.checkHexStringLength(
      ddi,
      name: 'ddi',
    );
    ArgumentValidation.checkValueInRange(
      value: variableValue,
      min: -2147483648,
      max: 2147483647,
      name: 'variableValue',
    );
    if (productIdRef != null) {
      ArgumentValidation.checkId(
        id: productIdRef!,
        idRefPattern: Product.staticIdRefPattern,
        idName: 'productIdRef',
      );
    }
    if (deviceElementIdRef != null) {
      ArgumentValidation.checkId(
        id: deviceElementIdRef!,
        idRefPattern: DeviceElement.staticIdRefPattern,
        idName: 'deviceElementIdRef',
      );
    }
    if (valuePresentationIdRef != null) {
      ArgumentValidation.checkId(
        id: valuePresentationIdRef!,
        idRefPattern: ValuePresentation.staticIdRefPattern,
        idName: 'valuePresentationIdRef',
      );
    }
    if (actualCulturalPracticeValue != null) {
      ArgumentValidation.checkValueInRange(
        value: actualCulturalPracticeValue!,
        min: -2147483648,
        max: 2147483647,
        name: 'actualCulturalPracticeValue',
      );
    }
    if (elementTypeInstanceValue != null) {
      ArgumentValidation.checkValueInRange(
        value: elementTypeInstanceValue!,
        min: -2147483648,
        max: 2147483647,
        name: 'elementTypeInstanceValue',
      );
    }
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.processDataVariable;

  /// A list of child [ProcessDataVariable]s.
  late final processDataVariables = _XmlSyncedList<ProcessDataVariable>(
    xmlElement: xmlElement,
  );

  /// A unique Data Dictionary Identifier which identifies this.
  ///
  /// This can be found as a Device Dictionary Entity (DDE)
  /// in the ISO 11783-11 database.
  String get ddi => parseString('A');
  set ddi(String value) => setString('A', value);

  /// Value of the Process Data DDI.
  int get variableValue => parseInt('B');
  set variableValue(int value) => setInt('B', value);

  /// Reference to a [Product].
  String? get productIdRef => tryParseString('C');
  set productIdRef(String? value) => setStringNullable('C', value);

  /// Reference to a [DeviceElement].
  String? get deviceElementIdRef => tryParseString('D');
  set deviceElementIdRef(String? value) => setStringNullable('D', value);

  /// Reference to a [ValuePresentation].
  String? get valuePresentationIdRef => tryParseString('E');
  set valuePresentationIdRef(String? value) => setStringNullable('E', value);

  /// A value for the DDI 179 Actual Cultural Practice from the ISO 11783-11
  /// database.
  int? get actualCulturalPracticeValue => tryParseInt('F');
  set actualCulturalPracticeValue(int? value) => setIntNullable('F', value);

  /// A value for the DDI 178 Element Type Instance from the ISO 11783-11
  /// database.
  int? get elementTypeInstanceValue => tryParseInt('G');
  set elementTypeInstanceValue(int? value) => setIntNullable('G', value);
}
