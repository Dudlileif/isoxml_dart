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
class TimeLogHeader extends _XmlElementBase {
  /// Default constructor.
  TimeLogHeader({
    required TimeType type,
    DateTime? start,
    TimeLogHeaderPosition? position,
    List<TimeLogHeaderDataLogValue>? dataLogValues,
  }) {
    xmlElement = XmlElement.tag(_elementType.xmlTag);
    this.type = type;
    this.start = start;
    this.position = position;
    if (dataLogValues != null) {
      xmlElement.children.addAll(dataLogValues.map((e) => e.xmlElement));
    }
  }

  TimeLogHeader._fromXmlElement(XmlElement element)
    : assert(
        element.name.local == _elementType.xmlTag,
        '''XML tag ${element.name.local} does not matche expected tag ${_elementType.xmlTag}''',
      ) {
    xmlElement = element;
    position = switch (xmlElement.getElement(
      Iso11783ElementType.position.xmlTag,
    )) {
      final XmlElement element => TimeLogHeaderPosition._fromXmlElement(
        element,
      ),
      _ => null,
    };
    dataLogValues.addAll(
      xmlElement
          .findElements(Iso11783ElementType.dataLogValue.xmlTag)
          .map(TimeLogHeaderDataLogValue._fromXmlElement)
          .toList(),
    );
  }

  /// Creates an [TimeLogHeader] from [document].
  factory TimeLogHeader.fromXmlDocument(XmlDocument document) =>
      TimeLogHeader._fromXmlElement(document.lastElementChild!);

  static const Iso11783ElementType _elementType = Iso11783ElementType.time;

  /// A structured XML document that represents this.
  XmlDocument toXmlDocument() => XmlDocument([
    XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
    xmlElement.copy(),
  ]);

  /// A template for which [Position] attributes are used in the
  /// log.
  TimeLogHeaderPosition? get position => _position;
  set position(TimeLogHeaderPosition? value) {
    switch ((
      value,
      position,
    )) {
      case (
        TimeLogHeaderPosition(xmlElement: final element),
        TimeLogHeaderPosition(xmlElement: final existing),
      ):
        if (element.hasParent) {
          element.remove();
        }
        existing.replace(element);
      case (TimeLogHeaderPosition(xmlElement: final element), null):
        if (element.hasParent) {
          element.remove();
        }
        xmlElement.children.add(
          element,
        );
      case (null, final TimeLogHeaderPosition existing):
        existing.xmlElement.remove();
    }
    _position = value;
  }

  TimeLogHeaderPosition? _position;

  /// A template for which [DataLogValue]s' attributes are used in the log.
  late final dataLogValues = _XmlSyncedList<TimeLogHeaderDataLogValue>(
    xmlElement: xmlElement,
  );

  /// The starting time of the records, should be null.
  DateTime? get start => tryParseDateTime('A');
  set start(DateTime? value) => setDateTimeNullable('A', value);

  /// Should equal [TimeType.effective] for this.
  TimeType get type => TimeType.values.firstWhere(
    (type) => type.value == parseInt('D'),
    orElse: () => throw ArgumentError(
      '''`${xmlElement.getAttribute('D')}` is not one of the supported values: ${TimeType.values.join(', ')}''',
    ),
  );
  set type(TimeType value) => setInt('D', value.value);

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
}

/// An element for use in [TimeLogHeader.position] that describes default
/// attributes and attributes to read from [TimeLog.byteData] for the [Position]
/// part of the log record.
class TimeLogHeaderPosition extends _XmlElementBase {
  /// Default constructor
  TimeLogHeaderPosition({
    this.binaryHeaderOptions = const PositionBinaryHeaderOptions(),
    double? north,
    double? east,
    PositionStatus? status,
    int? up,
    double? pdop,
    double? hdop,
    int? numberOfSatellites,
    int? gpsUtcTimeMs,
    int? gpsUtcDate,
  }) {
    xmlElement = XmlElement.tag(_elementType.xmlTag);
    this.north = north;
    this.east = east;
    this.status = status;
    this.up = up;
    this.pdop = pdop;
    this.hdop = hdop;
    this.numberOfSatellites = numberOfSatellites;
    this.gpsUtcTimeMs = gpsUtcTimeMs;
    this.gpsUtcDate = gpsUtcDate;
  }

