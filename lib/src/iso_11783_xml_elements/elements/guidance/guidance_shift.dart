// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element for describing a shift/move of a [GuidancePattern] or
/// [GuidanceGroup].
///
/// These shifts can be used to move the baseline for creating the waylines,
/// but keep the same [GuidancePattern] as reference shape.
class GuidanceShift extends Iso11783Element with _AllocationStampMixin {
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
    _argumentValidator(
      allocationStamp: allocationStamp,
      groupIdRef: groupIdRef,
      patternIdRef: patternIdRef,
      eastShift: eastShift,
      northShift: northShift,
      propagationOffset: propagationOffset,
    );

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
  GuidanceShift._({
    AllocationStamp? allocationStamp,
    String? groupIdRef,
    String? patternIdRef,
    int? eastShift,
    int? northShift,
    int? propagationOffset,
  }) : super._(elementType: _elementType) {
    this.allocationStamp = allocationStamp;
    this.groupIdRef = groupIdRef;
    this.patternIdRef = patternIdRef;
    this.eastShift = eastShift;
    this.northShift = northShift;
    this.propagationOffset = propagationOffset;
  }

  GuidanceShift._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    _parseAllocationStamp();
    _argumentValidator(
      allocationStamp: allocationStamp,
      groupIdRef: groupIdRef,
      patternIdRef: patternIdRef,
      eastShift: eastShift,
      northShift: northShift,
      propagationOffset: propagationOffset,
    );
  }

  static void _argumentValidator({
    required AllocationStamp? allocationStamp,
    required String? groupIdRef,
    required String? patternIdRef,
    required int? eastShift,
    required int? northShift,
    required int? propagationOffset,
  }) {
    if (groupIdRef != null) {
      ArgumentValidation.checkId(
        id: groupIdRef,
        idRefPattern: GuidanceGroup.staticIdRefPattern,
        name: 'GuidanceShift.groupIdRef',
      );
    }
    if (patternIdRef != null) {
      ArgumentValidation.checkId(
        id: patternIdRef,
        idRefPattern: GuidancePattern.staticIdRefPattern,
        name: 'GuidanceShift.patternIdRef',
      );
    }
    if (eastShift != null) {
      ArgumentValidation.checkValueInRange(
        value: eastShift,
        min: -2147483648,
        max: 2147483647,
        name: 'GuidanceShift.eastShift',
      );
    }
    if (northShift != null) {
      ArgumentValidation.checkValueInRange(
        value: northShift,
        min: -2147483648,
        max: 2147483647,
        name: 'GuidanceShift.northShift',
      );
    }
    if (propagationOffset != null) {
      ArgumentValidation.checkValueInRange(
        value: propagationOffset,
        min: -2147483648,
        max: 2147483647,
        name: 'GuidanceShift.propagationOffset',
      );
    }
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.guidanceShift;

  /// Reference to a [GuidanceGroup].
  String? get groupIdRef => tryParseString('A');
  set groupIdRef(String? value) => setStringNullable('A', value);

  /// Reference to a [GuidancePattern].
  String? get patternIdRef => tryParseString('B');
  set patternIdRef(String? value) => setStringNullable('B', value);

  /// Offset distance in millimeters in the east direction from point A of the
  /// pattern.
  int? get eastShift => tryParseInt('C');
  set eastShift(int? value) => setIntNullable('C', value);

  /// Offset distance in millimeters in the north direction from point A of the
  /// pattern.
  int? get northShift => tryParseInt('D');
  set northShift(int? value) => setIntNullable('D', value);

  /// Perpendicular offset millimeters from the direction of the pattern.
  ///
  /// Negative values shifts the pattern to the left and positive values
  /// shifts the pattern to the right.
  int? get propagationOffset => tryParseInt('E');
  set propagationOffset(int? value) => setIntNullable('E', value);
}
