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
    Iso11783LinkList? linkList,
    String? taskControllerManufacturer,
    String? taskControllerVersion,
    String? language,
  }) : super(
         elementType: Iso11783ElementType.taskData,
         description: 'ISO 11783 Task Data File',
       ) {
    this.versionMajor = versionMajor;
    this.versionMinor = versionMinor;
    this.managementSoftwareManufacturer = managementSoftwareManufacturer;
    this.managementSoftwareVersion = managementSoftwareVersion;
    this.dataTransferOrigin = dataTransferOrigin;
    this.linkList = linkList;
    this.taskControllerManufacturer = taskControllerManufacturer;
    this.taskControllerVersion = taskControllerVersion;
    this.language = language;
    children.addAll([
      ...?attachedFiles,
      ...?baseStations,
      ...?codedComments,
      ...?codedCommentGroups,
      ...?colourLegends,
      ...?cropTypes,
      ...?culturalPractices,
      ...?customers,
      ...?devices,
      ...?farms,
      ...?operationTechniques,
      ...?partfields,
      ...?products,
      ...?productGroups,
      ...?tasks,
      ...?taskControllerCapabilities,
      ...?valuePresentations,
      ...?workers,
      ...?externalFileReferences,
    ]);
  }

  /// Creates an [Iso11783TaskData] from [document].
  factory Iso11783TaskData.fromXmlDocument(XmlDocument document) {
    final element = document.getElement(Iso11783ElementType.taskData.xmlTag)!;
    return element as Iso11783TaskData;
  }

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
          taskData.children.addAll(externalContent.childElements);
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
  List<AttachedFile> get attachedFiles => findElements(
    Iso11783ElementType.attachedFile.xmlTag,
  ).map((e) => e as AttachedFile).toList();

  /// A list of [BaseStation]s.
  List<BaseStation> get baseStations => findElements(
    Iso11783ElementType.baseStation.xmlTag,
  ).map((e) => e as BaseStation).toList();

  /// A list of [CodedComment]s.
  List<CodedComment> get codedComments => findElements(
    Iso11783ElementType.codedComment.xmlTag,
  ).map((e) => e as CodedComment).toList();

  /// A list of [CodedCommentGroup]s.
  List<CodedCommentGroup> get codedCommentGroups => findElements(
    Iso11783ElementType.codedCommentGroup.xmlTag,
  ).map((e) => e as CodedCommentGroup).toList();

  /// A list of [ColourLegend]s.
  List<ColourLegend> get colourLegends => findElements(
    Iso11783ElementType.colourLegend.xmlTag,
  ).map((e) => e as ColourLegend).toList();

  /// A list of [CropType]s.
  List<CropType> get cropTypes => findElements(
    Iso11783ElementType.cropType.xmlTag,
  ).map((e) => e as CropType).toList();

  /// A list of [CulturalPractice]s.
  List<CulturalPractice> get culturalPractices => findElements(
    Iso11783ElementType.culturalPractice.xmlTag,
  ).map((e) => e as CulturalPractice).toList();

  /// A list of [Customer]s.
  List<Customer> get customers => findElements(
    Iso11783ElementType.customer.xmlTag,
  ).map((e) => e as Customer).toList();

  /// A list of [Device]s.
  List<Device> get devices => findElements(
    Iso11783ElementType.device.xmlTag,
  ).map((e) => e as Device).toList();

  /// A list of [Farm]s.
  List<Farm> get farms => findElements(
    Iso11783ElementType.farm.xmlTag,
  ).map((e) => e as Farm).toList();

  /// A list of [OperationTechnique]s.
  List<OperationTechnique> get operationTechniques => findElements(
    Iso11783ElementType.operationTechnique.xmlTag,
  ).map((e) => e as OperationTechnique).toList();

  /// A list of [Partfield]s.
  List<Partfield> get partfields => findElements(
    Iso11783ElementType.partfield.xmlTag,
  ).map((e) => e as Partfield).toList();

  /// A list of [Product]s.
  List<Product> get products => findElements(
    Iso11783ElementType.product.xmlTag,
  ).map((e) => e as Product).toList();

  /// A list of [ProductGroup]s.
  List<ProductGroup> get productGroups => findElements(
    Iso11783ElementType.productGroup.xmlTag,
  ).map((e) => e as ProductGroup).toList();

  /// A list of [Task]s.
  List<Task> get tasks => findElements(
    Iso11783ElementType.task.xmlTag,
  ).map((e) => e as Task).toList();

  /// A list of [TaskControllerCapabilities].
  List<TaskControllerCapabilities> get taskControllerCapabilities =>
      findElements(
        Iso11783ElementType.taskControllerCapabilities.xmlTag,
      ).map((e) => e as TaskControllerCapabilities).toList();

  /// A list of [ValuePresentation]s.
  List<ValuePresentation> get valuePresentations => findElements(
    Iso11783ElementType.valuePresentation.xmlTag,
  ).map((e) => e as ValuePresentation).toList();

  /// A list of [Worker]s.
  List<Worker> get workers => findElements(
    Iso11783ElementType.worker.xmlTag,
  ).map((e) => e as Worker).toList();

  /// A list of [ExternalFileReference]s.
  List<ExternalFileReference> get externalFileReferences => findElements(
    Iso11783ElementType.externalFileReference.xmlTag,
  ).map((e) => e as ExternalFileReference).toList();

  /// An [Iso11783LinkList] for linking to external files.

  Iso11783LinkList? get linkList =>
      getElement(Iso11783ElementType.linkList.xmlTag) as Iso11783LinkList?;
  set linkList(Iso11783LinkList? value) => switch ((value, linkList)) {
    (final Iso11783LinkList value, final Iso11783LinkList existing) =>
      existing.replace(value as XmlElement),
    (final Iso11783LinkList value, null) => children.add(value),
    (null, final Iso11783LinkList existing) => existing.remove(),
    _ => null,
  };

  /// Preferred language of the software.
  String? get language => tryParseString('lang');
  set language(String? value) => setStringNullable('lang', value);

  /// A structured XML document that represents this.
  ///
  /// External references are removed as everything is contained in
  /// one document.
  XmlDocument toSingleXmlDocument() {
    final document = XmlDocument([
      XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
      this,
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
      this,
    ]);

    final list = <({String fileName, XmlDocument document})>[];
    if (mainDocument.lastChild != null) {
      final occurancesOfType = <Iso11783ElementType, int>{};
      for (final externalFileReference in externalFileReferences) {
        occurancesOfType.update(
          externalFileReference.elementType,
          (value) => value + 1,
          ifAbsent: () => 1,
        );
      }
      final typeDone = <Iso11783ElementType, bool>{};

      for (final externalFileReference in externalFileReferences) {
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
      findAllElements(type.xmlTag).map((e) => e as Iso11783Element);

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
