// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that provides an assignment of the combination of a specific
/// [OperationTechnique] with a single [CulturalPractice].
class OperationTechniquePractice extends Iso11783Element {
  /// Default factory for creating a [OperationTechniquePractice] with
  /// verified arguments.
  factory OperationTechniquePractice({
    required String culturalPracticeIdRef,
    String? operationTechniqueIdRef,
  }) {
    ArgumentValidation.checkId(
      id: culturalPracticeIdRef,
      idRefPattern: CulturalPractice.staticIdRefPattern,
      idName: 'culturalPracticeIdRef',
    );
    if (operationTechniqueIdRef != null) {
      ArgumentValidation.checkId(
        id: operationTechniqueIdRef,
        idRefPattern: OperationTechnique.staticIdRefPattern,
        idName: 'operationTechniqueIdRef',
      );
    }
    return OperationTechniquePractice._(
      culturalPracticeIdRef: culturalPracticeIdRef,
      operationTechniqueIdRef: operationTechniqueIdRef,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  OperationTechniquePractice._({
    required String culturalPracticeIdRef,
    String? operationTechniqueIdRef,
  }) : super(elementType: _elementType) {
    this.culturalPracticeIdRef = culturalPracticeIdRef;
    this.operationTechniqueIdRef = operationTechniqueIdRef;
  }

  OperationTechniquePractice._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    _argumentValidator();
  }

  void _argumentValidator() {
    ArgumentValidation.checkId(
      id: culturalPracticeIdRef,
      idRefPattern: CulturalPractice.staticIdRefPattern,
      idName: 'culturalPracticeIdRef',
    );
    if (operationTechniqueIdRef != null) {
      ArgumentValidation.checkId(
        id: operationTechniqueIdRef!,
        idRefPattern: OperationTechnique.staticIdRefPattern,
        idName: 'operationTechniqueIdRef',
      );
    }
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.operationTechniquePractice;

  /// Reference to a [CulturalPractice].
  String get culturalPracticeIdRef => parseString('A');
  set culturalPracticeIdRef(String value) => setString('A', value);

  /// Reference to a [OperationTechnique].
  String? get operationTechniqueIdRef => tryParseString('B');
  set operationTechniqueIdRef(String? value) => setStringNullable('B', value);
}
