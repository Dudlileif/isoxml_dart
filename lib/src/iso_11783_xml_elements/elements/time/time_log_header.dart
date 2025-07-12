// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

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
  TimeLogHeader({
    required this.type,
    this.start,
    this.position,
    List<TimeLogHeaderDataLogValue>? dataLogValues,
  }) {
    if (dataLogValues != null) {
      this.dataLogValues.addAll(dataLogValues);
    }
  }

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
  @annotation.XmlElement(name: 'PTN', includeIfNull: false)
  final TimeLogHeaderPosition? position;

  /// A template for which [DataLogValue]s' attributes are used in the log.
  @annotation.XmlElement(name: 'DLV')
  final List<TimeLogHeaderDataLogValue> dataLogValues = [];

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
    return length + 1 + dataLogValues.length * 5;
  }

  /// Converts the [record]to bytes according to the read parameters.
  Uint8List recordToBytes(Time record) {
    final bytes = Uint8List(byteLength);
    var currentOffset = 0;
    if (start == null) {
      final byteData = bytes.buffer.asByteData(0, bytes.lengthInBytes);
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

    final recordPosition = record.positions.first;
    if (position != null) {
      bytes.setRange(
        currentOffset,
        currentOffset + position!.byteLength,
        position!.recordToBytes(recordPosition),
      );
      currentOffset += position!.byteLength;
    }
    final byteData = bytes.buffer.asByteData(0, bytes.lengthInBytes)
      ..setUint8(currentOffset, record.dataLogValues.length);
    currentOffset++;
    for (final dataLogValue in record.dataLogValues) {
      byteData.setUint8(
        currentOffset,
        dataLogValues.indexWhere(
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

    return Uint8List.sublistView(bytes, 0, currentOffset);
  }

  /// Get the [XmlElement] representing this.
  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) {
    final element = XmlElement(
      XmlName.fromString('TIM'),
      [...namespaces.toXmlAttributes()],
      [
        if (position != null) position!.toXmlElement(),
        ...dataLogValues.map((e) => e.toXmlElement()),
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
