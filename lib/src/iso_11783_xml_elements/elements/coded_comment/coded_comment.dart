// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes predefined comments that can be used to annotate
/// [Task]s.
///
/// The comments can be grouped in [CodedCommentGroup] by establishing a
/// reference to that group with [groupIdRef].

class CodedComment extends Iso11783Element {
  /// Default factory for creating a [CodedComment] with verified arguments.
  factory CodedComment({
    required String id,
    required String designator,
    required CodedCommentScope scope,
    List<CodedCommentListValue>? listValues,
    String? groupIdRef,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );

    if (groupIdRef != null) {
      ArgumentValidation.checkId(
        id: groupIdRef,
        idRefPattern: CodedCommentGroup.staticIdRefPattern,
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
  CodedComment._({
    required String id,
    required String designator,
    required CodedCommentScope scope,
    List<CodedCommentListValue>? listValues,
    String? groupIdRef,
  }) : super(
         elementType: Iso11783ElementType.codedComment,
         description: 'CodedComment',
       ) {
    this.id = id;
    this.designator = designator;
    this.scope = scope;
    this.groupIdRef = groupIdRef;
    if (listValues != null) {
      children.addAll(listValues);
    }
  }

  /// Regular expression matching pattern for the [id] of [CodedComment]s.
  static const String staticIdRefPattern = '(CCT|CCT-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// List of [CodedCommentListValue]s for this comment.
  List<CodedCommentListValue> get listValues => findElements(
    Iso11783ElementType.codedCommentListValue.xmlTag,
  ).map((e) => e as CodedCommentListValue).toList();

  /// Unique identifier for this comment.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Description or comment.
  String get designator => parseString('B');
  set designator(String value) => setString('B', value);

  /// Where this comment should be used/applies.
  CodedCommentScope get scope => CodedCommentScope.values.firstWhere(
    (type) => type.value == parseInt('C'),
    orElse: () => throw ArgumentError(
      '''`${getAttribute('C')}` is not one of the supported values: ${CodedCommentScope.values.join(', ')}''',
    ),
  );
  set scope(CodedCommentScope value) => setInt('C', value.value);

  /// A reference to a [CodedCommentGroup] that this comment is a part of.
  String? get groupIdRef => tryParseString('D');
  set groupIdRef(String? value) => setStringNullable('D', value);
}

/// An enumerator for declaring the scope of a [CodedComment].
enum CodedCommentScope {
  /// Applies only on a specific point.
  point(1, 'Point'),

  /// Applies globally.
  global(2, 'Global'),

  /// Applies continuously.
  continuous(3, 'Contiuous');

  const CodedCommentScope(this.value, this.description);

  /// The XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
