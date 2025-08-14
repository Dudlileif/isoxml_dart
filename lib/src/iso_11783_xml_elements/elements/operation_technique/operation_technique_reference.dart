// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that contains a refernce to a single [OperationTechnique].
@CopyWith()
@annotation.XmlRootElement(name: 'OTR')
@annotation.XmlSerializable(createMixin: true)
class OperationTechniqueReference extends Iso11783Element
    with _$OperationTechniqueReferenceXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [OperationTechniqueReference] with
  /// verified arguments.
  factory OperationTechniqueReference({
    required String operationTechniqueIdRef,
    List<XmlAttribute>? customAttributes,
  }) {
    ArgumentValidation.checkId(
      id: operationTechniqueIdRef,
      idRefPattern: OperationTechnique.staticIdRefPattern,
      idName: 'operationTechniqueIdRef',
    );

    return OperationTechniqueReference._(
      operationTechniqueIdRef: operationTechniqueIdRef,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const OperationTechniqueReference._({
    required this.operationTechniqueIdRef,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.operationTechniqueReference,
         description: 'OperationTechniqueReference',
       );

  /// Creates a [OperationTechniqueReference] from [element].
  factory OperationTechniqueReference.fromXmlElement(XmlElement element) {
    final operationTechniqueIdRef = element.getAttribute('A')!;
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return OperationTechniqueReference(
      operationTechniqueIdRef: operationTechniqueIdRef,
      customAttributes: customAttributes,
    );
  }

  /// Reference to a [OperationTechnique].
  @annotation.XmlAttribute(name: 'A')
  final String operationTechniqueIdRef;

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$OperationTechniqueReferenceBuildXmlChildren(
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
    final attributes = _$OperationTechniqueReferenceToXmlAttributes(
      this,
      namespaces: namespaces,
    );
    if (customAttributes != null) {
      attributes.addAll(customAttributes!);
    }
    return attributes;
  }

  @override
  List<Object?> get props => [operationTechniqueIdRef];
}
