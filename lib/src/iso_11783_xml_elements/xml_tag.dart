// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'xml_tag.g.dart';

/// An enumerator for all ISO 11783-10 XML element types.
@annotation.XmlEnum()
enum Iso11783XmlTag {
  /// See [AllocationStamp]
  @annotation.XmlValue('ASP')
  allocationStamp('ASP'),

  /// See [AttachedFile]
  @annotation.XmlValue('AFE')
  attachedFile('AFE'),

  /// See [BaseStation]
  @annotation.XmlValue('BSN')
  baseStation('BSN'),

  /// See [CodedComment]
  @annotation.XmlValue('CCT')
  codedComment('CCT'),

  /// See [CodedCommentGroup]
  @annotation.XmlValue('CCG')
  codedCommentGroup('CCG'),

  /// See [CodedCommentListValue]
  @annotation.XmlValue('CCL')
  codedCommentListValue('CCL'),

  /// See [ColourLegend]
  @annotation.XmlValue('CLD')
  colourLegend('CLD'),

  /// See [ColourRange]
  @annotation.XmlValue('CRG')
  colourRange('CRG'),

  /// See [CommentAllocation]
  @annotation.XmlValue('CAN')
  commentAllocation('CAN'),

  /// See [Connection]
  @annotation.XmlValue('CNN')
  connection('CNN'),

  /// See [ControlAssignment]
  @annotation.XmlValue('CAT')
  controlAssignment('CAT'),

  /// See [CropType]
  @annotation.XmlValue('CTP')
  cropType('CTP'),

  /// See [CropVariety]
  @annotation.XmlValue('CVT')
  cropVariety('CVT'),

  /// See [CulturalPractice]
  @annotation.XmlValue('CPC')
  culturalPractice('CPC'),

  /// See [Customer]
  @annotation.XmlValue('CTR')
  customer('CTR'),

  /// See [DataLogTrigger]
  @annotation.XmlValue('DLT')
  dataLogTrigger('DLT'),

  /// See [DataLogValue]
  @annotation.XmlValue('DLV')
  dataLogValue('DLV'),

  /// See [Device]
  @annotation.XmlValue('DVC')
  device('DVC'),

  /// See [DeviceAllocation]
  @annotation.XmlValue('DAN')
  deviceAllocation('DAN'),

  /// See [DeviceElement]
  @annotation.XmlValue('DET')
  deviceElement('DET'),

  /// See [DeviceObjectReference]
  @annotation.XmlValue('DOR')
  deviceObjectReference('DOR'),

  /// See [DeviceProperty]
  @annotation.XmlValue('DPT')
  deviceProperty('DPT'),

  /// See [DeviceProcessData]
  @annotation.XmlValue('DPD')
  deciveProcessData('DPD'),

  /// See [DeviceValuePresentation]
  @annotation.XmlValue('DVP')
  deviceValuePresentation('DVP'),

  /// See [ExternalFileContents]
  @annotation.XmlValue('XFC')
  externalFileContents('XFC'),

  /// See [ExternalFileReference]
  @annotation.XmlValue('XFR')
  externalFileReference('XFR'),

  /// See [Farm]
  @annotation.XmlValue('FRM')
  farm('FRM'),

  /// See [Grid]
  @annotation.XmlValue('GRD')
  grid('GRD'),

  /// See [GuidanceAllocation]
  @annotation.XmlValue('GAN')
  guidanceAllocation('GAN'),

  /// See [GuidanceGroup]
  @annotation.XmlValue('GGP')
  guidanceGroup('GGP'),

  /// See [GuidancePattern]
  @annotation.XmlValue('GPN')
  guidancePattern('GPN'),

  /// See [GuidanceShift]
  @annotation.XmlValue('GST')
  guidanceShift('GST'),

  /// See [LineString]
  @annotation.XmlValue('LSG')
  lineString('LSG'),

  /// See [Link]
  @annotation.XmlValue('LNK')
  link('LNK'),

  /// See [LinkGroup]
  @annotation.XmlValue('LGP')
  linkGroup('LGP'),

  /// See [Iso11783LinkList]
  @annotation.XmlValue('ISO11783LinkList')
  linkList('ISO11783LinkList'),

  /// See [OperationTechnique]
  @annotation.XmlValue('OTQ')
  operationTechnique('OTQ'),

  /// See [OperationTechniquePractice]
  @annotation.XmlValue('OTP')
  operationTechniquePractice('OTP'),

  /// See [OperationTechniqueReference]
  @annotation.XmlValue('OTR')
  operationTechniqueReference('OTR'),

  /// See [Partfield]
  @annotation.XmlValue('PFD')
  partfield('PFD'),

  /// See [Polygon]
  @annotation.XmlValue('PLN')
  polygon('PLN'),

  /// See [Point]
  @annotation.XmlValue('PNT')
  point('PNT'),

  /// See [Position]
  @annotation.XmlValue('PTN')
  position('PTN'),

  /// See [ProcessDataVariable]
  @annotation.XmlValue('PDV')
  processDataVariable('PDV'),

  /// See [Product]
  @annotation.XmlValue('PDT')
  product('PDT'),

  /// See [ProductAllocation]
  @annotation.XmlValue('PAN')
  productAllocation('PAN'),

  /// See [ProductGroup]
  @annotation.XmlValue('PGP')
  productGroup('PGP'),

  /// See [ProductRelation]
  @annotation.XmlValue('PRN')
  productRelation('PRN'),

  /// See [Task]
  @annotation.XmlValue('TSK')
  task('TSK'),

  /// See [TaskControllerCapabilities]
  @annotation.XmlValue('TCC')
  taskControllerCapabilities('TCC'),

  /// See [Iso11783TaskData]
  @annotation.XmlValue('ISO11783_TaskData')
  taskData('ISO11783_TaskData'),

  /// See [Time]
  @annotation.XmlValue('TIM')
  time('TIM'),

  /// See [TimeLog]
  @annotation.XmlValue('TLG')
  timeLog('TLG'),

  /// See [TreatmentZone]
  @annotation.XmlValue('TZN')
  treatmentZone('TZN'),

  /// See [ValuePresentation]
  @annotation.XmlValue('VPN')
  valuePresentation('VPN'),

  /// See [Worker]
  @annotation.XmlValue('WKR')
  worker('WKR'),

  /// See [WorkerAllocation]
  @annotation.XmlValue('WAN')
  workerAllocation('WAN'),

  /// See [EmptyIso11783Element]
  @annotation.XmlValue('')
  emptyElement('');

  const Iso11783XmlTag(this.name);

  /// The XML element name for the element type.
  final String name;

  /// Finds the [Iso11783XmlTag] element which matches the [name] to this.
  static Iso11783XmlTag fromName(String name) => values.firstWhere(
        (element) => element.name == name,
      );

  /// A list of the element types that can be stored in external files.
  static const tagsThatCanBeExternal = [
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
