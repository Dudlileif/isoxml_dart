// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that describes a customer.
///
/// A [Customer] can be referenced in a [Task], [Farm] and [Partfield]. The
/// relationship between a [Customer] and [Farm]s and [Partfield]s can be
/// multiple. To determine which [Farm]s or [Partfield]s belong to a specific
/// [Customer], the `customerIdRef` values of all [Farm]s or [Partfield]s,
/// respectively, shall be examined for a match with a particular [id] value.
@CopyWith()
@annotation.XmlRootElement(name: 'CTR')
@annotation.XmlSerializable(createMixin: true)
class Customer extends Iso11783Element with _$CustomerXmlSerializableMixin {
  /// Default factory for creating a [Customer] with verified
  /// arguments.
  factory Customer({
    required String id,
    required String lastName,
    String? firstName,
    String? street,
    String? poBox,
    String? postalCode,
    String? city,
    String? state,
    String? country,
    String? phone,
    String? mobile,
    String? fax,
    String? email,
  }) {
    ArgumentValidation.checkId(id: id, idRefPattern: idRefPattern);
    if (lastName.length > 32) {
      throw ArgumentError.value(lastName, 'lastName', 'Length > 32');
    }
    if (firstName != null) {
      if (firstName.length > 32) {
        throw ArgumentError.value(firstName, 'firstName', 'Length > 32');
      }
    }
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
    if (phone != null) {
      if (phone.length > 20) {
        throw ArgumentError.value(phone, 'phone', 'Length > 20');
      }
    }
    if (mobile != null) {
      if (mobile.length > 32) {
        throw ArgumentError.value(mobile, 'mobile', 'Length > 32');
      }
    }
    if (fax != null) {
      if (fax.length > 20) {
        throw ArgumentError.value(fax, 'fax', 'Length > 20');
      }
    }
    if (email != null) {
      if (email.length > 64) {
        throw ArgumentError.value(email, 'email', 'Length > 64');
      }
    }
    return Customer._(
      id: id,
      lastName: lastName,
      firstName: firstName,
      street: street,
      poBox: poBox,
      postalCode: postalCode,
      city: city,
      state: state,
      country: country,
      phone: phone,
      mobile: mobile,
      fax: fax,
      email: email,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const Customer._({
    required this.id,
    required this.lastName,
    this.firstName,
    this.street,
    this.poBox,
    this.postalCode,
    this.city,
    this.state,
    this.country,
    this.phone,
    this.mobile,
    this.fax,
    this.email,
  }) : super(tag: Iso11783Tag.customer, description: 'Customer');

  /// Creates a [Customer] from [element].
  factory Customer.fromXmlElement(XmlElement element) =>
      _$CustomerFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [Customer]s.
  static const idRefPattern = '(CTR|CTR-)([0-9])+';

  /// Unique identifier for this customer.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Customer's last name.
  @annotation.XmlAttribute(name: 'B')
  final String lastName;

  /// Customer's first name.
  @annotation.XmlAttribute(name: 'C')
  final String? firstName;

  /// Street
  @annotation.XmlAttribute(name: 'D')
  final String? street;

  /// PO Box
  @annotation.XmlAttribute(name: 'E')
  final String? poBox;

  /// Postal code
  @annotation.XmlAttribute(name: 'F')
  final String? postalCode;

  /// City
  @annotation.XmlAttribute(name: 'G')
  final String? city;

  /// State
  @annotation.XmlAttribute(name: 'H')
  final String? state;

  /// Country
  @annotation.XmlAttribute(name: 'I')
  final String? country;

  /// Telephone number
  @annotation.XmlAttribute(name: 'J')
  final String? phone;

  /// Cellular phone number
  @annotation.XmlAttribute(name: 'K')
  final String? mobile;

  /// Fax number
  @annotation.XmlAttribute(name: 'L')
  final String? fax;

  /// E-mail address
  @annotation.XmlAttribute(name: 'M')
  final String? email;

  @override
  List<Object?> get props => super.props
    ..addAll([
      id,
      lastName,
      firstName,
      street,
      poBox,
      postalCode,
      city,
      state,
      country,
      phone,
      mobile,
      fax,
      email,
    ]);
}
