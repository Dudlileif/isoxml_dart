// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that relates a single [Product] with a [quantityValue] in a
/// mixed product definition.
class ProductRelation extends Iso11783Element {
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
  ProductRelation._({
    required String productIdRef,
    required int quantityValue,
  }) : super(elementType: _elementType) {
    this.productIdRef = productIdRef;
    this.quantityValue = quantityValue;
  }

  ProductRelation._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    _argumentValidator();
  }

  void _argumentValidator() {
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
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.productRelation;

  /// Reference to a [Product].
  String get productIdRef => parseString('A');
  set productIdRef(String value) => setString('A', value);

  /// A quantity value, in ml, of the [Product] referenced by [productIdRef].
  int get quantityValue => parseInt('B');
  set quantityValue(int value) => setInt('B', value);
}
