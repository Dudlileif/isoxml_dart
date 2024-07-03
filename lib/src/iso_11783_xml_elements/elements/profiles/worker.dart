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
@CopyWith()
@annotation.XmlRootElement(name: 'WKR')
@annotation.XmlSerializable(createMixin: true)
class Worker extends Iso11783Element with _$WorkerXmlSerializableMixin {
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
    if (licenseNumber != null) {
      if (licenseNumber.length > 32) {
        throw ArgumentError.value(
          licenseNumber,
          'licenseNumber',
          'Length > 32',
        );
      }
    }
    if (email != null) {
      if (email.length > 64) {
        throw ArgumentError.value(email, 'email', 'Length > 64');
      }
    }

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
  const Worker._({
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
    this.licenseNumber,
    this.email,
  }) : super(elementType: Iso11783ElementType.worker, description: 'Worker');

  /// Creates a [Worker] from [element].
  factory Worker.fromXmlElement(XmlElement element) =>
      _$WorkerFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [Worker]s.
  static const staticIdRefPattern = '(WKR|WKR-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this worker.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'A')
  final String id;


  /// Worker's last name.
  @annotation.XmlAttribute(name: 'B')
  final String lastName;

  /// Worker's first name.
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

  /// License number
  @annotation.XmlAttribute(name: 'L')
  final String? licenseNumber;

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
      licenseNumber,
      email,
    ]);

}
