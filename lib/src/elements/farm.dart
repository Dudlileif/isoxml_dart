// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that contains all required information to describe a farm.
///
/// The relationships between a [Customer] and [Farm]s and [Partfield]s can be
/// multiple. To determine which [Farm]s or [Partfield]s belong to a specific
/// [Customer], the [customerIdRef] values of all [Farm]s or [Partfield]s,
/// respectively, shall be examined for a match with a particular [Customer.id]
///  value.
@CopyWith()
@annotation.XmlRootElement(name: 'FRM')
@annotation.XmlSerializable(createMixin: true)
class Farm extends Iso11783Element with _$FarmXmlSerializableMixin {
  /// Default factory for creating a [Farm] with verified
  /// arguments.
  factory Farm({
    required String id,
    required String designator,
    String? street,
    String? poBox,
    String? postalCode,
    String? city,
    String? state,
    String? country,
    String? customerIdRef,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: idRefPattern,
      designator: designator,
    );
    if (street != null) {
      if (street.length > 32) {
        throw ArgumentError.value(street, 'street', 'Length > 32');
      }
    }
    if (poBox != null) {
      if (poBox.length > 32) {
        throw ArgumentError.value(poBox, 'poBox', 'Length > 32');
      }
    }
    if (postalCode != null) {
      if (postalCode.length > 10) {
        throw ArgumentError.value(postalCode, 'postalCode', 'Length > 10');
      }
    }
    if (city != null) {
      if (city.length > 32) {
        throw ArgumentError.value(city, 'city', 'Length > 32');
      }
    }
    if (state != null) {
      if (state.length > 32) {
        throw ArgumentError.value(state, 'state', 'Length > 32');
      }
    }
    if (country != null) {
      if (country.length > 32) {
        throw ArgumentError.value(country, 'country', 'Length > 32');
      }
    }
    if (customerIdRef != null) {
      ArgumentValidation.checkId(
        id: customerIdRef,
        idRefPattern: Customer.idRefPattern,
        idName: 'customerIdRef',
      );
    }

    return Farm._(
      id: id,
      designator: designator,
      street: street,
      poBox: poBox,
      postalCode: postalCode,
      city: city,
      state: state,
      country: country,
      customerIdRef: customerIdRef,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const Farm._({
    required this.id,
    required this.designator,
    this.street,
    this.poBox,
    this.postalCode,
    this.city,
    this.state,
    this.country,
    this.customerIdRef,
  }) : super(tag: Iso11783Tag.farm, description: 'Farm');

  /// Creates a [Farm] from [element].
  factory Farm.fromXmlElement(XmlElement element) =>
      _$FarmFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [Farm]s.
  static const idRefPattern = '(FRM|FRM-)([0-9])+';

  /// Unique identifier for this farm.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the farm, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  /// Street
  @annotation.XmlAttribute(name: 'C')
  final String? street;

  /// PO Box
  @annotation.XmlAttribute(name: 'D')
  final String? poBox;

  /// Postal code
  @annotation.XmlAttribute(name: 'E')
  final String? postalCode;

  /// City
  @annotation.XmlAttribute(name: 'F')
  final String? city;

  /// State
  @annotation.XmlAttribute(name: 'G')
  final String? state;

  /// Country
  @annotation.XmlAttribute(name: 'H')
  final String? country;

  /// Reference to a [Customer].
  @annotation.XmlAttribute(name: 'I')
  final String? customerIdRef;

  @override
  List<Object?> get props => super.props
    ..addAll([
      id,
      designator,
      street,
      poBox,
      postalCode,
      city,
      state,
      country,
      customerIdRef,
    ]);
}
