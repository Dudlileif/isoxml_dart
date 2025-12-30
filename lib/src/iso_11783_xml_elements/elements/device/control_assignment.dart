// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that binds a setpoint source control function (CF) to a setpoint
/// user CF.
class ControlAssignment extends Iso11783Element with _AllocationStampMixin {
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
    _argumentValidator(
      sourceClientNAME: sourceClientNAME,
      userClientNAME: userClientNAME,
      sourceDeviceStructureLabel: sourceDeviceStructureLabel,
      userDeviceStructureLabel: userDeviceStructureLabel,
      sourceDeviceElementNumber: sourceDeviceElementNumber,
      userDeviceElementNumber: userDeviceElementNumber,
      processDataDDI: processDataDDI,
      allocationStamp: allocationStamp,
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
  ControlAssignment._({
    required String sourceClientNAME,
    required String userClientNAME,
    required String sourceDeviceStructureLabel,
    required String userDeviceStructureLabel,
    required int sourceDeviceElementNumber,
    required int userDeviceElementNumber,
    required String processDataDDI,
    AllocationStamp? allocationStamp,
  }) : super._(elementType: _elementType) {
    this.sourceClientNAME = sourceClientNAME;
    this.userClientNAME = userClientNAME;
    this.sourceDeviceStructureLabel = sourceDeviceStructureLabel;
    this.userDeviceStructureLabel = userDeviceStructureLabel;
    this.sourceDeviceElementNumber = sourceDeviceElementNumber;
    this.userDeviceElementNumber = userDeviceElementNumber;
    this.processDataDDI = processDataDDI;
    this.allocationStamp = allocationStamp;
  }

  ControlAssignment._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    _parseAllocationStamp();
    _argumentValidator(
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

  static void _argumentValidator({
    required String sourceClientNAME,
    required String userClientNAME,
    required String sourceDeviceStructureLabel,
    required String userDeviceStructureLabel,
    required int sourceDeviceElementNumber,
    required int userDeviceElementNumber,
    required String processDataDDI,
    required AllocationStamp? allocationStamp,
  }) {
    ArgumentValidation.checkHexStringLength(
      sourceClientNAME,
      name: 'ControlAssignment.sourceClientNAME',
      minBytes: 8,
      maxBytes: 8,
    );
    ArgumentValidation.checkHexStringLength(
      userClientNAME,
      name: 'ControlAssignment.userClientNAME',
      minBytes: 8,
      maxBytes: 8,
    );
    ArgumentValidation.checkId(
      id: sourceDeviceStructureLabel,
      idRefPattern: Device.structureLabelPattern,
      minLength: 14,
      maxLength: 78,
      name: 'ControlAssignment.sourceDeviceStructureLabel',
    );
    ArgumentValidation.checkId(
      id: userDeviceStructureLabel,
      idRefPattern: Device.structureLabelPattern,
      minLength: 14,
      maxLength: 78,
      name: 'ControlAssignment.userDeviceStructureLabel',
    );
    ArgumentValidation.checkValueInRange(
      value: sourceDeviceElementNumber,
      min: 0,
      max: 4095,
      name: 'ControlAssignment.sourceDeviceElementNumber',
    );
    ArgumentValidation.checkValueInRange(
      value: userDeviceElementNumber,
      min: 0,
      max: 4095,
      name: 'ControlAssignment.userDeviceElementNumber',
    );
    ArgumentValidation.checkHexStringLength(
      processDataDDI,
      name: 'ControlAssignment.processDataDDI',
    );
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.controlAssignment;

  /// NAME of the control function source.
  ///
  /// See ISO 11783-5 for description of NAME.
  String get sourceClientNAME => parseString('A');
  set sourceClientNAME(String value) => setString('A', value);

  /// NAME of the control function user.
  ///
  /// See ISO 11783-5 for description of NAME.
  String get userClientNAME => parseString('B');
  set userClientNAME(String value) => setString('B', value);

  /// Structure label for the source [Device].
  String get sourceDeviceStructureLabel => parseString('C');
  set sourceDeviceStructureLabel(String value) => setString('C', value);

  /// Structure label for the user [Device].
  String get userDeviceStructureLabel => parseString('D');
  set userDeviceStructureLabel(String value) => setString('D', value);

  /// [DeviceElement] number for the source [Device].
  int get sourceDeviceElementNumber => parseInt('E');
  set sourceDeviceElementNumber(int value) => setInt('E', value);

  /// [DeviceElement] number for the user [Device].
  int get userDeviceElementNumber => parseInt('F');
  set userDeviceElementNumber(int value) => setInt('F', value);

  /// A unique Data Dictionary Identifier which identifies a
  /// [ProcessDataVariable].
  ///
  /// The [ProcessDataVariable] is found as a Device Dictionary Entity (DDE)
  /// in the ISO 11783-11 database.
  String get processDataDDI => parseString('G');
  set processDataDDI(String value) => setString('G', value);
}
