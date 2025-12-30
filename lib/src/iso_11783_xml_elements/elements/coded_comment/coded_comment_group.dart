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

class CodedCommentGroup extends Iso11783Element {
  /// Default factory for creating a [CodedCommentGroup] with verified
  /// arguments.
  factory CodedCommentGroup({
    required String id,
    required String designator,
  }) {
    _argumentValidator(id: id, designator: designator);

    return CodedCommentGroup._(
      id: id,
      designator: designator,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  CodedCommentGroup._({
    required String id,
    required String designator,
  }) : super._(elementType: _elementType) {
    this.id = id;
    this.designator = designator;
  }

  CodedCommentGroup._fromXmlElement(XmlElement element)
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
      idName: 'CodedCommentGroup.id',
      designatorName: 'CodedCommentDesignator.designator',
    );
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.codedCommentGroup;

  /// Regular expression matching pattern for the [id] of
  /// [CodedCommentGroup]s.
  static const String staticIdRefPattern = '(CCG|CCG-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this comment group.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Name or description.
  String get designator => parseString('B');
  set designator(String value) => setString('B', value);
}
