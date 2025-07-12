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
@CopyWith()
@annotation.XmlRootElement(name: 'PDT')
@annotation.XmlSerializable(createMixin: true)
class Product extends Iso11783Element
    with _$ProductXmlSerializableMixin, EquatableMixin {
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
    required this.id,
    required this.designator,
    List<ProductRelation>? relations,
    this.groupIdRef,
    this.valuePresentationIdRef,
    this.quantityDDI,
    this.type,
    this.mixtureRecipeQuantity,
    this.densityMassPerVolume,
    this.densityMassPerCount,
    this.densityVolumePerCount,
  }) : super(
         elementType: Iso11783ElementType.product,
         description: 'Product',
       ) {
    if (relations != null) {
      this.relations.addAll(relations);
    }
  }

  /// Creates a [Product] from [element].
  factory Product.fromXmlElement(XmlElement element) {
    final relations = element.getElements('PRN');
    final id = element.getAttribute('A')!;
    final designator = element.getAttribute('B')!;
    final groupIdRef = element.getAttribute('C');
    final valuePresentationIdRef = element.getAttribute('D');
    final quantityDDI = element.getAttribute('E');
    final type = element.getAttribute('F');
    final mixtureRecipeQuantity = element.getAttribute('G');
    final densityMassPerVolume = element.getAttribute('H');
    final densityMassPerCount = element.getAttribute('I');
    final densityVolumePerCount = element.getAttribute('J');
    return Product(
      relations: relations?.map(ProductRelation.fromXmlElement).toList(),
      id: id,
      designator: designator,
      groupIdRef: groupIdRef,
      valuePresentationIdRef: valuePresentationIdRef,
      quantityDDI: quantityDDI,
      type: type != null
          ? $ProductTypeEnumMap.entries
                .singleWhere(
                  (productTypeEnumMapEntry) =>
                      productTypeEnumMapEntry.value == type,
                  orElse: () => throw ArgumentError(
                    '''`$type` is not one of the supported values: ${$ProductTypeEnumMap.values.join(', ')}''',
                  ),
                )
                .key
          : null,
      mixtureRecipeQuantity: mixtureRecipeQuantity != null
          ? int.parse(mixtureRecipeQuantity)
          : null,
      densityMassPerVolume: densityMassPerVolume != null
          ? int.parse(densityMassPerVolume)
          : null,
      densityMassPerCount: densityMassPerCount != null
          ? int.parse(densityMassPerCount)
          : null,
      densityVolumePerCount: densityVolumePerCount != null
          ? int.parse(densityVolumePerCount)
          : null,
    );
  }

  /// Regular expression matching pattern for the [id] of [Product]s.
  static const staticIdRefPattern = '(PDT|PDT-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of [ProductRelation]s to other [Product]s that are used in this
  /// mixture, if there are any.
  @annotation.XmlElement(name: 'PRN')
  final List<ProductRelation> relations = [];

  /// Unique identifier for this product.
  ///
  /// Records generated on MICS have negative IDs.
  @override
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
  /// in the ISO 11783-11 database.
  @annotation.XmlAttribute(name: 'E')
  final String? quantityDDI;

  /// Which type of [Product] this is.
  @annotation.XmlAttribute(name: 'F')
  final ProductType? type;

  /// Quantity of this mixture, in ml (milliliters).
  @annotation.XmlAttribute(name: 'G')
  final int? mixtureRecipeQuantity;

  /// Density mass per volume, in mg/l.
  ///
  /// Corresponds to DDI 121 in the ISO 11783-11 database.
  @annotation.XmlAttribute(name: 'H')
  final int? densityMassPerVolume;

  /// Density mass per count, in mg/1000 (1000 seed mass).
  ///
  /// Corresponds to DDI 122 in the ISO 11783-11 database.
  @annotation.XmlAttribute(name: 'I')
  final int? densityMassPerCount;

  /// Density volume per count, in ml/1000 (volume per quantity unit).
  ///
  /// Corresponds to DDI 123 in the ISO 11783-11 database.
  @annotation.XmlAttribute(name: 'J')
  final int? densityVolumePerCount;

  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
    for (final a in relations.map((e) => e.selfWithRecursiveChildren)) ...a,
  ];

  @override
  List<Object?> get props => [
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
  ];
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
  temporaryMixture(3, 'TemporaryMixture');

  const ProductType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
