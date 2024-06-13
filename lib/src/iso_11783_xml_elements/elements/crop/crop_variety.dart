// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

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
  }) : super(tag: Iso11783XmlTag.cropVariety, description: 'CropVariety');

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
