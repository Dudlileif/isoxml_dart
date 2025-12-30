// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:meta/meta.dart';

/// An entry in the ISO 11783-11 Data Directory.
///
/// The up-to-date complete database can be found at [isobus.net/isobus](https://www.isobus.net/isobus/).
/// A browsable and searchable version is at [isobus.net/isobus/dDEntity](https://www.isobus.net/isobus/dDEntity).
@immutable
class Iso11783DataDictionaryEntity {
  /// Default factory for creating an [Iso11783DataDictionaryEntity] from
  /// [rawStrings].
  ///
  /// [rawStrings] is expected to be lines from a text like this:
  ///
  /// ```text
  /// DD Entity: 1 Setpoint Volume Per Area Application Rate as [mm³/m²]
  /// Definition: Setpoint Application Rate specified as volume per area as [mm³/m²]
  /// Comment:
  /// Typically used by Device Classes:
  /// 4 - Planters /Seeders
  /// 5 - Fertilizer
  /// 6 - Sprayers
  /// 10 - Irrigation
  /// Unit: mm³/m² - Capacity per area unit
  /// Resolution: 0,01
  /// SAE SPN: not specified
  /// CANBus Range: 0 - 2147483647
  /// Display Range: 0,00 - 21474836,47
  /// Submit by: Part 10 Task Force
  /// Submit Date:
  /// Submit Company: 89 - Kverneland Group, Electronics Division
  /// Revision Number: 1
  /// Current Status: ISO-Published
  /// Status Date: 2005-02-02
  // ignore: lines_longer_than_80_chars
  /// Status Comments: DDEs have been moved to published for creating the new Annex A version.
  /// Attachments:
  /// none
  /// ```
  factory Iso11783DataDictionaryEntity(List<String> rawStrings) {
    final id = int.parse(
      rawStrings.first.split('DD Entity: ').last.split(' ').first,
    );

    final name = rawStrings.first.split('DD Entity: $id ').last;

    final commentIndex = rawStrings.indexWhere(
      (element) => element.startsWith('Comment: '),
    );

    final definition = rawStrings
        .sublist(1, commentIndex)
        .join('\n')
        .replaceFirst('Definition: ', '');

    final typicallyUsedLineIndex = rawStrings.indexWhere(
      (element) => element.startsWith('Typically used'),
    );

    String? comment;
    if (commentIndex > 0 && typicallyUsedLineIndex > commentIndex) {
      final string = rawStrings
          .sublist(commentIndex, typicallyUsedLineIndex)
          .join('\n')
          .replaceFirst('Comment: ', '');
      if (string.isNotEmpty && string.trim().isNotEmpty) {
        comment = string;
      }
    }

    final unitLineIndex = rawStrings.indexWhere(
      (element) => element.startsWith('Unit:'),
    );

    final assignedDeviceClasses = <DeviceClass>[];

    for (var i = typicallyUsedLineIndex + 1; i < unitLineIndex; i++) {
      final value = int.tryParse(rawStrings[i].split(' ').first);
      if (value != null) {
        assignedDeviceClasses.add(DeviceClass.values[value]);
      }
    }

    final unit = rawStrings[unitLineIndex]
        .split('Unit: ')
        .last
        .split(' - ')
        .first;

    final unitDescription = rawStrings[unitLineIndex]
        .split('Unit: ')
        .last
        .split(' - ')
        .last;

    final resolutionIndex = rawStrings.indexWhere(
      (element) => element.startsWith('Resolution: '),
    );

    final bitResolution = double.parse(
      rawStrings[resolutionIndex]
          .split('Resolution: ')
          .last
          .replaceAll(',', '.'),
    );

    final canBusIndex = rawStrings.indexWhere(
      (element) => element.startsWith('CANBus Range: '),
    );

    final canBusRange = (
      min: int.tryParse(
        rawStrings[canBusIndex].split('CANBus Range: ').last.split(' - ').first,
      ),
      max: int.tryParse(
        rawStrings[canBusIndex].split('CANBus Range: ').last.split(' - ').last,
      ),
    );

    return Iso11783DataDictionaryEntity._(
      rawStrings: rawStrings,
      id: id,
      name: name,
      definition: definition,
      unit: unit,
      unitDescription: unitDescription,
      assignedDeviceClasses: assignedDeviceClasses,
      bitResolution: bitResolution,
      canBusRange: canBusRange,
      comment: comment,
    );
  }

  const Iso11783DataDictionaryEntity._({
    required this.rawStrings,
    required this.id,
    required this.name,
    required this.definition,
    required this.unit,
    required this.unitDescription,
    required this.assignedDeviceClasses,
    required this.bitResolution,
    required this.canBusRange,
    this.comment,
  });

  /// Raw strings used to generate this.
  final List<String> rawStrings;

  /// Unique number for identifying this.
  final int id;

  /// Name of this.
  final String name;

  /// Definition of this.
  final String definition;

  /// Comment on this.
  final String? comment;

  /// Physical unit of this.
  final String unit;

  /// A short description of [unit].
  final String unitDescription;

  /// [DeviceClass]es that this is typically used by.
  final List<DeviceClass> assignedDeviceClasses;

  /// Bit resolution for changing integer range `[0, 2147483647]` to a display
  /// (often decimal) range.
  ///
  /// Example [bitResolution] = `0.01` gives display range
  /// `[0 - 21474836,47]`.
  final double bitResolution;

  /// The range of allowed values over CANBus
  final ({int? min, int? max}) canBusRange;

  /// The range of allowed display numbers.
  ({num? min, num? max}) get displayRange => (
    min: canBusRange.min != null ? canBusRange.min! * bitResolution : null,
    max: canBusRange.max != null ? canBusRange.max! * bitResolution : null,
  );

  /// DDI value in hex format, useful for comparing DDIs in
  /// [Iso11783Element]s.
  String get ddi => id.toRadixString(16).toUpperCase().padLeft(4, '0');

  @override
  String toString() => [
    'Iso11783DataDictionaryEntity(',
    [
      'name: $name',
      'id: $id',
      'ddi: $ddi',
      'definition: $definition',
      if (comment != null) 'comment: $comment',
      'unit: $unit',
      'unitDescription: $unitDescription',
      'assignedDeviceClasses: $assignedDeviceClasses',
      'bitResolution: $bitResolution',
      'canBusRange: ${canBusRange.min} - ${canBusRange.max}',
    ].join(', '),
    ')',
  ].join('\n');

  @override
  int get hashCode => Object.hashAll([
    const ListEquality<String>().hash(rawStrings),
    id,
    name,
    definition,
    unit,
    unitDescription,
    const ListEquality<DeviceClass>().hash(assignedDeviceClasses),
    bitResolution,
    canBusRange,
    comment,
  ]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Iso11783DataDictionaryEntity &&
          const ListEquality<Object?>().equals(
            [
              ...rawStrings,
              id,
              name,
              definition,
              unit,
              unitDescription,
              ...assignedDeviceClasses,
              bitResolution,
              canBusRange,
              comment,
            ],
            [
              ...other.rawStrings,
              other.id,
              other.name,
              other.definition,
              other.unit,
              other.unitDescription,
              ...other.assignedDeviceClasses,
              other.bitResolution,
              other.canBusRange,
              other.comment,
            ],
          );
}
