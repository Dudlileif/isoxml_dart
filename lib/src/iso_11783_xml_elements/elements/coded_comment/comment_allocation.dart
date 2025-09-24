// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that allocates a [CodedComment] or a free comment text to a
/// [Task].
///
/// The allocation of comments is specified at a certain position and time by
/// including an [AllocationStamp].
///
/// The [CommentAllocation] can only assign either a [CodedComment] or the
/// [freeCommentText].

class CommentAllocation extends Iso11783Element with _AllocationStampMixin {
  /// Default factory for creating a [CommentAllocation] with verified
  /// arguments.
  ///
  /// Only one of [codedCommentIdRef] and [freeCommentText] can be set.
  ///
  /// If both [codedCommentIdRef] and [codedCommentListValueIdRef] are set,
  /// the [codedCommentListValueIdRef] mus be in the [CodedComment]'s
  /// listValues.
  factory CommentAllocation({
    AllocationStamp? allocationStamp,
    String? codedCommentIdRef,
    String? codedCommentListValueIdRef,
    String? freeCommentText,
  }) {
    if (codedCommentIdRef != null) {
      ArgumentValidation.checkId(
        id: codedCommentIdRef,
        idRefPattern: CodedComment.staticIdRefPattern,
        idName: 'codedCommentIdRef',
      );
      if (freeCommentText != null) {
        throw ArgumentError.value(
          [codedCommentIdRef, freeCommentText],
          '[codedCommentIdRef, freeCommentText]',
          'Only one of these can have a value set.',
        );
      }
    }
    if (codedCommentListValueIdRef != null) {
      ArgumentValidation.checkId(
        id: codedCommentListValueIdRef,
        idRefPattern: CodedCommentListValue.staticIdRefPattern,
        idName: 'codedCommentListValueIdRef',
      );
    }
    if (freeCommentText != null) {
      if (freeCommentText.length > 32) {
        throw ArgumentError.value(
          freeCommentText,
          'freeCommentText',
          'Too long: ${freeCommentText.length}, max: 32',
        );
      }
    }

    return CommentAllocation._(
      allocationStamp: allocationStamp,
      codedCommentIdRef: codedCommentIdRef,
      codedCommentListValueIdRef: codedCommentListValueIdRef,
      freeCommentText: freeCommentText,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  CommentAllocation._({
    AllocationStamp? allocationStamp,
    String? codedCommentIdRef,
    String? codedCommentListValueIdRef,
    String? freeCommentText,
  }) : super(
         elementType: Iso11783ElementType.commentAllocation,
         description: 'CommentAllocation',
       ) {
    this.allocationStamp = allocationStamp;
    this.codedCommentIdRef = codedCommentIdRef;
    this.codedCommentListValueIdRef = codedCommentListValueIdRef;
    this.freeCommentText = freeCommentText;
  }

  /// A reference to the id of the [CodedComment] we allocated.
  String? get codedCommentIdRef => tryParseString('A');
  set codedCommentIdRef(String? value) => setStringNullable('A', value);

  /// A reference to the id of the [CodedCommentListValue] we allocated.
  String? get codedCommentListValueIdRef => tryParseString('B');
  set codedCommentListValueIdRef(String? value) =>
      setStringNullable('B', value);

  /// A text comment specified by the operator.
  String? get freeCommentText => tryParseString('C');
  set freeCommentText(String? value) => setStringNullable('C', value);
}
