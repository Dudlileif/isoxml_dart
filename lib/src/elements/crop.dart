// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that describes a crop that can be cultivated on a [Partfield].
/// Several [CropVariety] elements can be included.
@CopyWith()
@annotation.XmlRootElement(name: 'CTP')
@annotation.XmlSerializable(createMixin: true)
class CropType extends Iso11783Element with _$CropTypeXmlSerializableMixin {
  /// Default factory for creating a [CropType] with verified
  /// arguments.
  factory CropType({
    required String id,
    required String designator,
    List<CropVariety>? varieties,
    String? productGroupIdRef,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: idRefPattern,
      designator: designator,
    );

    if (productGroupIdRef != null) {
      ArgumentValidation.checkId(
        id: productGroupIdRef,
        idRefPattern: ProductGroup.idRefPattern,
        idName: 'productGroupIdRef',
      );
    }

    return CropType._(
      id: id,
      designator: designator,
      varieties: varieties,
      productGroupIdRef: productGroupIdRef,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const CropType._({
    required this.id,
    required this.designator,
    this.varieties,
    this.productGroupIdRef,
  }) : super(tag: Iso11783Tag.cropType, description: 'CropType');

  /// Creates a [CropType] from [element].
  factory CropType.fromXmlElement(XmlElement element) =>
      _$CropTypeFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [CropType]s.
  static const idRefPattern = '(CTP|CTP-)([0-9])+';

  /// A list of different varieties of this crop.
  @annotation.XmlElement(name: 'CVT')
  final List<CropVariety>? varieties;

  /// Unique identifier for this crop type.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the crop type, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  /// Reference to a [ProductGroup] that this is a part of.
  @annotation.XmlAttribute(name: 'C')
  final String? productGroupIdRef;

  @override
  List<Object?> get props => super.props
    ..addAll([
      varieties,
      id,
      designator,
      productGroupIdRef,
    ]);
}

/// An element that describes varieties of a crop specified by [CropType] that
/// can be cultivated on a [Partfield].
///
/// Each [CropVariety] belongs to a single [CropType] definition.
@CopyWith()
@annotation.XmlRootElement(name: 'CVT')
@annotation.XmlSerializable(createMixin: true)
class CropVariety extends Iso11783Element
    with _$CropVarietyXmlSerializableMixin {
  /// Default factory for creating a [CropVariety] with verified
  /// arguments.
  factory CropVariety({
    required String id,
    required String designator,
    String? productIdRef,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: idRefPattern,
      designator: designator,
    );
    if (productIdRef != null) {
      ArgumentValidation.checkId(
        id: productIdRef,
        idRefPattern: Product.idRefPattern,
        idName: 'productIdRef',
      );
    }
    return CropVariety._(
      id: id,
      designator: designator,
      productIdRef: productIdRef,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const CropVariety._({
    required this.id,
    required this.designator,
    this.productIdRef,
  }) : super(tag: Iso11783Tag.cropVariety, description: 'CropVariety');

  /// Creates a [CropVariety] from [element].
  factory CropVariety.fromXmlElement(XmlElement element) =>
      _$CropVarietyFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [CropVariety]s.
  static const idRefPattern = '(CVT|CVT-)([0-9])+';

  /// Unique identifier for this crop variety.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the crop variety, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  /// Reference to a [Product] this variety can be a part of.
  @annotation.XmlAttribute(name: 'C')
  final String? productIdRef;

  @override
  List<Object?> get props => super.props
    ..addAll([
      id,
      designator,
      productIdRef,
    ]);
}
