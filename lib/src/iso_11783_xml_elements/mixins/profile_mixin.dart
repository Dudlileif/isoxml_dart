// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso_11783_element.dart';

mixin _ProfileMixin implements Iso11783Element {
  /// Unique identifier for this.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Last name.
  String get lastName => parseString('B');
  set lastName(String value) => setString('B', value);

  /// First name.
  String? get firstName => tryParseString('C');
  set firstName(String? value) => setStringNullable('C', value);

  /// Street
  String? get street => tryParseString('D');
  set street(String? value) => setStringNullable('D', value);

  /// PO Box
  String? get poBox => tryParseString('E');
  set poBox(String? value) => setStringNullable('E', value);

  /// Postal code
  String? get postalCode => tryParseString('F');
  set postalCode(String? value) => setStringNullable('F', value);

  /// City
  String? get city => tryParseString('G');
  set city(String? value) => setStringNullable('G', value);

  /// State
  String? get state => tryParseString('H');
  set state(String? value) => setStringNullable('H', value);

  /// Country
  String? get country => tryParseString('I');
  set country(String? value) => setStringNullable('I', value);

  /// Telephone number
  String? get phone => tryParseString('J');
  set phone(String? value) => setStringNullable('J', value);

  /// Cellular phone number
  String? get mobile => tryParseString('K');
  set mobile(String? value) => setStringNullable('K', value);

  /// E-mail address
  String? get email => tryParseString('M');
  set email(String? value) => setStringNullable('M', value);
}
