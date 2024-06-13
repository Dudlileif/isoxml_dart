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
@CopyWith()
@annotation.XmlRootElement(name: 'GAN')
@annotation.XmlSerializable(createMixin: true)
class GuidanceAllocation extends Iso11783Element
    with _$GuidanceAllocationXmlSerializableMixin {
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
      idRefPattern: GuidanceGroup.idRefPattern,
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
  const GuidanceAllocation._({
    required this.allocationStamps,
    required this.groupIdRef,
    this.shifts,
  }) : super(
          tag: Iso11783XmlTag.guidanceAllocation,
          description: 'GuidanceAllocation',
          onlyVersion4AndAbove: true,
        );

  /// Creates a [GuidanceAllocation] from [element].
  factory GuidanceAllocation.fromXmlElement(XmlElement element) =>
      _$GuidanceAllocationFromXmlElement(element);

  /// A list of [AllocationStamp]s for this.
  @annotation.XmlElement(name: 'ASP')
  final List<AllocationStamp> allocationStamps;

  /// A list of [GuidanceShift]s for this.
  @annotation.XmlElement(name: 'GST')
  final List<GuidanceShift>? shifts;

  /// Reference to a [GuidanceGroup].
  @annotation.XmlAttribute(name: 'A')
  final String groupIdRef;

  @override
  List<Object?> get props => super.props
    ..addAll([
      allocationStamps,
      shifts,
      groupIdRef,
    ]);
}
