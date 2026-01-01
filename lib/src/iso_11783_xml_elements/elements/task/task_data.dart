// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes the `TASKDATA.xml` file, which is the main root
/// element and contains definitions about the construct of the element
/// structure, (Version number... ) and the use of primary elements.
class Iso11783TaskData extends Iso11783Element with _DocumentMixin {
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
    _argumentValidator(
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

  /// Creates an [Iso11783TaskData] from [document].
  factory Iso11783TaskData.fromXmlDocument(XmlDocument document) {
    final element = document.getElement(Iso11783ElementType.taskData.xmlTag)!;
    return Iso11783TaskData._fromXmlElement(element);
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  Iso11783TaskData._({
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
    this.linkList,
    String? taskControllerManufacturer,
    String? taskControllerVersion,
    String? language,
  }) : super._(elementType: _elementType) {
    this.versionMajor = versionMajor;
    this.versionMinor = versionMinor;
    this.managementSoftwareManufacturer = managementSoftwareManufacturer;
    this.managementSoftwareVersion = managementSoftwareVersion;
    this.dataTransferOrigin = dataTransferOrigin;
    this.taskControllerManufacturer = taskControllerManufacturer;
    this.taskControllerVersion = taskControllerVersion;
    this.language = language;
    this.attachedFiles.addAll(attachedFiles);
    this.baseStations.addAll(baseStations);
    this.codedComments.addAll(codedComments);
    this.codedCommentGroups.addAll(codedCommentGroups);
    this.colourLegends.addAll(colourLegends);
    this.cropTypes.addAll(cropTypes);
    this.culturalPractices.addAll(culturalPractices);
    this.customers.addAll(customers);
    this.devices.addAll(devices);
    this.farms.addAll(farms);
    this.operationTechniques.addAll(operationTechniques);
    this.partfields.addAll(partfields);
    this.products.addAll(products);
    this.productGroups.addAll(productGroups);
    this.tasks.addAll(tasks);
    this.taskControllerCapabilities.addAll(taskControllerCapabilities);
    this.valuePresentations.addAll(valuePresentations);
    this.workers.addAll(workers);
    this.externalFileReferences.addAll(externalFileReferences);
  }

  Iso11783TaskData._fromXmlElement(XmlElement element)
    : super._(elementType: _elementType, xmlElement: element) {
    attachedFiles.addAll(
      xmlElement
          .findElements(Iso11783ElementType.attachedFile.xmlTag)
          .map(AttachedFile._fromXmlElement)
          .toList(),
    );
    baseStations.addAll(
      xmlElement
          .findElements(Iso11783ElementType.baseStation.xmlTag)
          .map(BaseStation._fromXmlElement)
          .toList(),
    );
    codedComments.addAll(
      xmlElement
          .findElements(Iso11783ElementType.codedComment.xmlTag)
          .map(CodedComment._fromXmlElement)
          .toList(),
    );
    codedCommentGroups.addAll(
      xmlElement
          .findElements(Iso11783ElementType.codedCommentGroup.xmlTag)
          .map(CodedCommentGroup._fromXmlElement)
          .toList(),
    );
    colourLegends.addAll(
      xmlElement
          .findElements(Iso11783ElementType.colourLegend.xmlTag)
          .map(ColourLegend._fromXmlElement)
          .toList(),
    );
    cropTypes.addAll(
      xmlElement
          .findElements(Iso11783ElementType.cropType.xmlTag)
          .map(CropType._fromXmlElement)
          .toList(),
    );
    culturalPractices.addAll(
      xmlElement
          .findElements(Iso11783ElementType.culturalPractice.xmlTag)
          .map(CulturalPractice._fromXmlElement)
          .toList(),
    );
    customers.addAll(
      xmlElement
          .findElements(Iso11783ElementType.customer.xmlTag)
          .map(Customer._fromXmlElement)
          .toList(),
    );
    devices.addAll(
      xmlElement
          .findElements(Iso11783ElementType.device.xmlTag)
          .map(Device._fromXmlElement)
          .toList(),
    );
    farms.addAll(
      xmlElement
          .findElements(Iso11783ElementType.farm.xmlTag)
          .map(Farm._fromXmlElement)
          .toList(),
    );
    operationTechniques.addAll(
      xmlElement
          .findElements(Iso11783ElementType.operationTechnique.xmlTag)
          .map(OperationTechnique._fromXmlElement)
          .toList(),
    );
    partfields.addAll(
      xmlElement
          .findElements(Iso11783ElementType.partfield.xmlTag)
          .map(Partfield._fromXmlElement)
          .toList(),
    );
    products.addAll(
      xmlElement
          .findElements(Iso11783ElementType.product.xmlTag)
          .map(Product._fromXmlElement)
          .toList(),
    );
    productGroups.addAll(
      xmlElement
          .findElements(Iso11783ElementType.productGroup.xmlTag)
          .map(ProductGroup._fromXmlElement)
          .toList(),
    );
    tasks.addAll(
      xmlElement
          .findElements(Iso11783ElementType.task.xmlTag)
          .map(Task._fromXmlElement)
          .toList(),
    );
    taskControllerCapabilities.addAll(
      xmlElement
          .findElements(Iso11783ElementType.taskControllerCapabilities.xmlTag)
          .map(TaskControllerCapabilities._fromXmlElement)
          .toList(),
    );
    valuePresentations.addAll(
      xmlElement
          .findElements(Iso11783ElementType.valuePresentation.xmlTag)
          .map(ValuePresentation._fromXmlElement)
          .toList(),
    );
    workers.addAll(
      xmlElement
          .findElements(Iso11783ElementType.worker.xmlTag)
          .map(Worker._fromXmlElement)
          .toList(),
    );
    externalFileReferences.addAll(
      xmlElement
          .findElements(Iso11783ElementType.externalFileReference.xmlTag)
          .map(ExternalFileReference._fromXmlElement)
          .toList(),
    );
    _argumentValidator(
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

  static void _argumentValidator({
    required VersionMajor versionMajor,
    required VersionMinor versionMinor,
    required String managementSoftwareManufacturer,
    required String managementSoftwareVersion,
    required DataTransferOrigin dataTransferOrigin,
    required List<AttachedFile>? attachedFiles,
    required List<BaseStation>? baseStations,
    required List<CodedComment>? codedComments,
    required List<CodedCommentGroup>? codedCommentGroups,
    required List<ColourLegend>? colourLegends,
    required List<CropType>? cropTypes,
    required List<CulturalPractice>? culturalPractices,
    required List<Customer>? customers,
    required List<Device>? devices,
    required List<Farm>? farms,
    required List<OperationTechnique>? operationTechniques,
    required List<Partfield>? partfields,
    required List<Product>? products,
    required List<ProductGroup>? productGroups,
    required List<Task>? tasks,
    required List<TaskControllerCapabilities>? taskControllerCapabilities,
    required List<ValuePresentation>? valuePresentations,
    required List<Worker>? workers,
    required List<ExternalFileReference>? externalFileReferences,
    required Iso11783LinkList? linkList,
    required String? taskControllerManufacturer,
    required String? taskControllerVersion,
    required String? language,
  }) {
    ArgumentValidation.checkStringLength(
      managementSoftwareManufacturer,
      name: 'Iso11783TaskData.managementSoftwareManufacturer',
    );
    ArgumentValidation.checkStringLength(
      managementSoftwareVersion,
      name: 'Iso11783TaskData.managementSoftwareVersion',
    );
    if (taskControllerManufacturer != null) {
      ArgumentValidation.checkStringLength(
        taskControllerManufacturer,
        name: 'Iso11783TaskData.taskControllerManufacturer',
      );
    }
    if (taskControllerVersion != null) {
      ArgumentValidation.checkStringLength(
        taskControllerVersion,
        name: 'Iso11783TaskData.taskControllerVersion',
      );
    }
    if (language != null) {
      ArgumentValidation.checkStringLength(
        language,
        name: 'Iso11783TaskData.language',
      );
    }
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.taskData;

  /// Creates an [Iso11783TaskData] object from the zip [archive].
  static Future<Iso11783TaskData?> fromZip(Archive archive) async {
    final taskDataFile = archive.files.firstWhereOrNull(
      (element) => element.name.toUpperCase().endsWith('TASKDATA.XML'),
    );
    if (taskDataFile == null) {
      return null;
    }
    final taskData = Iso11783TaskData.fromXmlDocument(
      XmlDocument.parse(
        utf8.decoder.convert(taskDataFile.content),
      ),
    );

    for (final externalFile in taskData.externalFileReferences) {
      final archiveFile = archive.files.firstWhereOrNull(
        (element) =>
            element.name.toUpperCase().endsWith('${externalFile.filename}.XML'),
      );
      if (archiveFile != null) {
        final externalContent = ExternalFileContents.fromXmlDocument(
          XmlDocument.parse(
            utf8.decoder.convert(archiveFile.content),
          ),
        );
        if (externalContent != null) {
          taskData.addExternalFileContents(externalContent);
        }
      }
    }

    Iso11783LinkList? linkList;
    final linkListFile = archive.files.firstWhereOrNull(
      (element) => element.name.toUpperCase().endsWith('LINKLIST.XML'),
    );
    if (linkListFile != null) {
      linkList = Iso11783LinkList.fromXmlDocument(
        XmlDocument.parse(
          utf8.decoder.convert(linkListFile.content),
        ),
      );
    }

    for (final task in taskData.tasks) {
      if (task.grid != null) {
        final dataFile = archive.files.firstWhereOrNull(
          (file) =>
              file.name.toUpperCase().endsWith('${task.grid!.fileName}.BIN'),
        );
        task.grid!
          ..byteData = dataFile!.content
          ..numberOfProcessDataVariables = task.grid!.type == GridType.two
              ? task.treatmentZones
                    .firstWhereOrNull(
                      (element) => element.code == task.grid!.treatmentZoneCode,
                    )
                    ?.processDataVariables
                    .length
              : null
          ..parseData();
      }
      for (final timeLog in task.timeLogs) {
        final headerFile = archive.files.firstWhereOrNull(
          (file) => file.name.toUpperCase().endsWith('${timeLog.filename}.XML'),
        );

        final dataFile = archive.files.firstWhereOrNull(
          (file) => file.name.toUpperCase().endsWith('${timeLog.filename}.BIN'),
        );
        if (dataFile?.content != null && headerFile?.content != null) {
          timeLog
            ..header = TimeLogHeader.fromXmlDocument(
              XmlDocument.parse(
                utf8.decoder.convert(headerFile!.content),
              ),
            )
            ..byteData = dataFile!.content
            ..parseData();
        }
      }
    }
    return taskData..linkList = linkList;
  }

  /// Creates an [Iso11783TaskData] object from the zip file [bytes].
  static Future<Iso11783TaskData?> fromBytes(List<int> bytes) async =>
      fromZip(ZipDecoder().decodeBytes(bytes));

  /// Creates an [Iso11783TaskData] object from the directory at [path].
  static Future<Iso11783TaskData?> fromDirectory(String path) async =>
      TaskDataFileHandler.loadDirectory(path);

  /// Creates a zip file export of this.
  ///
  /// If [externalize] is true, then all the elements of this that are in
  /// [Iso11783ElementType.tagsThatCanBeExternal] will create separate XML
  /// documents in the TASKDATA folder.
  Archive toZip({bool externalize = false}) {
    final archive = Archive();
    if (!externalize) {
      archive.addFile(
        ArchiveFile.string(
          'TASKDATA/TASKDATA.XML',
          '${toSingleXmlDocument().toXmlString(
            pretty: true,
            indent: '    ',
          )}\n',
        ),
      );
    } else {
      createExternalFileReferences();
      for (final file in toXmlExternalDocuments()) {
        archive.addFile(
          ArchiveFile.string(
            'TASKDATA/${file.fileName}.XML',
            '${file.document.toXmlString(
              pretty: true,
              indent: '    ',
            )}\n',
          ),
        );
      }
    }

    if (linkList != null) {
      archive.addFile(
        ArchiveFile.string(
          'TASKDATA/LINKLIST.XML',
          '${linkList!.toXmlDocument().toXmlString(
            pretty: true,
            indent: '    ',
          )}\n',
        ),
      );
    }

