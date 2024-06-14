// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that is used to group all XML elements of an XML file external to
/// the main XML data transfer file in order to keep the external file well
/// formed.
@CopyWith()
@annotation.XmlRootElement(name: 'XFC')
@annotation.XmlSerializable(createMixin: true)
class ExternalFileContents extends Iso11783Element
    with _$ExternalFileContentsXmlSerializableMixin {
  
  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  ExternalFileContents({
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
  }) : super(
          tag: Iso11783XmlTag.externalFileContents,
          description: 'ExternalFileContents',
        ) {
    if (attachedFiles != null) {
      this.attachedFiles.addAll(attachedFiles);
    }
    if (baseStations != null) {
      this.baseStations.addAll(baseStations);
    }
    if (codedComments != null) {
      this.codedComments.addAll(codedComments);
    }
    if (codedCommentGroups != null) {
      this.codedCommentGroups.addAll(codedCommentGroups);
    }
    if (colourLegends != null) {
      this.colourLegends.addAll(colourLegends);
    }
    if (cropTypes != null) {
      this.cropTypes.addAll(cropTypes);
    }
    if (culturalPractices != null) {
      this.culturalPractices.addAll(culturalPractices);
    }
    if (customers != null) {
      this.customers.addAll(customers);
    }
    if (devices != null) {
      this.devices.addAll(devices);
    }
    if (farms != null) {
      this.farms.addAll(farms);
    }
    if (operationTechniques != null) {
      this.operationTechniques.addAll(operationTechniques);
    }
    if (partfields != null) {
      this.partfields.addAll(partfields);
    }
    if (products != null) {
      this.products.addAll(products);
    }
    if (productGroups != null) {
      this.productGroups.addAll(productGroups);
    }
    if (tasks != null) {
      this.tasks.addAll(tasks);
    }
    if (valuePresentations != null) {
      this.valuePresentations.addAll(valuePresentations);
    }
    if (workers != null) {
      this.workers.addAll(workers);
    }
  }

  /// Creates an [ExternalFileContents] from [element].
  factory ExternalFileContents.fromXmlElement(XmlElement element) {
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
    final valuePresentations = element.getElements('VPN');
    final workers = element.getElements('WKR');
    return ExternalFileContents(
      attachedFiles: attachedFiles?.map(AttachedFile.fromXmlElement).toList(),
      baseStations: baseStations?.map(BaseStation.fromXmlElement).toList(),
      codedComments: codedComments?.map(CodedComment.fromXmlElement).toList(),
      codedCommentGroups:
          codedCommentGroups?.map(CodedCommentGroup.fromXmlElement).toList(),
      colourLegends: colourLegends?.map(ColourLegend.fromXmlElement).toList(),
      cropTypes: cropTypes?.map(CropType.fromXmlElement).toList(),
      culturalPractices:
          culturalPractices?.map(CulturalPractice.fromXmlElement).toList(),
      customers: customers?.map(Customer.fromXmlElement).toList(),
      devices: devices?.map(Device.fromXmlElement).toList(),
      farms: farms?.map(Farm.fromXmlElement).toList(),
      operationTechniques:
          operationTechniques?.map(OperationTechnique.fromXmlElement).toList(),
      partfields: partfields?.map(Partfield.fromXmlElement).toList(),
      products: products?.map(Product.fromXmlElement).toList(),
      productGroups: productGroups?.map(ProductGroup.fromXmlElement).toList(),
      tasks: tasks?.map(Task.fromXmlElement).toList(),
      valuePresentations:
          valuePresentations?.map(ValuePresentation.fromXmlElement).toList(),
      workers: workers?.map(Worker.fromXmlElement).toList(),
    );
  }

  /// Creates an [ExternalFileContents] from [document].
  static ExternalFileContents? fromXmlDocument(XmlDocument document) {
    final element =
        document.getElement(Iso11783XmlTag.externalFileContents.name);
    if (element == null) {
      return null;
    }
    return ExternalFileContents.fromXmlElement(element);
  }

  /// [BaseStation]s stored in the external file.
  @annotation.XmlElement(name: 'AFE')
  final List<AttachedFile> attachedFiles = [];

  /// [BaseStation]s stored in the external file.
  @annotation.XmlElement(name: 'BSN')
  final List<BaseStation> baseStations = [];

  /// [CodedComment]s stored in the external file.
  @annotation.XmlElement(name: 'CCT')
  final List<CodedComment> codedComments = [];

  /// [CodedCommentGroup]s stored in the external file.
  @annotation.XmlElement(name: 'CCG')
  final List<CodedCommentGroup> codedCommentGroups = [];

  /// [ColourLegend]s stored in the external file.
  @annotation.XmlElement(name: 'CLD')
  final List<ColourLegend> colourLegends = [];

  /// [CropType]s stored in the external file.
  @annotation.XmlElement(name: 'CTP')
  final List<CropType> cropTypes = [];

  /// [CulturalPractice]s stored in the external file.
  @annotation.XmlElement(name: 'CPC')
  final List<CulturalPractice> culturalPractices = [];

  /// [Customer]s stored in the external file.
  @annotation.XmlElement(name: 'CTR')
  final List<Customer> customers = [];

  /// [Device]s stored in the external file.
  @annotation.XmlElement(name: 'DVC')
  final List<Device> devices = [];

  /// [Farm]s stored in the external file.
  @annotation.XmlElement(name: 'FRM')
  final List<Farm> farms = [];

  /// [OperationTechnique]s stored in the external file.
  @annotation.XmlElement(name: 'OTQ')
  final List<OperationTechnique> operationTechniques = [];

  /// [Partfield]s stored in the external file.
  @annotation.XmlElement(name: 'PFD')
  final List<Partfield> partfields = [];

  /// [Product]s stored in the external file.
  @annotation.XmlElement(name: 'PDT')
  final List<Product> products = [];

  /// [ProductGroup]s stored in the external file.
  @annotation.XmlElement(name: 'PGP')
  final List<ProductGroup> productGroups = [];

  /// [Task]s stored in the external file.
  @annotation.XmlElement(name: 'TSK')
  final List<Task> tasks = [];

  /// [ValuePresentation]s stored in the external file.
  @annotation.XmlElement(name: 'VPN')
  final List<ValuePresentation> valuePresentations = [];

  /// [Worker]s stored in the external file.
  @annotation.XmlElement(name: 'WKR')
  final List<Worker> workers = [];

  /// A structured XML document that represents this.
  XmlDocument toXmlDocument() {
    final builder = XmlBuilder()
      ..processing('xml', 'version="1.0" encoding="UTF-8"');
    builder.element(tag.name, nest: () => buildXmlChildren(builder));
    return builder.buildDocument();
  }

  /// Iterable with all the children elements of this.
  Iterable<Iso11783Element> get contents => [
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
