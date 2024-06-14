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
  Task._({
    required this.id,
    required this.status,
    List<TreatmentZone>? treatmentZones,
    List<Time>? times,
    this.operationTechniquePractice,
    List<WorkerAllocation>? workerAllocations,
    List<DeviceAllocation>? deviceAllocations,
    List<Connection>? connections,
    List<ProductAllocation>? productAllocations,
    List<DataLogTrigger>? dataLogTriggers,
    List<CommentAllocation>? commentAllocations,
    List<TimeLog>? timeLogs,
    this.grid,
    List<ControlAssignment>? controlAssignments,
    List<GuidanceAllocation>? guidanceAllocations,
    this.designator,
    this.customerIdRef,
    this.farmIdRef,
    this.partfieldIdRef,
    this.responsibleWorkerIdRef,
    this.defaultTreatmentZoneCode,
    this.positionLostTreatmentZoneCode,
    this.outOfFieldTreatmentZoneCode,
  }) : super(tag: Iso11783XmlTag.task, description: 'Task') {
    if (treatmentZones != null) {
      this.treatmentZones.addAll(treatmentZones);
    }
    if (times != null) {
      this.times.addAll(times);
    }
    if (workerAllocations != null) {
      this.workerAllocations.addAll(workerAllocations);
    }
    if (deviceAllocations != null) {
      this.deviceAllocations.addAll(deviceAllocations);
    }
    if (connections != null) {
      this.connections.addAll(connections);
    }
    if (productAllocations != null) {
      this.productAllocations.addAll(productAllocations);
    }
    if (dataLogTriggers != null) {
      this.dataLogTriggers.addAll(dataLogTriggers);
    }
    if (commentAllocations != null) {
      this.commentAllocations.addAll(commentAllocations);
    }
    if (timeLogs != null) {
      this.timeLogs.addAll(timeLogs);
    }
    if (controlAssignments != null) {
      this.controlAssignments.addAll(controlAssignments);
    }
    if (guidanceAllocations != null) {
      this.guidanceAllocations.addAll(guidanceAllocations);
    }
  }

  /// Creates a [Task] from [element].
  factory Task.fromXmlElement(XmlElement element) {
    final commentAllocations = element.getElements('CAN');
    final controlAssignments = element.getElements('CAT');
    final connections = element.getElements('CNN');
    final deviceAllocations = element.getElements('DAN');
    final dataLogTriggers = element.getElements('DLT');
    final grid = element.getElement('GRD');
    final guidanceAllocations = element.getElements('GAN');
    final operationTechniquePractice = element.getElement('OTP');
    final productAllocations = element.getElements('PAN');
    final times = element.getElements('TIM');
    final timeLogs = element.getElements('TLG');
    final treatmentZones = element.getElements('TZN');
    final workerAllocations = element.getElements('WAN');
    final id = element.getAttribute('A')!;
    final designator = element.getAttribute('B');
    final customerIdRef = element.getAttribute('C');
    final farmIdRef = element.getAttribute('D');
    final partfieldIdRef = element.getAttribute('E');
    final responsibleWorkerIdRef = element.getAttribute('F');
    final status = element.getAttribute('G');
    final defaultTreatmentZoneCode = element.getAttribute('H');
    final positionLostTreatmentZoneCode = element.getAttribute('I');
    final outOfFieldTreatmentZoneCode = element.getAttribute('J');
    return Task(
      commentAllocations:
          commentAllocations?.map(CommentAllocation.fromXmlElement).toList(),
      controlAssignments:
          controlAssignments?.map(ControlAssignment.fromXmlElement).toList(),
      connections: connections?.map(Connection.fromXmlElement).toList(),
      deviceAllocations:
          deviceAllocations?.map(DeviceAllocation.fromXmlElement).toList(),
      dataLogTriggers:
          dataLogTriggers?.map(DataLogTrigger.fromXmlElement).toList(),
      grid: grid != null ? Grid.fromXmlElement(grid) : null,
      guidanceAllocations:
          guidanceAllocations?.map(GuidanceAllocation.fromXmlElement).toList(),
      operationTechniquePractice: operationTechniquePractice != null
          ? OperationTechniquePractice.fromXmlElement(
              operationTechniquePractice,
            )
          : null,
      productAllocations:
          productAllocations?.map(ProductAllocation.fromXmlElement).toList(),
      times: times?.map(Time.fromXmlElement).toList(),
      timeLogs: timeLogs?.map(TimeLog.fromXmlElement).toList(),
      treatmentZones:
          treatmentZones?.map(TreatmentZone.fromXmlElement).toList(),
      workerAllocations:
          workerAllocations?.map(WorkerAllocation.fromXmlElement).toList(),
      id: id,
      designator: designator,
      customerIdRef: customerIdRef,
      farmIdRef: farmIdRef,
      partfieldIdRef: partfieldIdRef,
      responsibleWorkerIdRef: responsibleWorkerIdRef,
      status: $TaskStatusEnumMap.entries
          .singleWhere(
            (taskStatusEnumMapEntry) => taskStatusEnumMapEntry.value == status,
            orElse: () => throw ArgumentError(
              '''`$status` is not one of the supported values: ${$TaskStatusEnumMap.values.join(', ')}''',
            ),
          )
          .key,
      defaultTreatmentZoneCode: defaultTreatmentZoneCode != null
          ? int.parse(defaultTreatmentZoneCode)
          : null,
      positionLostTreatmentZoneCode: positionLostTreatmentZoneCode != null
          ? int.parse(positionLostTreatmentZoneCode)
          : null,
      outOfFieldTreatmentZoneCode: outOfFieldTreatmentZoneCode != null
          ? int.parse(outOfFieldTreatmentZoneCode)
          : null,
    );
  }

  /// Regular expression matching pattern for the [id] of [Task]s.
  static const idRefPattern = '(TSK|TSK-)([0-9])+';

  /// A list of [CommentAllocation] for this.
  @annotation.XmlElement(name: 'CAN')
  final List<CommentAllocation> commentAllocations = [];

  /// A list of [ControlAssignment]s for this.
  @annotation.XmlElement(name: 'CAT')
  final List<ControlAssignment> controlAssignments = [];

  /// A list of [Connection] for this.
  @annotation.XmlElement(name: 'CNN')
  final List<Connection> connections = [];

  /// A list of [DeviceAllocation] for this.
  @annotation.XmlElement(name: 'DAN')
  final List<DeviceAllocation> deviceAllocations = [];

  /// A list of [DataLogTrigger] for this.
  @annotation.XmlElement(name: 'DLT')
  final List<DataLogTrigger> dataLogTriggers = [];

  /// The [Grid] for this.
  @annotation.XmlElement(name: 'GRD', includeIfNull: false)
  Grid? grid;

  /// A list of [GuidanceAllocation]s for this.
  @annotation.XmlElement(name: 'GAN')
  final List<GuidanceAllocation> guidanceAllocations = [];

  /// The [OperationTechniquePractice] for this.
  @annotation.XmlElement(name: 'OTP', includeIfNull: false)
  final OperationTechniquePractice? operationTechniquePractice;

  /// A list of [ProductAllocation] for this.
  @annotation.XmlElement(name: 'PAN')
  final List<ProductAllocation> productAllocations = [];

  /// A list of [Time] for this.
  @annotation.XmlElement(name: 'TIM')
  final List<Time> times = [];

  /// A list of [TimeLog] for this.
  @annotation.XmlElement(name: 'TLG')
  final List<TimeLog> timeLogs = [];

  /// A list of [TreatmentZone] for this.
  @annotation.XmlElement(name: 'TZN')
  final List<TreatmentZone> treatmentZones = [];

  /// A list of [WorkerAllocation] for this.
  @annotation.XmlElement(name: 'WAN')
  final List<WorkerAllocation> workerAllocations = [];

  /// Unique identifier for this task.
  ///
  /// Records generated on MICS have negative IDs.
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the task, description or comment.
  @annotation.XmlAttribute(name: 'B')
  String? designator;

  /// Reference to a [Customer].
  @annotation.XmlAttribute(name: 'C')
  String? customerIdRef;

  /// Reference to a [Farm].
  @annotation.XmlAttribute(name: 'D')
  String? farmIdRef;

  /// Reference to a [Partfield].
  @annotation.XmlAttribute(name: 'E')
  String? partfieldIdRef;

  /// Reference to a [Worker].
  @annotation.XmlAttribute(name: 'F')
  String? responsibleWorkerIdRef;

  /// What the state of this is.
  @annotation.XmlAttribute(name: 'G')
  TaskStatus status;

  /// Default [TreatmentZone.code].
  @annotation.XmlAttribute(name: 'H')
  int? defaultTreatmentZoneCode;

  /// Position lost [TreatmentZone.code].
  @annotation.XmlAttribute(name: 'I')
  int? positionLostTreatmentZoneCode;

  /// Out of field [TreatmentZone.code].
  @annotation.XmlAttribute(name: 'J')
  int? outOfFieldTreatmentZoneCode;

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
