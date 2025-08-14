// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that includes information on which [Device]s the planned
/// [Task] was created for and which [Device]s were actually used during task
/// processing.
///
/// For a planned [Task] the [DeviceAllocation] describes the
/// [clientNAMEValue] and optionally a [clientNAMEMask] to enable a range of
/// NAME values which can specify [Device]s that are also allowed for the task
/// processing. During task processing the task controller modifies the
/// [clientNAMEValue] attribute to the NAME of the client that was actually used
/// to perform the task.
@CopyWith()
@annotation.XmlRootElement(name: 'DAN')
@annotation.XmlSerializable(createMixin: true)
class DeviceAllocation extends Iso11783Element
    with _$DeviceAllocationXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [DeviceAllocation] with verified
  /// arguments.
  factory DeviceAllocation({
    required String clientNAMEValue,
    String? clientNAMEMask,
    String? deviceIdRef,
    AllocationStamp? allocationStamp,
    List<XmlAttribute>? customAttributes,
  }) {
    ArgumentValidation.checkHexStringLength(
      clientNAMEValue,
      name: 'clientNAMEValue',
      minBytes: 8,
      maxBytes: 8,
    );
    if (clientNAMEMask != null) {
      ArgumentValidation.checkHexStringLength(
        clientNAMEMask,
        name: 'clientNAMEMask',
        minBytes: 8,
        maxBytes: 8,
      );
    }
    if (deviceIdRef != null) {
      ArgumentValidation.checkId(
        id: deviceIdRef,
        idRefPattern: Device.staticIdRefPattern,
        idName: 'deviceIdRef',
      );
    }

    return DeviceAllocation._(
      clientNAMEValue: clientNAMEValue,
      clientNAMEMask: clientNAMEMask,
      deviceIdRef: deviceIdRef,
      allocationStamp: allocationStamp,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const DeviceAllocation._({
    required this.clientNAMEValue,
    this.clientNAMEMask,
    this.deviceIdRef,
    this.allocationStamp,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.deviceAllocation,
         description: 'DeviceAllocation',
       );

  /// Creates a [DeviceAllocation] from [element].
  factory DeviceAllocation.fromXmlElement(XmlElement element) {
    final allocationStamp = element.getElement('ASP');
    final clientNAMEValue = element.getAttribute('A')!;
    final clientNAMEMask = element.getAttribute('B');
    final deviceIdRef = element.getAttribute('C');
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return DeviceAllocation(
      allocationStamp: allocationStamp != null
          ? AllocationStamp.fromXmlElement(allocationStamp)
          : null,
      clientNAMEValue: clientNAMEValue,
      clientNAMEMask: clientNAMEMask,
      deviceIdRef: deviceIdRef,
      customAttributes: customAttributes,
    );
  }

  /// [AllocationStamp] for specifying the position and time of this allocation.
  @annotation.XmlElement(name: 'ASP', includeIfNull: false)
  final AllocationStamp? allocationStamp;

  /// NAME of the client from the [Device] the [Task] is planned for or was
  /// processed with.
  @annotation.XmlAttribute(name: 'A')
  final String clientNAMEValue;

  /// Bit-Mask, which is to be used for a logical `AND` operation to
  /// [clientNAMEValue], to allow more then one specific [Device] for the
  /// task.
  ///
  /// bit=1 => relevant bit of the [clientNAMEValue].
  /// bit=0 => bit of the [clientNAMEValue] is not relevant.
  @annotation.XmlAttribute(name: 'B')
  final String? clientNAMEMask;

  /// Reference to a [Device].
  @annotation.XmlAttribute(name: 'C')
  final String? deviceIdRef;

  @override
  Iterable<Iso11783Element>? get recursiveChildren =>
      allocationStamp?.selfWithRecursiveChildren;

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$DeviceAllocationBuildXmlChildren(this, builder, namespaces: namespaces);
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
    final attributes = _$DeviceAllocationToXmlAttributes(
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
    clientNAMEValue,
    clientNAMEMask,
    deviceIdRef,
  ];
}
