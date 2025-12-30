// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element for collecting [DataLogValue]s from external binary files.
///
/// [Time] elements are used as embedded lists inside the data transfer file
/// or as a time template specification in the [TimeLog] element. [TimeLog]
/// enables the collection of all [DataLogValue]s in a binary-coded data log
/// file. Within the [TimeLog] element, the [TimeType] attribute of the [Time]
/// element shall be set to [TimeType.effective]. The [type] attribute is
/// defined to enable future expansion of the data logging method. The value of
/// the [type] shall be set a value of [TimeLogType.binaryTimeLogFileType1] for
/// the current data logging method.
///
/// [TimeLog] is always related to a [Task] and refers to a set of two files of
/// a unique name. Both files shall exist in the same folder as the data
/// transfer file. The name of the files shall be unique over all [TimeLog]s
/// referred to by all tasks of a data transfer file.
class TimeLog extends Iso11783Element {
  /// Default factory for creating a [TimeLog] with verified
  /// arguments.
  factory TimeLog({
    required String filename,
    int? fileLength,
    TimeLogType type = TimeLogType.binaryTimeLogFileType1,
    Uint8List? byteData,
    TimeLogHeader? header,
    List<Time>? records,
  }) {
    _argumentValidator(
      filename: filename,
      fileLength: fileLength,
      type: type,
      byteData: byteData,
      header: header,
      records: records,
    );

    return TimeLog._(
      filename: filename,
      fileLength: fileLength,
      byteData: byteData ?? Uint8List(0),
      type: type,
      header: header,
      records: records,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  TimeLog._({
    required String filename,
    required this.byteData,
    int? fileLength,
    TimeLogType type = TimeLogType.binaryTimeLogFileType1,
    this.header,
    List<Time>? records,
  }) : super._(elementType: _elementType) {
    this.filename = filename;
    this.fileLength = fileLength;
    this.type = type;
    if (records != null) {
      this.records.addAll(records);
    }
  }

  TimeLog._fromXmlElement(XmlElement element, {Uint8List? byteData})
    : byteData = byteData ?? Uint8List(0),
      super._(elementType: _elementType, xmlElement: element) {
    _argumentValidator(
      filename: filename,
      fileLength: fileLength,
      type: type,
      byteData: byteData,
      header: header,
      records: records,
    );
  }

  static void _argumentValidator({
    required String filename,
    required int? fileLength,
    required TimeLogType type,
    required Uint8List? byteData,
    required TimeLogHeader? header,
    required List<Time>? records,
  }) {
    ArgumentValidation.checkId(
      id: filename,
      idRefPattern: fileNamePattern,
      name: 'TimeLog.filename',
    );
    if (fileLength != null) {
      ArgumentValidation.checkValueInRange(
        value: fileLength,
        min: 0,
        max: 4294967294,
        name: 'TimeLog.fileLength',
      );
    }
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.timeLog;

  /// Regular expression matching pattern for the [filename] of this.
  static const fileNamePattern = 'TLG[0-9]{5}';

  /// Unique name for the [TimeLog] file.
  String get filename => parseString('A');
  set filename(String value) => setString('A', value);

  /// Byte length of the [TimeLog] file.
  int? get fileLength => tryParseInt('B');
  set fileLength(int? value) => setIntNullable('B', value);

  /// Which type the [TimeLog] file is.
  ///
  /// Only [TimeLogType.binaryTimeLogFileType1] is possible.
  TimeLogType get type => TimeLogType.values.firstWhere(
    (type) => type.value == parseInt('C'),
    orElse: () => throw ArgumentError.value(
      xmlElement.getAttribute('C'),
      'TimeLog.type',
      'is not one of the supported values: ${TimeLogType.values.join(', ')}',
    ),
  );
  set type(TimeLogType value) => setInt('C', value.value);

  /// Byte data from the file at [filename].
  ///
  /// Can be empty if the external file is not loaded.
  Uint8List byteData;

  /// A header that describes the data format in the [byteData].
  TimeLogHeader? header;

  /// Logged [Time] records for this.
  final List<Time> records = [];

  /// Returns [byteData] parsed with [header] to a log of [Time] records.
  List<Time>? parseData() {
    records.clear();
    if (byteData.isNotEmpty && header != null) {
      var currentOffset = 0;
      final data = byteData.buffer.asByteData(0, byteData.lengthInBytes);

      while (currentOffset + 6 <= data.lengthInBytes) {
        final ms = data.getUint32(currentOffset, Endian.little);
        currentOffset += 4;
        final day = data.getUint16(currentOffset, Endian.little);
        currentOffset += 2;

        final time = DateTime.utc(1980).add(
          Duration(
            days: day,
            milliseconds: ms,
          ),
        );

        Position? position;
        if (header!.position != null) {
          final north = header!.position!.binaryHeaderOptions.readNorth
              ? 1e-7 * data.getInt32(currentOffset, Endian.little)
              : header!.position!.north ?? 0;
          if (header!.position!.binaryHeaderOptions.readNorth) {
            currentOffset += 4;
          }
          final east = header!.position!.binaryHeaderOptions.readEast
              ? 1e-7 * data.getInt32(currentOffset, Endian.little)
              : header!.position!.east ?? 0;
          if (header!.position!.binaryHeaderOptions.readEast) {
            currentOffset += 4;
          }
          final up = header!.position!.binaryHeaderOptions.readUp
              ? data.getInt32(currentOffset, Endian.little)
              : header!.position!.up;
          if (header!.position!.binaryHeaderOptions.readUp) {
            currentOffset += 4;
          }
          final status = header!.position!.binaryHeaderOptions.readStatus
              ? PositionStatus.values.firstWhere(
                  (element) => element.value == data.getUint8(currentOffset),
                )
              : header!.position!.status ?? PositionStatus.notAvailable;
          if (header!.position!.binaryHeaderOptions.readStatus) {
            currentOffset++;
          }
          final pdop = header!.position!.binaryHeaderOptions.readPdop
              ? 1e-1 * data.getUint16(currentOffset, Endian.little)
              : header!.position!.pdop;
          if (header!.position!.binaryHeaderOptions.readPdop) {
            currentOffset += 2;
          }
          final hdop = header!.position!.binaryHeaderOptions.readHdop
              ? 1e-1 * data.getUint16(currentOffset, Endian.little)
              : header!.position!.hdop;
          if (header!.position!.binaryHeaderOptions.readHdop) {
            currentOffset += 2;
          }
          final numberOfSatellites =
              header!.position!.binaryHeaderOptions.readNumberOfSatellites
              ? data.getUint8(currentOffset)
              : header!.position!.numberOfSatellites;
          if (header!.position!.binaryHeaderOptions.readNumberOfSatellites) {
            currentOffset++;
          }
          final gpsUtcTimeMs =
              header!.position!.binaryHeaderOptions.readGpsUtcTimeMs
              ? data.getUint32(currentOffset, Endian.little)
              : header!.position!.gpsUtcTimeMs;
          if (header!.position!.binaryHeaderOptions.readGpsUtcTimeMs) {
            currentOffset += 4;
          }
          final gpsUtcDate =
              header!.position!.binaryHeaderOptions.readGpsUtcDate
              ? data.getUint16(currentOffset, Endian.little)
              : header!.position!.gpsUtcDate;
          if (header!.position!.binaryHeaderOptions.readGpsUtcDate) {
            currentOffset += 2;
          }
          position = Position(
            north: north,
            east: east,
            up: up,
            status: status,
            pdop: pdop,
            hdop: hdop,
            numberOfSatellites: numberOfSatellites,
            gpsUtcTimeMs: gpsUtcTimeMs,
            gpsUtcDate: gpsUtcDate,
          );
        }

        final countDLVs = data.getUint8(currentOffset);
        currentOffset++;
        List<DataLogValue>? dataLogValues;
        if (countDLVs > 0) {
          dataLogValues = [];
          for (var i = 0; i < countDLVs; i++) {
            final dlvN = data.getUint8(currentOffset);
            currentOffset++;

            final pdv = data.getInt32(currentOffset, Endian.little);
            currentOffset += 4;

            final headerDataLogValue = header!.dataLogValues.elementAt(dlvN);
            dataLogValues.add(
              DataLogValue(
                processDataDDI: headerDataLogValue.processDataDDI,
                processDataValue: pdv,
                deviceElementIdRef: headerDataLogValue.deviceElementIdRef,
                pgn: headerDataLogValue.pgn,
                pgnStartBit: headerDataLogValue.pgnStartBit,
                pgnStopBit: headerDataLogValue.pgnStopBit,
              ),
            );
          }
        }

        records.add(
          Time(
            start: time,
            positions: position != null ? [position] : const [],
            dataLogValues: dataLogValues,
            type: header!.type,
          ),
        );
      }
    }
    return records;
  }

  /// Converts [records] to bytes ready to be saved as a `TLG-----.BIN`
  /// file.
  Uint8List? recordsToBytes() {
    if (header != null) {
      final byteData = Uint8List(records.length * header!.byteLength);
      var currentOffset = 0;
      for (final record in records) {
        final bytes = header!.recordToBytes(record);
        byteData.setRange(
          currentOffset,
          currentOffset + bytes.lengthInBytes,
          bytes,
        );
        currentOffset += bytes.lengthInBytes;
      }
      return byteData.buffer.asUint8List(0, currentOffset);
    }
    return null;
  }
}

/// An enumerator for which type the [TimeLog] file is.
enum TimeLogType {
  /// Binary file format.
  binaryTimeLogFileType1(1, 'Binary timelog file type 1');

  const TimeLogType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
