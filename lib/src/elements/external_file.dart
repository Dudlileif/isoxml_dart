// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso11783_element.dart';

/// An element that is used to group all XML elements of an XML file external to
/// the main XML data transfer file in order to keep the external file well
/// formed.
@CopyWith()
@annotation.XmlRootElement(name: 'XFC')
@annotation.XmlSerializable(createMixin: true)
class ExternalFileContents extends Iso11783Element
    with _$ExternalFileContentsXmlSerializableMixin {
  /// Default factory for creating an [ExternalFileContents] with verified
  /// arguments.
  factory ExternalFileContents({
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
    List<ValuePresentation>? valuePresentations,
    List<Worker>? workers,
  }) =>
      ExternalFileContents._(
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
        valuePresentations: valuePresentations,
        workers: workers,
      );

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const ExternalFileContents._({
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
    this.valuePresentations,
    this.workers,
  }) : super(
          tag: Iso11783Tag.externalFileContents,
          description: 'ExternalFileContents',
        );

  /// Creates an [ExternalFileContents] from [element].
  factory ExternalFileContents.fromXmlElement(XmlElement element) =>
      _$ExternalFileContentsFromXmlElement(element);

  /// Creates an [ExternalFileContents] from [document].
  static ExternalFileContents? fromXmlDocument(XmlDocument document) {
    final element = document.getElement(Iso11783Tag.externalFileContents.name);
    if (element == null) {
      return null;
    }
    return ExternalFileContents.fromXmlElement(element);
  }

  /// [BaseStation]s stored in the external file.
  @annotation.XmlElement(name: 'AFE')
  final List<AttachedFile>? attachedFiles;

  /// [BaseStation]s stored in the external file.
  @annotation.XmlElement(name: 'BSN')
  final List<BaseStation>? baseStations;

  /// [CodedComment]s stored in the external file.
  @annotation.XmlElement(name: 'CCT')
  final List<CodedComment>? codedComments;

  /// [CodedCommentGroup]s stored in the external file.
  @annotation.XmlElement(name: 'CCG')
  final List<CodedCommentGroup>? codedCommentGroups;

  /// [ColourLegend]s stored in the external file.
  @annotation.XmlElement(name: 'CLD')
  final List<ColourLegend>? colourLegends;

  /// [CropType]s stored in the external file.
  @annotation.XmlElement(name: 'CTP')
  final List<CropType>? cropTypes;

  /// [CulturalPractice]s stored in the external file.
  @annotation.XmlElement(name: 'CPC')
  final List<CulturalPractice>? culturalPractices;

  /// [Customer]s stored in the external file.
  @annotation.XmlElement(name: 'CTR')
  final List<Customer>? customers;

  /// [Device]s stored in the external file.
  @annotation.XmlElement(name: 'DVC')
  final List<Device>? devices;

  /// [Farm]s stored in the external file.
  @annotation.XmlElement(name: 'FRM')
  final List<Farm>? farms;

  /// [OperationTechnique]s stored in the external file.
  @annotation.XmlElement(name: 'OTQ')
  final List<OperationTechnique>? operationTechniques;

  /// [Partfield]s stored in the external file.
  @annotation.XmlElement(name: 'PFD')
  final List<Partfield>? partfields;

  /// [Product]s stored in the external file.
  @annotation.XmlElement(name: 'PDT')
  final List<Product>? products;

  /// [ProductGroup]s stored in the external file.
  @annotation.XmlElement(name: 'PGP')
  final List<ProductGroup>? productGroups;

  /// [Task]s stored in the external file.
  @annotation.XmlElement(name: 'TSK')
  final List<Task>? tasks;

  /// [ValuePresentation]s stored in the external file.
  @annotation.XmlElement(name: 'VPN')
  final List<ValuePresentation>? valuePresentations;

  /// [Worker]s stored in the external file.
  @annotation.XmlElement(name: 'WKR')
  final List<Worker>? workers;

  /// A structured XML document that represents this.
  XmlDocument toXmlDocument() {
    final builder = XmlBuilder()
      ..processing('xml', 'version="1.0" encoding="UTF-8"');
    builder.element(tag.name, nest: () => buildXmlChildren(builder));
    return builder.buildDocument();
  }

  /// Iterable with all the children elements of this.
  Iterable<Iso11783Element> get contents => [
        attachedFiles ?? [],
        baseStations ?? [],
        codedComments ?? [],
        codedCommentGroups ?? [],
        colourLegends ?? [],
        cropTypes ?? [],
        culturalPractices ?? [],
        customers ?? [],
        devices ?? [],
        farms ?? [],
        operationTechniques ?? [],
        partfields ?? [],
        products ?? [],
        productGroups ?? [],
        tasks ?? [],
        valuePresentations ?? [],
        workers ?? [],
      ].flattened;

  @override
  List<Object?> get props => super.props
    ..addAll([
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
    ]);
}

