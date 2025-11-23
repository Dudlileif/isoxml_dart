// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that contains a refernce to a single [OperationTechnique].
class OperationTechniqueReference extends Iso11783Element {
  /// Default factory for creating a [OperationTechniqueReference] with
  /// verified arguments.
  factory OperationTechniqueReference({
    required String operationTechniqueIdRef,
  }) {
    ArgumentValidation.checkId(
      id: operationTechniqueIdRef,
      idRefPattern: OperationTechnique.staticIdRefPattern,
      idName: 'operationTechniqueIdRef',
    );

    return OperationTechniqueReference._(
      operationTechniqueIdRef: operationTechniqueIdRef,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  OperationTechniqueReference._({
    required String operationTechniqueIdRef,
  }) : super(elementType: _elementType) {
    this.operationTechniqueIdRef = operationTechniqueIdRef;
  }

  OperationTechniqueReference._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    _argumentValidator();
  }

  void _argumentValidator() {
    ArgumentValidation.checkId(
      id: operationTechniqueIdRef,
      idRefPattern: OperationTechnique.staticIdRefPattern,
      idName: 'operationTechniqueIdRef',
    );
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.operationTechniqueReference;

  /// Reference to a [OperationTechnique].
  String get operationTechniqueIdRef => parseString('A');
  set operationTechniqueIdRef(String value) => setString('A', value);
}
