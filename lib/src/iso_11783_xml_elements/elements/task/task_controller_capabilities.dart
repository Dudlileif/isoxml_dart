// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes the application version ang control capabilities
/// of the task controller that generated the data transfer file set.
///
/// [TaskControllerCapabilities] elements should only be included if the
/// source is MICS, and at least one if this is the case.
@CopyWith()
@annotation.XmlRootElement(name: 'TCC')
@annotation.XmlSerializable(createMixin: true)
class TaskControllerCapabilities extends Iso11783Element
    with _$TaskControllerCapabilitiesXmlSerializableMixin, EquatableMixin {
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
    ArgumentValidation.checkHexStringLength(
      functionNAME,
      name: 'functionNAME',
      minBytes: 8,
      maxBytes: 8,
    );
    ArgumentValidation.checkStringLength(designator, maxLength: 153);
    ArgumentValidation.checkValueInRange(
      value: providedCapabilities,
      min: 0,
      max: 63,
      name: 'providedCapabilities',
    );
    ArgumentValidation.checkValueInRange(
      value: numberOfBoomsSectionControl,
      min: 0,
      max: 254,
      name: 'numberOfBoomsSectionControl',
    );
    ArgumentValidation.checkValueInRange(
      value: numberOfSectionsSectionControl,
      min: 0,
      max: 254,
      name: 'numberOfSectionsSectionControl',
    );
    ArgumentValidation.checkValueInRange(
      value: numberOfControlChannels,
      min: 0,
      max: 254,
      name: 'numberOfControlChannels',
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
  const TaskControllerCapabilities._({
    required this.functionNAME,
    required this.designator,
    required this.versionNumber,
    required this.providedCapabilities,
    required this.numberOfBoomsSectionControl,
    required this.numberOfSectionsSectionControl,
    required this.numberOfControlChannels,
  }) : super(
          elementType: Iso11783ElementType.taskControllerCapabilities,
          description: 'TaskControllerCapabilities',
          onlyVersion4AndAbove: true,
        );

  /// Creates a [TaskControllerCapabilities] from [element].
  factory TaskControllerCapabilities.fromXmlElement(XmlElement element) =>
      _$TaskControllerCapabilitiesFromXmlElement(element);

  /// NAME of the function.
  ///
  /// See ISO 11783-5 for description of NAME.
  @annotation.XmlAttribute(name: 'A')
  final String functionNAME;

  /// Name of the task controller product, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  /// The version number of this.
  @annotation.XmlAttribute(name: 'C')
  final VersionNumber versionNumber;

  /// A value for provided capabilities.
  ///
  /// 6 bit mask
  /// -----1:  1 Supports documentation
  /// ----1-:  2 Supports TC-GEO without position control
  /// ---1--:  4 Supports TC-GEO with position control
  /// --1---:  8 Supports assignment single-level control
  /// -1----: 16 Supports section control
  /// 1-----: 32 Supports graded application polygon
  @annotation.XmlAttribute(name: 'D')
  final int providedCapabilities;

  /// How many booms this can control.
  @annotation.XmlAttribute(name: 'E')
  final int numberOfBoomsSectionControl;

  /// How many sections this can control.
  @annotation.XmlAttribute(name: 'F')
  final int numberOfSectionsSectionControl;

  /// How many control channels this has.
  @annotation.XmlAttribute(name: 'G')
  final int numberOfControlChannels;

  /// [providedCapabilities] mapped to enumeration values from
  /// [ProvidedCapability].
  List<ProvidedCapability> get capabilities => ProvidedCapability.values
      .where(
        (capability) =>
            providedCapabilities & capability.bitMask == capability.bitMask,
      )
      .toList();

  @override
  List<Object?> get props => [
        functionNAME,
        designator,
        versionNumber,
        providedCapabilities,
        numberOfBoomsSectionControl,
        numberOfSectionsSectionControl,
        numberOfControlChannels,
      ];
}

/// An enumerator for which version a TaskController is.
@annotation.XmlEnum()
enum VersionNumber {
  /// 0, Pre first edition.
  @annotation.XmlValue('0')
  dis1(0, 'The version of the DIS.1 (first draft international standard)'),

  /// 1, First edition
  @annotation.XmlValue('1')
  fdis1(
    1,
    '''The version of the FDIS.1 (final draft international standard, first edition)''',
  ),

  /// 2, Second edition
  @annotation.XmlValue('2')
  fdis2(
    2,
    '''The version of the FDIS.2 and the first edition published as an international standard''',
  ),

  /// 3, Third edition
  @annotation.XmlValue('3')
  e2dis(
    3,
    '''The version of the second edition published as a draft international standard (E2.DIS)''',
  ),

  /// 4, Fourth and current edition
  @annotation.XmlValue('4')
  e2fdis(
    4,
    '''The version of the second edition published as a final draft international standard (E2.FDIS)''',
  ),
  ;

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
