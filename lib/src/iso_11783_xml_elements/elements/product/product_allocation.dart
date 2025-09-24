// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that specifies the allocation of a single [Product] to a [Task].
///
/// A [ProductAllocation] is optionally related to a [DeviceElement]. This is to
///  be able to track the assignment of a single [Product] or of a number of
/// different [Product]s to a bin or to another type of [DeviceElement].
/// The transferred amount can optionally be specified by a combination of the
/// attributes [quantityDDI] and [quantityValue].
class ProductAllocation extends Iso11783Element with _AllocationStampMixin {
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
      idRefPattern: Product.staticIdRefPattern,
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
        idRefPattern: DeviceElement.staticIdRefPattern,
        idName: 'deviceElementIdRef',
      );
    }
    if (valuePresentationIdRef != null) {
      ArgumentValidation.checkId(
        id: valuePresentationIdRef,
        idRefPattern: ValuePresentation.staticIdRefPattern,
        idName: 'valuePresentationIdRef',
      );
    }
    if (productSubTypeIdRef != null) {
      ArgumentValidation.checkId(
        id: productSubTypeIdRef,
        idRefPattern: Product.staticIdRefPattern,
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
  ProductAllocation._({
    required String productIdRef,
    String? quantityDDI,
    int? quantityValue,
    TransferMode? transferMode,
    String? deviceElementIdRef,
    String? valuePresentationIdRef,
    String? productSubTypeIdRef,
    AllocationStamp? allocationStamp,
  }) : super(
         elementType: Iso11783ElementType.productAllocation,
         description: 'ProductAllocation',
       ) {
    this.productIdRef = productIdRef;
    this.quantityDDI = quantityDDI;
    this.quantityValue = quantityValue;
    this.transferMode = transferMode;
    this.deviceElementIdRef = deviceElementIdRef;
    this.valuePresentationIdRef = valuePresentationIdRef;
    this.productSubTypeIdRef = productSubTypeIdRef;
    this.allocationStamp = allocationStamp;
  }

  /// Reference to a [Product].
  String get productIdRef => parseString('A');
  set productIdRef(String value) => setString('A', value);

  /// A unique Data Dictionary Identifier which identifies a
  /// [ProcessDataVariable].
  ///
  /// The [ProcessDataVariable] is found as a Device Dictionary Entity (DDE)
  /// in the ISO 11783-11 database.
  String? get quantityDDI => tryParseString('B');
  set quantityDDI(String? value) => setStringNullable('B', value);

  /// Value for the quantity of the [Product].
  int? get quantityValue => tryParseInt('C');
  set quantityValue(int? value) => setIntNullable('C', value);

  /// Which kind of transfer this allocation is performing.
  TransferMode? get transferMode => switch (tryParseInt('D')) {
    final int value => TransferMode.values.firstWhere(
      (type) => type.value == value,
      orElse: () => throw ArgumentError(
        '''`$value` is not one of the supported values: ${TransferMode.values.join(', ')}''',
      ),
    ),
    _ => null,
  };
  set transferMode(TransferMode? value) => setIntNullable('D', value?.value);

  /// Reference to a [DeviceElement].
  String? get deviceElementIdRef => tryParseString('E');
  set deviceElementIdRef(String? value) => setStringNullable('E', value);

  /// Reference to a [ValuePresentation].
  String? get valuePresentationIdRef => tryParseString('F');
  set valuePresentationIdRef(String? value) => setStringNullable('F', value);

  /// Reference to a sub type of[Product].
  String? get productSubTypeIdRef => tryParseString('G');
  set productSubTypeIdRef(String? value) => setStringNullable('G', value);
}

/// An enumerator for which kind of transfer the [ProductAllocation] is
/// performing.
enum TransferMode {
  /// Filling
  filling(1, 'Filling'),

  /// Emptying
  emptying(2, 'Emptying'),

  /// Remainder
  remainder(3, 'Remainder');

  const TransferMode(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
