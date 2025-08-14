// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that relates a single [Product] with a [quantityValue] in a
/// mixed product definition.
@CopyWith()
@annotation.XmlRootElement(name: 'PRN')
@annotation.XmlSerializable(createMixin: true)
class ProductRelation extends Iso11783Element
    with _$ProductRelationXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [ProductRelation] with verified
  /// arguments.
  factory ProductRelation({
    required String productIdRef,
    required int quantityValue,
    List<XmlAttribute>? customAttributes,
  }) {
    ArgumentValidation.checkId(
      id: productIdRef,
      idRefPattern: Product.staticIdRefPattern,
      idName: 'productIdRef',
    );
    ArgumentValidation.checkValueInRange(
      value: quantityValue,
      min: 0,
      max: 2147483647,
      name: 'quantityValue',
    );

    return ProductRelation._(
      productIdRef: productIdRef,
      quantityValue: quantityValue,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const ProductRelation._({
    required this.productIdRef,
    required this.quantityValue,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.productRelation,
         description: 'ProductRelation',
         onlyVersion4AndAbove: true,
       );

  /// Creates a [ProductRelation] from [element].
  factory ProductRelation.fromXmlElement(XmlElement element) {
    final productIdRef = element.getAttribute('A')!;
    final quantityValue = element.getAttribute('B')!;
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return ProductRelation(
      productIdRef: productIdRef,
      quantityValue: int.parse(quantityValue),
      customAttributes: customAttributes,
    );
  }

  /// Reference to a [Product].
  @annotation.XmlAttribute(name: 'A')
  final String productIdRef;

  /// A quantity value, in ml, of the [Product] referenced by [productIdRef].
  @annotation.XmlAttribute(name: 'B')
  final int quantityValue;

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$ProductRelationBuildXmlChildren(this, builder, namespaces: namespaces);
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
    final attributes = _$ProductRelationToXmlAttributes(
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
    productIdRef,
    quantityValue,
  ];
}
