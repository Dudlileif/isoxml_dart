// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

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
    required this.id,
    required this.designator,
    required this.scope,
    List<CodedCommentListValue>? listValues,
    this.groupIdRef,
  }) : super(
         elementType: Iso11783ElementType.codedComment,
         description: 'CodedComment',
       ) {
    if (listValues != null) {
      this.listValues.addAll(listValues);
    }
  }

  /// Creates a [CodedComment] from [element].
  factory CodedComment.fromXmlElement(XmlElement element) {
    final listValues = element.getElements('CCL');
    final id = element.getAttribute('A')!;
    final designator = element.getAttribute('B')!;
    final scope = element.getAttribute('C')!;
    final groupIdRef = element.getAttribute('D');
    return CodedComment(
      listValues: listValues
          ?.map(CodedCommentListValue.fromXmlElement)
          .toList(),
      id: id,
      designator: designator,
      scope: $CodedCommmentScopeEnumMap.entries
          .singleWhere(
            (codedCommmentScopeEnumMapEntry) =>
                codedCommmentScopeEnumMapEntry.value == scope,
            orElse: () => throw ArgumentError(
              '''`$scope` is not one of the supported values: ${$CodedCommmentScopeEnumMap.values.join(', ')}''',
            ),
          )
          .key,
      groupIdRef: groupIdRef,
    );
  }

  /// Regular expression matching pattern for the [id] of [CodedComment]s.
  static const String staticIdRefPattern = '(CCT|CCT-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// List of [CodedCommentListValue]s for this comment.
  @annotation.XmlElement(name: 'CCL')
  final List<CodedCommentListValue> listValues = [];

  /// Unique identifier for this comment.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  /// Where this comment should be used/applies.
  @annotation.XmlAttribute(name: 'C')
  CodedCommmentScope scope;

  /// A reference to a [CodedCommentGroup] that this comment is a part of.
  @annotation.XmlAttribute(name: 'D')
  String? groupIdRef;

  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
    ...[
      for (final a in listValues.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
  ];

  /// The list of properties that will be used to determine whether
  /// two instances are equal.
  List<Object?> get props => [
    listValues,
    id,
    designator,
    scope,
    groupIdRef,
  ];

  /// Returns a string for [props].
  @override
  String toString() => mapPropsToString(runtimeType, props);
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
  continuous(3, 'Contiuous');

  const CodedCommmentScope(this.value, this.description);

  /// The XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
