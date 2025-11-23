// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso_11783_element.dart';

extension _ParsingExtension on _XmlElementBase {
  /// Parse a [DateTime] from attribute [attributeName].
  DateTime parseDateTime(String attributeName, {String? namespace}) =>
      switch (xmlElement.getAttribute(attributeName, namespace: namespace)) {
        final String string => DateTime.parse(string),
        final value => throw FormatException(
          'Attribute $attributeName could not be parsed as DateTime: $value',
        ),
      };

  /// Parse a [double]from attribute [attributeName].
  double parseDouble(String attributeName, {String? namespace}) =>
      switch (xmlElement.getAttribute(attributeName, namespace: namespace)) {
        final String string => double.parse(string),
        final value => throw FormatException(
          'Attribute $attributeName could not be parsed as double: $value',
        ),
      };

  /// Parse an [int] from attribute [attributeName].
  int parseInt(String attributeName, {String? namespace}) =>
      switch (xmlElement.getAttribute(attributeName, namespace: namespace)) {
        final String string => int.parse(string),
        final value => throw FormatException(
          'Attribute $attributeName could not be parsed as int: $value',
        ),
      };

  /// Parse a [String] from attribute [attributeName].
  String parseString(String attributeName, {String? namespace}) =>
      switch (xmlElement.getAttribute(attributeName, namespace: namespace)) {
        final String string => string,
        final value => throw FormatException(
          'Attribute $attributeName could not be parsed as string: $value',
        ),
      };

  /// Parse a nullable [DateTime] from attribute [attributeName].
  DateTime? tryParseDateTime(String attributeName, {String? namespace}) {
    return switch (xmlElement.getAttribute(
      attributeName,
      namespace: namespace,
    )) {
      final String string => DateTime.tryParse(string),
      final _ => null,
    };
  }

  /// Parse a nullable [double] from attribute [attributeName].
  double? tryParseDouble(String attributeName, {String? namespace}) =>
      switch (xmlElement.getAttribute(attributeName, namespace: namespace)) {
        final String string => double.tryParse(string),
        _ => null,
      };

  /// Parse a nullable [int] from attribute [attributeName].
  int? tryParseInt(String attributeName, {String? namespace}) =>
      switch (xmlElement.getAttribute(attributeName, namespace: namespace)) {
        final String string => int.tryParse(string),
        _ => null,
      };

  /// Parse a nullable [String] from attribute [attributeName].
  String? tryParseString(String attributeName, {String? namespace}) =>
      switch (xmlElement.getAttribute(attributeName, namespace: namespace)) {
        final String string => string,
        _ => null,
      };

  /// Set a [DateTime] value to attribute [attributeName].
  void setDateTime(String attributeName, DateTime value, {String? namespace}) =>
      xmlElement.setAttribute(
        attributeName,
        value.toIso8601String(),
        namespace: namespace,
      );

  /// Set a nullable [DateTime] value to attribute [attributeName].
  void setDateTimeNullable(
    String attributeName,
    DateTime? value, {
    String? namespace,
    bool setNullToEmptyString = false,
  }) => xmlElement.setAttribute(
    attributeName,
    value == null && setNullToEmptyString ? '' : value?.toIso8601String(),
    namespace: namespace,
  );

  /// Set a [double] value to attribute [attributeName].
  void setDouble(String attributeName, double value, {String? namespace}) =>
      xmlElement.setAttribute(attributeName, '$value', namespace: namespace);

  /// Set a nullable [String] value to attribute [attributeName].
  void setDoubleNullable(
    String attributeName,
    double? value, {
    String? namespace,
    bool setNullToEmptyString = false,
  }) => xmlElement.setAttribute(
    attributeName,
    value == null && setNullToEmptyString ? '' : value?.toString(),
    namespace: namespace,
  );

  /// Set an [int] value to attribute [attributeName].
  void setInt(String attributeName, int value, {String? namespace}) =>
      xmlElement.setAttribute(attributeName, '$value', namespace: namespace);

  /// Set a nullable [int] value to attribute [attributeName].
  void setIntNullable(
    String attributeName,
    int? value, {
    String? namespace,
    bool setNullToEmptyString = false,
  }) => xmlElement.setAttribute(
    attributeName,
    value == null && setNullToEmptyString ? '' : value?.toString(),
    namespace: namespace,
  );

  /// Set a [String] value to attribute [attributeName].
  void setString(String attributeName, String value, {String? namespace}) =>
      xmlElement.setAttribute(attributeName, value, namespace: namespace);

  /// Set a nullable [String] value to attribute [attributeName].
  void setStringNullable(
    String attributeName,
    String? value, {
    String? namespace,
    bool setNullToEmptyString = false,
  }) => xmlElement.setAttribute(
    attributeName,
    value == null && setNullToEmptyString ? '' : value,
    namespace: namespace,
  );
}
