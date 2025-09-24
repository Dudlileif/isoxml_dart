// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that specifies a single value of a single [ProcessDataVariable],
/// specified by its DDI and supplied by a single [DeviceElement].
///
/// The [deviceElementIdRef] references the appropriate [DeviceElement].
/// The position and time of a [DataLogValue] is specified with a [Time] element
/// in the [Task], and by this relation all [DataLogValue]s belong to a [Task].
/// [DataLogValue]s are part of the data logging functionality of the task
/// controller.
///
/// When the values are logged from a Parameter Group Number (PGN), the
/// attributes [pgn], [pgnStartBit] and [pgnStopBit] are used and the
/// [processDataDDI] attribute shall be set to `'DFFE'` (PGN logvalue).

class DataLogValue extends Iso11783Element {
  /// Default factory for creating a [DataLogValue] with verified
  /// arguments.
  factory DataLogValue({
    required String processDataDDI,
    required int processDataValue,
    required String deviceElementIdRef,
    int? pgn,
    int? pgnStartBit,
    int? pgnStopBit,
  }) {
    ArgumentValidation.checkHexStringLength(
      processDataDDI,
      name: 'processDataDDI',
    );
    ArgumentValidation.checkValueInRange(
      value: processDataValue,
      min: -2147483648,
      max: 2147483647,
      name: 'processDataValue',
    );
    ArgumentValidation.checkId(
      id: deviceElementIdRef,
      idRefPattern: DeviceElement.staticIdRefPattern,
      idName: 'deviceElementIdRef',
    );
    if (pgn != null) {
      ArgumentValidation.checkValueInRange(
        value: pgn,
        min: 0,
        max: 262143,
        name: 'pgn',
      );
      if (processDataDDI != 'DFFE') {
        throw ArgumentError.value(
          [processDataDDI, pgn],
          '[processDataDDI, pgn]',
          'When pgn is set, processDataDDI MUST be "DFFE"',
        );
      }
    }
    if (pgnStartBit != null) {
      ArgumentValidation.checkValueInRange(
        value: pgnStartBit,
        min: 0,
        max: 63,
        name: 'pgnStartBit',
      );
    }
    if (pgnStopBit != null) {
      ArgumentValidation.checkValueInRange(
        value: pgnStopBit,
        min: 0,
        max: 63,
        name: 'pgnStopBit',
      );
    }
    return DataLogValue._(
      processDataDDI: processDataDDI,
      processDataValue: processDataValue,
      deviceElementIdRef: deviceElementIdRef,
      pgn: pgn,
      pgnStartBit: pgnStartBit,
      pgnStopBit: pgnStopBit,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  DataLogValue._({
    required String processDataDDI,
    required int processDataValue,
    required String deviceElementIdRef,
    int? pgn,
    int? pgnStartBit,
    int? pgnStopBit,
  }) : super(
         elementType: Iso11783ElementType.dataLogValue,
         description: 'DataLogValue',
       ) {
    this.processDataDDI = processDataDDI;
    this.processDataValue = processDataValue;
    this.deviceElementIdRef = deviceElementIdRef;
    this.pgn = pgn;
    this.pgnStartBit = pgnStartBit;
    this.pgnStopBit = pgnStopBit;
  }

  /// A unique Data Dictionary Identifier which identifies a
  /// [ProcessDataVariable].
  ///
  /// The [ProcessDataVariable] is found as a Device Dictionary Entity (DDE)
  /// in the ISO 11783-11 database.
  String get processDataDDI => parseString('A');
  set processDataDDI(String value) => setString('A', value);

  /// Value of the process data.
  int get processDataValue => parseInt('B');
  set processDataValue(int value) => setInt('B', value);

  /// ID reference to the [DeviceElement] this log value was supplied by.
  String get deviceElementIdRef => parseString('C');
  set deviceElementIdRef(String value) => setString('C', value);

  /// Parameter Group Number to log a value from.
  int? get pgn => tryParseInt('D');
  set pgn(int? value) => setIntNullable('D', value);

  /// First bit of the value to log from a Parameter Group Number.
  ///
  /// Bit 0 is the least significant bit of Byte 0 in the Data Field of a CAN
  /// Data Frame. The start bit is included in the value and becomes the least
  /// significant bit.
  int? get pgnStartBit => tryParseInt('E');
  set pgnStartBit(int? value) => setIntNullable('E', value);

  /// Stop bit of the value to log from a Parameter Group Number.
  ///
  /// The stop bit is included in the value and becomes the most significant
  /// bit.
  int? get pgnStopBit => tryParseInt('F');
  set pgnStopBit(int? value) => setIntNullable('F', value);
}
