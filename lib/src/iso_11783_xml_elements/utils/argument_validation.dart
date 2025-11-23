// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso_11783_element.dart';

/// A class with static methods for validating arguments when creating
/// [Iso11783Element]s.
class ArgumentValidation {
  /// Checks the [id] with [checkId] and the [designator] with
  /// [checkStringLength].
  ///
  /// [idName] and [designatorName] can change the respective printer name in
  /// errors if they occur.
  ///
  /// [idMinLength] and [idMaxLength] sets the minimum and maxiumum acceptable
  /// length of [id], whilst [designatorMaxLength] does the same for
  /// [designator].
  static void checkIdAndDesignator({
    required String id,
    required String idRefPattern,
    required String designator,
    String idName = 'id',
    String designatorName = 'designator',
    int idMinLength = 4,
    int idMaxLength = 14,
    int designatorMaxLength = 32,
  }) {
    checkStringLength(
      designator,
      maxLength: designatorMaxLength,
      name: designatorName,
    );
    checkId(
      id: id,
      idRefPattern: idRefPattern,
      idName: idName,
      minLength: idMinLength,
      maxLength: idMaxLength,
    );
  }

  /// Checks that the [string] has a length that satisfies `length<=maxLength`.
  ///
  /// [name] can be given if the element argument name of the [name] is not
  /// equal to `designator`.
  static void checkStringLength(
    String string, {
    int maxLength = 32,
    String name = 'designator',
  }) {
    if (string.length > maxLength) {
      throw ArgumentError.value(
        string,
        name,
        'Length > $maxLength',
      );
    }
  }

  /// Checks whether [id] satisfies the regular expression [idRefPattern]
  /// whilst also having a length that satisfies `minLength<=length<=maxLength`.
  ///
  /// [id] can be given if the element argument name of the [id] is not equal
  /// to `id`.
  static void checkId({
    required String id,
    required String idRefPattern,
    int minLength = 4,
    int maxLength = 14,
    String idName = 'id',
  }) {
    if (id.length >= minLength && id.length <= maxLength) {
      final match = RegExp(idRefPattern).matchAsPrefix(id);
      if (match != null) {
        id = match.input;
      } else {
        throw ArgumentError.value(
          id,
          idName,
          '''Doesn't match pattern: $idRefPattern''',
        );
      }
    } else {
      throw ArgumentError.value(
        id,
        idName,
        'Length < $minLength or Length > $maxLength',
      );
    }
  }

  /// Checks whether [value] satisfies `min<=value<=max`.
  ///
  /// If [hex] is true, then the values printed in the error (if there is one)
  /// will be hex instead of decimal.
  static void checkValueInRange({
    required num value,
    required num min,
    required num max,
    required String name,
    bool hex = false,
  }) {
    if (value < min || value > max) {
      final minString = hex && min is int ? min.toRadixString(16) : '$min';
      final maxString = hex && max is int ? max.toRadixString(16) : '$max';
      throw ArgumentError.value(
        value,
        name,
        'Outside range: [$minString, $maxString]',
      );
    }
  }

  /// Checks whether the [string] has a length that satisfies
  /// `minBytes<=length<=maxBytes`.
  ///
  /// [name] is used when throwing errors to figure out which element argument
  /// caused the error.
  static void checkHexStringLength(
    String string, {
    required String name,
    int minBytes = 2,
    int maxBytes = 2,
  }) {
    final minLength = minBytes * 2;
    final maxLength = maxBytes * 2;
    if (string.length > maxLength) {
      throw ArgumentError.value(
        string,
        name,
        'Hex string length ${string.length}, max length: $maxLength',
      );
    }

    if (RegExp(
          '[0-9a-f]{$minLength,$maxLength}',
          caseSensitive: false,
        ).matchAsPrefix(string) ==
        null) {
      throw ArgumentError.value(
        string,
        name,
        'Not a HEX string of byte length [$minBytes, $maxBytes]',
      );
    }
  }
}
