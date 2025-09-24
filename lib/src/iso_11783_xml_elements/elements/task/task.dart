// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes an ISO 11783 Task.
///
/// The Task is the central XML element in the data transfer file. It contains
/// references to various other XML elements to express allocation of resources
/// and specification of operations.
class Task extends Iso11783Element {
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
    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }
    if (customerIdRef != null) {
      ArgumentValidation.checkId(
        id: customerIdRef,
        idRefPattern: Customer.staticIdRefPattern,
        idName: 'customerIdRef',
      );
    }
    if (farmIdRef != null) {
      ArgumentValidation.checkId(
        id: farmIdRef,
        idRefPattern: Farm.staticIdRefPattern,
        idName: 'farmIdRef',
      );
    }
    if (partfieldIdRef != null) {
      ArgumentValidation.checkId(
        id: partfieldIdRef,
        idRefPattern: Partfield.staticIdRefPattern,
        idName: 'partfieldIdRef',
      );
    }
    if (responsibleWorkerIdRef != null) {
      ArgumentValidation.checkId(
        id: responsibleWorkerIdRef,
        idRefPattern: Worker.staticIdRefPattern,
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
  }) : super(elementType: Iso11783ElementType.task, description: 'Task') {
    this.id = id;
    this.status = status;
    this.operationTechniquePractice = operationTechniquePractice;
    this.grid = grid;
    this.designator = designator;
    this.customerIdRef = customerIdRef;
    this.farmIdRef = farmIdRef;
    this.partfieldIdRef = partfieldIdRef;
    this.responsibleWorkerIdRef = responsibleWorkerIdRef;
    this.defaultTreatmentZoneCode = defaultTreatmentZoneCode;
    this.positionLostTreatmentZoneCode = positionLostTreatmentZoneCode;
    this.outOfFieldTreatmentZoneCode = outOfFieldTreatmentZoneCode;

    if (treatmentZones != null) {
      children.addAll(treatmentZones);
    }
    if (times != null) {
      children.addAll(times);
    }
    if (workerAllocations != null) {
      children.addAll(workerAllocations);
    }
    if (deviceAllocations != null) {
      children.addAll(deviceAllocations);
    }
    if (connections != null) {
      children.addAll(connections);
    }
    if (productAllocations != null) {
      children.addAll(productAllocations);
    }
    if (dataLogTriggers != null) {
      children.addAll(dataLogTriggers);
    }
    if (commentAllocations != null) {
      children.addAll(commentAllocations);
    }
    if (timeLogs != null) {
      children.addAll(timeLogs);
    }
    if (controlAssignments != null) {
      children.addAll(controlAssignments);
    }
    if (guidanceAllocations != null) {
      children.addAll(guidanceAllocations);
    }
  }

  /// Regular expression matching pattern for the [id] of [Task]s.
  static const staticIdRefPattern = '(TSK|TSK-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of [CommentAllocation] for this.
  List<CommentAllocation> get commentAllocations => findElements(
    Iso11783ElementType.commentAllocation.xmlTag,
  ).map((e) => e as CommentAllocation).toList();

  /// A list of [ControlAssignment]s for this.
  List<ControlAssignment> get controlAssignments => findElements(
    Iso11783ElementType.controlAssignment.xmlTag,
  ).map((e) => e as ControlAssignment).toList();

  /// A list of [Connection] for this.
  List<Connection> get connections => findElements(
    Iso11783ElementType.connection.xmlTag,
  ).map((e) => e as Connection).toList();

  /// A list of [DeviceAllocation] for this.
  List<DeviceAllocation> get deviceAllocations => findElements(
    Iso11783ElementType.deviceAllocation.xmlTag,
  ).map((e) => e as DeviceAllocation).toList();

  /// A list of [DataLogTrigger] for this.
  List<DataLogTrigger> get dataLogTriggers => findElements(
    Iso11783ElementType.dataLogTrigger.xmlTag,
  ).map((e) => e as DataLogTrigger).toList();

  /// The [Grid] for this.
  Grid? get grid => getElement(Iso11783ElementType.grid.xmlTag) as Grid?;
  set grid(Grid? value) => switch ((value, grid)) {
    (
      final Grid value,
      final Grid existing,
    ) =>
      existing.replace(value as XmlElement),
    (final Grid value, null) => children.add(value),
    (null, final Grid existing) => existing.remove(),
    _ => null,
  };

  /// A list of [GuidanceAllocation]s for this.
  List<GuidanceAllocation> get guidanceAllocations => findElements(
    Iso11783ElementType.guidanceAllocation.xmlTag,
  ).map((e) => e as GuidanceAllocation).toList();

  /// The [OperationTechniquePractice] for this.
  OperationTechniquePractice? get operationTechniquePractice =>
      getElement(Iso11783ElementType.operationTechniquePractice.xmlTag)
          as OperationTechniquePractice?;
  set operationTechniquePractice(OperationTechniquePractice? value) =>
      switch ((value, operationTechniquePractice)) {
        (
          final OperationTechniquePractice value,
          final OperationTechniquePractice existing,
        ) =>
          existing.replace(value as XmlElement),
        (final OperationTechniquePractice value, null) => children.add(value),
        (null, final OperationTechniquePractice existing) => existing.remove(),
        _ => null,
      };

  /// A list of [ProductAllocation] for this.
  List<ProductAllocation> get productAllocations => findElements(
    Iso11783ElementType.productAllocation.xmlTag,
  ).map((e) => e as ProductAllocation).toList();

  /// A list of [Time] for this.
  List<Time> get times => findElements(
    Iso11783ElementType.time.xmlTag,
  ).map((e) => e as Time).toList();

  /// A list of [TimeLog] for this.
  List<TimeLog> get timeLogs => findElements(
    Iso11783ElementType.timeLog.xmlTag,
  ).map((e) => e as TimeLog).toList();

  /// A list of [TreatmentZone] for this.
  List<TreatmentZone> get treatmentZones => findElements(
    Iso11783ElementType.treatmentZone.xmlTag,
  ).map((e) => e as TreatmentZone).toList();

  /// A list of [WorkerAllocation] for this.
  List<WorkerAllocation> get workerAllocations => findElements(
    Iso11783ElementType.workerAllocation.xmlTag,
  ).map((e) => e as WorkerAllocation).toList();

  /// Unique identifier for this task.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Name of the task, description or comment.
  String? get designator => tryParseString('B');
  set designator(String? value) => setStringNullable('B', value);

  /// Reference to a [Customer].
  String? get customerIdRef => tryParseString('C');
  set customerIdRef(String? value) => setStringNullable('C', value);

  /// Reference to a [Farm].
  String? get farmIdRef => tryParseString('D');
  set farmIdRef(String? value) => setStringNullable('D', value);

  /// Reference to a [Partfield].
  String? get partfieldIdRef => tryParseString('E');
  set partfieldIdRef(String? value) => setStringNullable('E', value);

  /// Reference to a [Worker].
  String? get responsibleWorkerIdRef => tryParseString('F');
  set responsibleWorkerIdRef(String? value) => setStringNullable('F', value);

  /// What the state of this is.
  TaskStatus get status => TaskStatus.values.firstWhere(
    (type) => type.value == parseInt('G'),
    orElse: () => throw ArgumentError(
      '''`${getAttribute('G')}` is not one of the supported values: ${TaskStatus.values.join(', ')}''',
    ),
  );
  set status(TaskStatus value) => setInt('G', value.value);

  /// Default [TreatmentZone.code].
  int? get defaultTreatmentZoneCode => tryParseInt('H');
  set defaultTreatmentZoneCode(int? value) => setIntNullable('H', value);

  /// Position lost [TreatmentZone.code].
  int? get positionLostTreatmentZoneCode => tryParseInt('I');
  set positionLostTreatmentZoneCode(int? value) => setIntNullable('I', value);

  /// Out of field [TreatmentZone.code].
  int? get outOfFieldTreatmentZoneCode => tryParseInt('J');
  set outOfFieldTreatmentZoneCode(int? value) => setIntNullable('J', value);
}

/// An enumerator for which state a [Task] has.
enum TaskStatus {
  /// Planned
  planned(1, 'Planned'),

  /// Running
  running(2, 'Running'),

  /// Paused
  paused(3, 'Paused'),

  /// Completed
  completed(4, 'Completed'),

  /// Template
  template(5, 'Template'),

  /// Cancelled
  cancelled(6, 'Cancelled');

  const TaskStatus(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
