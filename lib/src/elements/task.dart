// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that describes an ISO 11783 Task.
///
/// The Task is the central XML element in the data transfer file. It contains
/// references to various other XML elements to express allocation of resources
/// and specification of operations.
@CopyWith()
@annotation.XmlRootElement(name: 'TSK')
@annotation.XmlSerializable(createMixin: true)
class Task extends Iso11783Element with _$TaskXmlSerializableMixin {
  /// Default factory for creating a [Task] with verified
  /// arguments.
  factory Task({
    required String id,
    required TaskStatus status,
    List<TreatmentZone>? treatmentZones,
    List<Time>? times,
    OperationTechniquePractice? operationTechniquePractice,
    List<WorkerAllocation>? workerAllocations,
    List<DeviceAllocation>? deviceAllocations,
    List<Connection>? connections,
    List<ProductAllocation>? productAllocations,
    List<DataLogTrigger>? dataLogTriggers,
    List<CommentAllocation>? commentAllocations,
    List<TimeLog>? timeLogs,
    Grid? grid,
    List<ControlAssignment>? controlAssignments,
    List<GuidanceAllocation>? guidanceAllocations,
    String? designator,
    String? customerIdRef,
    String? farmIdRef,
    String? partfieldIdRef,
    String? responsibleWorkerIdRef,
    int? defaultTreatmentZoneCode,
    int? positionLostTreatmentZoneCode,
    int? outOfFieldTreatmentZoneCode,
  }) {
    ArgumentValidation.checkId(id: id, idRefPattern: idRefPattern);
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }
    if (customerIdRef != null) {
      ArgumentValidation.checkId(
        id: customerIdRef,
        idRefPattern: Customer.idRefPattern,
        idName: 'customerIdRef',
      );
    }
    if (farmIdRef != null) {
      ArgumentValidation.checkId(
        id: farmIdRef,
        idRefPattern: Farm.idRefPattern,
        idName: 'farmIdRef',
      );
    }
    if (partfieldIdRef != null) {
      ArgumentValidation.checkId(
        id: partfieldIdRef,
        idRefPattern: Partfield.idRefPattern,
        idName: 'partfieldIdRef',
      );
    }
    if (responsibleWorkerIdRef != null) {
      ArgumentValidation.checkId(
        id: responsibleWorkerIdRef,
        idRefPattern: Worker.idRefPattern,
        idName: 'responsibleWorkerIdRef',
      );
    }
    if (defaultTreatmentZoneCode != null) {
      ArgumentValidation.checkValueInRange(
        value: defaultTreatmentZoneCode,
        min: 0,
        max: 254,
        name: 'defaultTreatmentZoneCode',
      );
    }
    if (positionLostTreatmentZoneCode != null) {
      ArgumentValidation.checkValueInRange(
        value: positionLostTreatmentZoneCode,
        min: 0,
        max: 254,
        name: 'positionLostTreatmentZoneCode',
      );
    }
    if (outOfFieldTreatmentZoneCode != null) {
      ArgumentValidation.checkValueInRange(
        value: outOfFieldTreatmentZoneCode,
        min: 0,
        max: 254,
        name: 'outOfFieldTreatmentZoneCode',
      );
    }
    return Task._(
      id: id,
      status: status,
      treatmentZones: treatmentZones,
      times: times,
      operationTechniquePractice: operationTechniquePractice,
      workerAllocations: workerAllocations,
      deviceAllocations: deviceAllocations,
      connections: connections,
      productAllocations: productAllocations,
      dataLogTriggers: dataLogTriggers,
      commentAllocations: commentAllocations,
      timeLogs: timeLogs,
      grid: grid,
      controlAssignments: controlAssignments,
      guidanceAllocations: guidanceAllocations,
      designator: designator,
      customerIdRef: customerIdRef,
      farmIdRef: farmIdRef,
      partfieldIdRef: partfieldIdRef,
      responsibleWorkerIdRef: responsibleWorkerIdRef,
      defaultTreatmentZoneCode: defaultTreatmentZoneCode,
      positionLostTreatmentZoneCode: positionLostTreatmentZoneCode,
      outOfFieldTreatmentZoneCode: outOfFieldTreatmentZoneCode,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const Task._({
    required this.id,
    required this.status,
    this.treatmentZones,
    this.times,
    this.operationTechniquePractice,
    this.workerAllocations,
    this.deviceAllocations,
    this.connections,
    this.productAllocations,
    this.dataLogTriggers,
    this.commentAllocations,
    this.timeLogs,
    this.grid,
    this.controlAssignments,
    this.guidanceAllocations,
    this.designator,
    this.customerIdRef,
    this.farmIdRef,
    this.partfieldIdRef,
    this.responsibleWorkerIdRef,
    this.defaultTreatmentZoneCode,
    this.positionLostTreatmentZoneCode,
    this.outOfFieldTreatmentZoneCode,
  }) : super(tag: Iso11783Tag.task, description: 'Task');

  /// Creates a [Task] from [element].
  factory Task.fromXmlElement(XmlElement element) =>
      _$TaskFromXmlElement(element);

  /// Regular expression matching pattern for the [id] of [Task]s.
  static const idRefPattern = '(TSK|TSK-)([0-9])+';

  /// A list of [CommentAllocation] for this.
  @annotation.XmlElement(name: 'CAN', includeIfNull: false)
  final List<CommentAllocation>? commentAllocations;

  /// A list of [ControlAssignment]s for this.
  @annotation.XmlElement(name: 'CAT')
  final List<ControlAssignment>? controlAssignments;

  /// A list of [Connection] for this.
  @annotation.XmlElement(name: 'CNN')
  final List<Connection>? connections;

  /// A list of [DeviceAllocation] for this.
  @annotation.XmlElement(name: 'DAN')
  final List<DeviceAllocation>? deviceAllocations;

  /// A list of [DataLogTrigger] for this.
  @annotation.XmlElement(name: 'DLT')
  final List<DataLogTrigger>? dataLogTriggers;

  /// The [Grid] for this.
  @annotation.XmlElement(name: 'GRD', includeIfNull: false)
  final Grid? grid;

  /// A list of [GuidanceAllocation]s for this.
  @annotation.XmlElement(name: 'GAN')
  final List<GuidanceAllocation>? guidanceAllocations;

  /// The [OperationTechniquePractice] for this.
  @annotation.XmlElement(name: 'OTP')
  final OperationTechniquePractice? operationTechniquePractice;

  /// A list of [ProductAllocation] for this.
  @annotation.XmlElement(name: 'PAN')
  final List<ProductAllocation>? productAllocations;

  /// A list of [Time] for this.
  @annotation.XmlElement(name: 'TIM')
  final List<Time>? times;

  /// A list of [TimeLog] for this.
  @annotation.XmlElement(name: 'TLG')
  final List<TimeLog>? timeLogs;

  /// A list of [TreatmentZone] for this.
  @annotation.XmlElement(name: 'TZN')
  final List<TreatmentZone>? treatmentZones;

  /// A list of [WorkerAllocation] for this.
  @annotation.XmlElement(name: 'WAN')
  final List<WorkerAllocation>? workerAllocations;

  /// Unique identifier for this task.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the task, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String? designator;

  /// Reference to a [Customer].
  @annotation.XmlAttribute(name: 'C')
  final String? customerIdRef;

  /// Reference to a [Farm].
  @annotation.XmlAttribute(name: 'D')
  final String? farmIdRef;

  /// Reference to a [Partfield].
  @annotation.XmlAttribute(name: 'E')
  final String? partfieldIdRef;

  /// Reference to a [Worker].
  @annotation.XmlAttribute(name: 'F')
  final String? responsibleWorkerIdRef;

  /// What the state of this is.
  @annotation.XmlAttribute(name: 'G')
  final TaskStatus status;

  /// Default [TreatmentZone.code].
  @annotation.XmlAttribute(name: 'H')
  final int? defaultTreatmentZoneCode;

  /// Position lost [TreatmentZone.code].
  @annotation.XmlAttribute(name: 'I')
  final int? positionLostTreatmentZoneCode;

  /// Out of field [TreatmentZone.code].
  @annotation.XmlAttribute(name: 'J')
  final int? outOfFieldTreatmentZoneCode;

  @override
  List<Object?> get props => super.props
    ..addAll([
      commentAllocations,
      controlAssignments,
      connections,
      deviceAllocations,
      dataLogTriggers,
      grid,
      guidanceAllocations,
      operationTechniquePractice,
      productAllocations,
      id,
      designator,
      customerIdRef,
      farmIdRef,
      partfieldIdRef,
      responsibleWorkerIdRef,
      status,
      defaultTreatmentZoneCode,
      positionLostTreatmentZoneCode,
      outOfFieldTreatmentZoneCode,
    ]);
}

/// An enumerator for which state a [Task] has.
@annotation.XmlEnum()
enum TaskStatus {
  /// Planned
  @annotation.XmlValue('1')
  planned(1, 'Planned'),

