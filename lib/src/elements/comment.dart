// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that describes predefined comments that can be used to annotate
/// [Task]s.
///
/// The comments can be grouped in [CodedCommentGroup] by establishing a
/// reference to that group with [groupIdRef].
@CopyWith()
@annotation.XmlRootElement(name: 'CCT')
@annotation.XmlSerializable(createMixin: true)
class CodedComment extends Iso11783Element
    with _$CodedCommentXmlSerializableMixin {
  /// Default factory for creating a [CodedComment] with verified arguments.
  factory CodedComment({
    required String id,
    required String designator,
    required CodedCommmentScope scope,
    List<CodedCommentListValue>? listValues,
    String? groupIdRef,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: idRefPattern,
      designator: designator,
    );

    if (groupIdRef != null) {
      ArgumentValidation.checkId(
        id: groupIdRef,
        idRefPattern: CodedCommentGroup.idRefPattern,
        idName: 'groupIdRef',
      );
    }
    return CodedComment._(
      id: id,
      designator: designator,
      scope: scope,
      listValues: listValues,
      groupIdRef: groupIdRef,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const CodedComment._({
    required this.id,
    required this.designator,
    required this.scope,
    this.listValues,
    this.groupIdRef,
  }) : super(tag: Iso11783Tag.codedComment, description: 'CodedComment');

  /// Creates a [CodedComment] from [element].
  factory CodedComment.fromXmlElement(XmlElement element) =>
      _$CodedCommentFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [CodedComment]s.
  static const String idRefPattern = '(CCT|CCT-)([0-9])+';

  /// List of [CodedCommentListValue]s for this comment.
  @annotation.XmlElement(name: 'CCL')
  final List<CodedCommentListValue>? listValues;

  /// Unique identifier for this comment.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  /// Where this comment should be used/applies.
  @annotation.XmlAttribute(name: 'C')
  final CodedCommmentScope scope;

  /// A reference to a [CodedCommentGroup] that this comment is a part of.
  @annotation.XmlAttribute(name: 'D')
  final String? groupIdRef;

  @override
  List<Object?> get props => super.props
    ..addAll([
      listValues,
      id,
      designator,
      scope,
      groupIdRef,
    ]);
}

/// An enumerator for declaring the scope of a [CodedComment].
@annotation.XmlEnum()
enum CodedCommmentScope {
  /// Applies only on a specific point.
  @annotation.XmlValue('1')
  point(1, 'Point'),

  /// Applies globally.
  @annotation.XmlValue('2')
  global(2, 'Global'),

  /// Applies continuously.
  @annotation.XmlValue('3')
  continuous(3, 'Contiuous'),
  ;

  const CodedCommmentScope(this.value, this.description);

  /// The XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

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
      idRefPattern: idRefPattern,
      designator: designator,
    );

    return CodedCommentListValue._(id: id, designator: designator);
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const CodedCommentListValue._({required this.id, required this.designator})
      : super(
          tag: Iso11783Tag.codedCommentListValue,
          description: 'CodedCommentListvalue',
        );

  /// Creates a [CodedCommentListValue] from [element].
  factory CodedCommentListValue.fromXmlElement(XmlElement element) =>
      _$CodedCommentListValueFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of
  /// [CodedCommentListValue]s.
  static const String idRefPattern = '(CCL|CCL-)([0-9])+';

  /// Unique identifier for this colour legend.
  ///
  /// Records generated on MICS have negative IDs.
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
    with _$CodedCommentGroupXmlSerializableMixin {
  /// Default factory for creating a [CodedCommentGroup] with verified
  /// arguments.
  factory CodedCommentGroup({
    required String id,
    required String designator,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: idRefPattern,
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
          tag: Iso11783Tag.codedCommentGroup,
          description: 'CodedCommentGroup',
        );

  /// Creates a [CodedCommentGroup] from [element].
  factory CodedCommentGroup.fromXmlElement(XmlElement element) =>
      _$CodedCommentGroupFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of
  /// [CodedCommentGroup]s.
  static const String idRefPattern = '(CCG|CCG-)([0-9])+';

  /// Unique identifier for this colour legend.
  ///
  /// Records generated on MICS have negative IDs.
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

/// An element that allocates a [CodedComment] or a free comment text to a
/// [Task].
///
/// The allocation of comments is specified at a certain position and time by
/// including an [AllocationStamp].
///
/// The [CommentAllocation] can only assign either a [CodedComment] or the
/// [freeCommentText].
@CopyWith()
@annotation.XmlRootElement(name: 'CAN')
@annotation.XmlSerializable(createMixin: true)
class CommentAllocation extends Iso11783Element
    with _$CommentAllocationXmlSerializableMixin {
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
        idRefPattern: CodedComment.idRefPattern,
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
        idRefPattern: CodedCommentListValue.idRefPattern,
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
  const CommentAllocation._({
    this.allocationStamp,
    this.codedCommentIdRef,
    this.codedCommentListValueIdRef,
    this.freeCommentText,
  }) : super(
          tag: Iso11783Tag.commentAllocation,
          description: 'CommentAllocation',
        );

  /// Creates a [CommentAllocation] from [element].
  factory CommentAllocation.fromXmlElement(XmlElement element) =>
      _$CommentAllocationFromXmlElement(element);

  /// [AllocationStamp] for specifying the position and time of this allocation.
  @annotation.XmlElement(name: 'ASP', includeIfNull: false)
  final AllocationStamp? allocationStamp;

  /// A reference to the id of the [CodedComment] we allocated.
  @annotation.XmlAttribute(name: 'A')
  final String? codedCommentIdRef;

  /// A reference to the id of the [CodedCommentListValue] we allocated.
  @annotation.XmlAttribute(name: 'B')
  final String? codedCommentListValueIdRef;

  /// A text comment specified by the operator.
  @annotation.XmlAttribute(name: 'C')
  final String? freeCommentText;

  @override
  List<Object?> get props => super.props
    ..addAll([
      allocationStamp,
      codedCommentIdRef,
      codedCommentListValueIdRef,
      freeCommentText,
    ]);
}
