// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:isoxml_dart/src/iso_11783_xml_elements/argument_validation.dart';
import 'package:test/test.dart';

void main() {
  group('Test ArgumentValidation', () {
    group('.chedkId', () {
      test(
        'with valid base station id',
        () {
          Object? error;
          try {
            ArgumentValidation.checkId(
              id: 'BSN0001',
              idRefPattern: BaseStation.idRefPattern,
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
      test(
        'with invalid base station id',
        () {
          Object? error;
          try {
            ArgumentValidation.checkId(
              id: 'BS0001',
              idRefPattern: BaseStation.idRefPattern,
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            isArgumentError,
          );
        },
      );
      test(
        'with wrong maxLength',
        () {
          Object? error;
          try {
            ArgumentValidation.checkId(
              id: 'BSN10',
              idRefPattern: BaseStation.idRefPattern,
              maxLength: 4,
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            isArgumentError,
          );
        },
      );
      test(
        'with wrong id ref pattern',
        () {
          Object? error;
          try {
            ArgumentValidation.checkId(
              id: 'BSN10',
              idRefPattern: Partfield.idRefPattern,
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            isArgumentError,
          );
        },
      );
    });
    group('.checkStringLength', () {
      test(
        'with too long string',
        () {
          Object? error;
          try {
            ArgumentValidation.checkStringLength(
              'Test string which is 39 characters long',
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            isArgumentError,
          );
        },
      );
      test(
        'with exact length string',
        () {
          Object? error;
          try {
            ArgumentValidation.checkStringLength(
              'Test string which is 39 characters long',
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
              idRefPattern: Partfield.idRefPattern,
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
      test(
        'wrong id ref pattern',
        () {
          Object? error;
          try {
            ArgumentValidation.checkIdAndDesignator(
              id: 'PFD100',
              designator: 'Some field in the world',
              idRefPattern: Product.idRefPattern,
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            isArgumentError,
          );
        },
      );
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
      test(
        'under minimum',
        () {
          Object? error;
          try {
            ArgumentValidation.checkValueInRange(
              value: 123,
              min: 150,
              max: 200,
              name: 'test',
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            isArgumentError,
          );
        },
      );
      test(
        'over maximum',
        () {
          Object? error;
          try {
            ArgumentValidation.checkValueInRange(
              value: 223,
              min: 100,
              max: 200,
              name: 'test',
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            isArgumentError,
          );
        },
      );
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
      test(
        'hex outside range',
        () {
          Object? error;
          try {
            ArgumentValidation.checkValueInRange(
              value: 123,
              min: 150,
              max: 200,
              name: 'test',
              hex: true,
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            isArgumentError,
          );
        },
      );
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
      test(
        'too short',
        () {
          Object? error;
          try {
            ArgumentValidation.checkHexStringLength(
              '0DE',
              name: 'test',
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            isArgumentError,
          );
        },
      );
      test(
        'too long',
        () {
          Object? error;
          try {
            ArgumentValidation.checkHexStringLength(
              '0DEA6',
              name: 'test',
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            isArgumentError,
          );
        },
      );
      test(
        'maxBytes < minBytes throws FormatException',
        () {
          Object? error;
          try {
            ArgumentValidation.checkHexStringLength(
              '11F2',
              name: 'test',
              maxBytes: 3,
              minBytes: 4,
            );
          } catch (e) {
            error = e;
          }
          expect(
            error,
            isFormatException,
          );
        },
      );
    });
  });
}
