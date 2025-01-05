// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element included in a [Task] and contains information about which
/// [ProcessDataVariable]s values shall be logged as  [DataLogValue]s during
/// task processing.
///
/// The reference to the [deviceElementIdRef] can be added on the mobile system,
/// as soon as a [Device] is allocated to the [Task]. When the reference to the
/// [DeviceElement] is already given at FMIS then a specific device was planned
/// for the task. The attributes of the [DataLogTrigger] define the behaviour of
/// the task controller, regarding how to collect and store the
/// [ProcessDataVariable] values.
///
/// The data log methods `time interval`, `distance interval` and `on change`
/// can be used in any combination. The logging is triggered by the event that
/// occurs first, and all active methods of these three data log methods are
/// then restarted. Additionally, the `threshold limits` method can be added.
/// With this addition, the logging is triggered when the logging value enters
/// the value range specified by the threshold limit definitions and is enabled
/// as long as the value is within the value range specified by the threshold
/// limit definitions.
///
/// If the [thresholdMinimum] is smaller than the [thresholdMaximum], data
/// logging is enabled when the value is between the [thresholdMinimum] and the
/// [thresholdMaximum]. If the [thresholdMinimum] is larger than the
/// [thresholdMaximum], data logging is enabled when the value is larger than
/// the [thresholdMinimum] or smaller than the [thresholdMaximum].
///
/// The data log method `counter` is independent of the other data log methods
/// and can be used with any combination described above. [DataLogValue]s of the
///  type `counter` shall be stored once per task in the data transfer file.
///
/// A maximum of 10 messages per process data variable per second can be
/// transmitted by a device.
///
/// Values from Parameter Group Numbers can be logged by specification of the
/// attributes [pgn], [pgnStartBit] and [pgnStopBit]. When these
/// attributes are specified, the [ddi] attribute shall be set to `DFFE`
/// (PGN logvalue).
@CopyWith()
@annotation.XmlRootElement(name: 'DLT')
@annotation.XmlSerializable(createMixin: true)
class DataLogTrigger extends Iso11783Element
    with _$DataLogTriggerXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [DataLogTrigger] with verified
  /// arguments.
  factory DataLogTrigger({
    required String ddi,
    required int method,
    int? distanceInterval,
    int? timeInterval,
    int? thresholdMinimum,
    int? thresholdMaximum,
    int? thresholdChange,
    String? deviceElementIdRef,
    String? valuePresentationIdRef,
    int? pgn,
    int? pgnStartBit,
    int? pgnStopBit,
  }) {
    ArgumentValidation.checkHexStringLength(
      ddi,
      name: 'ddi',
    );
    ArgumentValidation.checkValueInRange(
      value: method,
      min: 1,
      max: 31,
      name: 'method',
    );
    if (distanceInterval != null) {
      ArgumentValidation.checkValueInRange(
        value: distanceInterval,
        min: 0,
        max: 1000000,
        name: 'distanceInterval',
      );
    }
    if (timeInterval != null) {
      ArgumentValidation.checkValueInRange(
        value: timeInterval,
        min: 0,
        max: 60000,
        name: 'timeInterval',
      );
    }
    if (thresholdMinimum != null) {
      ArgumentValidation.checkValueInRange(
        value: thresholdMinimum,
        min: -2147483647,
        max: 2147483647,
        name: 'thresholdMinimum',
      );
    }
    if (thresholdMaximum != null) {
      ArgumentValidation.checkValueInRange(
        value: thresholdMaximum,
        min: -2147483647,
        max: 2147483647,
        name: 'thresholdMaximum',
      );
    }
    if (thresholdChange != null) {
      ArgumentValidation.checkValueInRange(
        value: thresholdChange,
        min: -2147483647,
        max: 2147483647,
        name: 'thresholdChange',
      );
    }
    if (deviceElementIdRef != null) {
      ArgumentValidation.checkId(
        id: deviceElementIdRef,
        idRefPattern: DeviceElement.staticIdRefPattern,
        idName: 'deviceElementIdRef',
      );
    }
    if (valuePresentationIdRef != null) {
      ArgumentValidation.checkId(
        id: valuePresentationIdRef,
        idRefPattern: ValuePresentation.staticIdRefPattern,
        idName: 'valuePresentationIdRef',
      );
    }
    if (pgn != null) {
      ArgumentValidation.checkValueInRange(
        value: pgn,
        min: 0,
        max: 262143,
        name: 'pgn',
      );
      if (ddi != 'DFFE') {
        throw ArgumentError.value(
          [ddi, pgn],
          '[ddi, pgn]',
          'When pgn is set, ddi MUST be "DFFE"',
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

    return DataLogTrigger._(
      ddi: ddi,
      method: method,
      distanceInterval: distanceInterval,
      timeInterval: timeInterval,
      thresholdMinimum: thresholdMinimum,
      thresholdMaximum: thresholdMaximum,
      thresholdChange: thresholdChange,
      deviceElementIdRef: deviceElementIdRef,
      valuePresentationIdRef: valuePresentationIdRef,
      pgn: pgn,
      pgnStartBit: pgnStartBit,
      pgnStopBit: pgnStopBit,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const DataLogTrigger._({
    required this.ddi,
    required this.method,
    this.distanceInterval,
    this.timeInterval,
    this.thresholdMinimum,
    this.thresholdMaximum,
    this.thresholdChange,
    this.deviceElementIdRef,
    this.valuePresentationIdRef,
    this.pgn,
    this.pgnStartBit,
    this.pgnStopBit,
  }) : super(
          elementType: Iso11783ElementType.dataLogTrigger,
          description: 'DataLogTrigger',
        );

  /// Creates a [DataLogTrigger] from [element].
  factory DataLogTrigger.fromXmlElement(XmlElement element) =>
      _$DataLogTriggerFromXmlElement(element);

  /// A unique Data Dictionary Identifier which identifies a
  /// [ProcessDataVariable].
  ///
  /// The [ProcessDataVariable] is found as a Device Dictionary Entity (DDE)
  /// in the ISO 11783-11 database.
  @annotation.XmlAttribute(name: 'A')
  final String ddi;

  /// Selection of the log method:
  ///
  /// `1 = time interval`,
  /// `2 = distance interval`,
  /// `4 = threshold limits`,
  /// `8 = on change`,
  /// `16 = counter`
  @annotation.XmlAttribute(name: 'B')
  final int method;

  /// Distance interval for data log in millimeters.
  ///
  /// 0 stops measurement.
  @annotation.XmlAttribute(name: 'C')
  final int? distanceInterval;

  /// Time interval for data lag in milliseconds.
  ///
  /// 0 stops measurement. 10 msec is minimum time interval.
  @annotation.XmlAttribute(name: 'D')
  final int? timeInterval;

  /// Minimum threshold to activate the data log.
  ///
  /// Threshold limit value is included in the value range to log.
  /// (2^31 -1) stops measurement.
  @annotation.XmlAttribute(name: 'E')
  final int? thresholdMinimum;

  /// Maximum threshold to activate the data log.
  ///
  /// Threshold limit value is included in the value range to log.
  /// (-2^31 +1) stops measurement.
  @annotation.XmlAttribute(name: 'F')
  final int? thresholdMaximum;

  /// Change threshold to activate the data log.
  /// 0 stops measurement, 1 lags each change.
  @annotation.XmlAttribute(name: 'G')
  final int? thresholdChange;

  /// ID reference to the [DeviceElement] this log value was supplied by.
  @annotation.XmlAttribute(name: 'H')
  final String? deviceElementIdRef;

  /// ID reference to the [ValuePresentation] to use with this log.
  @annotation.XmlAttribute(name: 'I')
  final String? valuePresentationIdRef;

  /// Parameter Group Number to log a value from.
  @annotation.XmlAttribute(name: 'J')
  final int? pgn;

  /// First bit of the value to log from a Parameter Group Number.
  ///
  /// Bit 0 is the least significant bit of Byte 0 in the Data Field of a CAN
  /// Data Frame. The start bit is included in the value and becomes the least
  /// significant bit.
  @annotation.XmlAttribute(name: 'K')
  final int? pgnStartBit;

  /// Stop bit of the value to log from a Parameter Group Number.
  ///
  /// The stop bit is included in the value and becomes the most significant
  /// bit.
  @annotation.XmlAttribute(name: 'L')
  final int? pgnStopBit;

  @override
  List<Object?> get props => [
        ddi,
        method,
        distanceInterval,
        timeInterval,
        thresholdMinimum,
        thresholdMaximum,
        thresholdChange,
        deviceElementIdRef,
        valuePresentationIdRef,
        pgn,
        pgnStartBit,
        pgnStopBit,
      ];
}
