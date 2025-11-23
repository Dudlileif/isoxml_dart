// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that  is used to group [Product]s.
///
/// To determine which [Product]s belong to a specific [ProductGroup], the
/// [Product.groupIdRef] values of all [Product]s shall be examined for a match
/// with a particular [id] value.
class ProductGroup extends Iso11783Element {
  /// Default factory for creating a [ProductGroup] with verified
  /// arguments.
  factory ProductGroup({
    required String id,
    required String designator,
    ProductGroupType? type,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );

    return ProductGroup._(
      id: id,
      designator: designator,
      type: type,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  ProductGroup._({
    required String id,
    required String designator,
    ProductGroupType? type,
  }) : super(elementType: _elementType) {
    this.id = id;
    this.designator = designator;
    this.type = type;
  }

  ProductGroup._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    _argumentValidator();
  }

  void _argumentValidator() {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.productGroup;

  /// Regular expression matching pattern for the [id] of [ProductGroup]s.
  static const staticIdRefPattern = '(PGP|PGP-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this product group.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Name of the product group, description or comment.
  String get designator => parseString('B');
  set designator(String value) => setString('B', value);

  /// Which type of product group this is.
  ProductGroupType? get type => switch (tryParseInt('C')) {
    final int value => ProductGroupType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => throw ArgumentError(
        '''`$value` is not one of the supported values: ${ProductGroupType.values.join(', ')}''',
      ),
    ),
    _ => null,
  };
  set type(ProductGroupType? value) => setIntNullable('C', value?.value);
}

/// An enumerator for which type a [ProductGroup] is.
enum ProductGroupType {
  /// The default [ProductGroup] type.
  productGroupDefault(1, 'ProductGroup (default)'),

  /// A [ProductGroup] type for [CropType]s only.
  cropType(2, 'CropType');

  const ProductGroupType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
