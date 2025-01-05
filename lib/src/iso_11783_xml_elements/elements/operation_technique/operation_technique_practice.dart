// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that provides an assignment of the combination of a specific
/// [OperationTechnique] with a single [CulturalPractice].
@CopyWith()
@annotation.XmlRootElement(name: 'OTP')
@annotation.XmlSerializable(createMixin: true)
class OperationTechniquePractice extends Iso11783Element
    with _$OperationTechniquePracticeXmlSerializableMixin, EquatableMixin {
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
  const OperationTechniquePractice._({
    required this.culturalPracticeIdRef,
    this.operationTechniqueIdRef,
  }) : super(
          elementType: Iso11783ElementType.operationTechniquePractice,
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
  List<Object?> get props => [
        culturalPracticeIdRef,
        operationTechniqueIdRef,
      ];
}
