// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes cultural practices that can be allocated to a
/// [Task].
///
/// Examples of [CulturalPractice] definitions are "plowing" or "seeding".
/// A [CulturalPractice] can refer to a list of references to several
/// [OperationTechnique]s
///
/// (e.g. cultural practice: "fertilization"->
/// operation techniques: "liquid fertilization","organic fertilization",
/// "gaseous fertilization").
@CopyWith()
@annotation.XmlRootElement(name: 'CPC')
@annotation.XmlSerializable(createMixin: true)
class CulturalPractice extends Iso11783Element
    with _$CulturalPracticeXmlSerializableMixin {
  /// Default factory for creating a [CulturalPractice] with verified
  /// arguments.
  factory CulturalPractice({
    required String id,
    required String designator,
    List<OperationTechniqueReference>? operationTechniqueReferences,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: idRefPattern,
      designator: designator,
    );
    return CulturalPractice._(
      id: id,
      designator: designator,
      operationTechniqueReferences: operationTechniqueReferences,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  CulturalPractice._({
    required this.id,
    required this.designator,
    List<OperationTechniqueReference>? operationTechniqueReferences,
  }) : super(
          tag: Iso11783XmlTag.culturalPractice,
          description: 'CulturalPractice',
        ) {
    if (operationTechniqueReferences != null) {
      this.operationTechniqueReferences.addAll(operationTechniqueReferences);
    }
  }

  /// Creates a [CulturalPractice] from [element].
  factory CulturalPractice.fromXmlElement(XmlElement element) {
    final operationTechniqueReferences = element.getElements('OTR');
    final id = element.getAttribute('A')!;
    final designator = element.getAttribute('B')!;
    return CulturalPractice(
      operationTechniqueReferences: operationTechniqueReferences
          ?.map(OperationTechniqueReference.fromXmlElement)
          .toList(),
      id: id,
      designator: designator,
    );
  }

  /// Regular expression matching pattern for the [id] of [CulturalPractice]s.
  static const idRefPattern = '(CPC|CPC-)([0-9])+';

  /// A list of references to the available [OperationTechnique]s for this.
  @annotation.XmlElement(name: 'OTR')
  final List<OperationTechniqueReference> operationTechniqueReferences = [];

  /// Unique identifier for this cultural practice.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the cultural practice, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;
  
  @override
  List<Object?> get props => super.props
    ..addAll([
      operationTechniqueReferences,
      id,
      designator,
    ]);
}
