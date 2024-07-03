// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that links an [Iso11783Element] with an external object outside
/// the scope of ISO 11783.
///
/// The link value type is determined by the parent [LinkGroup.type], and the
/// full link value may be a concatenation with prefix [LinkGroup.namespace].
@CopyWith()
@annotation.XmlRootElement(name: 'LNK')
@annotation.XmlSerializable(createMixin: true)
class Link extends Iso11783Element with _$LinkXmlSerializableMixin {
  /// Default factory for creating a [Link] with verified
  /// arguments.
  factory Link({
    required String objectIdRef,
    required String value,
    String? designator,
  }) {
    ArgumentValidation.checkId(
      id: objectIdRef,
      idRefPattern: objectIdRefPattern,
      idName: 'objectIdRef',
    );
    ArgumentValidation.checkStringLength(value, maxLength: 255, name: 'value');
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }
    return Link._(
      objectIdRef: objectIdRef,
      value: value,
      designator: designator,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const Link._({
    required this.objectIdRef,
    required this.value,
    this.designator,
  }) : super(
          elementType: Iso11783ElementType.link,
          description: 'Link',
          onlyVersion4AndAbove: true,
        );

  /// Creates a [Link] from [element].
  factory Link.fromXmlElement(XmlElement element) =>
      _$LinkFromXmlElement(element);

  /// Regular expression matching pattern for the [objectIdRef].
  static const objectIdRefPattern =
      '''(AFE|BSN|CCT|CCG|CCL|CLD|CTP|CVT|CPC|CTR|DET|DVC|FRM|GGP|GPN|LSG|OTQ|PFD|PNT|PLN|PDT|PGP|TLG|TSK|VPN|WKR)(|-)([0-9])+''';

  /// Reference to another object ([Iso11783Element]).
  @annotation.XmlAttribute(name: 'A')
  final String objectIdRef;

  /// Identifier for the object.
  @annotation.XmlAttribute(name: 'B')
  final String value;

  /// Name of the link, description or comment.
  @annotation.XmlAttribute(name: 'C')
  final String? designator;

  @override
  List<Object?> get props => super.props
    ..addAll([
      objectIdRef,
      value,
      designator,
    ]);
}
