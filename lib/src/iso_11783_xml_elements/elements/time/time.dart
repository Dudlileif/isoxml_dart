// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

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
class Time extends Iso11783Element {
  /// Default factory for creating a [Time] with verified
  /// arguments.
  factory Time({
    required DateTime start,
    required TimeType type,
    List<Position> positions = const [],
    List<DataLogValue>? dataLogValues,
    DateTime? stop,
    int? duration,
  }) {
    _argumentValidator(
      start: start,
      type: type,
      positions: positions,
      dataLogValues: dataLogValues,
      stop: stop,
      duration: duration,
    );

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
  Time._({
    required DateTime start,
    required TimeType type,
    List<Position>? positions,
    List<DataLogValue>? dataLogValues,
    DateTime? stop,
    int? duration,
  }) : super._(elementType: _elementType) {
    this.start = start;
    this.type = type;
    this.stop = stop;
    this.duration = duration;
    this.positions.addAll(positions);
    this.dataLogValues.addAll(dataLogValues);
  }

  Time._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    positions.addAll(
      xmlElement
          .findElements(Iso11783ElementType.position.xmlTag)
          .map(Position._fromXmlElement)
          .toList(),
    );
    dataLogValues.addAll(
      xmlElement
          .findElements(Iso11783ElementType.dataLogValue.xmlTag)
          .map(DataLogValue._fromXmlElement)
          .toList(),
    );
    _argumentValidator(
      start: start,
      type: type,
      positions: positions,
      dataLogValues: dataLogValues,
      stop: stop,
      duration: duration,
    );
  }

  static void _argumentValidator({
    required DateTime start,
    required TimeType type,
    required List<Position> positions,
    required List<DataLogValue>? dataLogValues,
    required DateTime? stop,
    required int? duration,
  }) {
    if (duration != null) {
      ArgumentValidation.checkValueInRange(
        value: duration,
        min: 0,
        max: 4294967294,
        name: 'Time.duration',
      );
    }
    if (positions.length > 2) {
      throw ArgumentError.value(
        positions,
        'Time.positions',
        'Length can not be larger than 2.',
      );
    }
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.time;

  /// A list of up to 2 [Position]s for this.
  late final positions = _XmlSyncedList<Position>(
    xmlElement: xmlElement,
    xmlTag: Position._elementType.xmlTag,
  );

  /// A list of [DataLogValue]s that was recorded with this time.
  late final dataLogValues = _XmlSyncedList<DataLogValue>(
    xmlElement: xmlElement,
    xmlTag: DataLogValue._elementType.xmlTag,
  );

  /// Time of start.
  DateTime get start => parseDateTime('A');
  set start(DateTime value) => setDateTime('A', value);

  /// Time of stop.
  DateTime? get stop => tryParseDateTime('B');
  set stop(DateTime? value) => setDateTimeNullable('B', value);

  /// Time betwen [start] and [stop] in number of seconds.
  int? get duration => tryParseInt('C');
  set duration(int? value) => setIntNullable('C', value);

  /// Which type this is.
  TimeType get type => TimeType.values.firstWhere(
    (type) => type.value == parseInt('D'),
    orElse: () => throw ArgumentError.value(
      xmlElement.getAttribute('D'),
      'Time.type',
      'is not one of the supported values: ${TimeType.values.join(', ')}',
    ),
  );
  set type(TimeType value) => setInt('D', value.value);
}

/// An enumerator for which type a [Time] element is.
enum TimeType {
  /// Planned
  planned(1, 'Planned'),

  /// Preliminary
  preliminary(2, 'Preliminary'),

  /// Effective
  effective(4, 'Effective'),

  /// Ineffective
  ineffective(5, 'Ineffective'),

  /// Repair
  repair(6, 'Repair'),

  /// Clearing
  clearing(7, 'Clearing'),

  /// Powered down
  poweredDown(7, 'Powered Down');

  const TimeType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
