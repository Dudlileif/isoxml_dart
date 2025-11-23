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
    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
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
  }) : super(elementType: _elementType) {
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
    : super(elementType: _elementType, xmlElement: element) {
    _argumentValidator();
  }

  void _argumentValidator() {
    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
    if (lastName.length > 32) {
      throw ArgumentError.value(lastName, 'lastName', 'Length > 32');
    }
    if (firstName != null) {
      if (firstName!.length > 32) {
        throw ArgumentError.value(firstName, 'firstName', 'Length > 32');
      }
    }
    if (street != null) {
      if (street!.length > 32) {
        throw ArgumentError.value(street, 'street', 'Length > 32');
      }
    }
    if (poBox != null) {
      if (poBox!.length > 32) {
        throw ArgumentError.value(poBox, 'poBox', 'Length > 32');
      }
    }
    if (postalCode != null) {
      if (postalCode!.length > 10) {
        throw ArgumentError.value(postalCode, 'postalCode', 'Length > 10');
      }
    }
    if (city != null) {
      if (city!.length > 32) {
        throw ArgumentError.value(city, 'city', 'Length > 32');
      }
    }
    if (state != null) {
      if (state!.length > 32) {
        throw ArgumentError.value(state, 'state', 'Length > 32');
      }
    }
    if (country != null) {
      if (country!.length > 32) {
        throw ArgumentError.value(country, 'country', 'Length > 32');
      }
    }
    if (phone != null) {
      if (phone!.length > 20) {
        throw ArgumentError.value(phone, 'phone', 'Length > 20');
      }
    }
    if (mobile != null) {
      if (mobile!.length > 32) {
        throw ArgumentError.value(mobile, 'mobile', 'Length > 32');
      }
    }
    if (fax != null) {
      if (fax!.length > 20) {
        throw ArgumentError.value(fax, 'fax', 'Length > 20');
      }
    }
    if (email != null) {
      if (email!.length > 64) {
        throw ArgumentError.value(email, 'email', 'Length > 64');
      }
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
