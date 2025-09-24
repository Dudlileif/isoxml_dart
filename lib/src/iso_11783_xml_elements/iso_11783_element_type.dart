// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
import 'package:isoxml_dart/isoxml_dart.dart';

/// An enumerator for all ISO 11783-10 XML element types.
enum Iso11783ElementType {
  /// See [AllocationStamp]
  allocationStamp('ASP'),

  /// See [AttachedFile]
  attachedFile('AFE'),

  /// See [BaseStation]
  baseStation('BSN', canHaveId: true),

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
  controlAssignment('CAT'),

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
  guidanceAllocation('GAN'),

  /// See [GuidanceGroup]
  guidanceGroup('GGP', canHaveId: true),

  /// See [GuidancePattern]
  guidancePattern('GPN', canHaveId: true),

  /// See [GuidanceShift]
  guidanceShift('GST'),

  /// See [LineString]
  lineString('LSG', canHaveId: true),

  /// See [Link]
  link('LNK'),

  /// See [LinkGroup]
  linkGroup('LGP', canHaveId: true),

  /// See [Iso11783LinkList]
  linkList('ISO11783LinkList'),

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
  productRelation('PRN'),

  /// See [Task]
  task('TSK', canHaveId: true),

  /// See [TaskControllerCapabilities]
  taskControllerCapabilities('TCC'),

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
  workerAllocation('WAN');

  const Iso11783ElementType(this.xmlTag, {this.canHaveId = false});

  /// The XML element name for the element type.
  final String xmlTag;

  /// Whether this element type can have IDs for the elements.
  final bool canHaveId;

  /// Finds the [Iso11783ElementType] element which matches the [xmlTag] to
  /// this.
  static Iso11783ElementType fromXmlTag(String xmlTag) => values.firstWhere(
    (element) => element.xmlTag == xmlTag,
  );

  /// Redirects to [xmlTag]. Gives the XML element name for the element type.
  String get name => xmlTag;

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
