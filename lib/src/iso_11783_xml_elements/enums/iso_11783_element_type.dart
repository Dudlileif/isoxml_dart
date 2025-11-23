// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso_11783_element.dart';

/// An enumerator for all ISO 11783-10 XML element types.
enum Iso11783ElementType {
  /// See [AllocationStamp]
  allocationStamp('ASP'),

  /// See [AttachedFile]
  attachedFile('AFE', onlyVersion4AndAbove: true),

  /// See [BaseStation]
  baseStation('BSN', canHaveId: true, onlyVersion4AndAbove: true),

  /// See [CodedComment]
  codedComment('CCT', canHaveId: true),

  /// See [CodedCommentGroup]
  codedCommentGroup('CCG', canHaveId: true),

  /// See [CodedCommentListValue]
  codedCommentListValue('CCL', canHaveId: true),

  /// See [ColourLegend]
  colourLegend('CLD', canHaveId: true),

  /// See [ColourRange]
  colourRange('CRG'),

  /// See [CommentAllocation]
  commentAllocation('CAN'),

  /// See [Connection]
  connection('CNN'),

  /// See [ControlAssignment]
  controlAssignment('CAT', onlyVersion4AndAbove: true),

  /// See [CropType]
  cropType('CTP', canHaveId: true),

  /// See [CropVariety]
  cropVariety('CVT', canHaveId: true),

  /// See [CulturalPractice]
  culturalPractice('CPC', canHaveId: true),

  /// See [Customer]
  customer('CTR', canHaveId: true),

  /// See [DataLogTrigger]
  dataLogTrigger('DLT'),

  /// See [DataLogValue]
  dataLogValue('DLV'),

  /// See [Device]
  device('DVC', canHaveId: true),

  /// See [DeviceAllocation]
  deviceAllocation('DAN'),

  /// See [DeviceElement]
  deviceElement('DET', canHaveId: true),

  /// See [DeviceObjectReference]
  deviceObjectReference('DOR'),

  /// See [DeviceProperty]
  deviceProperty('DPT'),

  /// See [DeviceProcessData]
  deviceProcessData('DPD'),

  /// See [DeviceValuePresentation]
  deviceValuePresentation('DVP'),

  /// See [ExternalFileContents]
  externalFileContents('XFC'),

  /// See [ExternalFileReference]
  externalFileReference('XFR'),

  /// See [Farm]
  farm('FRM', canHaveId: true),

  /// See [Grid]
  grid('GRD'),

  /// See [GuidanceAllocation]
  guidanceAllocation('GAN', onlyVersion4AndAbove: true),

  /// See [GuidanceGroup]
  guidanceGroup('GGP', canHaveId: true, onlyVersion4AndAbove: true),

  /// See [GuidancePattern]
  guidancePattern('GPN', canHaveId: true, onlyVersion4AndAbove: true),

  /// See [GuidanceShift]
  guidanceShift('GST', onlyVersion4AndAbove: true),

  /// See [LineString]
  lineString('LSG', canHaveId: true),

  /// See [Link]
  link('LNK', onlyVersion4AndAbove: true),

  /// See [LinkGroup]
  linkGroup('LGP', canHaveId: true, onlyVersion4AndAbove: true),

  /// See [Iso11783LinkList]
  linkList('ISO11783LinkList', onlyVersion4AndAbove: true),

  /// See [OperationTechnique]
  operationTechnique('OTQ', canHaveId: true),

  /// See [OperationTechniquePractice]
  operationTechniquePractice('OTP'),

  /// See [OperationTechniqueReference]
  operationTechniqueReference('OTR'),

  /// See [Partfield]
  partfield('PFD', canHaveId: true),

  /// See [Polygon]
  polygon('PLN', canHaveId: true),

  /// See [Point]
  point('PNT', canHaveId: true),

  /// See [Position]
  position('PTN'),

  /// See [ProcessDataVariable]
  processDataVariable('PDV'),

  /// See [Product]
  product('PDT', canHaveId: true),

  /// See [ProductAllocation]
  productAllocation('PAN'),

  /// See [ProductGroup]
  productGroup('PGP', canHaveId: true),

  /// See [ProductRelation]
  productRelation('PRN', onlyVersion4AndAbove: true),

  /// See [Task]
  task('TSK', canHaveId: true),

  /// See [TaskControllerCapabilities]
  taskControllerCapabilities('TCC', onlyVersion4AndAbove: true),

  /// See [Iso11783TaskData]
  taskData('ISO11783_TaskData'),

  /// See [Time]
  time('TIM'),

  /// See [TimeLog]
  timeLog('TLG'),

  /// See [TreatmentZone]
  treatmentZone('TZN'),

  /// See [ValuePresentation]
  valuePresentation('VPN', canHaveId: true),

  /// See [Worker]
  worker('WKR', canHaveId: true),

  /// See [WorkerAllocation]
  workerAllocation('WAN'),

  /// See [UnknownIso11783Element]
  unknown('');

  const Iso11783ElementType(
    this.xmlTag, {
    this.canHaveId = false,
    this.onlyVersion4AndAbove = false,
  });

  /// The XML element name for the element type.
  final String xmlTag;

  /// Whether this element type can have IDs for the elements.
  final bool canHaveId;

  /// Whether this element type is only supported in version 4 and above.
  final bool onlyVersion4AndAbove;

  /// Finds the [Iso11783ElementType] element which matches the [xmlTag] to
  /// this.
  static Iso11783ElementType fromXmlTag(String xmlTag) => values.firstWhere(
    (element) => element.xmlTag == xmlTag,
  );

  /// The enum name of this with capitalized first letter.
  String get capitalizedName => name.replaceFirst(
    name.substring(0, 1),
    name.substring(0, 1).toUpperCase(),
  );

  /// A list of the element types that can be stored in external files.
  static const List<Iso11783ElementType> tagsThatCanBeExternal = [
    attachedFile,
    baseStation,
    codedComment,
    codedCommentGroup,
    colourLegend,
    cropType,
    culturalPractice,
    customer,
    device,
    farm,
    operationTechnique,
    partfield,
    product,
    productGroup,
    task,
    valuePresentation,
    worker,
  ];
}
