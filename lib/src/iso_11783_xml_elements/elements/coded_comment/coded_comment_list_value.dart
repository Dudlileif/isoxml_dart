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

class CodedCommentListValue extends Iso11783Element {
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

    return CodedCommentListValue._(
      id: id,
      designator: designator,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  CodedCommentListValue._({
    required String id,
    required String designator,
  }) : super(
         elementType: Iso11783ElementType.codedCommentListValue,
         description: 'CodedCommentListvalue',
       ) {
    this.id = id;
    this.designator = designator;
  }

  /// Regular expression matching pattern for the [id] of
  /// [CodedCommentListValue]s.
  static const String staticIdRefPattern = '(CCL|CCL-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this comment list value.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Name or description.
  String get designator => parseString('B');
  set designator(String value) => setString('B', value);
}
