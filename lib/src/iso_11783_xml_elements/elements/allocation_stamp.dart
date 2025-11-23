// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso_11783_element.dart';

/// An element that specifies a recording of an allocation event.
///
/// The recording contains start time, whether it has happened or is planned,
/// and optionally stop time and duration. A position for where the allocation
/// happened can also be provided.

class AllocationStamp extends Iso11783Element {
  /// Default factory for creating an [AllocationStamp] with verified arguments.
  factory AllocationStamp({
    required DateTime start,
    required AllocationStampType type,
    List<Position>? position,
    DateTime? stop,
    int? duration,
  }) {
    if (position != null) {
      if (position.length > 2) {
        throw ArgumentError.value(
          position,
          'position',
          'Too many elements: ${position.length}, max elements: 2',
        );
      }
    }
    if (duration != null) {
      ArgumentValidation.checkValueInRange(
        value: duration,
        min: 0,
        max: 4294967294,
        name: 'duration',
      );
    }

    return AllocationStamp._(
      start: start,
      type: type,
      stop: stop,
      duration: duration,
      position: position,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  AllocationStamp._({
    required DateTime start,
    required AllocationStampType type,
    DateTime? stop,
    int? duration,
    List<Position>? position,
  }) : super(elementType: _elementType) {
    this.start = start;
    this.stop = stop;
    this.duration = duration;
    this.type = type;
    this.position.addAll(position);
  }

  AllocationStamp._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    position.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.position.xmlTag,
          )
          .map(Position._fromXmlElement)
          .toList(),
    );
    _argumentValidator();
  }

  void _argumentValidator() {
    if (position.length > 2) {
      throw ArgumentError.value(
        position,
        'position',
        'Too many elements: ${position.length}, max elements: 2',
      );
    }
    if (duration != null) {
      ArgumentValidation.checkValueInRange(
        value: duration!,
        min: 0,
        max: 4294967294,
        name: 'duration',
      );
    }
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.allocationStamp;

  /// Optional position for where the stamp was planned/effective.
  late final position = _XmlSyncedList<Position>(xmlElement: xmlElement);

  /// Start time.
  DateTime get start => parseDateTime('A');
  set start(DateTime value) => setDateTime('A', value);

  /// End time.
  DateTime? get stop => tryParseDateTime('B');
  set stop(DateTime? value) => setDateTimeNullable('B', value);

  /// How long the time between [start] and [stop] is in seconds.
  int? get duration => tryParseInt('C');
  set duration(int? value) => setIntNullable('C', value);

  /// Whether this is [AllocationStampType.planned] to happen in the future,
  /// or [AllocationStampType.effective] has already happened.
  AllocationStampType get type => AllocationStampType.values.firstWhere(
    (type) => type.value == parseInt('D'),
    orElse: () => throw ArgumentError(
      '''`${xmlElement.getAttribute('D')}` is not one of the supported values: ${AllocationStampType.values.join(', ')}''',
    ),
  );
  set type(AllocationStampType value) => setInt('D', value.value);
}

/// An enumerator for whether the [AllocationStamp] is planned for the future
/// or is effective, i.e. has already happened.
enum AllocationStampType {
  /// The [AllocationStamp] is planned to happen in the future. Typically
  /// assigned by an FMIS.
  planned(1, 'Planned'),

  /// The [AllocationStamp] is effective, i.e. has already happened.
  /// Typically assigned by an MCIS.
  effective(4, 'Effective');

  const AllocationStampType(this.value, this.description);

  /// The XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
