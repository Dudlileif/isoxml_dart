// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that describes a single product. A [Product] can be related to a
/// [ProductGroup].
///
/// To determine which products
/// belong to a specific [ProductGroup], the [groupIdRef] values of all products
/// shall be examined for a match with a particular [ProductGroup.id] value.
/// Products refer both to products being used in a task (i.e. crop protection
/// chemicals) and products being produced by a task (agricultural products).
///
// TODO(dudlileif): Needs better documentation (ProductRelation).
@CopyWith()
@annotation.XmlRootElement(name: 'PDT')
@annotation.XmlSerializable(createMixin: true)
class Product extends Iso11783Element with _$ProductXmlSerializableMixin {
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
      idRefPattern: idRefPattern,
      designator: designator,
    );
    if (groupIdRef != null) {
      ArgumentValidation.checkId(
        id: groupIdRef,
        idRefPattern: ProductGroup.idRefPattern,
        idName: 'groupIdRef',
      );
    }
    if (valuePresentationIdRef != null) {
      ArgumentValidation.checkId(
        id: valuePresentationIdRef,
        idRefPattern: ValuePresentation.idRefPattern,
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
  const Product._({
    required this.id,
    required this.designator,
    this.relations,
    this.groupIdRef,
    this.valuePresentationIdRef,
    this.quantityDDI,
    this.type,
    this.mixtureRecipeQuantity,
    this.densityMassPerVolume,
    this.densityMassPerCount,
    this.densityVolumePerCount,
  }) : super(tag: Iso11783Tag.product, description: 'Product');

  /// Creates a [Product] from [element].
  factory Product.fromXmlElement(XmlElement element) =>
      _$ProductFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [Product]s.
  static const idRefPattern = '(PDT|PDT-)([0-9])+';

  /// A list of [ProductRelation]s to other [Product]s.
  @annotation.XmlElement(name: 'PRN')
  final List<ProductRelation>? relations;

  /// Unique identifier for this product.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the product, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  /// Reference to a [ProductGroup].
  @annotation.XmlAttribute(name: 'C')
  final String? groupIdRef;

  /// Reference to a [ValuePresentation].
  @annotation.XmlAttribute(name: 'D')
  final String? valuePresentationIdRef;

  /// A unique Data Dictionary Identifier which identifies a
  /// [ProcessDataVariable].
  ///
  /// The [ProcessDataVariable] is found as a Device Dictionary Entity (DDE)
  /// in theISO 11783-11 online database.
  @annotation.XmlAttribute(name: 'E')
  final String? quantityDDI;

  /// Which type of [Product] this is.
  @annotation.XmlAttribute(name: 'F')
  final ProductType? type;

  /// Quantity of this in a mixture.
  ///
  // TODO(dudlileif): Unknown unit.
  @annotation.XmlAttribute(name: 'G')
  final int? mixtureRecipeQuantity;

  /// Density mass per volume.
  ///
  // TODO(dudlileif): Unknown unit.
  @annotation.XmlAttribute(name: 'H')
  final int? densityMassPerVolume;

  /// Density mass per count.
  ///
  // TODO(dudlileif): Unknown unit.
  @annotation.XmlAttribute(name: 'I')
  final int? densityMassPerCount;

  /// Density volume per count.
  ///
  // TODO(dudlileif): Unknown unit.
  @annotation.XmlAttribute(name: 'J')
  final int? densityVolumePerCount;

  @override
  List<Object?> get props => super.props
    ..addAll([
      relations,
      id,
      designator,
      groupIdRef,
      valuePresentationIdRef,
      quantityDDI,
      type,
      mixtureRecipeQuantity,
      densityMassPerVolume,
      densityMassPerCount,
      densityVolumePerCount,
    ]);
}

/// An enumerator for whether a [Product] is singular or in a mixture.
@annotation.XmlEnum()
enum ProductType {
  /// A single [Product].
  @annotation.XmlValue('1')
  single(1, 'Single (default)'),

  /// A mixture of several [Product]s.
  @annotation.XmlValue('2')
  mixture(2, 'Mixture'),

  /// A temporary mixture of several [Product]s.
  @annotation.XmlValue('3')
  temporaryMixture(2, 'TemporaryMixture');

  const ProductType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An element that specifies the allocation of a single [Product] to a [Task].
///
/// A [ProductAllocation] is optionally related to a [DeviceElement]. This is to
///  be able to track the assignment of a single [Product] or of a number of
/// different [Product]s to a bin or to another type of [DeviceElement].
/// The transferred amount can optionally be specified by a combination of the
/// attributes [quantityDDI] and [quantityValue].
@CopyWith()
@annotation.XmlRootElement(name: 'PAN')
@annotation.XmlSerializable(createMixin: true)
class ProductAllocation extends Iso11783Element
    with _$ProductAllocationXmlSerializableMixin {
  /// Default factory for creating a [ProductAllocation] with verified
  /// arguments.
  factory ProductAllocation({
    required String productIdRef,
    String? quantityDDI,
    int? quantityValue,
    TransferMode? transferMode,
    String? deviceElementIdRef,
    String? valuePresentationIdRef,
    String? productSubTypeIdRef,
    AllocationStamp? allocationStamp,
  }) {
    ArgumentValidation.checkId(
      id: productIdRef,
      idRefPattern: Product.idRefPattern,
      idName: 'productIdRef',
    );
    if (quantityDDI != null) {
      ArgumentValidation.checkHexStringLength(
        quantityDDI,
        name: 'quantityDDI',
      );
    }
    if (deviceElementIdRef != null) {
      ArgumentValidation.checkId(
        id: deviceElementIdRef,
        idRefPattern: DeviceElement.idRefPattern,
        idName: 'deviceElementIdRef',
      );
    }
    if (valuePresentationIdRef != null) {
      ArgumentValidation.checkId(
        id: valuePresentationIdRef,
        idRefPattern: ValuePresentation.idRefPattern,
        idName: 'valuePresentationIdRef',
      );
    }
    if (productSubTypeIdRef != null) {
      ArgumentValidation.checkId(
        id: productSubTypeIdRef,
        idRefPattern: Product.idRefPattern,
        idName: 'productSubTypeIdRef',
      );
    }

    return ProductAllocation._(
      productIdRef: productIdRef,
      quantityDDI: quantityDDI,
      quantityValue: quantityValue,
      transferMode: transferMode,
      deviceElementIdRef: deviceElementIdRef,
      valuePresentationIdRef: valuePresentationIdRef,
      productSubTypeIdRef: productSubTypeIdRef,
      allocationStamp: allocationStamp,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const ProductAllocation._({
    required this.productIdRef,
    this.quantityDDI,
    this.quantityValue,
    this.transferMode,
    this.deviceElementIdRef,
    this.valuePresentationIdRef,
    this.productSubTypeIdRef,
    this.allocationStamp,
  }) : super(
          tag: Iso11783Tag.productAllocation,
          description: 'ProductAllocation',
        );

  /// Creates a [ProductAllocation] from [element].
  factory ProductAllocation.fromXmlElement(XmlElement element) =>
      _$ProductAllocationFromXmlElement(element);

  /// [AllocationStamp] for the position and time of this allocation.
  @annotation.XmlElement(name: 'ASP', includeIfNull: false)
  final AllocationStamp? allocationStamp;

  /// Reference to a [Product].
  @annotation.XmlAttribute(name: 'A')
  final String productIdRef;

  /// A unique Data Dictionary Identifier which identifies a
  /// [ProcessDataVariable].
  ///
  /// The [ProcessDataVariable] is found as a Device Dictionary Entity (DDE)
  /// in theISO 11783-11 online database.
  @annotation.XmlAttribute(name: 'B')
  final String? quantityDDI;

  /// Value for the quantity of the [Product].
  @annotation.XmlAttribute(name: 'C')
  final int? quantityValue;

  /// Which kind of transfer this allocation is performing.
  @annotation.XmlAttribute(name: 'D')
  final TransferMode? transferMode;

  /// Reference to a [DeviceElement].
  @annotation.XmlAttribute(name: 'E')
  final String? deviceElementIdRef;

  /// Reference to a [ValuePresentation].
  @annotation.XmlAttribute(name: 'F')
  final String? valuePresentationIdRef;

  /// Reference to a sub type of[Product].
  @annotation.XmlAttribute(name: 'G')
  final String? productSubTypeIdRef;

  @override
  List<Object?> get props => super.props
    ..addAll([
      allocationStamp,
      productIdRef,
      quantityDDI,
      quantityValue,
      transferMode,
      deviceElementIdRef,
      valuePresentationIdRef,
      productSubTypeIdRef,
    ]);
}

/// An enumerator for which kind of transfer the [ProductAllocation] is
/// performing.
@annotation.XmlEnum()
enum TransferMode {
  /// Filling
  @annotation.XmlValue('1')
  filling(1, 'Filling'),

  /// Emptying
  @annotation.XmlValue('2')
  emptying(2, 'Emptying'),

  /// Remainder
  @annotation.XmlValue('3')
  remainder(3, 'Remainder'),
  ;

  const TransferMode(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An element that  is used to group [Product]s.
///
/// To determine which [Product]s belong to a specific [ProductGroup], the
/// [Product.groupIdRef] values of all [Product]s shall be examined for a match
/// with a particular [id] value.
@CopyWith()
@annotation.XmlRootElement(name: 'PGP')
@annotation.XmlSerializable(createMixin: true)
class ProductGroup extends Iso11783Element
    with _$ProductGroupXmlSerializableMixin {
  /// Default factory for creating a [ProductGroup] with verified
  /// arguments.
  factory ProductGroup({
    required String id,
    required String designator,
    ProductGroupType? type,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: idRefPattern,
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
  const ProductGroup._({
    required this.id,
    required this.designator,
    this.type,
  }) : super(tag: Iso11783Tag.productGroup, description: 'ProductGroup');

  /// Creates a [ProductGroup] from [element].
  factory ProductGroup.fromXmlElement(XmlElement element) =>
      _$ProductGroupFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [ProductGroup]s.
  static const idRefPattern = '(PGP|PGP-)([0-9])+';

  /// Unique identifier for this product group.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the product group, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  /// Which type of product group this is.
  @annotation.XmlAttribute(name: 'C')
  final ProductGroupType? type;

  @override
  List<Object?> get props => super.props
    ..addAll([
      id,
      designator,
      type,
    ]);
}

/// An enumerator for which type a [ProductGroup] is.
@annotation.XmlEnum()
enum ProductGroupType {
  /// The default [ProductGroup] type.
  @annotation.XmlValue('1')
  productGroupDefault(1, 'ProductGroup (default)'),

  /// A [ProductGroup] type for [CropType]s only.
  @annotation.XmlValue('2')
  cropType(2, 'CropType');

  const ProductGroupType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An element that relates a [Product] with a [quantityValue].
///
// TODO(dudlileif): Needs better documentation.
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
      idRefPattern: Product.idRefPattern,
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
          tag: Iso11783Tag.productRelation,
          description: 'ProductRelation',
          onlyVersion4AndAbove: true,
        );

  /// Creates a [ProductRelation] from [element].
  factory ProductRelation.fromXmlElement(XmlElement element) =>
      _$ProductRelationFromXmlElement(element);

  /// Reference to a [Product].
  @annotation.XmlAttribute(name: 'A')
  final String productIdRef;

  /// A quantity value of the [Product] referenced by [productIdRef].
  @annotation.XmlAttribute(name: 'B')
  final int quantityValue;

  @override
  List<Object?> get props => super.props
    ..addAll([
      productIdRef,
      quantityValue,
    ]);
}
