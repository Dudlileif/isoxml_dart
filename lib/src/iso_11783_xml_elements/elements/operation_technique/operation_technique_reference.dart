// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that contains a refernce to a single [OperationTechnique].
@CopyWith()
@annotation.XmlRootElement(name: 'OTR')
@annotation.XmlSerializable(createMixin: true)
class OperationTechniqueReference extends Iso11783Element
    with _$OperationTechniqueReferenceXmlSerializableMixin, EquatableMixin {
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
  const OperationTechniqueReference._({
    required this.operationTechniqueIdRef,
  }) : super(
          elementType: Iso11783ElementType.operationTechniqueReference,
          description: 'OperationTechniqueReference',
        );

  /// Creates a [OperationTechniqueReference] from [element].
  factory OperationTechniqueReference.fromXmlElement(XmlElement element) =>
      _$OperationTechniqueReferenceFromXmlElement(element);

  /// Reference to a [OperationTechnique].
  @annotation.XmlAttribute(name: 'A')
  final String operationTechniqueIdRef;

  @override
  List<Object?> get props => [operationTechniqueIdRef];
}
