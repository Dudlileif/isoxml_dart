// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a single product. A [Product] can be related to a
/// [ProductGroup].
///
/// To determine which products
/// belong to a specific [ProductGroup], the [groupIdRef] values of all products
/// shall be examined for a match with a particular [ProductGroup.id] value.
/// Products refer both to products being used in a task (i.e. crop protection
/// chemicals) and products being produced by a task (agricultural products).
class Product extends Iso11783Element {
  /// Default factory for creating a [Product] with verified
  /// arguments.
  factory Product({
    required String id,
    required String designator,
    List<ProductRelation>? relations,
    String? groupIdRef,
    String? valuePresentationIdRef,
    String? quantityDDI,
    ProductType? type,
    int? mixtureRecipeQuantity,
    int? densityMassPerVolume,
    int? densityMassPerCount,
    int? densityVolumePerCount,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );
    if (groupIdRef != null) {
      ArgumentValidation.checkId(
        id: groupIdRef,
        idRefPattern: ProductGroup.staticIdRefPattern,
        idName: 'groupIdRef',
      );
    }
    if (valuePresentationIdRef != null) {
      ArgumentValidation.checkId(
        id: valuePresentationIdRef,
        idRefPattern: ValuePresentation.staticIdRefPattern,
        idName: 'valuePresentationIdRef',
      );
    }
    if (quantityDDI != null) {
      ArgumentValidation.checkHexStringLength(
        quantityDDI,
        name: 'quantityDDI',
      );
    }
    if (mixtureRecipeQuantity != null) {
      ArgumentValidation.checkValueInRange(
        value: mixtureRecipeQuantity,
        min: 0,
        max: 2147483647,
        name: 'mixtureRecipeQuantity',
      );
    }
    if (densityMassPerVolume != null) {
      ArgumentValidation.checkValueInRange(
        value: densityMassPerVolume,
        min: 0,
        max: 2147483647,
        name: 'densityMassPerVolume',
      );
    }
    if (densityMassPerCount != null) {
      ArgumentValidation.checkValueInRange(
        value: densityMassPerCount,
        min: 0,
        max: 2147483647,
        name: 'densityMassPerCount',
      );
    }
    if (densityVolumePerCount != null) {
      ArgumentValidation.checkValueInRange(
        value: densityVolumePerCount,
        min: 0,
        max: 2147483647,
        name: 'densityVolumePerCount',
      );
    }
    if (type == ProductType.single) {
      if (relations != null) {
        throw ArgumentError.value(
          relations,
          'relations',
          'should be null when type == ProductType.single',
        );
      }
    } else if (type != null) {
      if (relations == null) {
        throw ArgumentError.value(
          relations,
          'relations',
          'should not be null when type != ProductType.single',
        );
      }
    }

    return Product._(
      id: id,
      designator: designator,
      relations: relations,
      groupIdRef: groupIdRef,
      valuePresentationIdRef: valuePresentationIdRef,
      quantityDDI: quantityDDI,
      type: type,
      mixtureRecipeQuantity: mixtureRecipeQuantity,
      densityMassPerVolume: densityMassPerVolume,
      densityMassPerCount: densityMassPerCount,
      densityVolumePerCount: densityVolumePerCount,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  Product._({
    required String id,
    required String designator,
    List<ProductRelation>? relations,
    String? groupIdRef,
    String? valuePresentationIdRef,
    String? quantityDDI,
    ProductType? type,
    int? mixtureRecipeQuantity,
    int? densityMassPerVolume,
    int? densityMassPerCount,
    int? densityVolumePerCount,
  }) : super(
         elementType: Iso11783ElementType.product,
         description: 'Product',
       ) {
    this.id = id;
    this.designator = designator;
    this.groupIdRef = groupIdRef;
    this.valuePresentationIdRef = valuePresentationIdRef;
    this.quantityDDI = quantityDDI;
    this.type = type;
    this.mixtureRecipeQuantity = mixtureRecipeQuantity;
    this.densityMassPerVolume = densityMassPerVolume;
    this.densityMassPerCount = densityMassPerCount;
    this.densityVolumePerCount = densityVolumePerCount;
    if (relations != null) {
      children.addAll(relations);
    }
  }

  /// Regular expression matching pattern for the [id] of [Product]s.
  static const staticIdRefPattern = '(PDT|PDT-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of [ProductRelation]s to other [Product]s that are used in this
  /// mixture, if there are any.
  List<ProductRelation> get relations => findElements(
    Iso11783ElementType.productRelation.xmlTag,
  ).map((e) => e as ProductRelation).toList();

  /// Unique identifier for this product.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Name of the product, description or comment.
  String get designator => parseString('B');
  set designator(String value) => setString('B', value);

  /// Reference to a [ProductGroup].
  String? get groupIdRef => tryParseString('C');
  set groupIdRef(String? value) => setStringNullable('C', value);

  /// Reference to a [ValuePresentation].
  String? get valuePresentationIdRef => tryParseString('D');
  set valuePresentationIdRef(String? value) => setStringNullable('D', value);

  /// A unique Data Dictionary Identifier which identifies a
  /// [ProcessDataVariable].
  ///
  /// The [ProcessDataVariable] is found as a Device Dictionary Entity (DDE)
  /// in the ISO 11783-11 database.
  String? get quantityDDI => tryParseString('E');
  set quantityDDI(String? value) => setStringNullable('E', value);

  /// Which type of [Product] this is.
  ProductType? get type => switch (tryParseInt('F')) {
    final int value => ProductType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => throw ArgumentError(
        '''`$value` is not one of the supported values: ${ProductType.values.join(', ')}''',
      ),
    ),
    _ => null,
  };
  set type(ProductType? value) => setIntNullable('F', value?.value);

  /// Quantity of this mixture, in ml (milliliters).
  int? get mixtureRecipeQuantity => tryParseInt('G');
  set mixtureRecipeQuantity(int? value) => setIntNullable('G', value);

  /// Density mass per volume, in mg/l.
  ///
  /// Corresponds to DDI 121 in the ISO 11783-11 database.
  int? get densityMassPerVolume => tryParseInt('H');
  set densityMassPerVolume(int? value) => setIntNullable('H', value);

  /// Density mass per count, in mg/1000 (1000 seed mass).
  ///
  /// Corresponds to DDI 122 in the ISO 11783-11 database.
  int? get densityMassPerCount => tryParseInt('I');
  set densityMassPerCount(int? value) => setIntNullable('I', value);

  /// Density volume per count, in ml/1000 (volume per quantity unit).
  ///
  /// Corresponds to DDI 123 in the ISO 11783-11 database.
  int? get densityVolumePerCount => tryParseInt('J');
  set densityVolumePerCount(int? value) => setIntNullable('J', value);
}

/// An enumerator for whether a [Product] is singular or in a mixture.
enum ProductType {
  /// A single [Product].
  single(1, 'Single (default)'),

  /// A mixture of several [Product]s.
  mixture(2, 'Mixture'),

  /// A temporary mixture of several [Product]s.
  temporaryMixture(3, 'TemporaryMixture');

  const ProductType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
