// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that can be used to combine predefined [CodedComment]s into
/// groups.
///
/// The purpose is to have a better navigation and selection of [CodedComment]s
/// on the mobile system. Each [CodedComment] can only belong to a single
/// group. The comments are attached to the group by adding the group's [id]
/// as their [CodedComment.groupIdRef].
@CopyWith()
@annotation.XmlRootElement(name: 'CCG')
@annotation.XmlSerializable(createMixin: true)
class CodedCommentGroup extends Iso11783Element
    with _$CodedCommentGroupXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [CodedCommentGroup] with verified
  /// arguments.
  factory CodedCommentGroup({
    required String id,
    required String designator,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );

    return CodedCommentGroup._(
      id: id,
      designator: designator,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const CodedCommentGroup._({
    required this.id,
    required this.designator,
  }) : super(
          elementType: Iso11783ElementType.codedCommentGroup,
          description: 'CodedCommentGroup',
        );

  /// Creates a [CodedCommentGroup] from [element].
  factory CodedCommentGroup.fromXmlElement(XmlElement element) =>
      _$CodedCommentGroupFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of
  /// [CodedCommentGroup]s.
  static const String staticIdRefPattern = '(CCG|CCG-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this comment group.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name or description.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  @override
  List<Object?> get props => [
        id,
        designator,
      ];
}
