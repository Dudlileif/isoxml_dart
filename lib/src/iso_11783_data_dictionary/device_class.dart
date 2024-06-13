// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:isoxml_dart/isoxml_dart.dart';

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
