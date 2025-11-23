// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso_11783_element.dart';

mixin _DocumentMixin implements Iso11783Element {
  /// Major version of the standard.
  VersionMajor get versionMajor => VersionMajor.values.firstWhere(
    (type) => type.value == parseInt('VersionMajor'),
    orElse: () => throw ArgumentError(
      '''`${xmlElement.getAttribute('VersionMajor')}` is not one of the supported values: ${VersionMajor.values.join(', ')}''',
    ),
  );
  set versionMajor(VersionMajor value) => setInt('VersionMajor', value.value);

  /// Minor version of the standard.
  VersionMinor get versionMinor => VersionMinor.values.firstWhere(
    (type) => type.value == parseInt('VersionMinor'),
    orElse: () => throw ArgumentError(
      '''`${xmlElement.getAttribute('VersionMinor')}` is not one of the supported values: ${VersionMinor.values.join(', ')}''',
    ),
  );
  set versionMinor(VersionMinor value) => setInt('VersionMinor', value.value);

  /// Name of the Management Software manufacturer.
  String get managementSoftwareManufacturer =>
      parseString('ManagementSoftwareManufacturer');
  set managementSoftwareManufacturer(String value) =>
      setString('ManagementSoftwareManufacturer', value);

  /// Version of the Management Software.
  String get managementSoftwareVersion =>
      parseString('ManagementSoftwareVersion');
  set managementSoftwareVersion(String value) =>
      setString('ManagementSoftwareVersion', value);

  /// Name of the Task Controller software.
  String? get taskControllerManufacturer =>
      tryParseString('TaskControllerManufacturer');
  set taskControllerManufacturer(String? value) =>
      setStringNullable('TaskControllerManufacturer', value);

  /// Version of the Task Controller software.
  String? get taskControllerVersion => tryParseString('TaskControllerVersion');
  set taskControllerVersion(String? value) =>
      setStringNullable('TaskControllerVersion', value);

  /// The creation origin of this.
  DataTransferOrigin
  get dataTransferOrigin => DataTransferOrigin.values.firstWhere(
    (type) => type.value == parseInt('DataTransferOrigin'),
    orElse: () => throw ArgumentError(
      '''`${xmlElement.getAttribute('DataTransferOrigin')}` is not one of the supported values: ${DataTransferOrigin.values.join(', ')}''',
    ),
  );
  set dataTransferOrigin(DataTransferOrigin value) =>
      setInt('DataTransferOrigin', value.value);
}
