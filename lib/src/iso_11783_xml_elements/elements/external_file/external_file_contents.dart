// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that is used to group all XML elements of an XML file external to
/// the main XML data transfer file in order to keep the external file well
/// formed.
class ExternalFileContents extends Iso11783Element {
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
         elementType: Iso11783ElementType.externalFileContents,
         description: 'ExternalFileContents',
       ) {
    if (attachedFiles != null) {
      children.addAll(attachedFiles);
    }
    if (baseStations != null) {
      children.addAll(baseStations);
    }
    if (codedComments != null) {
      children.addAll(codedComments);
    }
    if (codedCommentGroups != null) {
      children.addAll(codedCommentGroups);
    }
    if (colourLegends != null) {
      children.addAll(colourLegends);
    }
    if (cropTypes != null) {
      children.addAll(cropTypes);
    }
    if (culturalPractices != null) {
      children.addAll(culturalPractices);
    }
    if (customers != null) {
      children.addAll(customers);
    }
    if (devices != null) {
      children.addAll(devices);
    }
    if (farms != null) {
      children.addAll(farms);
    }
    if (operationTechniques != null) {
      children.addAll(operationTechniques);
    }
    if (partfields != null) {
      children.addAll(partfields);
    }
    if (products != null) {
      children.addAll(products);
    }
    if (productGroups != null) {
      children.addAll(productGroups);
    }
    if (tasks != null) {
      children.addAll(tasks);
    }
    if (valuePresentations != null) {
      children.addAll(valuePresentations);
    }
    if (workers != null) {
      children.addAll(workers);
    }
  }

  /// Creates an [ExternalFileContents] from [document].
  static ExternalFileContents? fromXmlDocument(XmlDocument document) =>
      document.getElement(Iso11783ElementType.externalFileContents.xmlTag)
          as ExternalFileContents?;

  /// A structured XML document that represents this.
  XmlDocument toXmlDocument() => XmlDocument([
    XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
    this,
  ]);

  /// [BaseStation]s stored in the external file.
  List<AttachedFile> get attachedFiles => findElements(
    Iso11783ElementType.attachedFile.xmlTag,
  ).map((e) => e as AttachedFile).toList();

  /// [BaseStation]s stored in the external file.
  List<BaseStation> get baseStations => findElements(
    Iso11783ElementType.baseStation.xmlTag,
  ).map((e) => e as BaseStation).toList();

  /// [CodedComment]s stored in the external file.
  List<CodedComment> get codedComments => findElements(
    Iso11783ElementType.codedComment.xmlTag,
  ).map((e) => e as CodedComment).toList();

  /// [CodedCommentGroup]s stored in the external file.
  List<CodedCommentGroup> get codedCommentGroups => findElements(
    Iso11783ElementType.codedCommentGroup.xmlTag,
  ).map((e) => e as CodedCommentGroup).toList();

  /// [ColourLegend]s stored in the external file.
  List<ColourLegend> get colourLegends => findElements(
    Iso11783ElementType.colourLegend.xmlTag,
  ).map((e) => e as ColourLegend).toList();

  /// [CropType]s stored in the external file.
  List<CropType> get cropTypes => findElements(
    Iso11783ElementType.cropType.xmlTag,
  ).map((e) => e as CropType).toList();

  /// [CulturalPractice]s stored in the external file.
  List<CulturalPractice> get culturalPractices => findElements(
    Iso11783ElementType.culturalPractice.xmlTag,
  ).map((e) => e as CulturalPractice).toList();

  /// [Customer]s stored in the external file.
  List<Customer> get customers => findElements(
    Iso11783ElementType.customer.xmlTag,
  ).map((e) => e as Customer).toList();

  /// [Device]s stored in the external file.
  List<Device> get devices => findElements(
    Iso11783ElementType.device.xmlTag,
  ).map((e) => e as Device).toList();

  /// [Farm]s stored in the external file.
  List<Farm> get farms => findElements(
    Iso11783ElementType.farm.xmlTag,
  ).map((e) => e as Farm).toList();

  /// [OperationTechnique]s stored in the external file.
  List<OperationTechnique> get operationTechniques => findElements(
    Iso11783ElementType.operationTechnique.xmlTag,
  ).map((e) => e as OperationTechnique).toList();

  /// [Partfield]s stored in the external file.
  List<Partfield> get partfields => findElements(
    Iso11783ElementType.partfield.xmlTag,
  ).map((e) => e as Partfield).toList();

  /// [Product]s stored in the external file.
  List<Product> get products => findElements(
    Iso11783ElementType.product.xmlTag,
  ).map((e) => e as Product).toList();

  /// [ProductGroup]s stored in the external file.
  List<ProductGroup> get productGroups => findElements(
    Iso11783ElementType.productGroup.xmlTag,
  ).map((e) => e as ProductGroup).toList();

  /// [Task]s stored in the external file.
  List<Task> get tasks => findElements(
    Iso11783ElementType.task.xmlTag,
  ).map((e) => e as Task).toList();

  /// [ValuePresentation]s stored in the external file.
  List<ValuePresentation> get valuePresentations => findElements(
    Iso11783ElementType.valuePresentation.xmlTag,
  ).map((e) => e as ValuePresentation).toList();

  /// [Worker]s stored in the external file.
  List<Worker> get workers => findElements(
    Iso11783ElementType.worker.xmlTag,
  ).map((e) => e as Worker).toList();
}
