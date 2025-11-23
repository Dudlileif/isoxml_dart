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
  }) : super(elementType: _elementType) {
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
    this.valuePresentations.addAll(valuePresentations);
    this.workers.addAll(workers);
  }

  ExternalFileContents._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    attachedFiles.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.attachedFile.xmlTag,
          )
          .map(AttachedFile._fromXmlElement)
          .toList(),
    );
    baseStations.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.baseStation.xmlTag,
          )
          .map(BaseStation._fromXmlElement)
          .toList(),
    );
    codedComments.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.codedComment.xmlTag,
          )
          .map(CodedComment._fromXmlElement)
          .toList(),
    );
    codedCommentGroups.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.codedCommentGroup.xmlTag,
          )
          .map(CodedCommentGroup._fromXmlElement)
          .toList(),
    );
    colourLegends.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.colourLegend.xmlTag,
          )
          .map(ColourLegend._fromXmlElement)
          .toList(),
    );
    cropTypes.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.cropType.xmlTag,
          )
          .map(CropType._fromXmlElement)
          .toList(),
    );
    culturalPractices.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.culturalPractice.xmlTag,
          )
          .map(CulturalPractice._fromXmlElement)
          .toList(),
    );
    customers.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.customer.xmlTag,
          )
          .map(Customer._fromXmlElement)
          .toList(),
    );
    devices.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.device.xmlTag,
          )
          .map(Device._fromXmlElement)
          .toList(),
    );
    farms.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.farm.xmlTag,
          )
          .map(Farm._fromXmlElement)
          .toList(),
    );
    operationTechniques.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.operationTechnique.xmlTag,
          )
          .map(OperationTechnique._fromXmlElement)
          .toList(),
    );
    partfields.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.partfield.xmlTag,
          )
          .map(Partfield._fromXmlElement)
          .toList(),
    );
    products.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.product.xmlTag,
          )
          .map(Product._fromXmlElement)
          .toList(),
    );
    productGroups.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.productGroup.xmlTag,
          )
          .map(ProductGroup._fromXmlElement)
          .toList(),
    );
    tasks.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.task.xmlTag,
          )
          .map(Task._fromXmlElement)
          .toList(),
    );
    valuePresentations.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.valuePresentation.xmlTag,
          )
          .map(ValuePresentation._fromXmlElement)
          .toList(),
    );
    workers.addAll(
      xmlElement
          .findElements(
            Iso11783ElementType.worker.xmlTag,
          )
          .map(Worker._fromXmlElement)
          .toList(),
    );
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.externalFileContents;

  /// Creates an [ExternalFileContents] from [document].
  static ExternalFileContents? fromXmlDocument(XmlDocument document) {
    final element = document.getElement(_elementType.xmlTag);
    if (element != null) {
      return ExternalFileContents._fromXmlElement(element);
    }
    return null;
  }

  /// A structured XML document that represents this.
  XmlDocument toXmlDocument() => XmlDocument([
    XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
    xmlElement.copy(),
  ]);

  /// [BaseStation]s stored in the external file.
  late final attachedFiles = _XmlSyncedList<AttachedFile>(
    xmlElement: xmlElement,
  );

  /// [BaseStation]s stored in the external file.
  late final baseStations = _XmlSyncedList<BaseStation>(xmlElement: xmlElement);

  /// [CodedComment]s stored in the external file.
  late final codedComments = _XmlSyncedList<CodedComment>(
    xmlElement: xmlElement,
  );

  /// [CodedCommentGroup]s stored in the external file.
  late final codedCommentGroups = _XmlSyncedList<CodedCommentGroup>(
    xmlElement: xmlElement,
  );

  /// [ColourLegend]s stored in the external file.
  late final colourLegends = _XmlSyncedList<ColourLegend>(
    xmlElement: xmlElement,
  );

  /// [CropType]s stored in the external file.
  late final cropTypes = _XmlSyncedList<CropType>(xmlElement: xmlElement);

  /// [CulturalPractice]s stored in the external file.
  late final culturalPractices = _XmlSyncedList<CulturalPractice>(
    xmlElement: xmlElement,
  );

  /// [Customer]s stored in the external file.
  late final customers = _XmlSyncedList<Customer>(xmlElement: xmlElement);

  /// [Device]s stored in the external file.
  late final devices = _XmlSyncedList<Device>(xmlElement: xmlElement);

  /// [Farm]s stored in the external file.
  late final farms = _XmlSyncedList<Farm>(xmlElement: xmlElement);

  /// [OperationTechnique]s stored in the external file.
  late final operationTechniques = _XmlSyncedList<OperationTechnique>(
    xmlElement: xmlElement,
  );

  /// [Partfield]s stored in the external file.
  late final partfields = _XmlSyncedList<Partfield>(xmlElement: xmlElement);

  /// [Product]s stored in the external file.
  late final products = _XmlSyncedList<Product>(xmlElement: xmlElement);

  /// [ProductGroup]s stored in the external file.
  late final productGroups = _XmlSyncedList<ProductGroup>(
    xmlElement: xmlElement,
  );

  /// [Task]s stored in the external file.
  late final tasks = _XmlSyncedList<Task>(xmlElement: xmlElement);

  /// [ValuePresentation]s stored in the external file.
  late final valuePresentations = _XmlSyncedList<ValuePresentation>(
    xmlElement: xmlElement,
  );

  /// [Worker]s stored in the external file.
  late final workers = _XmlSyncedList<Worker>(xmlElement: xmlElement);
}
