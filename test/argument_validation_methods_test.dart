// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Allow catching all errors and exceptions
// ignore_for_file: avoid_catches_without_on_clauses

import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:isoxml_dart/src/iso_11783_xml_elements/utils/argument_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Test ArgumentValidation', () {
    group('.checkId', () {
      test(
        'with valid base station id',
        () {
          Object? error;
          try {
            ArgumentValidation.checkId(
              id: 'BSN1',
              idRefPattern: BaseStation.staticIdRefPattern,
              name: 'BaseStation.id',
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            null,
          );
        },
      );
      test('with invalid base station id, wrong tag', () {
        expect(
          () => ArgumentValidation.checkId(
            id: 'BS0001',
            idRefPattern: BaseStation.staticIdRefPattern,
            name: 'BaseStation.id',
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'BaseStation.id',
            ),
          ),
        );
      });
      test('with invalid base station id, leading zeros', () {
        expect(
          () => ArgumentValidation.checkId(
            id: 'BSN00001',
            idRefPattern: BaseStation.staticIdRefPattern,
            name: 'BaseStation.id',
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'BaseStation.id',
            ),
          ),
        );
      });
      test('with wrong maxLength', () {
        expect(
          () => ArgumentValidation.checkId(
            id: 'BSN10',
            idRefPattern: BaseStation.staticIdRefPattern,
            maxLength: 4,
            name: 'BaseStation.id',
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'BaseStation.id',
            ),
          ),
        );
      });
      test('with wrong id ref pattern', () {
        expect(
          () => ArgumentValidation.checkId(
            id: 'BSN10',
            idRefPattern: Partfield.staticIdRefPattern,
            name: 'BaseStation.id',
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'BaseStation.id',
            ),
          ),
        );
      });
    });
    group('.checkStringLength', () {
      test('with too long string', () {
        expect(
          () => ArgumentValidation.checkStringLength(
            'Test string which is 39 characters long',
            name: 'Name',
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'Name',
            ),
          ),
        );
      });
      test(
        'with exact length string',
        () {
          Object? error;
          try {
            ArgumentValidation.checkStringLength(
              'Test string which is 39 characters long',
              name: 'Name',
              maxLength: 39,
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            null,
          );
        },
      );
    });
    group('.checkIdAndDesignator', () {
      test(
        'passing arguments',
        () {
          Object? error;
          try {
            ArgumentValidation.checkIdAndDesignator(
              id: 'PFD100',
              designator: 'Some field in the world',
              idRefPattern: Partfield.staticIdRefPattern,
              idName: 'Partfield.id',
              designatorName: 'Partfield.designator',
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            null,
          );
        },
      );
      test('wrong id ref pattern', () {
        expect(
          () => ArgumentValidation.checkIdAndDesignator(
            id: 'PFD100',
            designator: 'Some field in the world',
            idRefPattern: Product.staticIdRefPattern,
            idName: 'Partfield.id',
            designatorName: 'Partfield.designator',
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'Partfield.id',
            ),
          ),
        );
      });
    });
    group('.checkValueInRange', () {
      test(
        'passing arguments',
        () {
          Object? error;
          try {
            ArgumentValidation.checkValueInRange(
              value: 123,
              min: 100,
              max: 200,
              name: 'test',
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            null,
          );
        },
      );
      test('under minimum', () {
        expect(
          () => ArgumentValidation.checkValueInRange(
            value: 123,
            min: 150,
            max: 200,
            name: 'test',
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'test',
            ),
          ),
        );
      });
      test('over maximum', () {
        expect(
          () => ArgumentValidation.checkValueInRange(
            value: 223,
            min: 100,
            max: 200,
            name: 'test',
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'test',
            ),
          ),
        );
      });
      test(
        'hex passing',
        () {
          Object? error;
          try {
            ArgumentValidation.checkValueInRange(
              value: 123,
              min: 100,
              max: 200,
              name: 'test',
              hex: true,
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            null,
          );
        },
      );
      test('hex outside range', () {
        expect(
          () => ArgumentValidation.checkValueInRange(
            value: 123,
            min: 150,
            max: 200,
            name: 'test',
            hex: true,
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'test',
            ),
          ),
        );
      });
    });
    group('.checkHexStringLength', () {
      test(
        'passing',
        () {
          Object? error;
          try {
            ArgumentValidation.checkHexStringLength(
              '0DEF',
              name: 'test',
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            null,
          );
        },
      );
      test('too short', () {
        expect(
          () => ArgumentValidation.checkHexStringLength(
            '0DE',
            name: 'test',
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'test',
            ),
          ),
        );
      });
      test('too long', () {
        expect(
          () => ArgumentValidation.checkHexStringLength(
            '0DEA6',
            name: 'test',
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'test',
            ),
          ),
        );
      });
      test(
        'maxBytes < minBytes throws FormatException',
        () {
          expect(
            () => ArgumentValidation.checkHexStringLength(
              '11F2',
              name: 'test',
              maxBytes: 3,
              minBytes: 4,
            ),
            throwsFormatException,
          );
        },
      );
    });
  });
}
