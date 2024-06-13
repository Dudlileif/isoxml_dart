// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

@TestOn('vm')
library;

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:test/test.dart';

void main() async {
  final url = Uri.https('isobus.net', 'isobus/exports/completeTXT');

  final dictionaryString = await http.read(url);

  final dictionary =
      Iso11783DataDictionary(utf8.decode(dictionaryString.codeUnits));

  group('Parse dictionary', () {
    final version = dictionaryString
        .split('\n')
        .firstWhere((element) => element.startsWith('Version:'))
        .split('Version: ')
        .last;
    test(
      'Check version: $version',
      () => expect(
        dictionary.version,
        version,
      ),
    );
    final length = 'DD Entity: '.allMatches(dictionaryString).length - 1;
    test(
      'Check number of entities: $length',
      () => expect(
        dictionary.entities.length,
        length,
      ),
    );
    group(
      'Check entity with DDI="000F"=15',
      () {
        final entity = dictionary.findEntityByDDI('000F');
        test(
          'Entity exists',
          () => expect(
            entity,
            isA<Iso11783DataDictionaryEntity>(),
          ),
        );
        test(
          'findEntityByID == findEntityByDDI',
          () => expect(entity, dictionary.findEntityByID(15)),
        );
        test(
          'Entity id = 15',
          () => expect(
            entity.id,
            15,
          ),
        );
        test(
          'Check device classes',
          () => expect(entity.assignedDeviceClasses, [
            DeviceClass.planterOrSeeder,
            DeviceClass.fertilizer,
            DeviceClass.sprayer,
          ]),
        );
        test('Check unit = /m²', () => expect(entity.unit, '/m²'));
        test(
          'Check unit description',
          () => expect(entity.unitDescription, 'Quantity per area unit'),
        );
        test(
          'Bit resolution = 0.001',
          () => expect(entity.bitResolution, 0.001),
        );
        test(
          'CANBus range = 0 - 2147483647',
          () => expect(entity.canBusRange, (min: 0, max: 2147483647)),
        );
        test(
          'Display range = 0,000 - 2147483,647',
          () => expect(entity.displayRange, (min: 0, max: 2147483.647)),
        );
        test(
          'toString()',
          () => expect(entity.toString(), '''
Iso11783DataDictionaryEntity(
name: Maximum Count Per Area Application Rate, id: 15, ddi: 000F, definition: Maximum Application Rate specified as count per area, comment: supplied by device as physical maximum, unit: /m², unitDescription: Quantity per area unit, assignedDeviceClasses: [DeviceClass.planterOrSeeder, DeviceClass.fertilizer, DeviceClass.sprayer], bitResolution: 0.001, canBusRange: 0 - 2147483647
)'''),
        );
      },
    );
  });
}
