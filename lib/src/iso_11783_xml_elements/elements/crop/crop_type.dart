// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a crop that can be cultivated on a [Partfield].
/// Several [CropVariety] elements can be included.

class CropType extends Iso11783Element {
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
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );

    if (productGroupIdRef != null) {
      ArgumentValidation.checkId(
        id: productGroupIdRef,
        idRefPattern: ProductGroup.staticIdRefPattern,
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
  CropType._({
    required String id,
    required String designator,
    List<CropVariety>? varieties,
    String? productGroupIdRef,
  }) : super(
         elementType: Iso11783ElementType.cropType,
         description: 'CropType',
       ) {
    this.id = id;
    this.designator = designator;
    this.productGroupIdRef = productGroupIdRef;
    if (varieties != null) {
      children.addAll(varieties);
    }
  }

  /// Regular expression matching pattern for the [id] of [CropType]s.
  static const staticIdRefPattern = '(CTP|CTP-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of different varieties of this crop.
  List<CropVariety> get varieties => findElements(
    Iso11783ElementType.cropType.xmlTag,
  ).map((e) => e as CropVariety).toList();

  /// Unique identifier for this crop type.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Name of the crop type, description or comment.
  String get designator => parseString('B');
  set designator(String value) => setString('B', value);

  /// Reference to a [ProductGroup] that this is a part of.
  String? get productGroupIdRef => tryParseString('C');
  set productGroupIdRef(String? value) => setStringNullable('C', value);
}
