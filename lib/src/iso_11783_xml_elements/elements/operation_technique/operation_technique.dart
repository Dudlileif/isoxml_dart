// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

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
          tag: Iso11783XmlTag.operationTechnique,
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
