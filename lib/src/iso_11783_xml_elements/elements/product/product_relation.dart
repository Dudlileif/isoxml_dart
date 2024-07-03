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
    with _$ProductRelationXmlSerializableMixin {
  /// Default factory for creating a [ProductRelation] with verified
  /// arguments.
  factory ProductRelation({
    required String productIdRef,
    required int quantityValue,
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
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const ProductRelation._({
    required this.productIdRef,
    required this.quantityValue,
  }) : super(
          elementType: Iso11783ElementType.productRelation,
          description: 'ProductRelation',
          onlyVersion4AndAbove: true,
        );

  /// Creates a [ProductRelation] from [element].
  factory ProductRelation.fromXmlElement(XmlElement element) =>
      _$ProductRelationFromXmlElement(element);

  /// Reference to a [Product].
  @annotation.XmlAttribute(name: 'A')
  final String productIdRef;

  /// A quantity value, in ml, of the [Product] referenced by [productIdRef].
  @annotation.XmlAttribute(name: 'B')
  final int quantityValue;

  @override
  List<Object?> get props => super.props
    ..addAll([
      productIdRef,
      quantityValue,
    ]);
}
