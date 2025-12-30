// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a customer.
///
/// A [Customer] can be referenced in a [Task], [Farm] and [Partfield]. The
/// relationship between a [Customer] and [Farm]s and [Partfield]s can be
/// multiple. To determine which [Farm]s or [Partfield]s belong to a specific
/// [Customer], the `customerIdRef` values of all [Farm]s or [Partfield]s,
/// respectively, shall be examined for a match with a particular [id] value.
class Customer extends Iso11783Element with _ProfileMixin {
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
    _argumentValidator(
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
  Customer._({
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
  }) : super._(elementType: _elementType) {
    this.id = id;
    this.lastName = lastName;
    this.firstName = firstName;
    this.street = street;
    this.poBox = poBox;
    this.postalCode = postalCode;
    this.city = city;
    this.state = state;
    this.country = country;
    this.phone = phone;
    this.mobile = mobile;
    this.fax = fax;
    this.email = email;
  }

  Customer._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    _argumentValidator(
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

  static void _argumentValidator({
    required String id,
    required String lastName,
    required String? firstName,
    required String? street,
    required String? poBox,
    required String? postalCode,
    required String? city,
    required String? state,
    required String? country,
    required String? phone,
    required String? mobile,
    required String? fax,
    required String? email,
  }) {
    ArgumentValidation.checkId(
      id: id,
      idRefPattern: staticIdRefPattern,
      name: 'Customer.id',
    );
    ArgumentValidation.checkStringLength(lastName, name: 'Customer.lastName');

    if (firstName != null) {
      ArgumentValidation.checkStringLength(
        firstName,
        name: 'Customer.firstName',
      );
    }
    if (street != null) {
      ArgumentValidation.checkStringLength(street, name: 'Customer.street');
    }
    if (poBox != null) {
      ArgumentValidation.checkStringLength(poBox, name: 'Customer.poBox');
    }
    if (postalCode != null) {
      ArgumentValidation.checkStringLength(
        postalCode,
        name: 'Customer.postalCode',
        maxLength: 10,
      );
    }
    if (city != null) {
      ArgumentValidation.checkStringLength(city, name: 'Customer.city');
    }
    if (state != null) {
      ArgumentValidation.checkStringLength(
        state,
        name: 'Customer.state',
      );
    }
    if (country != null) {
      ArgumentValidation.checkStringLength(country, name: 'Customer.country');
    }
    if (phone != null) {
      ArgumentValidation.checkStringLength(
        phone,
        name: 'Customer.phone',
        maxLength: 20,
      );
    }
    if (mobile != null) {
      ArgumentValidation.checkStringLength(mobile, name: 'Customer.mobile');
    }
    if (fax != null) {
      ArgumentValidation.checkStringLength(
        fax,
        name: 'Customer.fax',
        maxLength: 20,
      );
    }
    if (email != null) {
      ArgumentValidation.checkStringLength(
        email,
        name: 'Customer.email',
        maxLength: 64,
      );
    }
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.customer;

  /// Regular expression matching pattern for the [id] of [Customer]s.
  static const staticIdRefPattern = '(CTR|CTR-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Fax number
  String? get fax => tryParseString('L');
  set fax(String? value) => setStringNullable('L', value);
}
