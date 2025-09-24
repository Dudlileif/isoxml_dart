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

class DeviceAllocation extends Iso11783Element with _AllocationStampMixin {
  /// Default factory for creating a [DeviceAllocation] with verified
  /// arguments.
  factory DeviceAllocation({
    required String clientNAMEValue,
    String? clientNAMEMask,
    String? deviceIdRef,
    AllocationStamp? allocationStamp,
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
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  DeviceAllocation._({
    required String clientNAMEValue,
    String? clientNAMEMask,
    String? deviceIdRef,
    AllocationStamp? allocationStamp,
  }) : super(
         elementType: Iso11783ElementType.deviceAllocation,
         description: 'DeviceAllocation',
       ) {
    this.clientNAMEValue = clientNAMEValue;
    this.clientNAMEMask = clientNAMEMask;
    this.deviceIdRef = deviceIdRef;
    this.allocationStamp = allocationStamp;
  }

  /// NAME of the client from the [Device] the [Task] is planned for or was
  /// processed with.
  String get clientNAMEValue => parseString('A');
  set clientNAMEValue(String value) => setString('A', value);

  /// Bit-Mask, which is to be used for a logical `AND` operation to
  /// [clientNAMEValue], to allow more then one specific [Device] for the
  /// task.
  ///
  /// bit=1 => relevant bit of the [clientNAMEValue].
  /// bit=0 => bit of the [clientNAMEValue] is not relevant.
  String? get clientNAMEMask => tryParseString('B');
  set clientNAMEMask(String? value) => setStringNullable('B', value);

  /// Reference to a [Device].
  String? get deviceIdRef => tryParseString('C');
  set deviceIdRef(String? value) => setStringNullable('C', value);
}
