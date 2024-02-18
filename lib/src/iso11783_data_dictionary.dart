// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:isoxml/isoxml.dart';

/// A class that represents the ISO 11783-11 Data Dictionary which specifies the
/// identifiers for the data elements used in the Process Data message defined
/// by ISO 11783-10 for a serial data network for control and communications on
/// forestry or agricultural tractors and mounted, semi-mounted, towed or
/// self-propelled implements.
class Iso11783DataDictionary {
  /// Creates an [Iso11783DataDictionary] from the [raw].
  ///
  /// [raw] is expected to be the whole content of the `export.txt` file
  /// that can be downloaded at [isobus.net](https://isobus.net/).
  factory Iso11783DataDictionary(String raw) {
    final lines = raw.split('\n')..removeWhere((element) => element.isEmpty);

    final version = lines
        .firstWhere((element) => element.startsWith('Version: '))
        .split('Version: ')
        .last;

    final indexOfFirstEntity =
        lines.indexWhere((element) => element.startsWith('DD Entity: '));

    final entities = <Iso11783DataDictionaryEntity>[];

    final entity = <String>[];
    for (final line in lines.sublist(indexOfFirstEntity)) {
      if (line.startsWith('DD Entity: ')) {
        if (entity.isNotEmpty) {
          entities.add(Iso11783DataDictionaryEntity(entity));
          entity.clear();
        }
      }
      entity.add(line);
    }
    if (entity.isNotEmpty) {
      entities.add(Iso11783DataDictionaryEntity(entity));
    }

    return Iso11783DataDictionary._(entities: entities, version: version);
  }

  const Iso11783DataDictionary._({
    required this.entities,
    required this.version,
  });

  /// All the entities in the data directory.
  final List<Iso11783DataDictionaryEntity> entities;

  /// Version of the data directory, typically a date.
  final String version;

  /// Finds the matching entity by looking up by the [ddi] hex string of
  /// the [Iso11783DataDictionaryEntity.id].
  Iso11783DataDictionaryEntity findEntityByDDI(String ddi) => entities
      .firstWhere((element) => element.ddi.toUpperCase() == ddi.toUpperCase());
}

/// An entry in the ISO 11783-11 Data Directory.
///
/// The up-to-date complete database can be found at [isobus.net/isobus](https://www.isobus.net/isobus/).
/// A browsable and searchable version is at [isobus.net/isobus/dDEntity](https://www.isobus.net/isobus/dDEntity).
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
    final id =
        int.parse(rawStrings.first.split('DD Entity: ').last.split(' ').first);
    final name = rawStrings.first.split('DD Entity: $id ').last;

    final definition = rawStrings.elementAt(1);

    final typicallyUsedLineIndex = rawStrings
        .indexWhere((element) => element.startsWith('Typically used'));

    final unitLineIndex =
        rawStrings.indexWhere((element) => element.startsWith('Unit:'));

    final assignedDeviceClasses = <DeviceClass>[];

    for (var i = typicallyUsedLineIndex + 1; i < unitLineIndex; i++) {
      final value = int.tryParse(rawStrings[i].split(' ').first);
      if (value != null) {
        assignedDeviceClasses.add(DeviceClass.values[value]);
      }
    }

    final unit =
        rawStrings[unitLineIndex].split('Unit: ').last.split(' - ').first;

    final unitDescription =
        rawStrings[unitLineIndex].split('Unit: ').last.split(' - ').last;

    final resolutionIndex =
        rawStrings.indexWhere((element) => element.startsWith('Resolution: '));

    final bitResolution = double.parse(
      rawStrings[resolutionIndex]
          .split('Resolution: ')
          .last
          .replaceAll(',', '.'),
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
  });

  /// Raw strings used to generate this.
  final List<String> rawStrings;

  /// Unique number for identifying this.
  final int id;

  /// Name of this.
  final String name;

  /// Definition of this.
  final String definition;

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

  /// DDI value in hex format, useful for comparing DDIs in
  /// [Iso11783Element]s.
  String get ddi => id.toRadixString(16).toUpperCase().padLeft(4, '0');
}

/// An enumerator for separating the different type of device classes that
/// [Iso11783DataDictionaryEntity] can be assigned to in the
/// [Iso11783DataDictionary].
enum DeviceClass {
  /// Non-specific system
  nonSpecificSystem(0, 'Non-specific system'),

  /// Tractor
  tractor(1, 'Tractor'),

  /// Primary Soil Tillage
  primarySoilTillage(2, 'Primary Soil Tillage'),

  /// Secondary Soil Tillage
  secondarySoilTillage(3, 'Secondary Soil Tillage'),

  /// Planter / Seeder
  planterOrSeeder(4, 'Planter / Seeder'),

  /// Fertilizer
  fertilizer(5, 'Fertilizer'),

  /// Sprayer
  sprayer(6, 'Sprayer'),

  /// Harvester
  harvester(7, 'Harvester'),

  /// Root Harvester
  rootHarvester(8, 'Root Harvester'),

  /// Forage Harvester
  forageHarvester(9, 'Forage harvester'),

  /// Irrigation
  irrigation(10, 'Irrigation'),

  /// Transport / Trailer
  transportOrTrailer(11, 'Transport / Trailer'),

  /// Farmyard Work
  farmyardWork(12, 'Farmyard Work'),

  /// Powered Auxiliary Unit
  poweredAuxiliaryUnit(13, 'Powered Auxiliary Unit'),

  /// Special Crop
  specialCrop(14, 'Special Crop'),

  /// Municipal Work
  municipalWork(15, 'Municipal Work'),

  /// Skidder
  skidder(16, 'Skidder'),

  /// Sensor system
  sensorSystem(17, 'Sensor System'),

  /// Reserved For For Future Assignment
  reservedForFutureAssignment(18, 'Reserved For For Future Assignment'),

  /// Timber Harvesters
  timberHarvester(19, 'Timber Harvester'),

  /// Forwarder (Forestry)
  forwarder(20, 'Forwarder'),

  /// Timber Loader
  timberLoader(21, 'Timber Loader'),

  /// Timber Processing Machine
  timberProcessingMachine(22, 'Timber Processing Machine'),

  /// Mulcher
  mulcher(23, 'Mulcher'),

  /// Utility Vehicle
  utilityVehicle(24, 'Utility Vehicle'),

  /// Slurry Applicator
  slurryApplicator(25, 'Slurry Applicator'),

  /// Feeder / Mixer
  feederOrMixer(26, 'Feeder / Mixer'),

  /// Weeder
  weeder(27, 'Weeder'),

  /// Not Available
  notAvailable(127, 'Not Available');

  const DeviceClass(this.id, this.name);

  /// Identification number for this value..
  final int id;

  /// A descriptive name of the value.
  final String name;
}