/// An element that is used to refer to an XML file external to the main XML
/// file.
///
/// The external file can only include top level XML elements. Top level XML
/// elements are the elements that can be included in XML element
/// `ISO11783_TaskData` ([Iso11783TaskData]), see
/// [Iso11783Tag.tagsThatCanBeExternal]. Inside an external XML file, only a
/// single type of XML element can be specified per file. There shall be no
/// recursive use of XFR elements, and no recursive use XFC elements.
@CopyWith()
@annotation.XmlRootElement(name: 'XFR')
@annotation.XmlSerializable(createMixin: true)
class ExternalFileReference extends Iso11783Element
    with _$ExternalFileReferenceXmlSerializableMixin {
  /// Default factory for creating an [ExternalFileReference] with verified
  /// arguments.
  factory ExternalFileReference({
    required String filename,
    FileType? filetype,
  }) {
    ArgumentValidation.checkId(
      id: filename,
      idRefPattern: filenamePattern,
      idName: 'filename',
      minLength: 8,
      maxLength: 8,
    );
    return ExternalFileReference._(
      filename: filename,
      filetype: filetype,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const ExternalFileReference._({
    required this.filename,
    this.filetype,
  }) : super(
          tag: Iso11783Tag.externalFileReference,
          description: 'ExternalFileReference',
        );

  /// Creates an [ExternalFileReference] from [element].
  factory ExternalFileReference.fromXmlElement(XmlElement element) =>
      _$ExternalFileReferenceFromXmlElement(element);

  /// Regular expression matching pattern for the filenames of external files.
  static const filenamePattern =
      '''(AFE|BSN|CCG|CCT|CLD|CPC|CTP|CTR|DVC|FRM|OTQ|PDT|PFD|PGP|TSK|VPN|WKR)[0-9][0-9][0-9][0-9][0-9]''';

  /// Filename of the external file.
  @annotation.XmlAttribute(name: 'A')
  final String filename;

  /// What type of file the referenced file is.
  ///
  /// Only [FileType.xml] is possible.
  @annotation.XmlAttribute(name: 'B')
  final FileType? filetype;

  /// Which type of element this file's content is.
  Iso11783Tag get elementType => Iso11783Tag.values
      .firstWhere((element) => element.name == filename.substring(0, 3));

  @override
  List<Object?> get props => super.props
    ..addAll([
      filename,
      filetype,
    ]);
}

/// An enumerator for which type of file an [ExternalFileReference] refers to.
@annotation.XmlEnum()
enum FileType {
  /// An XML document file.
  @annotation.XmlValue('1')
  xml(1, 'XML');

  const FileType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// Short description of the value.
  final String description;
}

/// An element that is used to refer to an attached file.
///
// TODO(dudlileif): Needs better documentation.
@CopyWith()
@annotation.XmlRootElement(name: 'AFE')
@annotation.XmlSerializable(createMixin: true)
class AttachedFile extends Iso11783Element
    with _$AttachedFileXmlSerializableMixin {
  /// Default factory for creating an [AttachedFile] with verified
  /// arguments.
  factory AttachedFile({
    required String filenameWithExtension,
    required Preserve preserve,
    required Uri manufacturerGLN,
    required int fileType,
    String? fileVersion,
    int? fileLength,
  }) {
    ArgumentValidation.checkId(
      id: filenameWithExtension,
      idRefPattern: extensionPattern,
      idName: 'filenameWithExtension',
      minLength: 12,
      maxLength: 12,
    );
    ArgumentValidation.checkValueInRange(
      value: fileType,
      min: 1,
      max: 254,
      name: 'fileType',
    );
    if (fileVersion != null) {
      ArgumentValidation.checkStringLength(fileVersion, name: 'fileVersion');
    }
    if (fileLength != null) {
      ArgumentValidation.checkValueInRange(
        value: fileLength,
        min: 0,
        max: 4294967294,
        name: 'fileLength',
      );
    }

    return AttachedFile._(
      filenameWithExtension: filenameWithExtension,
      preserve: preserve,
      manufacturerGLN: manufacturerGLN,
      fileType: fileType,
      fileVersion: fileVersion,
      fileLength: fileLength,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  ///
  // TODO(dudlileif): Needs better documentation.
  const AttachedFile._({
    required this.filenameWithExtension,
    required this.preserve,
    required this.manufacturerGLN,
    required this.fileType,
    this.fileVersion,
    this.fileLength,
  }) : super(
          tag: Iso11783Tag.attachedFile,
          description: 'AttachedFile',
          onlyVersion4AndAbove: true,
        );

  /// Creates an [AttachedFile] from [element].
  factory AttachedFile.fromXmlElement(XmlElement element) =>
      _$AttachedFileFromXmlElement(element);

  /// Regular expression matching pattern for the [filenameWithExtension].
  static const extensionPattern = '([0-9]|[A-Z]){8}.([0-9]|[A-Z]){3}';

  /// Filename with extension for the attached file.
  @annotation.XmlAttribute(name: 'A')
  final String filenameWithExtension;

  /// Whether the file should be preserved or not.
  @annotation.XmlAttribute(name: 'B')
  final Preserve preserve;

  /// A Global Location Number for the manufacturer.
  @annotation.XmlAttribute(name: 'C')
  final Uri manufacturerGLN;

  /// What type of file that is attached.
  @annotation.XmlAttribute(name: 'D')
  final int fileType;

  /// The version of the file.
  @annotation.XmlAttribute(name: 'E')
  final String? fileVersion;

  /// The length of the file in bytes.
  @annotation.XmlAttribute(name: 'F')
  final int? fileLength;

  @override
  List<Object?> get props => super.props
    ..addAll([
      filenameWithExtension,
      preserve,
      manufacturerGLN,
      fileType,
      fileVersion,
      fileLength,
    ]);
}

/// An enumerator for whether the [AttachedFile] should be preserved.
@annotation.XmlEnum()
enum Preserve {
  /// The file is not preserved.
  @annotation.XmlValue('1')
  doNotPreserve(1, 'Task Controller does not need to preserve attached file'),

  /// The file is preserved.
  @annotation.XmlValue('2')
  preserve(2, 'Preserve on Task Controller and send back to FMIS');

  const Preserve(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// Short description of the value.
  final String description;
}
