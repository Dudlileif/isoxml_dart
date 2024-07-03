// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that provides a value to qualify a [CodedComment].
///
/// Each instance can only belong to a single [CodedComment]. One of the
/// [CodedCommentListValue]s in [CodedComment.listValues] can be referenced
/// in a [CommentAllocation] when a that [CodedComment] is assigned to a task.
///
/// Example values are "low", "medium" and "high" for crop growth stage codes.
@CopyWith()
@annotation.XmlRootElement(name: 'CCL')
@annotation.XmlSerializable(createMixin: true)
class CodedCommentListValue extends Iso11783Element
    with _$CodedCommentListValueXmlSerializableMixin {
  /// Default factory for creating a [CodedCommentListValue] with verified
  /// arguments.
  factory CodedCommentListValue({
    required String id,
    required String designator,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );

    return CodedCommentListValue._(id: id, designator: designator);
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const CodedCommentListValue._({required this.id, required this.designator})
      : super(
          elementType: Iso11783ElementType.codedCommentListValue,
          description: 'CodedCommentListvalue',
        );

  /// Creates a [CodedCommentListValue] from [element].
  factory CodedCommentListValue.fromXmlElement(XmlElement element) =>
      _$CodedCommentListValueFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of
  /// [CodedCommentListValue]s.
  static const String staticIdRefPattern = '(CCL|CCL-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this comment list value.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name or description.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  @override
  List<Object?> get props => super.props
    ..addAll([
      id,
      designator,
    ]);
}
