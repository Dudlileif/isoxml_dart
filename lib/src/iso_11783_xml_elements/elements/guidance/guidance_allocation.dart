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
    with _$GuidanceAllocationXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [GuidanceAllocation] with verified
  /// arguments.
  factory GuidanceAllocation({
    required List<AllocationStamp> allocationStamps,
    required String groupIdRef,
    List<GuidanceShift>? shifts,
    List<XmlAttribute>? customAttributes,
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
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  GuidanceAllocation._({
    required List<AllocationStamp> allocationStamps,
    required this.groupIdRef,
    List<GuidanceShift>? shifts,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.guidanceAllocation,
         description: 'GuidanceAllocation',
         onlyVersion4AndAbove: true,
       ) {
    this.allocationStamps.addAll(allocationStamps);
    if (shifts != null) {
      this.shifts.addAll(shifts);
    }
  }

  /// Creates a [GuidanceAllocation] from [element].
  factory GuidanceAllocation.fromXmlElement(XmlElement element) {
    final allocationStamps = element.getElements('ASP')!;
    final shifts = element.getElements('GST');
    final groupIdRef = element.getAttribute('A')!;
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return GuidanceAllocation(
      allocationStamps: allocationStamps
          .map(AllocationStamp.fromXmlElement)
          .toList(),
      shifts: shifts?.map(GuidanceShift.fromXmlElement).toList(),
      groupIdRef: groupIdRef,
      customAttributes: customAttributes,
    );
  }

  /// A list of [AllocationStamp]s for this.
  @annotation.XmlElement(name: 'ASP')
  final List<AllocationStamp> allocationStamps = [];

  /// A list of [GuidanceShift]s for this.
  @annotation.XmlElement(name: 'GST')
  final List<GuidanceShift> shifts = [];

  /// Reference to a [GuidanceGroup].
  @annotation.XmlAttribute(name: 'A')
  final String groupIdRef;

  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
    ...[
      for (final a in allocationStamps.map((e) => e.selfWithRecursiveChildren))
        ...a,
    ],
    ...[
      for (final a in shifts.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
  ];

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$GuidanceAllocationBuildXmlChildren(this, builder, namespaces: namespaces);
    if (customAttributes != null && customAttributes!.isNotEmpty) {
      for (final attribute in customAttributes!) {
        builder.attribute(attribute.name.local, attribute.value);
      }
    }
  }

  /// Returns a list of the XML attributes of this.
  @override
  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    final attributes = _$GuidanceAllocationToXmlAttributes(
      this,
      namespaces: namespaces,
    );
    if (customAttributes != null) {
      attributes.addAll(customAttributes!);
    }
    return attributes;
  }

  @override
  List<Object?> get props => [
    allocationStamps,
    shifts,
    groupIdRef,
  ];
}
