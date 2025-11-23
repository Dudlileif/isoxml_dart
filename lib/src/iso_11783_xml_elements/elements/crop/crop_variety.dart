// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes varieties of a crop specified by [CropType] that
/// can be cultivated on a [Partfield].
///
/// Each [CropVariety] belongs to a single [CropType] definition.
class CropVariety extends Iso11783Element {
  /// Default factory for creating a [CropVariety] with verified
  /// arguments.
  factory CropVariety({
    required String id,
    required String designator,
    String? productIdRef,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );
    if (productIdRef != null) {
      ArgumentValidation.checkId(
        id: productIdRef,
        idRefPattern: Product.staticIdRefPattern,
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
  CropVariety._({
    required String id,
    required String designator,
    String? productIdRef,
  }) : super(elementType: _elementType) {
    this.id = id;
    this.designator = designator;
    this.productIdRef = productIdRef;
  }

  CropVariety._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    _argumentValidator();
  }

  void _argumentValidator() {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );
    if (productIdRef != null) {
      ArgumentValidation.checkId(
        id: productIdRef!,
        idRefPattern: Product.staticIdRefPattern,
        idName: 'productIdRef',
      );
    }
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.cropVariety;

  /// Regular expression matching pattern for the [id] of [CropVariety]s.
  static const staticIdRefPattern = '(CVT|CVT-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this crop variety.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Name of the crop variety, description or comment.
  String get designator => parseString('B');
  set designator(String value) => setString('B', value);

  /// Reference to a [Product] this variety can be a part of.
  String? get productIdRef => tryParseString('C');
  set productIdRef(String? value) => setStringNullable('C', value);
}
