// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes the allocation of [Worker]s to a [Task].
///
/// The [AllocationStamp] entry describes the start/stop time of worker
/// allocations and the changes of the [WorkerAllocation]s inside a [Task].
@CopyWith()
@annotation.XmlRootElement(name: 'WAN')
@annotation.XmlSerializable(createMixin: true)
class WorkerAllocation extends Iso11783Element
    with _$WorkerAllocationXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [WorkerAllocation] with verified
  /// arguments.
  factory WorkerAllocation({
    required String workerIdRef,
    AllocationStamp? allocationStamp,
    List<XmlAttribute>? customAttributes,
  }) {
    ArgumentValidation.checkId(
      id: workerIdRef,
      idRefPattern: Worker.staticIdRefPattern,
      idName: 'workerIdRef',
    );
    return WorkerAllocation._(
      workerIdRef: workerIdRef,
      allocationStamp: allocationStamp,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const WorkerAllocation._({
    required this.workerIdRef,
    this.allocationStamp,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.workerAllocation,
         description: 'WorkerAllocation',
       );

  /// Creates a [WorkerAllocation] from [element].
  factory WorkerAllocation.fromXmlElement(XmlElement element) {
    final allocationStamp = element.getElement('ASP');
    final workerIdRef = element.getAttribute('A')!;
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return WorkerAllocation(
      allocationStamp: allocationStamp != null
          ? AllocationStamp.fromXmlElement(allocationStamp)
          : null,
      workerIdRef: workerIdRef,
      customAttributes: customAttributes,
    );
  }

  /// [AllocationStamp] for position and time for this.
  @annotation.XmlElement(name: 'ASP', includeIfNull: false)
  final AllocationStamp? allocationStamp;

  /// Reference to a [Worker].
  @annotation.XmlAttribute(name: 'A')
  final String workerIdRef;

  @override
  Iterable<Iso11783Element>? get recursiveChildren =>
      allocationStamp?.selfWithRecursiveChildren;

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$WorkerAllocationBuildXmlChildren(this, builder, namespaces: namespaces);
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
    final attributes = _$WorkerAllocationToXmlAttributes(
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
    allocationStamp,
    workerIdRef,
  ];
}