  /// Create a [TimeLogHeaderPosition] with read parameters set to true
  /// for all parameters in [position] that has a value.
  ///
  /// [binaryHeaderOptions].readNorth, [binaryHeaderOptions].readEast and
  /// [binaryHeaderOptions].readStatus are always true.
  factory TimeLogHeaderPosition.fromPosition(Position position) =>
      TimeLogHeaderPosition(
        binaryHeaderOptions: PositionBinaryHeaderOptions(
          readNorth: true,
          readEast: true,
          readUp: position.up != null,
          readStatus: true,
          readPdop: position.pdop != null,
          readHdop: position.hdop != null,
          readNumberOfSatellites: position.numberOfSatellites != null,
          readGpsUtcTimeMs: position.gpsUtcTimeMs != null,
          readGpsUtcDate: position.gpsUtcDate != null,
        ),
      );

  TimeLogHeaderPosition._fromXmlElement(XmlElement element)
    : assert(
        element.name.local == _elementType.xmlTag,
        '''XML tag ${element.name.local} does not matche expected tag ${_elementType.xmlTag}''',
      ) {
    xmlElement = element;
    binaryHeaderOptions = PositionBinaryHeaderOptions(
      readNorth: tryParseString('A') == '',
      readEast: tryParseString('B') == '',
      readUp: tryParseString('C') == '',
      readStatus: tryParseString('D') == '',
      readPdop: tryParseString('E') == '',
      readHdop: tryParseString('F') == '',
      readNumberOfSatellites: tryParseString('G') == '',
      readGpsUtcTimeMs: tryParseString('H') == '',
      readGpsUtcDate: tryParseString('I') == '',
    );
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.position;

  /// [Position.north] value to apply to all records.
  double? get north => tryParseDouble('A');
  set north(double? value) => setDoubleNullable(
    'A',
    value,
    setNullToEmptyString: binaryHeaderOptions.readNorth,
  );

  /// [Position.east] value to apply to all records.
  double? get east => tryParseDouble('B');
  set east(double? value) => setDoubleNullable(
    'B',
    value,
    setNullToEmptyString: binaryHeaderOptions.readEast,
  );

  /// [Position.up] value to apply to all records.
  int? get up => tryParseInt('C');
  set up(int? value) => setIntNullable(
    'C',
    value,
    setNullToEmptyString: binaryHeaderOptions.readUp,
  );

  /// [Position.status] value to apply to all records.
  PositionStatus? get status => switch (tryParseInt('D')) {
    final int value => PositionStatus.values.firstWhere(
      (type) => type.value == value,
      orElse: () => throw ArgumentError(
        '''`$value` is not one of the supported values: ${PositionStatus.values.join(', ')}''',
      ),
    ),
    _ => null,
  };
  set status(PositionStatus? value) => setIntNullable(
    'D',
    value?.value,
    setNullToEmptyString: binaryHeaderOptions.readStatus,
  );

  /// [Position.pdop] value to apply to all records.
  double? get pdop => tryParseDouble('E');
  set pdop(double? value) => setDoubleNullable(
    'E',
    value,
    setNullToEmptyString: binaryHeaderOptions.readPdop,
  );

  /// [Position.hdop] value to apply to all records.
  double? get hdop => tryParseDouble('F');
  set hdop(double? value) => setDoubleNullable(
    'F',
    value,
    setNullToEmptyString: binaryHeaderOptions.readHdop,
  );

  /// [Position.numberOfSatellites] value to apply to all records.
  int? get numberOfSatellites => tryParseInt('G');
  set numberOfSatellites(int? value) => setIntNullable(
    'G',
    value,
    setNullToEmptyString: binaryHeaderOptions.readNumberOfSatellites,
  );

  /// [Position.gpsUtcTimeMs] value to apply to all records.
  int? get gpsUtcTimeMs => tryParseInt('H');
  set gpsUtcTimeMs(int? value) => setIntNullable(
    'H',
    value,
    setNullToEmptyString: binaryHeaderOptions.readGpsUtcTimeMs,
  );

  /// [Position.gpsUtcDate] value to apply to all records.
  int? get gpsUtcDate => tryParseInt('I');
  set gpsUtcDate(int? value) => setIntNullable(
    'I',
    value,
    setNullToEmptyString: binaryHeaderOptions.readGpsUtcDate,
  );

  /// An object containing the options of which parameters of the positions
  /// to log.
  late final PositionBinaryHeaderOptions binaryHeaderOptions;

  /// Number of bytes for the position part of the log record.
  int get byteLength {
    var length = 0;
    if (binaryHeaderOptions.readNorth) {
      length += 4;
    }
    if (binaryHeaderOptions.readEast) {
      length += 4;
    }
    if (binaryHeaderOptions.readUp) {
      length += 4;
    }
    if (binaryHeaderOptions.readStatus) {
      length++;
    }
    if (binaryHeaderOptions.readPdop) {
      length += 2;
    }
    if (binaryHeaderOptions.readHdop) {
      length += 2;
    }
    if (binaryHeaderOptions.readNumberOfSatellites) {
      length++;
    }
    if (binaryHeaderOptions.readGpsUtcTimeMs) {
      length += 4;
    }
    if (binaryHeaderOptions.readGpsUtcDate) {
      length += 2;
    }
    return length;
  }

  /// Converts the [position] attributes that should be stored to
  /// bytes according to the read parameters.
  Uint8List recordToBytes(Position position) {
    final byteData = ByteData(byteLength);
    var currentOffset = 0;
    if (binaryHeaderOptions.readNorth) {
      byteData.setInt32(
        currentOffset,
        (position.north * 1e7).round(),
        Endian.little,
      );
      currentOffset += 4;
    }
    if (binaryHeaderOptions.readEast) {
      byteData.setInt32(
        currentOffset,
        (position.east * 1e7).round(),
        Endian.little,
      );
      currentOffset += 4;
    }
    if (binaryHeaderOptions.readUp) {
      byteData.setInt32(currentOffset, position.up ?? 0, Endian.little);
      currentOffset += 4;
    }
    if (binaryHeaderOptions.readStatus) {
      byteData.setUint8(currentOffset, position.status.value);
      currentOffset++;
    }
    if (binaryHeaderOptions.readPdop) {
      byteData.setUint16(
        currentOffset,
        ((position.pdop ?? 0) * 1e1).round(),
        Endian.little,
      );
      currentOffset += 2;
    }
    if (binaryHeaderOptions.readHdop) {
      byteData.setUint16(
        currentOffset,
        ((position.hdop ?? 0) * 1e1).round(),
        Endian.little,
      );
      currentOffset += 2;
    }
    if (binaryHeaderOptions.readNumberOfSatellites) {
      byteData.setUint8(currentOffset, position.numberOfSatellites ?? 0);
      currentOffset++;
    }
    if (binaryHeaderOptions.readGpsUtcTimeMs) {
      byteData.setUint32(
        currentOffset,
        position.gpsUtcTimeMs ?? 0,
        Endian.little,
      );
      currentOffset += 4;
    }
    if (binaryHeaderOptions.readGpsUtcDate) {
      byteData.setUint16(
        currentOffset,
        position.gpsUtcDate ?? 0,
        Endian.little,
      );
      currentOffset += 2;
    }

    return byteData.buffer.asUint8List(0, currentOffset);
  }
}

/// An element for use in [TimeLogHeader.dataLogValues] that describes default
/// attributes and attributes to read from [TimeLog.byteData] for the n-th
/// [DataLogValue] part of the log record.

class TimeLogHeaderDataLogValue extends _XmlElementBase {
  /// Default constructor
  TimeLogHeaderDataLogValue({
    required String processDataDDI,
    required String deviceElementIdRef,
    this.readProcessDataValue = false,
    int? processDataValue,
    int? pgn,
    int? pgnStartBit,
    int? pgnStopBit,
  }) {
    xmlElement = XmlElement.tag(_elementType.xmlTag);
    this.processDataDDI = processDataDDI;
    this.deviceElementIdRef = deviceElementIdRef;
    this.processDataValue = processDataValue;
    this.pgn = pgn;
    this.pgnStartBit = pgnStartBit;
    this.pgnStopBit = pgnStopBit;
  }

