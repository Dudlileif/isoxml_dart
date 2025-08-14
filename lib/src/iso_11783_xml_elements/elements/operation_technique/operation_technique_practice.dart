// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that provides an assignment of the combination of a specific
/// [OperationTechnique] with a single [CulturalPractice].
@CopyWith()
@annotation.XmlRootElement(name: 'OTP')
@annotation.XmlSerializable(createMixin: true)
class OperationTechniquePractice extends Iso11783Element
    with _$OperationTechniquePracticeXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [OperationTechniquePractice] with
  /// verified arguments.
  factory OperationTechniquePractice({
    required String culturalPracticeIdRef,
    String? operationTechniqueIdRef,
    List<XmlAttribute>? customAttributes,
  }) {
    ArgumentValidation.checkId(
      id: culturalPracticeIdRef,
      idRefPattern: CulturalPractice.staticIdRefPattern,
      idName: 'culturalPracticeIdRef',
    );
    if (operationTechniqueIdRef != null) {
      ArgumentValidation.checkId(
        id: operationTechniqueIdRef,
        idRefPattern: OperationTechnique.staticIdRefPattern,
        idName: 'operationTechniqueIdRef',
      );
    }
    return OperationTechniquePractice._(
      culturalPracticeIdRef: culturalPracticeIdRef,
      operationTechniqueIdRef: operationTechniqueIdRef,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const OperationTechniquePractice._({
    required this.culturalPracticeIdRef,
    this.operationTechniqueIdRef,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.operationTechniquePractice,
         description: 'OperationTechniquePractice',
       );

  /// Creates a [OperationTechniquePractice] from [element].
  factory OperationTechniquePractice.fromXmlElement(XmlElement element) {
    final culturalPracticeIdRef = element.getAttribute('A')!;
    final operationTechniqueIdRef = element.getAttribute('B');
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return OperationTechniquePractice(
      culturalPracticeIdRef: culturalPracticeIdRef,
      operationTechniqueIdRef: operationTechniqueIdRef,
      customAttributes: customAttributes,
    );
  }

  /// Reference to a [CulturalPractice].
  @annotation.XmlAttribute(name: 'A')
  final String culturalPracticeIdRef;

  /// Reference to a [OperationTechnique].
  @annotation.XmlAttribute(name: 'B')
  final String? operationTechniqueIdRef;

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$OperationTechniquePracticeBuildXmlChildren(
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
    final attributes = _$OperationTechniquePracticeToXmlAttributes(
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
    culturalPracticeIdRef,
    operationTechniqueIdRef,
  ];
}
