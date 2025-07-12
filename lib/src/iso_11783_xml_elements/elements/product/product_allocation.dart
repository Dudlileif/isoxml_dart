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
@CopyWith()
@annotation.XmlRootElement(name: 'PAN')
@annotation.XmlSerializable(createMixin: true)
class ProductAllocation extends Iso11783Element
    with _$ProductAllocationXmlSerializableMixin, EquatableMixin {
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
         elementType: Iso11783ElementType.productAllocation,
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
  /// in the ISO 11783-11 database.
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
  Iterable<Iso11783Element>? get recursiveChildren =>
      allocationStamp?.selfWithRecursiveChildren;

  @override
  List<Object?> get props => [
    allocationStamp,
    productIdRef,
    quantityDDI,
    quantityValue,
    transferMode,
    deviceElementIdRef,
    valuePresentationIdRef,
    productSubTypeIdRef,
  ];
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
  remainder(3, 'Remainder');

  const TransferMode(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