  /// Running
  @annotation.XmlValue('2')
  running(2, 'Running'),

  /// Paused
  @annotation.XmlValue('3')
  paused(3, 'Paused'),

  /// Completed
  @annotation.XmlValue('4')
  completed(4, 'Completed'),

  /// Template
  @annotation.XmlValue('5')
  template(5, 'Template'),

  /// Cancelled
  @annotation.XmlValue('6')
  cancelled(6, 'Cancelled'),
  ;

  const TaskStatus(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// An element that describes the control capabilities of a task controller.
///
// TODO(dudlileif): Needs better documentation.
@CopyWith()
@annotation.XmlRootElement(name: 'TCC')
@annotation.XmlSerializable(createMixin: true)
class TaskControllerCapabilities extends Iso11783Element
    with _$TaskControllerCapabilitiesXmlSerializableMixin {
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
          tag: Iso11783Tag.taskControllerCapabilities,
          description: 'TaskControllerCapabilities',
          onlyVersion4AndAbove: true,
        );

  /// Creates a [TaskControllerCapabilities] from [element].
  factory TaskControllerCapabilities.fromXmlElement(XmlElement element) =>
      _$TaskControllerCapabilitiesFromXmlElement(element);

  /// NAME of the function.
  @annotation.XmlAttribute(name: 'A')
  final String functionNAME;

  /// Name of the task controller capabilities, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  /// The version number of this.
  @annotation.XmlAttribute(name: 'C')
  final VersionNumber versionNumber;

  /// A value for provided capabilities.
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

  @override
  List<Object?> get props => super.props
    ..addAll([
      functionNAME,
      designator,
      versionNumber,
      providedCapabilities,
      numberOfBoomsSectionControl,
      numberOfSectionsSectionControl,
      numberOfControlChannels,
    ]);
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

/// An element that describes the `TASKDATA.xml` file, which is the main root
/// element and contains definitions about the construct of the element
/// structure, (Version number... ) and the use of primary elements.
@CopyWith()
@annotation.XmlRootElement(name: 'ISO11783_TaskData')
@annotation.XmlSerializable(createMixin: true)
class Iso11783TaskData extends Iso11783Element
    with _$Iso11783TaskDataXmlSerializableMixin {
  /// Default factory for creating an [Iso11783TaskData] with verified
  /// arguments.
  factory Iso11783TaskData({
    required VersionMajor versionMajor,
    required VersionMinor versionMinor,
    required String managementSoftwareManufacturer,
    required String managementSoftwareVersion,
    required DataTransferOrigin dataTransferOrigin,
    List<AttachedFile>? attachedFiles,
    List<BaseStation>? baseStations,
    List<CodedComment>? codedComments,
    List<CodedCommentGroup>? codedCommentGroups,
    List<ColourLegend>? colourLegends,
    List<CropType>? cropTypes,
    List<CulturalPractice>? culturalPractices,
    List<Customer>? customers,
    List<Device>? devices,
    List<Farm>? farms,
    List<OperationTechnique>? operationTechniques,
    List<Partfield>? partfields,
    List<Product>? products,
    List<ProductGroup>? productGroups,
    List<Task>? tasks,
    List<TaskControllerCapabilities>? taskControllerCapabilities,
    List<ValuePresentation>? valuePresentations,
    List<Worker>? workers,
    List<ExternalFileReference>? externalFileReferences,
    Iso11783LinkList? linkList,
    String? taskControllerManufacturer,
    String? taskControllerVersion,
    String? language,
  }) {
    ArgumentValidation.checkStringLength(
      managementSoftwareManufacturer,
      name: 'managementSoftwareManufacturer',
    );
    ArgumentValidation.checkStringLength(
      managementSoftwareVersion,
      name: 'managementSoftwareVersion',
    );
    if (taskControllerManufacturer != null) {
      ArgumentValidation.checkStringLength(
        taskControllerManufacturer,
        name: 'taskControllerManufacturer',
      );
    }
    if (taskControllerVersion != null) {
      ArgumentValidation.checkStringLength(
        taskControllerVersion,
        name: 'taskControllerVersion',
      );
    }
    if (language != null) {
      ArgumentValidation.checkStringLength(
        language,
        name: 'language',
      );
    }

    return Iso11783TaskData._(
      versionMajor: versionMajor,
      versionMinor: versionMinor,
      managementSoftwareManufacturer: managementSoftwareManufacturer,
      managementSoftwareVersion: managementSoftwareVersion,
      dataTransferOrigin: dataTransferOrigin,
      attachedFiles: attachedFiles,
      baseStations: baseStations,
      codedComments: codedComments,
      codedCommentGroups: codedCommentGroups,
      colourLegends: colourLegends,
      cropTypes: cropTypes,
      culturalPractices: culturalPractices,
      customers: customers,
      devices: devices,
      farms: farms,
      operationTechniques: operationTechniques,
      partfields: partfields,
      products: products,
      productGroups: productGroups,
      tasks: tasks,
      taskControllerCapabilities: taskControllerCapabilities,
      valuePresentations: valuePresentations,
      workers: workers,
      externalFileReferences: externalFileReferences,
      linkList: linkList,
      taskControllerManufacturer: taskControllerManufacturer,
      taskControllerVersion: taskControllerVersion,
      language: language,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const Iso11783TaskData._({
    required this.versionMajor,
    required this.versionMinor,
    required this.managementSoftwareManufacturer,
    required this.managementSoftwareVersion,
    required this.dataTransferOrigin,
    this.attachedFiles,
    this.baseStations,
    this.codedComments,
    this.codedCommentGroups,
    this.colourLegends,
    this.cropTypes,
    this.culturalPractices,
    this.customers,
    this.devices,
    this.farms,
    this.operationTechniques,
    this.partfields,
    this.products,
    this.productGroups,
    this.tasks,
    this.taskControllerCapabilities,
    this.valuePresentations,
    this.workers,
    this.externalFileReferences,
    this.linkList,
    this.taskControllerManufacturer,
    this.taskControllerVersion,
    this.language,
  }) : super(
          tag: Iso11783Tag.taskData,
          description: 'ISO 11783 Task Data File',
        );

  /// Creates an [Iso11783TaskData] from [element].
  factory Iso11783TaskData.fromXmlElement(XmlElement element) =>
      _$Iso11783TaskDataFromXmlElement(element);

  /// Creates an [Iso11783TaskData] from [document].
  static Iso11783TaskData? fromXmlDocument(XmlDocument document) =>
      Iso11783TaskData.fromXmlElement(document.childElements.first);

  /// A list of [AttachedFile]s.
  @annotation.XmlElement(name: 'AFE')
  final List<AttachedFile>? attachedFiles;

  /// A list of [BaseStation]s.
  @annotation.XmlElement(name: 'BSN')
  final List<BaseStation>? baseStations;

  /// A list of [CodedComment]s.
  @annotation.XmlElement(name: 'CCT')
  final List<CodedComment>? codedComments;

  /// A list of [CodedCommentGroup]s.
  @annotation.XmlElement(name: 'CCG')
  final List<CodedCommentGroup>? codedCommentGroups;

  /// A list of [ColourLegend]s.
  @annotation.XmlElement(name: 'CLD')
  final List<ColourLegend>? colourLegends;

  /// A list of [CropType]s.
  @annotation.XmlElement(name: 'CTP')
  final List<CropType>? cropTypes;

  /// A list of [CulturalPractice]s.
  @annotation.XmlElement(name: 'CPC')
  final List<CulturalPractice>? culturalPractices;

  /// A list of [Customer]s.
  @annotation.XmlElement(name: 'CTR')
  final List<Customer>? customers;

  /// A list of [Device]s.
  @annotation.XmlElement(name: 'DVC')
  final List<Device>? devices;

  /// A list of [Farm]s.
  @annotation.XmlElement(name: 'FRM')
  final List<Farm>? farms;

  /// A list of [OperationTechnique]s.
  @annotation.XmlElement(name: 'OTQ')
  final List<OperationTechnique>? operationTechniques;

  /// A list of [Partfield]s.
  @annotation.XmlElement(name: 'PFD')
  final List<Partfield>? partfields;

  /// A list of [Product]s.
  @annotation.XmlElement(name: 'PDT')
  final List<Product>? products;

  /// A list of [ProductGroup]s.
  @annotation.XmlElement(name: 'PGP')
  final List<ProductGroup>? productGroups;

  /// A list of [Task]s.
  @annotation.XmlElement(name: 'TSK')
  final List<Task>? tasks;

  /// A list of [TaskControllerCapabilities].
  @annotation.XmlElement(name: 'TCC')
  final List<TaskControllerCapabilities>? taskControllerCapabilities;

  /// A list of [ValuePresentation]s.
  @annotation.XmlElement(name: 'VPN')
  final List<ValuePresentation>? valuePresentations;

  /// A list of [Worker]s.
  @annotation.XmlElement(name: 'WKR')
  final List<Worker>? workers;

  /// A list of [ExternalFileReference]s.
  @annotation.XmlElement(name: 'XFR')
  final List<ExternalFileReference>? externalFileReferences;

  /// An [Iso11783LinkList] for linking to external files.
  final Iso11783LinkList? linkList;

  /// Major version of the standard.
  @annotation.XmlAttribute(name: 'VersionMajor')
  final VersionMajor versionMajor;

  /// Minor version of the standard
  @annotation.XmlAttribute(name: 'VersionMinor')
  final VersionMinor versionMinor;

  /// The creation origin of this.
  @annotation.XmlAttribute(name: 'DataTransferOrigin')
  final DataTransferOrigin dataTransferOrigin;

  /// Name of the Management Software manufacturer.
  @annotation.XmlAttribute(name: 'ManagementSoftwareManufacturer')
  final String managementSoftwareManufacturer;

  /// Version of the Management Software.
  @annotation.XmlAttribute(name: 'ManagementSoftwareVersion')
  final String managementSoftwareVersion;

  /// Name of the Task Controller software.
  @annotation.XmlAttribute(name: 'TaskControllerManufacturer')
  final String? taskControllerManufacturer;

  /// Version of the Task Controller software.
  @annotation.XmlAttribute(name: 'TaskControllerVersion')
  final String? taskControllerVersion;

  /// Preferred language of the software.
  @annotation.XmlAttribute(name: 'lang')
  final String? language;

  /// A structured XML document that represents this.
  ///
  /// External references are removed as everything is contained in
  /// one document.
  XmlDocument toSingleXmlDocument() {
    final builder = XmlBuilder()
      ..processing('xml', 'version="1.0" encoding="UTF-8"');
    builder.element(tag.name, nest: () => buildXmlChildren(builder));
    final document = builder.buildDocument();
    document.lastChild?.children.retainWhere(
      (node) =>
          node is XmlElement &&
              node.name.local != Iso11783Tag.externalFileReference.name ||
          node is! XmlElement,
    );
    return document;
  }

  /// A structured XML document that represents this.
  List<({String fileName, XmlDocument document})> toXmlExternalDocuments() {
    final builder = XmlBuilder()
      ..processing('xml', 'version="1.0" encoding="UTF-8"');

    builder.element(tag.name, nest: () => buildXmlChildren(builder));
    final mainDocument = builder.buildDocument();

    final list = <({String fileName, XmlDocument document})>[];
    if (externalFileReferences != null && mainDocument.lastChild != null) {
      final occurancesOfType = <Iso11783Tag, int>{};
      for (final externalFileReference in externalFileReferences!) {
        occurancesOfType.update(
          externalFileReference.elementType,
          (value) => value + 1,
          ifAbsent: () => 1,
        );
      }
      final typeDone = <Iso11783Tag, bool>{};

      for (final externalFileReference in externalFileReferences!) {
        final type = externalFileReference.elementType;

        if (typeDone[type] ?? false) {
          continue;
        }
        typeDone[type] = true;
        // If there are more than one occurance of a type, we use
        // ---00000.XML for positive ids and ---00001.XML for negative ids.
        // If there are more than two occurances, the overshooting ones are
        // removed.
        if ((occurancesOfType[type] ?? 0) > 1) {
          final externalContent =
              mainDocument.lastChild!.getElements(type.name)?.toList();
          if (externalContent != null && externalContent.isNotEmpty) {
            // ---00001 , Negative ids
            final documentNegative = XmlDocument(
              [
                XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
                XmlElement(
                  XmlName.fromString(Iso11783Tag.externalFileContents.name),
                  [],
                  externalContent
                      .where(
                        (element) =>
                            element.getAttribute('A')?.contains('-') ?? false,
                      )
                      .map((e) => e.copy())
                      .toList(),
                ),
              ],
            );
            list.add(
              (
                fileName:
                    '${externalFileReference.filename.substring(0, 3)}000001',
                document: documentNegative
              ),
            );

            externalContent.removeWhere(
              (element) => element.getAttribute('A')?.contains('-') ?? false,
            );

            // ---00000, Positive ids
            final documentPositive = XmlDocument(
              [
                XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
                XmlElement(
                  XmlName.fromString(Iso11783Tag.externalFileContents.name),
                  [],
                  externalContent.map((e) => e.copy()).toList(),
                ),
              ],
            );
            list.add(
              (
                fileName:
                    '${externalFileReference.filename.substring(0, 3)}000000',
                document: documentPositive
              ),
            );

            mainDocument.lastChild!.children.retainWhere(
              (node) =>
                  node is XmlElement && node.name.local != type.name ||
                  node is! XmlElement,
            );
          }
          // Remove overshooting external references.
          if ((occurancesOfType[type] ?? 0) > 2) {
            final indices = <int>[];
            for (final (index, node)
                in mainDocument.lastChild!.children.indexed) {
              if (node is XmlElement &&
                  node.name.local == Iso11783Tag.externalFileReference.name &&
                  (node.getAttribute('A')?.startsWith(type.name) ?? false)) {
                indices.add(index);
              }
            }
            mainDocument.lastChild!.children
                .removeRange(indices[2], indices.last + 1);
          }
        } else {
          final externalContent =
              mainDocument.lastChild?.getElements(type.name);
          if (externalContent != null && externalContent.isNotEmpty) {
            final document = XmlDocument(
              [
                XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
                XmlElement(
                  XmlName.fromString(Iso11783Tag.externalFileContents.name),
                  [],
                  externalContent.map((e) => e.copy()).toList(),
                ),
              ],
            );
            list.add(
              (fileName: externalFileReference.filename, document: document),
            );

            mainDocument.lastChild!.children.retainWhere(
              (node) =>
                  node is XmlElement && node.name.local != type.name ||
                  node is! XmlElement,
            );
          }
        }
      }
    }
    list.add((fileName: 'TASKDATA', document: mainDocument));

    return list;
  }

  /// Returns null or a copy of this with the top level [element] added.
  ///
  /// A copy is returned if the list for the element type doesn't exist,
  /// otherwise null is returned and the element is added to the
  /// already existing list.
  Iso11783TaskData? addTopLevelElement(Iso11783Element element) {
    Iso11783TaskData? updated;
    switch (element) {
      case (final AttachedFile element):
        attachedFiles != null
            ? attachedFiles?.add(element)
            : updated = copyWith.attachedFiles([element]);
      case (final BaseStation element):
        baseStations != null
            ? baseStations?.add(element)
            : updated = copyWith.baseStations([element]);
      case (final CodedComment element):
        codedComments != null
            ? codedComments?.add(element)
            : updated = copyWith.codedComments([element]);
      case (final CodedCommentGroup element):
        codedCommentGroups != null
            ? codedCommentGroups?.add(element)
            : updated = copyWith.codedCommentGroups([element]);
      case (final ColourLegend element):
        colourLegends != null
            ? colourLegends?.add(element)
            : updated = copyWith.colourLegends([element]);
      case (final CropType element):
        cropTypes != null
            ? cropTypes?.add(element)
            : updated = copyWith.cropTypes([element]);
      case (final CulturalPractice element):
        culturalPractices != null
            ? culturalPractices?.add(element)
            : updated = copyWith.culturalPractices([element]);
      case (final Customer element):
        customers != null
            ? customers?.add(element)
            : updated = copyWith.customers([element]);
      case (final Device element):
        devices != null
            ? devices?.add(element)
            : updated = copyWith.devices([element]);
      case (final Farm element):
        farms != null
            ? farms?.add(element)
            : updated = copyWith.farms([element]);
      case (final OperationTechnique element):
        operationTechniques != null
            ? operationTechniques?.add(element)
            : updated = copyWith.operationTechniques([element]);
      case (final Partfield element):
        partfields != null
            ? partfields?.add(element)
            : updated = copyWith.partfields([element]);
      case (final Product element):
        products != null
            ? products?.add(element)
            : updated = copyWith.products([element]);
      case (final ProductGroup element):
        productGroups != null
            ? productGroups?.add(element)
            : updated = copyWith.productGroups([element]);
      case (final Task element):
        tasks != null
            ? tasks?.add(element)
            : updated = copyWith.tasks([element]);
      case (final TaskControllerCapabilities element):
        taskControllerCapabilities != null
            ? taskControllerCapabilities?.add(element)
            : updated = copyWith.taskControllerCapabilities([element]);
      case (final ValuePresentation element):
        valuePresentations != null
            ? valuePresentations?.add(element)
            : updated = copyWith.valuePresentations([element]);
      case (final Worker element):
        workers != null
            ? workers?.add(element)
            : updated = copyWith.workers([element]);
      case (final ExternalFileReference element):
        externalFileReferences != null
            ? externalFileReferences?.add(element)
            : updated = copyWith.externalFileReferences([element]);
      default:
        return null;
    }
    return updated;
  }

  @override
  List<Object?> get props => super.props
    ..addAll([
      attachedFiles,
      baseStations,
      codedComments,
      codedCommentGroups,
      colourLegends,
      cropTypes,
      culturalPractices,
      customers,
      devices,
      farms,
      operationTechniques,
      partfields,
      products,
      productGroups,
      tasks,
      taskControllerCapabilities,
      valuePresentations,
      workers,
      externalFileReferences,
      linkList,
      versionMajor,
      versionMinor,
      dataTransferOrigin,
      managementSoftwareManufacturer,
      managementSoftwareVersion,
      taskControllerManufacturer,
      taskControllerVersion,
      dataTransferOrigin,
      language,
    ]);
}
