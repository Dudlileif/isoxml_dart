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
    with _$CodedCommentListValueXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [CodedCommentListValue] with verified
  /// arguments.
  factory CodedCommentListValue({
    required String id,
    required String designator,
    List<XmlAttribute>? customAttributes,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );

    return CodedCommentListValue._(
      id: id,
      designator: designator,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const CodedCommentListValue._({
    required this.id,
    required this.designator,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.codedCommentListValue,
         description: 'CodedCommentListvalue',
       );

  /// Creates a [CodedCommentListValue] from [element].
  factory CodedCommentListValue.fromXmlElement(XmlElement element) {
    final id = element.getAttribute('A')!;
    final designator = element.getAttribute('B')!;
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return CodedCommentListValue(
      id: id,
      designator: designator,
      customAttributes: customAttributes,
    );
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
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name or description.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$CodedCommentListValueBuildXmlChildren(
      this,
      builder,
      namespaces: namespaces,
    );
    if (customAttributes != null && customAttributes!.isNotEmpty) {
      for (final attribute in customAttributes!) {
        builder.attribute(attribute.name.local, attribute.value);
      }
    }
  }

  /// Returns a list of the XML attributes of this.
  @override
  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    final attributes = _$CodedCommentListValueToXmlAttributes(
      this,
      namespaces: namespaces,
    );
    if (customAttributes != null) {
      attributes.addAll(customAttributes!);
    }
    return attributes;
  }

  @override
  List<Object?> get props => [
    id,
    designator,
  ];
}
