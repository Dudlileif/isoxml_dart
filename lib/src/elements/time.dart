// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that specifies a recording of a time event.
/// Optionally, a [Position] can be recorded at a time specification.
///
/// The type attribute is used to specify what type of Time is recorded. All
/// [Time] elements that were provided by FMIS shall be of the type planned.
/// When the MICS does not provide a detailed time recording distinction by
/// using all of the types 2 ([TimeType.preliminary]) to types 7
/// ([TimeType.clearing]), all [Time] elements that were provided by the FMIS
/// shall be of type [TimeType.effective]. All [Time] elements shall have
/// [start] or [stop] defined. [duration] shall always contain a positive
/// value. All time values are to be set in local time.
@CopyWith()
@annotation.XmlRootElement(name: 'TIM')
@annotation.XmlSerializable(createMixin: true)
class Time extends Iso11783Element with _$TimeXmlSerializableMixin {
  /// Default factory for creating a [Time] with verified
  /// arguments.
  factory Time({
    required DateTime start,
    required TimeType type,
    List<Position>? positions,
    List<DataLogValue>? dataLogValues,
    DateTime? stop,
    int? duration,
  }) {
    if (duration != null) {
      ArgumentValidation.checkValueInRange(
        value: duration,
        min: 0,
        max: 4294967294,
        name: 'duration',
      );
    }
    if (positions != null) {
      if (positions.length > 2) {
        throw ArgumentError.value(
          positions,
          'positions',
          'Length can not be larger than 2.',
        );
      }
    }

    return Time._(
      start: start,
      type: type,
      positions: positions,
      dataLogValues: dataLogValues,
      stop: stop,
      duration: duration,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const Time._({
    required this.start,
    required this.type,
    this.positions,
    this.dataLogValues,
    this.stop,
    this.duration,
  }) : super(tag: Iso11783Tag.time, description: 'Time');

  /// Creates a [Time] from [element].
  factory Time.fromXmlElement(XmlElement element) =>
      _$TimeFromXmlElement(element);

  /// A list of up to 2 [Position]s for this.
  @annotation.XmlElement(name: 'PTN')
  final List<Position>? positions;

  /// A list of [DataLogValue]s that was recorded with this time.
  @annotation.XmlElement(name: 'DLV')
  final List<DataLogValue>? dataLogValues;

  /// Time of start.
  @annotation.XmlAttribute(name: 'A')
  final DateTime start;

  /// Time of stop.
  @annotation.XmlAttribute(name: 'B')
  final DateTime? stop;

  /// Time betwen [start] and [stop] in number of seconds.
  @annotation.XmlAttribute(name: 'C')
  final int? duration;

  /// Which type this is.
  @annotation.XmlAttribute(name: 'D')
  final TimeType type;

  @override
  List<Object?> get props => super.props
    ..addAll([
      positions,
      dataLogValues,
      start,
      stop,
      duration,
      type,
    ]);
}

/// An enumerator for which type a [Time] element is.
@annotation.XmlEnum()
enum TimeType {
  /// Planned
  @annotation.XmlValue('1')
  planned(1, 'Planned'),

  /// Preliminary
  @annotation.XmlValue('2')
  preliminary(2, 'Preliminary'),

  /// Effective
  @annotation.XmlValue('4')
  effective(4, 'Effective'),

  /// Ineffective
  @annotation.XmlValue('5')
  ineffective(5, 'Ineffective'),

  /// Repair
  @annotation.XmlValue('6')
  repair(6, 'Repair'),

  /// Clearing
  @annotation.XmlValue('7')
  clearing(7, 'Clearing'),

  /// Powered down
  @annotation.XmlValue('8')
  poweredDown(7, 'Powered Down'),
  ;

  const TimeType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

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
@CopyWith()
@annotation.XmlRootElement(name: 'TLG')
@annotation.XmlSerializable(createMixin: true)
class TimeLog extends Iso11783Element with _$TimeLogXmlSerializableMixin {
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
    ArgumentValidation.checkId(
      id: filename,
      idRefPattern: fileNamePattern,
      idName: 'filename',
    );
    if (fileLength != null) {
      ArgumentValidation.checkValueInRange(
        value: fileLength,
        min: 0,
        max: 4294967294,
        name: 'fileLength',
      );
    }
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
  const TimeLog._({
    required this.filename,
    required this.type,
    required this.byteData,
    this.fileLength,
    this.header,
    this.records,
  }) : super(tag: Iso11783Tag.timeLog, description: 'TimeLog');

  /// Creates a [TimeLog] from [element].
  factory TimeLog.fromXmlElement(XmlElement element) =>
      _$TimeLogFromXmlElement(element);

  /// Regular expression matching pattern for the [filename] of this.
  static const fileNamePattern = 'TLG[0-9][0-9][0-9][0-9][0-9]';

  /// Unique name for the [TimeLog] file.
  @annotation.XmlAttribute(name: 'A')
  final String filename;

  /// Byte length of the [TimeLog] file.
  @annotation.XmlAttribute(name: 'B')
  final int? fileLength;

  /// Which type the [TimeLog] file is.
  ///
  /// Only [TimeLogType.binaryTimeLogFileType1] is possible.
  @annotation.XmlAttribute(name: 'C')
  final TimeLogType type;

  /// Byte data from the file at [filename].
  ///
  /// Can be empty if the external file is not loaded.
  final Uint8List byteData;

  /// A header that describes the data format in the [byteData].
  final TimeLogHeader? header;

  /// Logged [Time] records for this.
  final List<Time>? records;

  @override
  List<Object?> get props => super.props
    ..addAll([
      filename,
      fileLength,
      type,
      byteData,
    ]);

  /// Returns [byteData] parsed with [header] to a log of [Time] records.
  List<Time>? parseData() {
    if (this.records != null) {
      return this.records;
    }
    List<Time>? records;
    if (byteData.isNotEmpty && header != null) {
      records = [];
      var currentOffset = 0;
      final data = byteData.buffer.asByteData();

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
          final north = header!.position!.readNorth
              ? 1e-7 * data.getInt32(currentOffset, Endian.little)
              : header!.position!.north ?? 0;
          if (header!.position!.readNorth) {
            currentOffset += 4;
          }
          final east = header!.position!.readEast
              ? 1e-7 * data.getInt32(currentOffset, Endian.little)
              : header!.position!.east ?? 0;
          if (header!.position!.readEast) {
            currentOffset += 4;
          }
          final up = header!.position!.readUp
              ? data.getInt32(currentOffset, Endian.little)
              : header!.position!.up;
          if (header!.position!.readUp) {
            currentOffset += 4;
          }
          final status = header!.position!.readStatus
              ? PositionStatus.values.firstWhere(
                  (element) => element.value == data.getUint8(currentOffset),
                )
              : header!.position!.status ?? PositionStatus.notAvailable;
          if (header!.position!.readStatus) {
            currentOffset++;
          }
          final pdop = header!.position!.readPdop
              ? 1e-1 * data.getUint16(currentOffset, Endian.little)
              : header!.position!.pdop;
          if (header!.position!.readPdop) {
            currentOffset += 2;
          }
          final hdop = header!.position!.readHdop
              ? 1e-1 * data.getUint16(currentOffset, Endian.little)
              : header!.position!.hdop;
          if (header!.position!.readHdop) {
            currentOffset += 2;
          }
          final numberOfSatellites = header!.position!.readNumberOfSatellites
              ? data.getUint8(currentOffset)
              : header!.position!.numberOfSatellites;
          if (header!.position!.readNumberOfSatellites) {
            currentOffset++;
          }
          final gpsUtcTimeMs = header!.position!.readgpsUtcTimeMs
              ? data.getUint32(currentOffset, Endian.little)
              : header!.position!.gpsUtcTimeMs;
          if (header!.position!.readgpsUtcTimeMs) {
            currentOffset += 4;
          }
          final gpsUtcDate = header!.position!.readGpsUtcDate
              ? data.getUint16(currentOffset, Endian.little)
              : header!.position!.gpsUtcDate;
          if (header!.position!.readGpsUtcDate) {
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

        final numDLVs = data.getUint8(currentOffset);
        currentOffset++;
        List<DataLogValue>? dataLogValues;
        if (numDLVs > 0) {
          dataLogValues = [];
          for (var i = 0; i < numDLVs; i++) {
            final dlvN = data.getUint8(currentOffset);
            currentOffset++;

            final pdv = data.getInt32(currentOffset, Endian.little);
            currentOffset += 4;

            final headerDataLogValue = header!.dataLogValues?.elementAt(dlvN);
            if (headerDataLogValue != null) {
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
        }

        records.add(
          Time(
            start: time,
            positions: position != null ? [position] : null,
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
    if (records != null && header != null) {
      final byteData = Uint8List(records!.length * header!.byteLength);
      var currentOffset = 0;
      for (final record in records!) {
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
@annotation.XmlEnum()
enum TimeLogType {
  /// Binary file format.
  @annotation.XmlValue('1')
  binaryTimeLogFileType1(1, 'Binary timelog file type 1');

  const TimeLogType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An element used exclusively in `TLG-----.XML` files to denote the binary
/// format of [Time] records in the `TLG-----.BIN' files.
///
/// All attributes in the `TLG-----.XML` file with empty strings will have
/// their value in the binary record, if the attribute has a value it will be
/// used on all the records.
///
/// [TimeLogHeader] should only be set as [TimeLog.header].
@CopyWith()
class TimeLogHeader {
  /// Default constructor.
  const TimeLogHeader({
    required this.type,
    this.start,
    this.position,
    this.dataLogValues,
  });

  /// Creates a [TimeLogHeader] from [document].
  factory TimeLogHeader.fromXmlDocument(XmlDocument document) =>
      TimeLogHeader.fromXmlElement(document.childElements.first);

  /// Creates a [TimeLogHeader] from [element].
  factory TimeLogHeader.fromXmlElement(XmlElement element) {
    final position = element.getElement('PTN');
    final dataLogValues = element.getElements('DLV');
    final start = element.getAttribute('A');
    final type = element.getAttribute('D');
    if (type != '4') {
      throw ArgumentError.value(type, 'type', 'Should equal "4".');
    }
    return TimeLogHeader(
      position: position != null
          ? TimeLogHeaderPosition.fromXmlElement(position)
          : null,
      dataLogValues:
          dataLogValues?.map(TimeLogHeaderDataLogValue.fromXmlElement).toList(),
      start: start != null && start.isNotEmpty ? DateTime.parse(start) : null,
      type: type != null && type.isNotEmpty
          ? $TimeTypeEnumMap.entries
              .singleWhere(
                (mapEntry) => mapEntry.value == type,
                orElse: () => throw ArgumentError(
                  '''`$type` is not one of the supported values: ${$TimeTypeEnumMap.values.join(', ')}''',
                ),
              )
              .key
          : TimeType.effective,
    );
  }

  /// A template for which [Position] attributes are used in the
  /// log.
  @annotation.XmlElement(name: 'PTN')
  final TimeLogHeaderPosition? position;

  /// A template for which [DataLogValue]s' attributes are used in the log.
  @annotation.XmlElement(name: 'DLV')
  final List<TimeLogHeaderDataLogValue>? dataLogValues;

  /// The starting time of the records, should be null.
  @annotation.XmlAttribute(name: 'A')
  final DateTime? start;

  /// Should equal [TimeType.effective] for this.
  @annotation.XmlAttribute(name: 'D')
  final TimeType type;

  /// Number of bytes for one record in [TimeLog.records].
  int get byteLength {
    var length = 0;
    if (start == null) {
      length += 6;
    }
    if (position != null) {
      length += position!.byteLength;
    }
    if (dataLogValues != null) {
      length += 1 + dataLogValues!.length * 5;
    }

    return length;
  }

  /// Converts the [record]to bytes according to the read parameters.
  Uint8List recordToBytes(Time record) {
    final bytes = Uint8List(byteLength);
    var currentOffset = 0;
    if (start == null) {
      final byteData = bytes.buffer.asByteData();
      final days = record.start.difference(DateTime.utc(1980)).inDays;
      final ms = record.start
          .difference(
            DateTime.utc(
              record.start.year,
              record.start.month,
              record.start.day,
            ),
          )
          .inMilliseconds;
      byteData.setUint32(currentOffset, ms, Endian.little);
      currentOffset += 4;
      byteData.setUint16(currentOffset, days, Endian.little);
      currentOffset += 2;
    }

    final recordPosition = record.positions?.first;
    if (recordPosition != null && position != null) {
      bytes.setRange(
        currentOffset,
        currentOffset + position!.byteLength,
        position!.recordToBytes(recordPosition),
      );
      currentOffset += position!.byteLength;
    }
    final byteData = bytes.buffer.asByteData()
      ..setUint8(currentOffset, record.dataLogValues?.length ?? 0);
    currentOffset++;
    if (dataLogValues != null && record.dataLogValues != null) {
      for (final dataLogValue in record.dataLogValues!) {
        byteData.setUint8(
          currentOffset,
          dataLogValues!.indexWhere(
            (element) =>
                element.processDataDDI == dataLogValue.processDataDDI &&
                element.deviceElementIdRef == dataLogValue.deviceElementIdRef,
          ),
        );
        currentOffset++;
        byteData.setInt32(
          currentOffset,
          dataLogValue.processDataValue,
          Endian.little,
        );
        currentOffset += 4;
      }
    }

    return Uint8List.sublistView(bytes, 0, currentOffset);
  }

  /// Get the [XmlElement] representing this.
  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) {
    final element = XmlElement(
      XmlName.fromString('TIM'),
      [...namespaces.toXmlAttributes()],
      [
        if (position != null) position!.toXmlElement(),
        if (dataLogValues != null)
          ...dataLogValues!.map((e) => e.toXmlElement()),
      ],
    )
      ..setAttribute('A', start?.toString() ?? '')
      ..setAttribute('D', type.value.toString());

    return element;
  }

  /// Get the [XmlDocument] representing this.
  XmlDocument toXmlDocument() => XmlDocument([
        XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
        toXmlElement(),
      ]);
}

/// An element for use in [TimeLogHeader.position] that describes default
/// attributes and attributes to read from [TimeLog.byteData] for the [Position]
/// part of the log record.
@CopyWith()
class TimeLogHeaderPosition {
  /// Default constructor
  const TimeLogHeaderPosition({
    this.readNorth = false,
    this.readEast = false,
    this.readUp = false,
    this.readStatus = false,
    this.readPdop = false,
    this.readHdop = false,
    this.readNumberOfSatellites = false,
    this.readgpsUtcTimeMs = false,
    this.readGpsUtcDate = false,
    this.north,
    this.east,
    this.status,
    this.up,
    this.pdop,
    this.hdop,
    this.numberOfSatellites,
    this.gpsUtcTimeMs,
    this.gpsUtcDate,
  });

  /// Creates a [TimeLogHeaderPosition] from [element].
  factory TimeLogHeaderPosition.fromXmlElement(XmlElement element) {
    final north = element.getAttribute('A');
    final east = element.getAttribute('B');
    final up = element.getAttribute('C');
    final status = element.getAttribute('D');
    final pdop = element.getAttribute('E');
    final hdop = element.getAttribute('F');
    final numberOfSatellites = element.getAttribute('G');
    final gpsUtcTimeMs = element.getAttribute('H');
    final gpsUtcDate = element.getAttribute('I');
    return TimeLogHeaderPosition(
      north: north != null && north.isNotEmpty ? double.parse(north) : null,
      readNorth: north?.isEmpty ?? false,
      east: east != null && east.isNotEmpty ? double.parse(east) : null,
      readEast: east?.isEmpty ?? false,
      up: up != null && up.isNotEmpty ? int.parse(up) : null,
      readUp: up?.isEmpty ?? false,
      status: status != null && status.isNotEmpty
          ? $PositionStatusEnumMap.entries
              .singleWhere(
                (positionStatusEnumMapEntry) =>
                    positionStatusEnumMapEntry.value == status,
                orElse: () => throw ArgumentError(
                  '''`$status` is not one of the supported values: ${$PositionStatusEnumMap.values.join(', ')}''',
                ),
              )
              .key
          : null,
      readStatus: status?.isEmpty ?? false,
      pdop: pdop != null && pdop.isNotEmpty ? double.parse(pdop) : null,
      readPdop: pdop?.isEmpty ?? false,
      hdop: hdop != null && hdop.isNotEmpty ? double.parse(hdop) : null,
      readHdop: hdop?.isEmpty ?? false,
      numberOfSatellites:
          numberOfSatellites != null && numberOfSatellites.isNotEmpty
              ? int.parse(numberOfSatellites)
              : null,
      readNumberOfSatellites: numberOfSatellites?.isEmpty ?? false,
      gpsUtcTimeMs: gpsUtcTimeMs != null && gpsUtcTimeMs.isNotEmpty
          ? int.parse(gpsUtcTimeMs)
          : null,
      readgpsUtcTimeMs: gpsUtcTimeMs?.isEmpty ?? false,
      gpsUtcDate: gpsUtcDate != null && gpsUtcDate.isNotEmpty
          ? int.parse(gpsUtcDate)
          : null,
      readGpsUtcDate: gpsUtcDate?.isEmpty ?? false,
    );
  }

  /// Create a [TimeLogHeaderPosition] with read parameters set to true
  /// for all parameters in [position] that has a value.
  ///
  /// [readNorth], [readEast] and [readStatus] are always true.
  factory TimeLogHeaderPosition.fromPosition(Position position) =>
      TimeLogHeaderPosition(
        readNorth: true,
        readEast: true,
        readUp: position.up != null,
        readStatus: true,
        readPdop: position.pdop != null,
        readHdop: position.hdop != null,
        readNumberOfSatellites: position.numberOfSatellites != null,
        readgpsUtcTimeMs: position.gpsUtcTimeMs != null,
        readGpsUtcDate: position.gpsUtcDate != null,
      );

  /// [Position.north] value to apply to all records.
  final double? north;

  /// [Position.east] value to apply to all records.
  final double? east;

  /// [Position.up] value to apply to all records.
  final int? up;

  /// [Position.status] value to apply to all records.
  final PositionStatus? status;

  /// [Position.pdop] value to apply to all records.
  final double? pdop;

  /// [Position.hdop] value to apply to all records.
  final double? hdop;

  /// [Position.numberOfSatellites] value to apply to all records.
  final int? numberOfSatellites;

  /// [Position.gpsUtcTimeMs] value to apply to all records.
  final int? gpsUtcTimeMs;

  /// [Position.gpsUtcDate] value to apply to all records.
  final int? gpsUtcDate;

  /// Whether record [Position.north] should be read from the
  /// [TimeLog.byteData].
  ///
  /// Usually true.
  final bool readNorth;

  /// Whether record [Position.east] should be read from the [TimeLog.byteData].
  ///
  /// Usually true.
  final bool readEast;

  /// Whether record [Position.up] should be read from the [TimeLog.byteData].
  final bool readUp;

  /// Whether record [Position.status] should be read from the
  /// [TimeLog.byteData].
  ///
  /// Usually true.
  final bool readStatus;

  /// Whether record [Position.pdop] should be read from the [TimeLog.byteData].
  final bool readPdop;

  /// Whether record [Position.hdop] should be read from the [TimeLog.byteData].
  final bool readHdop;

  /// Whether record [Position.numberOfSatellites] should be read from the
  /// [TimeLog.byteData].
  ///
  /// Usually true.
  final bool readNumberOfSatellites;

  /// Whether record [Position.gpsUtcTimeMs] should be read from the
  /// [TimeLog.byteData].
  ///
  /// Usually true.
  final bool readgpsUtcTimeMs;

  /// Whether record [Position.gpsUtcDate] should be read from the
  /// [TimeLog.byteData].
  ///
  /// Usually true.
  final bool readGpsUtcDate;

  /// Number of bytes for the position part of the log record.
  int get byteLength {
    var length = 0;
    if (readNorth) {
      length += 4;
    }
    if (readEast) {
      length += 4;
    }
    if (readUp) {
      length += 4;
    }
    if (readStatus) {
      length++;
    }
    if (readPdop) {
      length += 2;
    }
    if (readHdop) {
      length += 2;
    }
    if (readNumberOfSatellites) {
      length++;
    }
    if (readgpsUtcTimeMs) {
      length += 4;
    }
    if (readGpsUtcDate) {
      length += 2;
    }
    return length;
  }

  /// Converts the [position] attributes that should be stored to
  /// bytes according to the read parameters.
  Uint8List recordToBytes(Position position) {
    final byteData = ByteData(byteLength);
    var currentOffset = 0;
    if (readNorth) {
      byteData.setInt32(
        currentOffset,
        (position.north * 1e7).round(),
        Endian.little,
      );
      currentOffset += 4;
    }
    if (readEast) {
      byteData.setInt32(
        currentOffset,
        (position.east * 1e7).round(),
        Endian.little,
      );
      currentOffset += 4;
    }
    if (readUp) {
      byteData.setInt32(currentOffset, position.up ?? 0, Endian.little);
      currentOffset += 4;
    }
    if (readStatus) {
      byteData.setUint8(currentOffset, position.status.value);
      currentOffset++;
    }
    if (readPdop) {
      byteData.setUint16(
        currentOffset,
        ((position.pdop ?? 0) * 1e1).round(),
        Endian.little,
      );
      currentOffset += 2;
    }
    if (readHdop) {
      byteData.setUint16(
        currentOffset,
        ((position.hdop ?? 0) * 1e1).round(),
        Endian.little,
      );
      currentOffset += 2;
    }
    if (readNumberOfSatellites) {
      byteData.setUint8(currentOffset, position.numberOfSatellites ?? 0);
      currentOffset++;
    }
    if (readgpsUtcTimeMs) {
      byteData.setUint32(
        currentOffset,
        position.gpsUtcTimeMs ?? 0,
        Endian.little,
      );
      currentOffset += 4;
    }
    if (readGpsUtcDate) {
      byteData.setUint16(
        currentOffset,
        position.gpsUtcDate ?? 0,
        Endian.little,
      );
      currentOffset += 2;
    }

    return byteData.buffer.asUint8List(0, currentOffset);
  }

  /// Returns a structured XML element that represents this.
  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) {
    final element = XmlElement(
      XmlName.fromString('PTN'),
      [...namespaces.toXmlAttributes()],
    );
    if (north != null || readNorth) {
      element.setAttribute('A', north?.toString() ?? '');
    }
    if (east != null || readEast) {
      element.setAttribute('B', east?.toString() ?? '');
    }
    if (up != null || readUp) {
      element.setAttribute('C', up?.toString() ?? '');
    }
    if (status != null || readStatus) {
      element.setAttribute('D', status?.value.toString() ?? '');
    }
    if (pdop != null || readPdop) {
      element.setAttribute('E', pdop?.toString() ?? '');
    }
    if (hdop != null || readHdop) {
      element.setAttribute('F', hdop?.toString() ?? '');
    }
    if (numberOfSatellites != null || readNumberOfSatellites) {
      element.setAttribute('G', numberOfSatellites?.toString() ?? '');
    }
    if (gpsUtcTimeMs != null || readgpsUtcTimeMs) {
      element.setAttribute('H', gpsUtcTimeMs?.toString() ?? '');
    }
    if (gpsUtcDate != null || readGpsUtcDate) {
      element.setAttribute('I', gpsUtcDate?.toString() ?? '');
    }
    return element;
  }
}

/// An element for use in [TimeLogHeader.dataLogValues] that describes default
/// attributes and attributes to read from [TimeLog.byteData] for the n-th
/// [DataLogValue] part of the log record.
@CopyWith()
class TimeLogHeaderDataLogValue {
  /// Default constructor
  const TimeLogHeaderDataLogValue({
    required this.processDataDDI,
    required this.deviceElementIdRef,
    this.readProcessDataValue = false,
    this.processDataValue,
    this.pgn,
    this.pgnStartBit,
    this.pgnStopBit,
  });

  /// Creates a [TimeLogHeaderDataLogValue] from [element].
  factory TimeLogHeaderDataLogValue.fromXmlElement(XmlElement element) {
    final processDataDDI = element.getAttribute('A')!;
    final processDataValue = element.getAttribute('B');
    final deviceElementIdRef = element.getAttribute('C')!;
    final pgn = element.getAttribute('D');
    final pgnStartBit = element.getAttribute('E');
    final pgnStopBit = element.getAttribute('F');
    return TimeLogHeaderDataLogValue(
      processDataDDI: processDataDDI,
      processDataValue: processDataValue != null && processDataValue.isNotEmpty
          ? int.parse(processDataValue)
          : null,
      readProcessDataValue: processDataValue?.isEmpty ?? false,
      deviceElementIdRef: deviceElementIdRef,
      pgn: pgn != null ? int.parse(pgn) : null,
      pgnStartBit: pgnStartBit != null ? int.parse(pgnStartBit) : null,
      pgnStopBit: pgnStopBit != null ? int.parse(pgnStopBit) : null,
    );
  }

  /// [DataLogValue.processDataDDI] value to apply to all records.
  @annotation.XmlAttribute(name: 'A')
  final String processDataDDI;

  /// [DataLogValue.processDataValue] value to apply to all records.
  @annotation.XmlAttribute(name: 'B')
  final int? processDataValue;

  /// [DataLogValue.deviceElementIdRef] value to apply to all records.
  @annotation.XmlAttribute(name: 'C')
  final String deviceElementIdRef;

  /// [DataLogValue.pgn] value to apply to all records.
  @annotation.XmlAttribute(name: 'D')
  final int? pgn;

  /// [DataLogValue.pgnStartBit] value to apply to all records.
  @annotation.XmlAttribute(name: 'E')
  final int? pgnStartBit;

  /// [DataLogValue.pgnStopBit] value to apply to all records.
  @annotation.XmlAttribute(name: 'F')
  final int? pgnStopBit;

  /// Whether record [DataLogValue.processDataValue] should be read from
  /// the [TimeLog.byteData].
  ///
  /// Should usually be true.
  final bool readProcessDataValue;

  /// Returns a structured XML element that represents this.
  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) {
    final element =
        XmlElement(XmlName.fromString('DLV'), [...namespaces.toXmlAttributes()])
          ..setAttribute('A', processDataDDI)
          ..setAttribute('B', processDataValue?.toString() ?? '')
          ..setAttribute('C', deviceElementIdRef);
    if (pgn != null) {
      element.setAttribute('D', pgn!.toString());
    }
    if (pgnStartBit != null) {
      element.setAttribute('E', pgnStartBit!.toString());
    }
    if (pgnStopBit != null) {
      element.setAttribute('F', pgnStopBit!.toString());
    }

    return element;
  }
}
