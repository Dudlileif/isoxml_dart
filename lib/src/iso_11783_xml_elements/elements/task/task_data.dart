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
    with _$Iso11783TaskDataXmlSerializableMixin, EquatableMixin {
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
    List<XmlAttribute>? customAttributes,
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
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  Iso11783TaskData._({
    required this.versionMajor,
    required this.versionMinor,
    required this.managementSoftwareManufacturer,
    required this.managementSoftwareVersion,
    required this.dataTransferOrigin,
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
    this.taskControllerManufacturer,
    this.taskControllerVersion,
    this.language,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.taskData,
         description: 'ISO 11783 Task Data File',
       ) {
    attachedFiles?.forEach(addTopLevelElement);
    baseStations?.forEach(addTopLevelElement);
    codedComments?.forEach(addTopLevelElement);
    codedCommentGroups?.forEach(addTopLevelElement);
    colourLegends?.forEach(addTopLevelElement);
    cropTypes?.forEach(addTopLevelElement);
    culturalPractices?.forEach(addTopLevelElement);
    customers?.forEach(addTopLevelElement);
    devices?.forEach(addTopLevelElement);
    farms?.forEach(addTopLevelElement);
    operationTechniques?.forEach(addTopLevelElement);
    partfields?.forEach(addTopLevelElement);
    products?.forEach(addTopLevelElement);
    productGroups?.forEach(addTopLevelElement);
    tasks?.forEach(addTopLevelElement);
    taskControllerCapabilities?.forEach(addTopLevelElement);
    valuePresentations?.forEach(addTopLevelElement);
    workers?.forEach(addTopLevelElement);
    externalFileReferences?.forEach(addTopLevelElement);
  }

  /// Creates an [Iso11783TaskData] from [element].
  factory Iso11783TaskData.fromXmlElement(XmlElement element) {
    final attachedFiles = element.getElements('AFE');
    final baseStations = element.getElements('BSN');
    final codedComments = element.getElements('CCT');
    final codedCommentGroups = element.getElements('CCG');
    final colourLegends = element.getElements('CLD');
    final cropTypes = element.getElements('CTP');
    final culturalPractices = element.getElements('CPC');
    final customers = element.getElements('CTR');
    final devices = element.getElements('DVC');
    final farms = element.getElements('FRM');
    final operationTechniques = element.getElements('OTQ');
    final partfields = element.getElements('PFD');
    final products = element.getElements('PDT');
    final productGroups = element.getElements('PGP');
    final tasks = element.getElements('TSK');
    final taskControllerCapabilities = element.getElements('TCC');
    final valuePresentations = element.getElements('VPN');
    final workers = element.getElements('WKR');
    final externalFileReferences = element.getElements('XFR');
    final versionMajor = element.getAttribute('VersionMajor')!;
    final versionMinor = element.getAttribute('VersionMinor')!;
    final dataTransferOrigin = element.getAttribute('DataTransferOrigin')!;
    final managementSoftwareManufacturer = element.getAttribute(
      'ManagementSoftwareManufacturer',
    )!;
    final managementSoftwareVersion = element.getAttribute(
      'ManagementSoftwareVersion',
    )!;
    final taskControllerManufacturer = element.getAttribute(
      'TaskControllerManufacturer',
    );
    final taskControllerVersion = element.getAttribute('TaskControllerVersion');
    final language = element.getAttribute('lang');
    final customAttributes = element.attributes
        .whereNot(
          (attribute) => [
            'VersionMajor',
            'VersionMinor',
            'DataTransferOrigin',
            'ManagementSoftwareManufacturer',
            'ManagementSoftwareVersion',
            'TaskControllerManufacturer',
            'TaskControllerVersion',
            'lang',
          ].contains(attribute.name.local),
        )
        .toList();
    return Iso11783TaskData(
      attachedFiles: attachedFiles?.map(AttachedFile.fromXmlElement).toList(),
      baseStations: baseStations?.map(BaseStation.fromXmlElement).toList(),
      codedComments: codedComments?.map(CodedComment.fromXmlElement).toList(),
      codedCommentGroups: codedCommentGroups
          ?.map(CodedCommentGroup.fromXmlElement)
          .toList(),
      colourLegends: colourLegends?.map(ColourLegend.fromXmlElement).toList(),
      cropTypes: cropTypes?.map(CropType.fromXmlElement).toList(),
      culturalPractices: culturalPractices
          ?.map(CulturalPractice.fromXmlElement)
          .toList(),
      customers: customers?.map(Customer.fromXmlElement).toList(),
      devices: devices?.map(Device.fromXmlElement).toList(),
      farms: farms?.map(Farm.fromXmlElement).toList(),
      operationTechniques: operationTechniques
          ?.map(OperationTechnique.fromXmlElement)
          .toList(),
      partfields: partfields?.map(Partfield.fromXmlElement).toList(),
      products: products?.map(Product.fromXmlElement).toList(),
      productGroups: productGroups?.map(ProductGroup.fromXmlElement).toList(),
      tasks: tasks?.map(Task.fromXmlElement).toList(),
      taskControllerCapabilities: taskControllerCapabilities
          ?.map(TaskControllerCapabilities.fromXmlElement)
          .toList(),
      valuePresentations: valuePresentations
          ?.map(ValuePresentation.fromXmlElement)
          .toList(),
      workers: workers?.map(Worker.fromXmlElement).toList(),
      externalFileReferences: externalFileReferences
          ?.map(ExternalFileReference.fromXmlElement)
          .toList(),
      versionMajor: $VersionMajorEnumMap.entries
          .singleWhere(
            (versionMajorEnumMapEntry) =>
                versionMajorEnumMapEntry.value == versionMajor,
            orElse: () => throw ArgumentError(
              '''`$versionMajor` is not one of the supported values: ${$VersionMajorEnumMap.values.join(', ')}''',
            ),
          )
          .key,
      versionMinor: $VersionMinorEnumMap.entries
          .singleWhere(
            (versionMinorEnumMapEntry) =>
                versionMinorEnumMapEntry.value == versionMinor,
            orElse: () => throw ArgumentError(
              '''`$versionMinor` is not one of the supported values: ${$VersionMinorEnumMap.values.join(', ')}''',
            ),
          )
          .key,
      dataTransferOrigin: $DataTransferOriginEnumMap.entries
          .singleWhere(
            (dataTransferOriginEnumMapEntry) =>
                dataTransferOriginEnumMapEntry.value == dataTransferOrigin,
            orElse: () => throw ArgumentError(
              '''`$dataTransferOrigin` is not one of the supported values: ${$DataTransferOriginEnumMap.values.join(', ')}''',
            ),
          )
          .key,
      managementSoftwareManufacturer: managementSoftwareManufacturer,
      managementSoftwareVersion: managementSoftwareVersion,
      taskControllerManufacturer: taskControllerManufacturer,
      taskControllerVersion: taskControllerVersion,
      language: language,
      customAttributes: customAttributes.isNotEmpty ? customAttributes : null,
    );
  }

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
    final taskData = Iso11783TaskData.fromXmlDocument(
      XmlDocument.parse(
        utf8.decoder.convert(taskDataFile.content),
      ),
    );
    if (taskData == null) {
      return null;
    }

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
        externalContent?.contents.forEach(taskData.addTopLevelElement);
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
    return taskData.copyWith.linkList(linkList);
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
  @annotation.XmlElement(name: 'AFE')
  final List<AttachedFile> attachedFiles = [];

  /// A list of [BaseStation]s.
  @annotation.XmlElement(name: 'BSN')
  final List<BaseStation> baseStations = [];

  /// A list of [CodedComment]s.
  @annotation.XmlElement(name: 'CCT')
  final List<CodedComment> codedComments = [];

  /// A list of [CodedCommentGroup]s.
  @annotation.XmlElement(name: 'CCG')
  final List<CodedCommentGroup> codedCommentGroups = [];

  /// A list of [ColourLegend]s.
  @annotation.XmlElement(name: 'CLD')
  final List<ColourLegend> colourLegends = [];

  /// A list of [CropType]s.
  @annotation.XmlElement(name: 'CTP')
  final List<CropType> cropTypes = [];

  /// A list of [CulturalPractice]s.
  @annotation.XmlElement(name: 'CPC')
  final List<CulturalPractice> culturalPractices = [];

  /// A list of [Customer]s.
  @annotation.XmlElement(name: 'CTR')
  final List<Customer> customers = [];

  /// A list of [Device]s.
  @annotation.XmlElement(name: 'DVC')
  final List<Device> devices = [];

  /// A list of [Farm]s.
  @annotation.XmlElement(name: 'FRM')
  final List<Farm> farms = [];

  /// A list of [OperationTechnique]s.
  @annotation.XmlElement(name: 'OTQ')
  final List<OperationTechnique> operationTechniques = [];

  /// A list of [Partfield]s.
  @annotation.XmlElement(name: 'PFD')
  final List<Partfield> partfields = [];

  /// A list of [Product]s.
  @annotation.XmlElement(name: 'PDT')
  final List<Product> products = [];

  /// A list of [ProductGroup]s.
  @annotation.XmlElement(name: 'PGP')
  final List<ProductGroup> productGroups = [];

  /// A list of [Task]s.
  @annotation.XmlElement(name: 'TSK')
  final List<Task> tasks = [];

  /// A list of [TaskControllerCapabilities].
  @annotation.XmlElement(name: 'TCC')
  final List<TaskControllerCapabilities> taskControllerCapabilities = [];

  /// A list of [ValuePresentation]s.
  @annotation.XmlElement(name: 'VPN')
  final List<ValuePresentation> valuePresentations = [];

  /// A list of [Worker]s.
  @annotation.XmlElement(name: 'WKR')
  final List<Worker> workers = [];

  /// A list of [ExternalFileReference]s.
  @annotation.XmlElement(name: 'XFR')
  final List<ExternalFileReference> externalFileReferences = [];

  /// An [Iso11783LinkList] for linking to external files.
  final Iso11783LinkList? linkList;

  /// Major version of the standard.
  @annotation.XmlAttribute(name: 'VersionMajor')
  final VersionMajor versionMajor;

  /// Minor version of the standard
  @annotation.XmlAttribute(name: 'VersionMinor')
  final VersionMinor versionMinor;

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

  /// The creation origin of this.
  @annotation.XmlAttribute(name: 'DataTransferOrigin')
  final DataTransferOrigin dataTransferOrigin;

  /// Preferred language of the software.
  @annotation.XmlAttribute(name: 'lang')
  final String? language;

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$Iso11783TaskDataBuildXmlChildren(this, builder, namespaces: namespaces);
    if (customAttributes != null && customAttributes!.isNotEmpty) {
      for (final attribute in customAttributes!) {
        builder.attribute(attribute.name.local, attribute.value);
      }
    }
  }

  /// Returns a list of the XML attributes of this.
  @override
  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    final attributes = _$Iso11783TaskDataToXmlAttributes(
      this,
      namespaces: namespaces,
    );
    if (customAttributes != null) {
      attributes.addAll(customAttributes!);
    }
    return attributes;
  }

  /// A structured XML document that represents this.
  ///
  /// External references are removed as everything is contained in
  /// one document.
  XmlDocument toSingleXmlDocument() {
    final builder = XmlBuilder()
      ..processing('xml', 'version="1.0" encoding="UTF-8"');
    builder.element(elementType.xmlTag, nest: () => buildXmlChildren(builder));
    final document = builder.buildDocument();
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
    final builder = XmlBuilder()
      ..processing('xml', 'version="1.0" encoding="UTF-8"');

    builder.element(elementType.xmlTag, nest: () => buildXmlChildren(builder));
    final mainDocument = builder.buildDocument();

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
              .getElements(type.xmlTag)
              ?.toList();
          if (externalContent != null && externalContent.isNotEmpty) {
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
          final externalContent = mainDocument.lastChild?.getElements(
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

  /// Returns null or a copy of this with the top level [element] added.
  ///
  /// A copy is returned if the list for the element type doesn't exist,
  /// otherwise null is returned and the element is added to the
  /// already existing list.
  void addTopLevelElement(Iso11783Element element) {
    switch (element) {
      case (final AttachedFile element):
        attachedFiles.add(element);
      case (final BaseStation element):
        baseStations.add(element);
      case (final CodedComment element):
        codedComments.add(element);
      case (final CodedCommentGroup element):
        codedCommentGroups.add(element);
      case (final ColourLegend element):
        colourLegends.add(element);
      case (final CropType element):
        cropTypes.add(element);
      case (final CulturalPractice element):
        culturalPractices.add(element);
      case (final Customer element):
        customers.add(element);
      case (final Device element):
        devices.add(element);
      case (final Farm element):
        farms.add(element);
      case (final OperationTechnique element):
        operationTechniques.add(element);
      case (final Partfield element):
        partfields.add(element);
      case (final Product element):
        products.add(element);
      case (final ProductGroup element):
        productGroups.add(element);
      case (final Task element):
        tasks.add(element);
      case (final TaskControllerCapabilities element):
        taskControllerCapabilities.add(element);
      case (final ValuePresentation element):
        valuePresentations.add(element);
      case (final Worker element):
        workers.add(element);
      case (final ExternalFileReference element):
        externalFileReferences.add(element);
      case _:
        break;
    }
  }

  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
    ...[
      for (final a in attachedFiles.map((e) => e.selfWithRecursiveChildren))
        ...a,
    ],
    ...[
      for (final a in baseStations.map((e) => e.selfWithRecursiveChildren))
        ...a,
    ],
    ...[
      for (final a in codedComments.map((e) => e.selfWithRecursiveChildren))
        ...a,
    ],
    ...[
      for (final a in codedCommentGroups.map(
        (e) => e.selfWithRecursiveChildren,
      ))
        ...a,
    ],
    ...[
      for (final a in colourLegends.map((e) => e.selfWithRecursiveChildren))
        ...a,
    ],
    ...[
      for (final a in cropTypes.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
    ...[
      for (final a in culturalPractices.map((e) => e.selfWithRecursiveChildren))
        ...a,
    ],
    ...[
      for (final a in customers.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
    ...[
      for (final a in devices.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
    ...[
      for (final a in farms.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
    ...[
      for (final a in operationTechniques.map(
        (e) => e.selfWithRecursiveChildren,
      ))
        ...a,
    ],
    ...[
      for (final a in partfields.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
    ...[
      for (final a in products.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
    ...[
      for (final a in productGroups.map((e) => e.selfWithRecursiveChildren))
        ...a,
    ],
    ...[
      for (final a in tasks.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
    ...[
      for (final a in taskControllerCapabilities.map(
        (e) => e.selfWithRecursiveChildren,
      ))
        ...a,
    ],
    ...[
      for (final a in valuePresentations.map(
        (e) => e.selfWithRecursiveChildren,
      ))
        ...a,
    ],
    ...[
      for (final a in workers.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
    ...[
      for (final a in externalFileReferences.map(
        (e) => e.selfWithRecursiveChildren,
      ))
        ...a,
    ],
  ];

  /// Find all the IDs for the [Iso11783Element]s of [type] in this.
  Iterable<String>? idsOfType(Iso11783ElementType type) =>
      type.canHaveId ? elementsOfType(type).map((e) => e.id).nonNulls : null;

  /// Find all the [Iso11783Element]s of [type] in this.
  Iterable<Iso11783Element> elementsOfType(Iso11783ElementType type) =>
      recursiveChildren!.where((e) => e.elementType == type);

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

  @override
  List<Object?> get props => [
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
  ];
}
