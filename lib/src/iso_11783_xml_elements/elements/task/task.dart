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
  }) : super(elementType: _elementType) {
    this.id = id;
    this.status = status;
    this.designator = designator;
    this.customerIdRef = customerIdRef;
    this.farmIdRef = farmIdRef;
    this.partfieldIdRef = partfieldIdRef;
    this.responsibleWorkerIdRef = responsibleWorkerIdRef;
    this.defaultTreatmentZoneCode = defaultTreatmentZoneCode;
    this.positionLostTreatmentZoneCode = positionLostTreatmentZoneCode;
    this.outOfFieldTreatmentZoneCode = outOfFieldTreatmentZoneCode;
    this.controlAssignments.addAll(controlAssignments);
    this.connections.addAll(connections);
    this.commentAllocations.addAll(commentAllocations);
    this.dataLogTriggers.addAll(dataLogTriggers);
    this.deviceAllocations.addAll(deviceAllocations);
    this.grid = grid;
    this.guidanceAllocations.addAll(guidanceAllocations);
    this.operationTechniquePractice = operationTechniquePractice;
    this.productAllocations.addAll(productAllocations);
    this.times.addAll(times);
    this.timeLogs.addAll(timeLogs);
    this.treatmentZones.addAll(treatmentZones);
    this.workerAllocations.addAll(workerAllocations);
  }

  Task._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    commentAllocations.addAll(
      xmlElement
          .findElements(Iso11783ElementType.commentAllocation.xmlTag)
          .map(CommentAllocation._fromXmlElement)
          .toList(),
    );
    controlAssignments.addAll(
      xmlElement
          .findElements(Iso11783ElementType.controlAssignment.xmlTag)
          .map(ControlAssignment._fromXmlElement)
          .toList(),
    );
    connections.addAll(
      xmlElement
          .findElements(Iso11783ElementType.connection.xmlTag)
          .map(Connection._fromXmlElement)
          .toList(),
    );
    deviceAllocations.addAll(
      xmlElement
          .findElements(Iso11783ElementType.deviceAllocation.xmlTag)
          .map(DeviceAllocation._fromXmlElement)
          .toList(),
    );
    dataLogTriggers.addAll(
      xmlElement
          .findElements(Iso11783ElementType.dataLogTrigger.xmlTag)
          .map(DataLogTrigger._fromXmlElement)
          .toList(),
    );
    final treatmentZones = xmlElement
        .findElements(Iso11783ElementType.treatmentZone.xmlTag)
        .map(TreatmentZone._fromXmlElement)
        .toList();
    grid = switch (xmlElement.getElement(Iso11783ElementType.grid.xmlTag)) {
      final XmlElement element => Grid._fromXmlElement(
        element,
        treatmentZones: treatmentZones,
      ),
      _ => null,
    };
    guidanceAllocations.addAll(
      xmlElement
          .findElements(Iso11783ElementType.guidanceAllocation.xmlTag)
          .map(GuidanceAllocation._fromXmlElement)
          .toList(),
    );
    operationTechniquePractice = switch (xmlElement.getElement(
      Iso11783ElementType.operationTechniquePractice.xmlTag,
    )) {
      final XmlElement element => OperationTechniquePractice._fromXmlElement(
        element,
      ),
      _ => null,
    };
    productAllocations.addAll(
      xmlElement
          .findElements(Iso11783ElementType.productAllocation.xmlTag)
          .map(ProductAllocation._fromXmlElement)
          .toList(),
    );
    times.addAll(
      xmlElement
          .findElements(Iso11783ElementType.time.xmlTag)
          .map(Time._fromXmlElement)
          .toList(),
    );
    timeLogs.addAll(
      xmlElement
          .findElements(Iso11783ElementType.timeLog.xmlTag)
          .map(TimeLog._fromXmlElement)
          .toList(),
    );
    this.treatmentZones.addAll(treatmentZones);
    workerAllocations.addAll(
      xmlElement
          .findElements(Iso11783ElementType.workerAllocation.xmlTag)
          .map(WorkerAllocation._fromXmlElement)
          .toList(),
    );
    _argumentValidator();
  }

  void _argumentValidator() {
    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator!);
    }
    if (customerIdRef != null) {
      ArgumentValidation.checkId(
        id: customerIdRef!,
        idRefPattern: Customer.staticIdRefPattern,
        idName: 'customerIdRef',
      );
    }
    if (farmIdRef != null) {
      ArgumentValidation.checkId(
        id: farmIdRef!,
        idRefPattern: Farm.staticIdRefPattern,
        idName: 'farmIdRef',
      );
    }
    if (partfieldIdRef != null) {
      ArgumentValidation.checkId(
        id: partfieldIdRef!,
        idRefPattern: Partfield.staticIdRefPattern,
        idName: 'partfieldIdRef',
      );
    }
    if (responsibleWorkerIdRef != null) {
      ArgumentValidation.checkId(
        id: responsibleWorkerIdRef!,
        idRefPattern: Worker.staticIdRefPattern,
        idName: 'responsibleWorkerIdRef',
      );
    }
    if (defaultTreatmentZoneCode != null) {
      ArgumentValidation.checkValueInRange(
        value: defaultTreatmentZoneCode!,
        min: 0,
        max: 254,
        name: 'defaultTreatmentZoneCode',
      );
    }
    if (positionLostTreatmentZoneCode != null) {
      ArgumentValidation.checkValueInRange(
        value: positionLostTreatmentZoneCode!,
        min: 0,
        max: 254,
        name: 'positionLostTreatmentZoneCode',
      );
    }
    if (outOfFieldTreatmentZoneCode != null) {
      ArgumentValidation.checkValueInRange(
        value: outOfFieldTreatmentZoneCode!,
        min: 0,
        max: 254,
        name: 'outOfFieldTreatmentZoneCode',
      );
    }
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.task;

  /// Regular expression matching pattern for the [id] of [Task]s.
  static const staticIdRefPattern = '(TSK|TSK-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of [CommentAllocation] for this.
  late final commentAllocations = _XmlSyncedList<CommentAllocation>(
    xmlElement: xmlElement,
  );

  /// A list of [ControlAssignment]s for this.
  late final controlAssignments = _XmlSyncedList<ControlAssignment>(
    xmlElement: xmlElement,
  );

  /// A list of [Connection] for this.
  late final connections = _XmlSyncedList<Connection>(xmlElement: xmlElement);

  /// A list of [DeviceAllocation] for this.
  late final deviceAllocations = _XmlSyncedList<DeviceAllocation>(
    xmlElement: xmlElement,
  );

  /// A list of [DataLogTrigger] for this.
  late final dataLogTriggers = _XmlSyncedList<DataLogTrigger>(
    xmlElement: xmlElement,
  );

  /// The [Grid] for this.
  Grid? get grid => _grid;

  set grid(Grid? value) {
    switch ((value, grid)) {
      case (
        Grid(xmlElement: final element),
        Grid(xmlElement: final existing),
      ):
        if (element.hasParent) {
          element.remove();
        }
        existing.replace(element);
      case (Grid(xmlElement: final gridElement), null):
        if (gridElement.hasParent) {
          gridElement.remove();
        }
        xmlElement.children.add(gridElement);
      case (null, final Grid existing):
        existing.xmlElement.remove();
    }
    _grid = value;
  }

  Grid? _grid;

  /// A list of [GuidanceAllocation]s for this.
  late final guidanceAllocations = _XmlSyncedList<GuidanceAllocation>(
    xmlElement: xmlElement,
  );

  /// The [OperationTechniquePractice] for this.
  OperationTechniquePractice? get operationTechniquePractice =>
      _operationTechniquePractice;

  set operationTechniquePractice(OperationTechniquePractice? value) {
    switch ((value, operationTechniquePractice)) {
      case (
        OperationTechniquePractice(xmlElement: final element),
        OperationTechniquePractice(xmlElement: final existing),
      ):
        if (element.hasParent) {
          element.remove();
        }
        existing.replace(element);
      case (OperationTechniquePractice(xmlElement: final element), null):
        if (element.hasParent) {
          element.remove();
        }
        xmlElement.children.add(element);
      case (null, OperationTechniquePractice(xmlElement: final existing)):
        existing.remove();
    }
    _operationTechniquePractice = value;
  }

  OperationTechniquePractice? _operationTechniquePractice;

  /// A list of [ProductAllocation] for this.
  late final productAllocations = _XmlSyncedList<ProductAllocation>(
    xmlElement: xmlElement,
  );

  /// A list of [Time] for this.
  late final times = _XmlSyncedList<Time>(xmlElement: xmlElement);

  /// A list of [TimeLog] for this.
  late final timeLogs = _XmlSyncedList<TimeLog>(xmlElement: xmlElement);

  /// A list of [TreatmentZone] for this.
  late final treatmentZones = _XmlSyncedList<TreatmentZone>(
    xmlElement: xmlElement,
  );

  /// A list of [WorkerAllocation] for this.
  late final workerAllocations = _XmlSyncedList<WorkerAllocation>(
    xmlElement: xmlElement,
  );

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
      '''`${xmlElement.getAttribute('G')}` is not one of the supported values: ${TaskStatus.values.join(', ')}''',
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
