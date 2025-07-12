// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that binds a setpoint source control function (CF) to a setpoint
/// user CF.
@CopyWith()
@annotation.XmlRootElement(name: 'CAT')
@annotation.XmlSerializable(createMixin: true)
class ControlAssignment extends Iso11783Element
    with _$ControlAssignmentXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [ControlAssignment] with verified
  /// arguments.
  factory ControlAssignment({
    required String sourceClientNAME,
    required String userClientNAME,
    required String sourceDeviceStructureLabel,
    required String userDeviceStructureLabel,
    required int sourceDeviceElementNumber,
    required int userDeviceElementNumber,
    required String processDataDDI,
    AllocationStamp? allocationStamp,
  }) {
    ArgumentValidation.checkHexStringLength(
      sourceClientNAME,
      name: 'sourceClientNAME',
      minBytes: 8,
      maxBytes: 8,
    );
    ArgumentValidation.checkHexStringLength(
      userClientNAME,
      name: 'userClientNAME',
      minBytes: 8,
      maxBytes: 8,
    );
    ArgumentValidation.checkId(
      id: sourceDeviceStructureLabel,
      idRefPattern: Device.structureLabelPattern,
      minLength: 14,
      maxLength: 78,
      idName: 'sourceDeviceStructureLabel',
    );
    ArgumentValidation.checkId(
      id: userDeviceStructureLabel,
      idRefPattern: Device.structureLabelPattern,
      minLength: 14,
      maxLength: 78,
      idName: 'userDeviceStructureLabel',
    );
    ArgumentValidation.checkValueInRange(
      value: sourceDeviceElementNumber,
      min: 0,
      max: 4095,
      name: 'sourceDeviceElementNumber',
    );
    ArgumentValidation.checkValueInRange(
      value: userDeviceElementNumber,
      min: 0,
      max: 4095,
      name: 'userDeviceElementNumber',
    );
    ArgumentValidation.checkHexStringLength(
      processDataDDI,
      name: 'processDataDDI',
    );

    return ControlAssignment._(
      sourceClientNAME: sourceClientNAME,
      userClientNAME: userClientNAME,
      sourceDeviceStructureLabel: sourceDeviceStructureLabel,
      userDeviceStructureLabel: userDeviceStructureLabel,
      sourceDeviceElementNumber: sourceDeviceElementNumber,
      userDeviceElementNumber: userDeviceElementNumber,
      processDataDDI: processDataDDI,
      allocationStamp: allocationStamp,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const ControlAssignment._({
    required this.sourceClientNAME,
    required this.userClientNAME,
    required this.sourceDeviceStructureLabel,
    required this.userDeviceStructureLabel,
    required this.sourceDeviceElementNumber,
    required this.userDeviceElementNumber,
    required this.processDataDDI,
    this.allocationStamp,
  }) : super(
         elementType: Iso11783ElementType.controlAssignment,
         description: 'ControlAssignment',
         onlyVersion4AndAbove: true,
       );

  /// Creates a [ControlAssignment] form [element].
  factory ControlAssignment.fromXmlElement(XmlElement element) =>
      _$ControlAssignmentFromXmlElement(element);

  /// [AllocationStamp] for specifying the position and time of this assignment.
  @annotation.XmlElement(name: 'ASP', includeIfNull: false)
  final AllocationStamp? allocationStamp;

  /// NAME of the control function source.
  ///
  /// See ISO 11783-5 for description of NAME.
  @annotation.XmlAttribute(name: 'A')
  final String sourceClientNAME;

  /// NAME of the control function user.
  ///
  /// See ISO 11783-5 for description of NAME.
  @annotation.XmlAttribute(name: 'B')
  final String userClientNAME;

  /// Structure label for the source [Device].
  @annotation.XmlAttribute(name: 'C')
  final String sourceDeviceStructureLabel;

  /// Structure label for the user [Device].
  @annotation.XmlAttribute(name: 'D')
  final String userDeviceStructureLabel;

  /// [DeviceElement] number for the source [Device].
  @annotation.XmlAttribute(name: 'E')
  final int sourceDeviceElementNumber;

  /// [DeviceElement] number for the user [Device].
  @annotation.XmlAttribute(name: 'F')
  final int userDeviceElementNumber;

  /// A unique Data Dictionary Identifier which identifies a
  /// [ProcessDataVariable].
  ///
  /// The [ProcessDataVariable] is found as a Device Dictionary Entity (DDE)
  /// in the ISO 11783-11 database.
  @annotation.XmlAttribute(name: 'G')
  final String processDataDDI;

  @override
  Iterable<Iso11783Element>? get recursiveChildren =>
      allocationStamp?.selfWithRecursiveChildren;

  @override
  List<Object?> get props => [
    allocationStamp,
    sourceClientNAME,
    userClientNAME,
    sourceDeviceStructureLabel,
    userDeviceStructureLabel,
    sourceDeviceElementNumber,
    userDeviceElementNumber,
    processDataDDI,
  ];
}
