// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that contains all required information to describe a farm.
///
/// The relationships between a [Customer] and [Farm]s and [Partfield]s can be
/// multiple. To determine which [Farm]s or [Partfield]s belong to a specific
/// [Customer], the [customerIdRef] values of all [Farm]s or [Partfield]s,
/// respectively, shall be examined for a match with a particular [Customer.id]
/// value.
class Farm extends Iso11783Element {
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
      idRefPattern: staticIdRefPattern,
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
        idRefPattern: Customer.staticIdRefPattern,
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
  Farm._({
    required String id,
    required String designator,
    String? street,
    String? poBox,
    String? postalCode,
    String? city,
    String? state,
    String? country,
    String? customerIdRef,
  }) : super(elementType: _elementType) {
    this.id = id;
    this.designator = designator;
    this.street = street;
    this.poBox = poBox;
    this.postalCode = postalCode;
    this.city = city;
    this.state = state;
    this.country = country;
    this.customerIdRef = customerIdRef;
  }

  Farm._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    _argumentValidator();
  }

  void _argumentValidator() {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );
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
    if (customerIdRef != null) {
      ArgumentValidation.checkId(
        id: customerIdRef!,
        idRefPattern: Customer.staticIdRefPattern,
        idName: 'customerIdRef',
      );
    }
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.farm;

  /// Regular expression matching pattern for the [id] of [Farm]s.
  static const staticIdRefPattern = '(FRM|FRM-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this farm.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Name of the farm, description or comment.
  String get designator => parseString('B');
  set designator(String value) => setString('B', value);

  /// Street
  String? get street => tryParseString('C');
  set street(String? value) => setStringNullable('C', value);

  /// PO Box
  String? get poBox => tryParseString('D');
  set poBox(String? value) => setStringNullable('D', value);

  /// Postal code
  String? get postalCode => tryParseString('E');
  set postalCode(String? value) => setStringNullable('E', value);

  /// City
  String? get city => tryParseString('F');
  set city(String? value) => setStringNullable('F', value);

  /// State
  String? get state => tryParseString('G');
  set state(String? value) => setStringNullable('G', value);

  /// Country
  String? get country => tryParseString('H');
  set country(String? value) => setStringNullable('H', value);

  /// Reference to a [Customer].
  String? get customerIdRef => tryParseString('I');
  set customerIdRef(String? value) => setStringNullable('I', value);
}
