// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

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
          tag: Iso11783XmlTag.taskData,
          description: 'ISO 11783 Task Data File',
        );

  /// Creates an [Iso11783TaskData] from [element].
  factory Iso11783TaskData.fromXmlElement(XmlElement element) =>
      _$Iso11783TaskDataFromXmlElement(element);

  /// Creates an [Iso11783TaskData] from [document].
  static Iso11783TaskData? fromXmlDocument(XmlDocument document) =>
      Iso11783TaskData.fromXmlElement(document.childElements.first);

  /// Creates an [Iso11783TaskData] object from the zip [archive].
  static Future<Iso11783TaskData?> fromZip(Archive archive) async {
    final taskDataFile = archive.files.firstWhereOrNull(
      (element) => element.name.toUpperCase().endsWith('TASKDATA.XML'),
    );
    if (taskDataFile == null) {
      return null;
    }
    var taskData = Iso11783TaskData.fromXmlDocument(
      XmlDocument.parse(
        utf8.decoder.convert(taskDataFile.content as Uint8List),
      ),
    );
    if (taskData == null) {
      return null;
    }

    if (taskData.externalFileReferences != null) {
      for (final externalFile in taskData.externalFileReferences!) {
        final archiveFile = archive.files.firstWhereOrNull(
          (element) => element.name
              .toUpperCase()
              .endsWith('${externalFile.filename}.XML'),
        );
        if (archiveFile != null) {
          final externalContent = ExternalFileContents.fromXmlDocument(
            XmlDocument.parse(
              utf8.decoder.convert(archiveFile.content as Uint8List),
            ),
          );
          externalContent?.contents.forEach(
            (element) {
              final updated = taskData!.addTopLevelElement(element);
              if (updated != null) {
                taskData = updated;
              }
            },
          );
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
          utf8.decoder.convert(linkListFile.content as Uint8List),
        ),
      );
    }

    if (taskData?.tasks != null) {
      final tasksWithData = <Task>[];
      taskData?.tasks?.forEach((task) {
        Grid? grid;
        List<TimeLog>? timeLogs;
        if (task.grid != null) {
          final dataFile = archive.files.firstWhereOrNull(
            (file) =>
                file.name.toUpperCase().endsWith('${task.grid!.fileName}.BIN'),
          );
          final byteData = dataFile?.content as Uint8List;
          final numberOfProcessDataVariables = task.grid?.type == GridType.two
              ? task.treatmentZones
                  ?.firstWhereOrNull(
                    (element) => element.code == task.grid?.treatmentZoneCode,
                  )
                  ?.processDataVariables
                  ?.length
              : null;

          grid = task.grid!.copyWith(
            byteData: byteData,
            numberOfProcessDataVariables: numberOfProcessDataVariables,
          );
        }
        if (task.timeLogs != null) {
          timeLogs = [];
          for (final timeLog in task.timeLogs!) {
            final headerFile = archive.files.firstWhereOrNull(
              (file) =>
                  file.name.toUpperCase().endsWith('${timeLog.filename}.XML'),
            );

            final dataFile = archive.files.firstWhereOrNull(
              (file) =>
                  file.name.toUpperCase().endsWith('${timeLog.filename}.BIN'),
            );
            if (dataFile?.content != null && headerFile?.content != null) {
              final header = TimeLogHeader.fromXmlDocument(
                XmlDocument.parse(
                  utf8.decoder.convert(headerFile!.content as Uint8List),
                ),
              );
              final byteData = dataFile!.content as Uint8List;
              timeLogs.add(
                timeLog.copyWith(
                  header: header,
                  byteData: byteData,
                  records: timeLog
                      .copyWith(byteData: byteData, header: header)
                      .parseData(),
                ),
              );
            }
          }
        }
        tasksWithData.add(task.copyWith(grid: grid, timeLogs: timeLogs));
      });
      taskData = taskData?.copyWith.tasks(tasksWithData);
    }

    return taskData?.copyWith.linkList(linkList);
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
  /// [Iso11783XmlTag.tagsThatCanBeExternal] will create separate XML documents
  /// in the TASKDATA folder.
  Archive toZip({bool externalize = false}) {
    final archive = Archive();
    if (!externalize) {
      archive.addFile(
        ArchiveFile.string(
          'TASKDATA/TASKDATA.XML',
          toSingleXmlDocument().toXmlString(pretty: true, indent: '    '),
        ),
      );
    } else {
      for (final file in toXmlExternalDocuments()) {
        archive.addFile(
          ArchiveFile.string(
            'TASKDATA/${file.fileName}.XML',
            file.document.toXmlString(pretty: true, indent: '    '),
          ),
        );
      }
    }

    if (linkList != null) {
      archive.addFile(
        ArchiveFile.string(
          'TASKDATA/LINKLIST.XML',
          linkList!.toXmlDocument().toXmlString(pretty: true, indent: '    '),
        ),
      );
    }

    if (tasks != null) {
      for (final task in tasks!) {
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
        if (task.timeLogs != null) {
          for (final timeLog in task.timeLogs!) {
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
                    timeLog.header!
                        .toXmlDocument()
                        .toXmlString(pretty: true, indent: '    '),
                  ),
                );
            }
          }
        }
      }
    }
    return archive;
  }

  /// Creates a zip file export bytes of this.
  ///
  /// If [externalize] is true, then all the elements of this that are in
  /// [Iso11783XmlTag.tagsThatCanBeExternal] will create separate XML documents
  /// in the TASKDATA folder.
  List<int>? toBytes({bool externalize = false}) =>
      ZipEncoder().encode(toZip(externalize: externalize));

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
              node.name.local != Iso11783XmlTag.externalFileReference.name ||
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
      final occurancesOfType = <Iso11783XmlTag, int>{};
      for (final externalFileReference in externalFileReferences!) {
        occurancesOfType.update(
          externalFileReference.elementType,
          (value) => value + 1,
          ifAbsent: () => 1,
        );
      }
      final typeDone = <Iso11783XmlTag, bool>{};

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
                  XmlName.fromString(Iso11783XmlTag.externalFileContents.name),
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
                  XmlName.fromString(Iso11783XmlTag.externalFileContents.name),
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
                  node.name.local ==
                      Iso11783XmlTag.externalFileReference.name &&
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
                  XmlName.fromString(Iso11783XmlTag.externalFileContents.name),
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
