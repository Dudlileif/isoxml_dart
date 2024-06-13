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
  }) : super(tag: Iso11783XmlTag.time, description: 'Time');

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
