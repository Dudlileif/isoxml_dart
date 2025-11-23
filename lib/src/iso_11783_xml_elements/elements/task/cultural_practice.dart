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
class CulturalPractice extends Iso11783Element {
  /// Default factory for creating a [CulturalPractice] with verified
  /// arguments.
  factory CulturalPractice({
    required String id,
    required String designator,
    List<OperationTechniqueReference>? operationTechniqueReferences,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
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
    required String id,
    required String designator,
    List<OperationTechniqueReference>? operationTechniqueReferences,
  }) : super(elementType: _elementType) {
    this.id = id;
    this.designator = designator;
    this.operationTechniqueReferences.addAll(operationTechniqueReferences);
  }

  CulturalPractice._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    operationTechniqueReferences.addAll(
      xmlElement
          .findElements(Iso11783ElementType.operationTechniqueReference.xmlTag)
          .map(OperationTechniqueReference._fromXmlElement)
          .toList(),
    );
    _argumentValidator();
  }

  void _argumentValidator() {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.culturalPractice;

  /// Regular expression matching pattern for the [id] of [CulturalPractice]s.
  static const staticIdRefPattern = '(CPC|CPC-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of references to the available [OperationTechnique]s for this.
  late final operationTechniqueReferences =
      _XmlSyncedList<OperationTechniqueReference>(xmlElement: xmlElement);

  /// Unique identifier for this cultural practice.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Name of the cultural practice, description or comment.
  String get designator => parseString('B');
  set designator(String value) => setString('B', value);
}
