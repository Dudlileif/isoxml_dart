// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that describes operation techniques like `drilling`, `plowing`,
/// `harvesting`.
@CopyWith()
@annotation.XmlRootElement(name: 'OTQ')
@annotation.XmlSerializable(createMixin: true)
class OperationTechnique extends Iso11783Element
    with _$OperationTechniqueXmlSerializableMixin {
  /// Default factory for creating a [OperationTechnique] with verified
  /// arguments.
  factory OperationTechnique({
    required String id,
    required String designator,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: idRefPattern,
      designator: designator,
    );

    return OperationTechnique._(
      id: id,
      designator: designator,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const OperationTechnique._({
    required this.id,
    required this.designator,
  }) : super(
          tag: Iso11783Tag.operationTechnique,
          description: 'OperationTechnique',
        );

  /// Creates a [OperationTechnique] from [element].
  factory OperationTechnique.fromXmlElement(XmlElement element) =>
      _$OperationTechniqueFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [OperationTechnique]s.
  static const idRefPattern = '(OTQ|OTQ-)([0-9])+';

  /// Unique identifier for this operation technique.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the operation technique, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  @override
  List<Object?> get props => super.props
    ..addAll([
      id,
      designator,
    ]);
}

/// An element that contains a refernce to a single [OperationTechnique].
@CopyWith()
@annotation.XmlRootElement(name: 'OTR')
@annotation.XmlSerializable(createMixin: true)
class OperationTechniqueReference extends Iso11783Element
    with _$OperationTechniqueReferenceXmlSerializableMixin {
  /// Default factory for creating a [OperationTechniqueReference] with
  /// verified arguments.
  factory OperationTechniqueReference({
    required String operationTechniqueIdRef,
  }) {
    ArgumentValidation.checkId(
      id: operationTechniqueIdRef,
      idRefPattern: OperationTechnique.idRefPattern,
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
          tag: Iso11783Tag.operationTechniqueReference,
          description: 'OperationTechniqueReference',
        );

  /// Creates a [OperationTechniqueReference] from [element].
  factory OperationTechniqueReference.fromXmlElement(XmlElement element) =>
      _$OperationTechniqueReferenceFromXmlElement(element);

  /// Reference to a [OperationTechnique].
  @annotation.XmlAttribute(name: 'A')
  final String operationTechniqueIdRef;

  @override
  List<Object?> get props => super.props..addAll([operationTechniqueIdRef]);
}

/// An element that provides an assignment of the combination of a specific
/// [OperationTechnique] with a single [CulturalPractice].
@CopyWith()
@annotation.XmlRootElement(name: 'OTP')
@annotation.XmlSerializable(createMixin: true)
class OperationTechniquePractice extends Iso11783Element
    with _$OperationTechniquePracticeXmlSerializableMixin {
  /// Default factory for creating a [OperationTechniquePractice] with
  /// verified arguments.
  factory OperationTechniquePractice({
    required String culturalPracticeIdRef,
    String? operationTechniqueIdRef,
  }) {
    ArgumentValidation.checkId(
      id: culturalPracticeIdRef,
      idRefPattern: CulturalPractice.idRefPattern,
      idName: 'culturalPracticeIdRef',
    );
    if (operationTechniqueIdRef != null) {
      ArgumentValidation.checkId(
        id: operationTechniqueIdRef,
        idRefPattern: OperationTechnique.idRefPattern,
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
  const OperationTechniquePractice._({
    required this.culturalPracticeIdRef,
    this.operationTechniqueIdRef,
  }) : super(
          tag: Iso11783Tag.operationTechniquePractice,
          description: 'OperationTechniquePractice',
        );

  /// Creates a [OperationTechniquePractice] from [element].
  factory OperationTechniquePractice.fromXmlElement(XmlElement element) =>
      _$OperationTechniquePracticeFromXmlElement(element);

  /// Reference to a [CulturalPractice].
  @annotation.XmlAttribute(name: 'A')
  final String culturalPracticeIdRef;

  /// Reference to a [OperationTechnique].
  @annotation.XmlAttribute(name: 'B')
  final String? operationTechniqueIdRef;

  @override
  List<Object?> get props => super.props
    ..addAll([
      culturalPracticeIdRef,
      operationTechniqueIdRef,
    ]);
}
