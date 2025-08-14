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
    List<XmlAttribute>? customAttributes,
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
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  CommentAllocation._({
    this.allocationStamp,
    this.codedCommentIdRef,
    this.codedCommentListValueIdRef,
    this.freeCommentText,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.commentAllocation,
         description: 'CommentAllocation',
       );

  /// Creates a [CommentAllocation] from [element].
  factory CommentAllocation.fromXmlElement(XmlElement element) {
    final allocationStamp = element.getElement('ASP');
    final codedCommentIdRef = element.getAttribute('A');
    final codedCommentListValueIdRef = element.getAttribute('B');
    final freeCommentText = element.getAttribute('C');
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return CommentAllocation(
      allocationStamp: allocationStamp != null
          ? AllocationStamp.fromXmlElement(allocationStamp)
          : null,
      codedCommentIdRef: codedCommentIdRef,
      codedCommentListValueIdRef: codedCommentListValueIdRef,
      freeCommentText: freeCommentText,
      customAttributes: customAttributes,
    );
  }

  /// [AllocationStamp] for specifying the position and time of this allocation.
  @annotation.XmlElement(name: 'ASP', includeIfNull: false)
  AllocationStamp? allocationStamp;

  /// A reference to the id of the [CodedComment] we allocated.
  @annotation.XmlAttribute(name: 'A')
  String? codedCommentIdRef;

  /// A reference to the id of the [CodedCommentListValue] we allocated.
  @annotation.XmlAttribute(name: 'B')
  String? codedCommentListValueIdRef;

  /// A text comment specified by the operator.
  @annotation.XmlAttribute(name: 'C')
  String? freeCommentText;

  @override
  Iterable<Iso11783Element>? get recursiveChildren =>
      allocationStamp?.selfWithRecursiveChildren;

  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$CommentAllocationBuildXmlChildren(
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
    final attributes = _$CommentAllocationToXmlAttributes(
      this,
      namespaces: namespaces,
    );
    if (customAttributes != null) {
      attributes.addAll(customAttributes!);
    }
    return attributes;
  }

  /// The list of properties that will be used to determine whether
  /// two instances are equal.
  List<Object?> get props => [
    allocationStamp,
    codedCommentIdRef,
    codedCommentListValueIdRef,
    freeCommentText,
  ];

  /// Returns a string for [props].
  @override
  String toString() => mapPropsToString(runtimeType, props);
}
