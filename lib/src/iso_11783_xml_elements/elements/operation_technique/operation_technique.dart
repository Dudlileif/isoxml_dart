// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes operation techniques like `drilling`, `plowing`,
/// `harvesting`.
@CopyWith()
@annotation.XmlRootElement(name: 'OTQ')
@annotation.XmlSerializable(createMixin: true)
class OperationTechnique extends Iso11783Element
    with _$OperationTechniqueXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [OperationTechnique] with verified
  /// arguments.
  factory OperationTechnique({
    required String id,
    required String designator,
    List<XmlAttribute>? customAttributes,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );

    return OperationTechnique._(
      id: id,
      designator: designator,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const OperationTechnique._({
    required this.id,
    required this.designator,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.operationTechnique,
         description: 'OperationTechnique',
       );

  /// Creates a [OperationTechnique] from [element].
  factory OperationTechnique.fromXmlElement(XmlElement element) {
    final id = element.getAttribute('A')!;
    final designator = element.getAttribute('B')!;
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return OperationTechnique(
      id: id,
      designator: designator,
      customAttributes: customAttributes,
    );
  }

  /// Regular expression matching pattern for the [id] of [OperationTechnique]s.
  static const staticIdRefPattern = '(OTQ|OTQ-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this operation technique.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the operation technique, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$OperationTechniqueBuildXmlChildren(this, builder, namespaces: namespaces);
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
    final attributes = _$OperationTechniqueToXmlAttributes(
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