    for (final task in tasks) {
      if (task.grid != null) {
        final bytes = task.grid!.gridToBytes();
        if (bytes != null && bytes.isNotEmpty) {
          archive.addFile(
            ArchiveFile(
              'TASKDATA/${task.grid!.fileName}.BIN',
              bytes.lengthInBytes,
              bytes,
            ),
          );
        }
      }
      for (final timeLog in task.timeLogs) {
        final bytes = timeLog.recordsToBytes();
        if (bytes != null && bytes.isNotEmpty && timeLog.header != null) {
          archive
            ..addFile(
              ArchiveFile(
                'TASKDATA/${timeLog.filename}.BIN',
                bytes.lengthInBytes,
                bytes,
              ),
            )
            ..addFile(
              ArchiveFile.string(
                'TASKDATA/${timeLog.filename}.XML',
                '${timeLog.header!.toXmlDocument().toXmlString(
                  pretty: true,
                  indent: '    ',
                )}\n',
              ),
            );
        }
      }
    }
    return archive;
  }

  /// Creates a zip file export bytes of this.
  ///
  /// If [externalize] is true, then all the elements of this that are in
  /// [Iso11783ElementType.tagsThatCanBeExternal] will create separate XML
  /// documents in the TASKDATA folder.
  List<int>? toBytes({bool externalize = false}) =>
      ZipEncoder().encode(toZip(externalize: externalize));

  /// A list of [AttachedFile]s.
  late final attachedFiles = _XmlSyncedList<AttachedFile>(
    xmlElement: xmlElement,
    xmlTag: AttachedFile._elementType.xmlTag,
  );

  /// A list of [BaseStation]s.
  late final baseStations = _XmlSyncedList<BaseStation>(
    xmlElement: xmlElement,
    xmlTag: BaseStation._elementType.xmlTag,
  );

  /// A list of [CodedComment]s.
  late final codedComments = _XmlSyncedList<CodedComment>(
    xmlElement: xmlElement,
    xmlTag: CodedComment._elementType.xmlTag,
  );

  /// A list of [CodedCommentGroup]s.
  late final codedCommentGroups = _XmlSyncedList<CodedCommentGroup>(
    xmlElement: xmlElement,
    xmlTag: CodedCommentGroup._elementType.xmlTag,
  );

  /// A list of [ColourLegend]s.
  late final colourLegends = _XmlSyncedList<ColourLegend>(
    xmlElement: xmlElement,
    xmlTag: ColourLegend._elementType.xmlTag,
  );

  /// A list of [CropType]s.
  late final cropTypes = _XmlSyncedList<CropType>(
    xmlElement: xmlElement,
    xmlTag: CropType._elementType.xmlTag,
  );

  /// A list of [CulturalPractice]s.
  late final culturalPractices = _XmlSyncedList<CulturalPractice>(
    xmlElement: xmlElement,
    xmlTag: CulturalPractice._elementType.xmlTag,
  );

  /// A list of [Customer]s.
  late final customers = _XmlSyncedList<Customer>(
    xmlElement: xmlElement,
    xmlTag: Customer._elementType.xmlTag,
  );

  /// A list of [Device]s.
  late final devices = _XmlSyncedList<Device>(
    xmlElement: xmlElement,
    xmlTag: Device._elementType.xmlTag,
  );

  /// A list of [Farm]s.
  late final farms = _XmlSyncedList<Farm>(
    xmlElement: xmlElement,
    xmlTag: Farm._elementType.xmlTag,
  );

  /// A list of [OperationTechnique]s.
  late final operationTechniques = _XmlSyncedList<OperationTechnique>(
    xmlElement: xmlElement,
    xmlTag: OperationTechnique._elementType.xmlTag,
  );

  /// A list of [Partfield]s.
  late final partfields = _XmlSyncedList<Partfield>(
    xmlElement: xmlElement,
    xmlTag: Partfield._elementType.xmlTag,
  );

  /// A list of [Product]s.
  late final products = _XmlSyncedList<Product>(
    xmlElement: xmlElement,
    xmlTag: Product._elementType.xmlTag,
  );

  /// A list of [ProductGroup]s.
  late final productGroups = _XmlSyncedList<ProductGroup>(
    xmlElement: xmlElement,
    xmlTag: ProductGroup._elementType.xmlTag,
  );

  /// A list of [Task]s.
  late final tasks = _XmlSyncedList<Task>(
    xmlElement: xmlElement,
    xmlTag: Task._elementType.xmlTag,
  );

  /// A list of [TaskControllerCapabilities].
  late final taskControllerCapabilities =
      _XmlSyncedList<TaskControllerCapabilities>(
        xmlElement: xmlElement,
        xmlTag: TaskControllerCapabilities._elementType.xmlTag,
      );

  /// A list of [ValuePresentation]s.
  late final valuePresentations = _XmlSyncedList<ValuePresentation>(
    xmlElement: xmlElement,
    xmlTag: ValuePresentation._elementType.xmlTag,
  );

  /// A list of [Worker]s.
  late final workers = _XmlSyncedList<Worker>(
    xmlElement: xmlElement,
    xmlTag: Worker._elementType.xmlTag,
  );

  /// A list of [ExternalFileReference]s.
  late final externalFileReferences = _XmlSyncedList<ExternalFileReference>(
    xmlElement: xmlElement,
    xmlTag: ExternalFileReference._elementType.xmlTag,
  );

  /// An [Iso11783LinkList] for linking to external files.
  Iso11783LinkList? linkList;

  /// Preferred language of the software.
  String? get language => tryParseString('lang');
  set language(String? value) => setStringNullable('lang', value);

  /// Adds the contents from [external] to their respective element list in
  /// this.
  void addExternalFileContents(ExternalFileContents external) {
    attachedFiles.addAll(external.attachedFiles);
    baseStations.addAll(external.baseStations);
    codedComments.addAll(external.codedComments);
    codedCommentGroups.addAll(external.codedCommentGroups);
    colourLegends.addAll(external.colourLegends);
    cropTypes.addAll(external.cropTypes);
    culturalPractices.addAll(external.culturalPractices);
    customers.addAll(external.customers);
    devices.addAll(external.devices);
    farms.addAll(external.farms);
    operationTechniques.addAll(external.operationTechniques);
    partfields.addAll(external.partfields);
    products.addAll(external.products);
    productGroups.addAll(external.productGroups);
    tasks.addAll(external.tasks);
    valuePresentations.addAll(external.valuePresentations);
    workers.addAll(external.workers);
  }

  /// Fills [externalFileReferences] with elements from all the tags that can
  /// be externalized.
  void createExternalFileReferences() {
    void createRefs({required Iterable<String> ids, required String typeId}) {
      if (ids.isEmpty) {
        return;
      }
      if (externalFileReferences.none(
            (existing) => existing.filename == '${typeId}00001',
          ) &&
          ids.any(
            (id) => id.contains('-'),
          )) {
        externalFileReferences.add(
          ExternalFileReference(
            filename: '${typeId}00001',
          ),
        );
      }
      if (externalFileReferences.none(
            (existing) => existing.filename == '${typeId}00000',
          ) &&
          ids.any(
            (id) => !id.contains('-'),
          )) {
        externalFileReferences.add(
          ExternalFileReference(
            filename: '${typeId}00000',
          ),
        );
      }
    }

    for (final elements in [
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
      valuePresentations,
      workers,
    ]) {
      createRefs(
        typeId: elements._xmlTag,
        ids: elements.map((element) => element.id).nonNulls,
      );
    }
  }

  /// A structured XML document that represents this.
  ///
  /// External references are removed as everything is contained in
  /// one document.
  XmlDocument toSingleXmlDocument() {
    final document = XmlDocument([
      XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
      xmlElement.copy(),
    ]);
    document.lastChild?.children.retainWhere(
      (node) =>
          node is XmlElement &&
              node.name.local !=
                  Iso11783ElementType.externalFileReference.xmlTag ||
          node is! XmlElement,
    );
    return document;
  }

  /// A structured XML document that represents this.
  List<({String fileName, XmlDocument document})> toXmlExternalDocuments() {
    final mainDocument = XmlDocument([
      XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
      xmlElement.copy(),
    ]);

    final list = <({String fileName, XmlDocument document})>[];
    if (mainDocument.lastChild != null) {
      final occurancesOfType = <Iso11783ElementType, int>{};
      for (final externalFileReference in externalFileReferences) {
        occurancesOfType.update(
          externalFileReference.childrenElementType,
          (value) => value + 1,
          ifAbsent: () => 1,
        );
      }
      final typeDone = <Iso11783ElementType, bool>{};

      for (final externalFileReference in externalFileReferences) {
        final type = externalFileReference.childrenElementType;

        if (typeDone[type] ?? false) {
          continue;
        }
        typeDone[type] = true;
        // If there are more than one occurance of a type, we use
        // ---00000.XML for positive ids and ---00001.XML for negative ids.
        // If there are more than two occurances, the overshooting ones are
        // removed.
        if ((occurancesOfType[type] ?? 0) > 1) {
          final externalContent = mainDocument.lastChild!
              .findElements(type.xmlTag)
              .toList();
          if (externalContent.isNotEmpty) {
            // ---00001 , Negative ids
            final documentNegative = XmlDocument(
              [
                XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
                XmlElement(
                  XmlName.fromString(
                    Iso11783ElementType.externalFileContents.xmlTag,
                  ),
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
                    '${externalFileReference.filename.substring(0, 3)}00001',
                document: documentNegative,
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
                  XmlName.fromString(
                    Iso11783ElementType.externalFileContents.xmlTag,
                  ),
                  [],
                  externalContent.map((e) => e.copy()).toList(),
                ),
              ],
            );
            list.add(
              (
                fileName:
                    '${externalFileReference.filename.substring(0, 3)}00000',
                document: documentPositive,
              ),
            );

            mainDocument.lastChild!.children.retainWhere(
              (node) =>
                  node is XmlElement && node.name.local != type.xmlTag ||
                  node is! XmlElement,
            );
          }
          // Remove overshooting external references.
          if ((occurancesOfType[type] ?? 0) > 2) {
            final indices = <int>[];
            for (final (index, node)
                in mainDocument.lastChild!.children.indexed) {
              if (node is XmlElement &&
                  node.name.local ==
                      Iso11783ElementType.externalFileReference.xmlTag &&
                  (node.getAttribute('A')?.startsWith(type.xmlTag) ?? false)) {
                indices.add(index);
              }
            }
            mainDocument.lastChild!.children.removeRange(
              indices[2],
              indices.last + 1,
            );
          }
        } else {
          final externalContent = mainDocument.lastChild?.findElements(
            type.xmlTag,
          );
          if (externalContent != null && externalContent.isNotEmpty) {
            final document = XmlDocument(
              [
                XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
                XmlElement(
                  XmlName.fromString(
                    Iso11783ElementType.externalFileContents.xmlTag,
                  ),
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
                  node is XmlElement && node.name.local != type.xmlTag ||
                  node is! XmlElement,
            );
          }
        }
      }
    }
    list.add((fileName: 'TASKDATA', document: mainDocument));

    return list;
  }

  /// Find all the IDs for the [Iso11783Element]s of [type] in this.
  Iterable<String>? idsOfType(Iso11783ElementType type) =>
      type.canHaveId ? elementsOfType(type).map((e) => e.id).nonNulls : null;

  /// Find all the [Iso11783Element]s of [type] in this.
  Iterable<Iso11783Element> elementsOfType(Iso11783ElementType type) =>
      xmlElement
          .findAllElements(type.xmlTag)
          .map(Iso11783Element.fromXmlElement);

  /// Find the next ID for an [Iso11783Element] of [type], if it can have an ID.
  ///
  /// [additionalIncrement] can be changed to get IDs further from the current
  /// max, this is particularily useful for getting several IDs before the
  /// elements become children of the task data structure.
  ///
  /// [overrideTransferOrigin] can be used to change the next ID to not follow
  /// the [dataTransferOrigin].
  String? nextIdForType(
    Iso11783ElementType type, {
    int additionalIncrement = 0,
    DataTransferOrigin? overrideTransferOrigin,
  }) {
    if (!type.canHaveId) {
      return null;
    }
    final ids = idsOfType(type);
    if (ids == null) {
      return null;
    }
    if ((overrideTransferOrigin ?? dataTransferOrigin) ==
        DataTransferOrigin.mics) {
      final min = ids.isEmpty
          ? 0
          : [0, ...ids.map((e) => int.parse(e.split(type.xmlTag).last))].min;

      return [
        type.xmlTag,
        min - (1 + additionalIncrement),
      ].join();
    } else {
      final max = ids.isEmpty
          ? 0
          : [0, ...ids.map((e) => int.parse(e.split(type.xmlTag).last))].max;

      return [
        type.xmlTag,
        max + (1 + additionalIncrement),
      ].join();
    }
  }

  /// Attempts to find the (recursive) child [Iso11783Element] with the given
  /// [id].
  Iso11783Element? elementById(String id) => elementsOfType(
    Iso11783ElementType.fromXmlTag(id.substring(0, 3)),
  ).firstWhereOrNull((e) => e.id == id);
}
