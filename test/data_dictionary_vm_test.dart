// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

@TestOn('vm')

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:isoxml/isoxml.dart';
import 'package:test/test.dart';

void main() async {
  final url = Uri.https('isobus.net', 'isobus/exports/completeTXT');

  final dictionaryString = await http.read(url);

  final dictionary =
      Iso11783DataDictionary(utf8.decode(dictionaryString.codeUnits));
  group('Parse dictionary', () {
    test('Check version', () => expect(dictionary.version, '2024020502'));
    test(
      'Check number of entities',
      () => expect(dictionary.entities.length, 715),
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
      },
    );
  });
}
