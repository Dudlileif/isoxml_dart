// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes the application version ang control capabilities
/// of the task controller that generated the data transfer file set.
///
/// [TaskControllerCapabilities] elements should only be included if the
/// source is MICS, and at least one if this is the case.
class TaskControllerCapabilities extends Iso11783Element {
  /// Default factory for creating a [TaskControllerCapabilities] with
  /// verified arguments.
  factory TaskControllerCapabilities({
    required String functionNAME,
    required String designator,
    required VersionNumber versionNumber,
    required int providedCapabilities,
    required int numberOfBoomsSectionControl,
    required int numberOfSectionsSectionControl,
    required int numberOfControlChannels,
  }) {
    _argumentValidator(
      functionNAME: functionNAME,
      designator: designator,
      versionNumber: versionNumber,
      providedCapabilities: providedCapabilities,
      numberOfBoomsSectionControl: numberOfBoomsSectionControl,
      numberOfSectionsSectionControl: numberOfSectionsSectionControl,
      numberOfControlChannels: numberOfControlChannels,
    );

    return TaskControllerCapabilities._(
      functionNAME: functionNAME,
      designator: designator,
      versionNumber: versionNumber,
      providedCapabilities: providedCapabilities,
      numberOfBoomsSectionControl: numberOfBoomsSectionControl,
      numberOfSectionsSectionControl: numberOfSectionsSectionControl,
      numberOfControlChannels: numberOfControlChannels,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  TaskControllerCapabilities._({
    required String functionNAME,
    required String designator,
    required VersionNumber versionNumber,
    required int providedCapabilities,
    required int numberOfBoomsSectionControl,
    required int numberOfSectionsSectionControl,
    required int numberOfControlChannels,
  }) : super._(elementType: _elementType) {
    this.functionNAME = functionNAME;
    this.designator = designator;
    this.versionNumber = versionNumber;
    this.providedCapabilities = providedCapabilities;
    this.numberOfBoomsSectionControl = numberOfBoomsSectionControl;
    this.numberOfSectionsSectionControl = numberOfSectionsSectionControl;
    this.numberOfControlChannels = numberOfControlChannels;
  }

  TaskControllerCapabilities._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    _argumentValidator(
      functionNAME: functionNAME,
      designator: designator,
      versionNumber: versionNumber,
      providedCapabilities: providedCapabilities,
      numberOfBoomsSectionControl: numberOfBoomsSectionControl,
      numberOfSectionsSectionControl: numberOfSectionsSectionControl,
      numberOfControlChannels: numberOfControlChannels,
    );
  }

  static void _argumentValidator({
    required String functionNAME,
    required String designator,
    required VersionNumber versionNumber,
    required int providedCapabilities,
    required int numberOfBoomsSectionControl,
    required int numberOfSectionsSectionControl,
    required int numberOfControlChannels,
  }) {
    ArgumentValidation.checkHexStringLength(
      functionNAME,
      name: 'TaskControllerCapabilities.functionNAME',
      minBytes: 8,
      maxBytes: 8,
    );
    ArgumentValidation.checkStringLength(
      designator,
      maxLength: 153,
      name: 'TaskControllerCapabilities.designator',
    );
    ArgumentValidation.checkValueInRange(
      value: providedCapabilities,
      min: 0,
      max: 63,
      name: 'TaskControllerCapabilities.providedCapabilities',
    );
    ArgumentValidation.checkValueInRange(
      value: numberOfBoomsSectionControl,
      min: 0,
      max: 254,
      name: 'TaskControllerCapabilities.numberOfBoomsSectionControl',
    );
    ArgumentValidation.checkValueInRange(
      value: numberOfSectionsSectionControl,
      min: 0,
      max: 254,
      name: 'TaskControllerCapabilities.numberOfSectionsSectionControl',
    );
    ArgumentValidation.checkValueInRange(
      value: numberOfControlChannels,
      min: 0,
      max: 254,
      name: 'TaskControllerCapabilities.numberOfControlChannels',
    );
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.taskControllerCapabilities;

  /// NAME of the function.
  ///
  /// See ISO 11783-5 for description of NAME.
  String get functionNAME => parseString('A');
  set functionNAME(String value) => setString('A', value);

  /// Name of the task controller product, description or comment.
  String get designator => parseString('B');
  set designator(String value) => setString('B', value);

  /// The version number of this.
  VersionNumber get versionNumber => VersionNumber.values.firstWhere(
    (type) => type.value == parseInt('C'),
    orElse: () => throw ArgumentError.value(
      xmlElement.getAttribute('C'),
      'TaskControllerCapabilities.versionNumber',
      '''is not one of the supported values: ${VersionNumber.values.join(', ')}''',
    ),
  );
  set versionNumber(VersionNumber value) => setInt('C', value.value);

  /// A value for provided capabilities.
  ///
  /// 6 bit mask
  /// -----1:  1 Supports documentation
  /// ----1-:  2 Supports TC-GEO without position control
  /// ---1--:  4 Supports TC-GEO with position control
  /// --1---:  8 Supports assignment single-level control
  /// -1----: 16 Supports section control
  /// 1-----: 32 Supports graded application polygon
  int get providedCapabilities => parseInt('D');
  set providedCapabilities(int value) => setInt('D', value);

  /// How many booms this can control.
  int get numberOfBoomsSectionControl => parseInt('E');
  set numberOfBoomsSectionControl(int value) => setInt('E', value);

  /// How many sections this can control.
  int get numberOfSectionsSectionControl => parseInt('F');
  set numberOfSectionsSectionControl(int value) => setInt('F', value);

  /// How many control channels this has.
  int get numberOfControlChannels => parseInt('G');
  set numberOfControlChannels(int value) => setInt('G', value);
}

/// An enumerator for which version a TaskController is.
enum VersionNumber {
  /// 0, Pre first edition.
  dis1(0, 'The version of the DIS.1 (first draft international standard)'),

  /// 1, First edition
  fdis1(
    1,
    '''The version of the FDIS.1 (final draft international standard, first edition)''',
  ),

  /// 2, Second edition
  fdis2(
    2,
    '''The version of the FDIS.2 and the first edition published as an international standard''',
  ),

  /// 3, Third edition
  e2dis(
    3,
    '''The version of the second edition published as a draft international standard (E2.DIS)''',
  ),

  /// 4, Fourth and current edition
  e2fdis(
    4,
    '''The version of the second edition published as a final draft international standard (E2.FDIS)''',
  );

  const VersionNumber(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An enumerator for the possible supported capabilites of a task controller.
enum ProvidedCapability {
  /// Supports documentation
  documentation(1),

  /// Supports TC-GEO without position control
  geoWithoutPositionControl(2),

  /// Supports TC-GEO with position control
  geoPositionControl(4),

  /// Supports assignment single-level control
  assignmentSingleLevelControl(8),

  /// Supports section control
  sectionControl(16),

  /// Supports graded application polygon
  gradedApplicationPolygon(32);

  const ProvidedCapability(this.bitMask);

  /// The bit mask to check if this capabilty is supported in
  /// [TaskControllerCapabilities.providedCapabilities].
  final int bitMask;
}
