// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

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
  }) : super(tag: Iso11783XmlTag.task, description: 'Task');

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