  TimeLogHeaderDataLogValue._fromXmlElement(XmlElement element)
    : readProcessDataValue = true,
      assert(
        element.name.local == _elementType.xmlTag,
        '''XML tag ${element.name.local} does not matche expected tag ${_elementType.xmlTag}''',
      ) {
    xmlElement = element;
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.dataLogValue;

  /// [DataLogValue.processDataDDI] value to apply to all records.
  String get processDataDDI => parseString('A');
  set processDataDDI(String value) => setString('A', value);

  /// [DataLogValue.processDataValue] value to apply to all records.
  int? get processDataValue => tryParseInt('B');
  set processDataValue(int? value) => setIntNullable(
    'B',
    value,
    setNullToEmptyString: readProcessDataValue,
  );

  /// [DataLogValue.deviceElementIdRef] value to apply to all records.
  String get deviceElementIdRef => parseString('C');
  set deviceElementIdRef(String value) => setString('C', value);

  /// [DataLogValue.pgn] value to apply to all records.
  int? get pgn => tryParseInt('D');
  set pgn(int? value) => setIntNullable('D', value);

  /// [DataLogValue.pgnStartBit] value to apply to all records.
  int? get pgnStartBit => tryParseInt('E');
  set pgnStartBit(int? value) => setIntNullable('E', value);

  /// [DataLogValue.pgnStopBit] value to apply to all records.
  int? get pgnStopBit => tryParseInt('F');
  set pgnStopBit(int? value) => setIntNullable('F', value);

  /// Whether record [DataLogValue.processDataValue] should be read from
  /// the [TimeLog.byteData].
  ///
  /// Should usually be true.
  final bool readProcessDataValue;
}

@immutable
/// A header that describes how [TimeLogHeaderPosition]s should be read from a
/// binary file.
class PositionBinaryHeaderOptions {
  /// A header that describes how [TimeLogHeaderPosition]s should be read from a
  /// binary file.
  const PositionBinaryHeaderOptions({
    this.readNorth = false,
    this.readEast = false,
    this.readUp = false,
    this.readStatus = false,
    this.readPdop = false,
    this.readHdop = false,
    this.readNumberOfSatellites = false,
    this.readGpsUtcTimeMs = false,
    this.readGpsUtcDate = false,
  });

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
  final bool readGpsUtcTimeMs;

  /// Whether record [Position.gpsUtcDate] should be read from the
  /// [TimeLog.byteData].
  ///
  /// Usually true.
  final bool readGpsUtcDate;

  @override
  int get hashCode => Object.hashAll([
    readNorth,
    readEast,
    readUp,
    readStatus,
    readPdop,
    readHdop,
    readNumberOfSatellites,
    readGpsUtcTimeMs,
    readGpsUtcDate,
  ]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PositionBinaryHeaderOptions &&
          const ListEquality<bool>().equals(
            [
              readNorth,
              readEast,
              readUp,
              readStatus,
              readPdop,
              readHdop,
              readNumberOfSatellites,
              readGpsUtcTimeMs,
              readGpsUtcDate,
            ],
            [
              other.readNorth,
              other.readEast,
              other.readUp,
              other.readStatus,
              other.readPdop,
              other.readHdop,
              other.readNumberOfSatellites,
              other.readGpsUtcTimeMs,
              other.readGpsUtcDate,
            ],
          );
}
