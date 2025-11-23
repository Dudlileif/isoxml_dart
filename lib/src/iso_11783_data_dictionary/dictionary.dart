// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:collection/collection.dart';
import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:meta/meta.dart';

/// A class that represents the ISO 11783-11 Data Dictionary which specifies the
/// identifiers for the data elements used in the Process Data message defined
/// by ISO 11783-10 for a serial data network for control and communications on
/// forestry or agricultural tractors and mounted, semi-mounted, towed or
/// self-propelled implements.
@immutable
class Iso11783DataDictionary {
  /// Creates an [Iso11783DataDictionary] from the [raw] string.
  ///
  /// [raw] is expected to be the whole content of the `export.txt` file
  /// that can be downloaded at [isobus.net](https://isobus.net/).
  factory Iso11783DataDictionary(String raw) {
    final lines = raw.split('\n')..removeWhere((element) => element.isEmpty);

    final version = lines
        .firstWhere((element) => element.startsWith('Version: '))
        .split('Version: ')
        .last;

    final indexOfFirstEntity = lines.indexWhere(
      (element) => element.startsWith('DD Entity: '),
    );

    final entities = <Iso11783DataDictionaryEntity>[];

    final entity = <String>[];
    for (final line in lines.sublist(indexOfFirstEntity)) {
      if (line.startsWith('DD Entity: ')) {
        if (entity.isNotEmpty) {
          final id = int.parse(
            entity.first.split('DD Entity: ').last.split(' ').first,
          );
          // Skip entity 57344 as it's a reference to the proprietary range
          // 57344-65534
          if (id != 57344) {
            entities.add(Iso11783DataDictionaryEntity(List.from(entity)));
          }
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

  /// Finds the matching entity by looking up by the [id] of
  /// the [Iso11783DataDictionaryEntity.id].
  Iso11783DataDictionaryEntity findEntityByID(int id) =>
      entities.firstWhere((element) => element.id == id);

  @override
  int get hashCode => Object.hashAll([
    const ListEquality<Iso11783DataDictionaryEntity>().hash(entities),
    version,
  ]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Iso11783DataDictionary &&
          const ListEquality<Iso11783DataDictionaryEntity>().equals(
            entities,
            other.entities,
          ) &&
          version == other.version;
}
