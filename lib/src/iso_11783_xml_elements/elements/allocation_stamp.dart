// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso_11783_element.dart';

/// An element that specifies a recording of an allocation event.
///
/// The recording contains start time, whether it has happened or is planned,
/// and optionally stop time and duration. A position for where the allocation
/// happened can also be provided.
@CopyWith()
@annotation.XmlRootElement(name: 'ASP')
@annotation.XmlSerializable(createMixin: true)
class AllocationStamp extends Iso11783Element
    with _$AllocationStampXmlSerializableMixin {
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
    required this.start,
    required this.type,
    this.stop,
    this.duration,
    List<Position>? position,
  }) : super(
          elementType: Iso11783ElementType.allocationStamp,
          description: 'AllocationStamp',
        ) {
    if (position != null) {
      this.position.addAll(position);
    }
  }

  /// Creates an [AllocationStamp] from [element].
  factory AllocationStamp.fromXmlElement(XmlElement element) {
    final position = element.getElements('PTN');
    final start = element.getAttribute('A')!;
    final stop = element.getAttribute('B');
    final duration = element.getAttribute('C');
    final type = element.getAttribute('D')!;
    return AllocationStamp(
      position: position?.map(Position.fromXmlElement).toList(),
      start: DateTime.parse(start),
      stop: stop != null ? DateTime.parse(stop) : null,
      duration: duration != null ? int.parse(duration) : null,
      type: $AllocationStampTypeEnumMap.entries
          .singleWhere(
            (allocationStampTypeEnumMapEntry) =>
                allocationStampTypeEnumMapEntry.value == type,
            orElse: () => throw ArgumentError(
              '''`$type` is not one of the supported values: ${$AllocationStampTypeEnumMap.values.join(', ')}''',
            ),
          )
          .key,
    );
  }

  /// Optional position for where the stamp was planned/effective.
  @annotation.XmlElement(name: 'PTN')
  final List<Position> position = [];

  /// Start time.
  @annotation.XmlAttribute(name: 'A')
  final DateTime start;

  /// End time.
  @annotation.XmlAttribute(name: 'B')
  final DateTime? stop;

  /// How long the time between [start] and [stop] is in seconds.
  @annotation.XmlAttribute(name: 'C')
  final int? duration;

  /// Whether this is [AllocationStampType.planned] to happen in the future,
  /// or [AllocationStampType.effective] has already happened.
  @annotation.XmlAttribute(name: 'D')
  final AllocationStampType type;

  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
        ...[
          for (final a in position.map((e) => e.selfWithRecursiveChildren))
            ...a,
        ],
      ];

  @override
  List<Object?> get props => super.props
    ..addAll([
      position,
      start,
      stop,
      duration,
      type,
    ]);
}

/// An enumerator for whether the [AllocationStamp] is planned for the future
/// or is effective, i.e. has already happened.
@annotation.XmlEnum()
enum AllocationStampType {
  /// The [AllocationStamp] is planned to happen in the future. Typically
  /// assigned by an FMIS.
  @annotation.XmlValue('1')
  planned(1, 'Planned'),

  /// The [AllocationStamp] is effective, i.e. has already happened.
  /// Typically assigned by an MCIS.
  @annotation.XmlValue('4')
  effective(4, 'Effective');

  const AllocationStampType(this.value, this.description);

  /// The XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
