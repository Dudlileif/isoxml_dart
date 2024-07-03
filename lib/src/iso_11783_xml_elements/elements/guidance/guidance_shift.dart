// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element for describing a shift/move of a [GuidancePattern] or
/// [GuidanceGroup].
///
/// These shifts can be used to move the baseline for creating the waylines,
/// but keep the same [GuidancePattern] as reference shape.
@CopyWith()
@annotation.XmlRootElement(name: 'GST')
@annotation.XmlSerializable(createMixin: true)
class GuidanceShift extends Iso11783Element
    with _$GuidanceShiftXmlSerializableMixin {
  /// Default factory for creating a [GuidanceShift] with verified
  /// arguments.
  factory GuidanceShift({
    AllocationStamp? allocationStamp,
    String? groupIdRef,
    String? patternIdRef,
    int? eastShift,
    int? northShift,
    int? propagationOffset,
  }) {
    if (groupIdRef != null) {
      ArgumentValidation.checkId(
        id: groupIdRef,
        idRefPattern: GuidanceGroup.staticIdRefPattern,
        idName: 'groupIdRef',
      );
    }
    if (patternIdRef != null) {
      ArgumentValidation.checkId(
        id: patternIdRef,
        idRefPattern: GuidancePattern.staticIdRefPattern,
        idName: 'patternIdRef',
      );
    }
    if (eastShift != null) {
      ArgumentValidation.checkValueInRange(
        value: eastShift,
        min: -2147483648,
        max: 2147483647,
        name: 'eastShift',
      );
    }
    if (northShift != null) {
      ArgumentValidation.checkValueInRange(
        value: northShift,
        min: -2147483648,
        max: 2147483647,
        name: 'northShift',
      );
    }
    if (propagationOffset != null) {
      ArgumentValidation.checkValueInRange(
        value: propagationOffset,
        min: -2147483648,
        max: 2147483647,
        name: 'propagationOffset',
      );
    }
    return GuidanceShift._(
      allocationStamp: allocationStamp,
      groupIdRef: groupIdRef,
      patternIdRef: patternIdRef,
      eastShift: eastShift,
      northShift: northShift,
      propagationOffset: propagationOffset,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const GuidanceShift._({
    this.allocationStamp,
    this.groupIdRef,
    this.patternIdRef,
    this.eastShift,
    this.northShift,
    this.propagationOffset,
  }) : super(
          elementType: Iso11783ElementType.guidanceShift,
          description: 'GuidanceShift',
          onlyVersion4AndAbove: true,
        );

  /// Creates a [GuidanceShift] from [element].
  factory GuidanceShift.fromXmlElement(XmlElement element) =>
      _$GuidanceShiftFromXmlElement(element);

  /// [AllocationStamp] for position and time of this.
  @annotation.XmlElement(name: 'ASP', includeIfNull: false)
  final AllocationStamp? allocationStamp;

  /// Reference to a [GuidanceGroup].
  @annotation.XmlAttribute(name: 'A')
  final String? groupIdRef;

  /// Reference to a [GuidancePattern].
  @annotation.XmlAttribute(name: 'B')
  final String? patternIdRef;

  /// Offset distance in millimeters in the east direction from point A of the
  /// pattern.
  @annotation.XmlAttribute(name: 'C')
  final int? eastShift;

  /// Offset distance in millimeters in the north direction from point A of the
  /// pattern.
  @annotation.XmlAttribute(name: 'D')
  final int? northShift;

  /// Perpendicular offset millimeters from the direction of the pattern.
  ///
  /// Negative values shifts the pattern to the left and positive values
  /// shifts the pattern to the right.
  @annotation.XmlAttribute(name: 'E')
  final int? propagationOffset;

  @override
  Iterable<Iso11783Element>? get recursiveChildren =>
      allocationStamp?.selfWithRecursiveChildren;

  @override
  List<Object?> get props => super.props
    ..addAll([
      allocationStamp,
      groupIdRef,
      patternIdRef,
      eastShift,
      northShift,
      propagationOffset,
    ]);
}
