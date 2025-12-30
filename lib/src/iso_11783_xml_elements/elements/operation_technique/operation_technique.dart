// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes operation techniques like `drilling`, `plowing`,
/// `harvesting`.
class OperationTechnique extends Iso11783Element {
  /// Default factory for creating a [OperationTechnique] with verified
  /// arguments.
  factory OperationTechnique({
    required String id,
    required String designator,
  }) {
    _argumentValidator(id: id, designator: designator);

    return OperationTechnique._(
      id: id,
      designator: designator,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  OperationTechnique._({
    required String id,
    required String designator,
  }) : super._(elementType: _elementType) {
    this.id = id;
    this.designator = designator;
  }

  OperationTechnique._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    _argumentValidator(id: id, designator: designator);
  }

  static void _argumentValidator({
    required String id,
    required String designator,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
      idName: 'OperationTechnique.id',
      designatorName: 'OperationTechnique.designator',
    );
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.operationTechnique;

  /// Regular expression matching pattern for the [id] of [OperationTechnique]s.
  static const staticIdRefPattern = '(OTQ|OTQ-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this operation technique.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Name of the operation technique, description or comment.
  String get designator => parseString('B');
  set designator(String value) => setString('B', value);
}
