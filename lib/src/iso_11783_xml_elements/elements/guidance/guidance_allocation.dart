// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes the allocation of [GuidanceGroup]s and
/// [GuidanceShift]s to a [Task].
///
/// The [allocationStamps] list has entries that describes the start/stop times
/// of guidance allocations and the changes of the [GuidanceAllocation] inside
/// a [Task].
class GuidanceAllocation extends Iso11783Element {
  /// Default factory for creating a [GuidanceAllocation] with verified
  /// arguments.
  factory GuidanceAllocation({
    required List<AllocationStamp> allocationStamps,
    required String groupIdRef,
    List<GuidanceShift>? shifts,
  }) {
    if (allocationStamps.isEmpty) {
      throw ArgumentError.value(
        allocationStamps,
        'allocationStamps',
        'Should not be empty',
      );
    }
    ArgumentValidation.checkId(
      id: groupIdRef,
      idRefPattern: GuidanceGroup.staticIdRefPattern,
      idName: 'groupIdRef',
    );
    return GuidanceAllocation._(
      allocationStamps: allocationStamps,
      shifts: shifts,
      groupIdRef: groupIdRef,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  GuidanceAllocation._({
    required List<AllocationStamp> allocationStamps,
    required String groupIdRef,
    List<GuidanceShift>? shifts,
  }) : super(elementType: _elementType) {
    this.groupIdRef = groupIdRef;
    this.allocationStamps.addAll(allocationStamps);
    this.shifts.addAll(shifts);
  }

  GuidanceAllocation._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    allocationStamps.addAll(
      xmlElement
          .findElements(Iso11783ElementType.allocationStamp.xmlTag)
          .map(AllocationStamp._fromXmlElement)
          .toList(),
    );
    shifts.addAll(
      xmlElement
          .findElements(Iso11783ElementType.guidanceShift.xmlTag)
          .map(GuidanceShift._fromXmlElement)
          .toList(),
    );
    _argumentValidator();
  }

  void _argumentValidator() {
    if (allocationStamps.isEmpty) {
      throw ArgumentError.value(
        allocationStamps,
        'allocationStamps',
        'Should not be empty',
      );
    }
    ArgumentValidation.checkId(
      id: groupIdRef,
      idRefPattern: GuidanceGroup.staticIdRefPattern,
      idName: 'groupIdRef',
    );
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.guidanceAllocation;

  /// A list of [AllocationStamp]s for this.
  late final allocationStamps = _XmlSyncedList<AllocationStamp>(
    xmlElement: xmlElement,
  );

  /// A list of [GuidanceShift]s for this.
  late final shifts = _XmlSyncedList<GuidanceShift>(xmlElement: xmlElement);

  /// Reference to a [GuidanceGroup].
  String get groupIdRef => parseString('A');
  set groupIdRef(String value) => setString('A', value);
}
