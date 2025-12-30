// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a worker that can be referenced by a [Task].
///
/// All [WorkerAllocation]s are logged with time information inside the data
/// transfer file. The [Task.responsibleWorkerIdRef] has a special meaning for a
/// [Task]. This [Worker] is directly referenced by the task without any
/// additional logged data.
class Worker extends Iso11783Element with _ProfileMixin {
  /// Default factory for creating a [Worker] with verified
  /// arguments.
  factory Worker({
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
    String? licenseNumber,
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
      licenseNumber: licenseNumber,
      email: email,
    );

    return Worker._(
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
      licenseNumber: licenseNumber,
      email: email,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  Worker._({
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
    String? licenseNumber,
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
    this.licenseNumber = licenseNumber;
    this.email = email;
  }

  Worker._fromXmlElement(XmlElement element)
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
      licenseNumber: licenseNumber,
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
    required String? licenseNumber,
    required String? email,
  }) {
    ArgumentValidation.checkId(
      id: id,
      idRefPattern: staticIdRefPattern,
      name: 'Worker.id',
    );
    if (lastName.length > 32) {
      ArgumentValidation.checkStringLength(lastName, name: 'Worker.lastName');
    }
    if (firstName != null) {
      ArgumentValidation.checkStringLength(firstName, name: 'Worker.firstName');
    }
    if (street != null) {
      ArgumentValidation.checkStringLength(street, name: 'Worker.street');
    }
    if (poBox != null) {
      ArgumentValidation.checkStringLength(poBox, name: 'Worker.poBox');
    }
    if (postalCode != null) {
      ArgumentValidation.checkStringLength(
        postalCode,
        name: 'Worker.postalCode',
        maxLength: 10,
      );
    }
    if (city != null) {
      ArgumentValidation.checkStringLength(city, name: 'Worker.city');
    }
    if (state != null) {
      ArgumentValidation.checkStringLength(state, name: 'Worker.state');
    }
    if (country != null) {
      ArgumentValidation.checkStringLength(country, name: 'Worker.country');
    }
    if (phone != null) {
      ArgumentValidation.checkStringLength(
        phone,
        name: 'Worker.phone',
        maxLength: 20,
      );
    }
    if (mobile != null) {
      ArgumentValidation.checkStringLength(mobile, name: 'Worker.mobile');
    }
    if (licenseNumber != null) {
      ArgumentValidation.checkStringLength(
        licenseNumber,
        name: 'Worker.licenseNumber',
      );
    }
    if (email != null) {
      ArgumentValidation.checkStringLength(
        email,
        name: 'Worker.email',
        maxLength: 64,
      );
    }
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.worker;

  /// Regular expression matching pattern for the [id] of [Worker]s.
  static const staticIdRefPattern = '(WKR|WKR-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// License number
  String? get licenseNumber => tryParseString('L');
  set licenseNumber(String? value) => setStringNullable('L', value);
}
