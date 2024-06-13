// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

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
  }) : super(tag: Iso11783XmlTag.productGroup, description: 'ProductGroup');

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
