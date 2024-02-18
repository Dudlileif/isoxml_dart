// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

part 'elements/allocation_stamp.dart';
part 'elements/base_station.dart';
part 'elements/colour.dart';
part 'elements/comment.dart';
part 'elements/connection.dart';
part 'elements/control_assignment.dart';
part 'elements/crop.dart';
part 'elements/cultural_practice.dart';
part 'elements/customer.dart';
part 'elements/data_log.dart';
part 'elements/device.dart';
part 'elements/external_file.dart';
part 'elements/farm.dart';
part 'elements/geometry.dart';
part 'elements/grid.dart';
part 'elements/guidance.dart';
part 'elements/link.dart';
part 'elements/operation_technique.dart';
part 'elements/partfield.dart';
part 'elements/position.dart';
part 'elements/process_data_variable.dart';
part 'elements/product.dart';
part 'elements/task.dart';
part 'elements/time.dart';
part 'elements/treatment_zone.dart';
part 'elements/value_presentation.dart';
part 'elements/worker.dart';
part 'iso11783_element.g.dart';

/// A sealed parent class for all ISO 11783-10 elements.
///
/// This is a starting point on which the elements extend with their
/// attributes and children elements.
///
/// Some elements are not available in earlier versions of the standard,
/// these have the [onlyVersion4AndAbove] parameter set to true, which can be
/// used to filter them out if exporting to an older version.
sealed class Iso11783Element extends Equatable {
  const Iso11783Element({
    required this.tag,
    required this.description,
    this.onlyVersion4AndAbove = false,
  });

  factory Iso11783Element.fromXmlElement(XmlElement element) =>
      switch (Iso11783Tag.fromName(element.name.local)) {
        Iso11783Tag.allocationStamp => AllocationStamp.fromXmlElement(element),
        Iso11783Tag.attachedFile => AttachedFile.fromXmlElement(element),
        Iso11783Tag.baseStation => BaseStation.fromXmlElement(element),
        Iso11783Tag.codedComment => CodedComment.fromXmlElement(element),
        Iso11783Tag.codedCommentGroup =>
          CodedCommentGroup.fromXmlElement(element),
        Iso11783Tag.codedCommentListValue =>
          CodedCommentListValue.fromXmlElement(element),
        Iso11783Tag.colourLegend => ColourLegend.fromXmlElement(element),
        Iso11783Tag.colourRange => ColourRange.fromXmlElement(element),
        Iso11783Tag.commentAllocation =>
          CommentAllocation.fromXmlElement(element),
        Iso11783Tag.connection => Connection.fromXmlElement(element),
        Iso11783Tag.controlAssignment =>
          ControlAssignment.fromXmlElement(element),
        Iso11783Tag.cropType => CropType.fromXmlElement(element),
        Iso11783Tag.cropVariety => CropVariety.fromXmlElement(element),
        Iso11783Tag.culturalPractice =>
          CulturalPractice.fromXmlElement(element),
        Iso11783Tag.customer => Customer.fromXmlElement(element),
        Iso11783Tag.dataLogTrigger => DataLogTrigger.fromXmlElement(element),
        Iso11783Tag.dataLogValue => DataLogValue.fromXmlElement(element),
        Iso11783Tag.device => Device.fromXmlElement(element),
        Iso11783Tag.deviceAllocation =>
          DeviceAllocation.fromXmlElement(element),
        Iso11783Tag.deviceElement => DeviceElement.fromXmlElement(element),
        Iso11783Tag.deviceObjectReference =>
          DeviceObjectReference.fromXmlElement(element),
        Iso11783Tag.deviceProperty => DeviceProperty.fromXmlElement(element),
        Iso11783Tag.deciveProcessData =>
          DeviceProcessData.fromXmlElement(element),
        Iso11783Tag.deviceValuePresentation =>
          DeviceValuePresentation.fromXmlElement(element),
        Iso11783Tag.externalFileContents =>
          ExternalFileContents.fromXmlElement(element),
        Iso11783Tag.externalFileReference =>
          ExternalFileReference.fromXmlElement(element),
        Iso11783Tag.farm => Farm.fromXmlElement(element),
        Iso11783Tag.grid => Grid.fromXmlElement(element),
        Iso11783Tag.guidanceAllocation =>
          GuidanceAllocation.fromXmlElement(element),
        Iso11783Tag.guidanceGroup => GuidanceGroup.fromXmlElement(element),
        Iso11783Tag.guidancePattern => GuidancePattern.fromXmlElement(element),
        Iso11783Tag.guidanceShift => GuidanceShift.fromXmlElement(element),
        Iso11783Tag.lineString => LineString.fromXmlElement(element),
        Iso11783Tag.link => Link.fromXmlElement(element),
        Iso11783Tag.linkGroup => LinkGroup.fromXmlElement(element),
        Iso11783Tag.linkList => Iso11783LinkList.fromXmlElement(element),
        Iso11783Tag.operationTechnique =>
          OperationTechnique.fromXmlElement(element),
        Iso11783Tag.operationTechniqueReference =>
          OperationTechniqueReference.fromXmlElement(element),
        Iso11783Tag.operationTechniquePractice =>
          OperationTechniquePractice.fromXmlElement(element),
        Iso11783Tag.partfield => Partfield.fromXmlElement(element),
        Iso11783Tag.polygon => Polygon.fromXmlElement(element),
        Iso11783Tag.point => Point.fromXmlElement(element),
        Iso11783Tag.position => Position.fromXmlElement(element),
        Iso11783Tag.processDataVariable =>
          ProcessDataVariable.fromXmlElement(element),
        Iso11783Tag.product => Product.fromXmlElement(element),
        Iso11783Tag.productAllocation =>
          ProductAllocation.fromXmlElement(element),
        Iso11783Tag.productGroup => ProductGroup.fromXmlElement(element),
        Iso11783Tag.productRelation => ProductRelation.fromXmlElement(element),
        Iso11783Tag.task => Task.fromXmlElement(element),
        Iso11783Tag.taskData => Iso11783TaskData.fromXmlElement(element),
        Iso11783Tag.taskControllerCapabilities =>
          TaskControllerCapabilities.fromXmlElement(element),
        Iso11783Tag.time => Time.fromXmlElement(element),
        Iso11783Tag.timeLog => TimeLog.fromXmlElement(element),
        Iso11783Tag.treatmentZone => TreatmentZone.fromXmlElement(element),
        Iso11783Tag.valuePresentation =>
          ValuePresentation.fromXmlElement(element),
        Iso11783Tag.worker => Worker.fromXmlElement(element),
        Iso11783Tag.workerAllocation =>
          WorkerAllocation.fromXmlElement(element),
        _ => const EmptyIso11783Element(),
      };

  /// Which type of ISO 11783-10 element this is based on the XML tag.
  final Iso11783Tag tag;

  /// A short description of the element type.
  final String description;

  /// Whether this element type is only supported in version 4 and above.
  final bool onlyVersion4AndAbove;

  @override
  List<Object?> get props => [
        tag,
        description,
        onlyVersion4AndAbove,
      ];
}

/// An empty ISO 11783-10 element that is only created if the parser finds some
/// XML element that it doesn't recognize.
///
/// If this is created, then the XML files have issues in them or there is
/// non-standard elements in them.
class EmptyIso11783Element extends Iso11783Element {
  /// Default constructor, creates an empty element.
  const EmptyIso11783Element()
      : super(
          tag: Iso11783Tag.emptyElement,
          description: 'Empty element, should not have been created.',
        );
}

/// An enumerator for all ISO 11783-10 XML element types.
@annotation.XmlEnum()
enum Iso11783Tag {
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

  const Iso11783Tag(this.name);

  /// The XML element name for the element type.
  final String name;

  /// Finds the [Iso11783Tag] element which matches the [name] to this.
  static Iso11783Tag fromName(String name) => values.firstWhere(
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

/// An enumerator for the supported ISO 11783-10 XML major versions.
@annotation.XmlEnum()
enum VersionMajor {
  /// Version 3.X
  @annotation.XmlValue('3')
  three(3),

  /// Version 4.X
  @annotation.XmlValue('4')
  four(4);

  const VersionMajor(this.value);

  /// XML attribute value.
  final int value;
}

/// An enumerator for the supported ISO 11783-10 XML minor versions.
@annotation.XmlEnum()
enum VersionMinor {
  /// Version X.0
  @annotation.XmlValue('0')
  zero,

  /// Version X.1
  @annotation.XmlValue('1')
  one,

  /// Version X.2
  @annotation.XmlValue('2')
  two,

  /// Version X.3
  @annotation.XmlValue('3')
  three;
}

/// An enumerator for the creation origin of XML task data files.
@annotation.XmlEnum()
enum DataTransferOrigin {
  /// Farm Management software, typically computer or web browser.
  @annotation.XmlValue('1')
  fmis(1, 'FMIS, Farming Software'),

  /// Machine terminal
  @annotation.XmlValue('2')
  mics(2, 'MICS, Machine Terminal');

  const DataTransferOrigin(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}

/// A class with static methods for validating arguments when creating
/// [Iso11783Element]s.
class ArgumentValidation {
  /// Checks the [id] with [checkId] and the [designator] with
  /// [checkStringLength].
  ///
  /// [idName] and [designatorName] can change the respective printer name in
  /// errors if they occur.
  ///
  /// [idMinLength] and [idMaxLength] sets the minimum and maxiumum acceptable
  /// length of [id], whilst [designatorMaxLength] does the same for
  /// [designator].
  static void checkIdAndDesignator({
    required String id,
    required String idRefPattern,
    required String designator,
    String idName = 'id',
    String designatorName = 'designator',
    int idMinLength = 4,
    int idMaxLength = 14,
    int designatorMaxLength = 32,
  }) {
    checkStringLength(
      designator,
      maxLength: designatorMaxLength,
      name: designatorName,
    );
    checkId(
      id: id,
      idRefPattern: idRefPattern,
      idName: idName,
      minLength: idMinLength,
      maxLength: idMaxLength,
    );
  }

  /// Checks that the [string] has a length that satisfies `length<=maxLength`.
  ///
  /// [name] can be given if the element argument name of the [name] is not
  /// equal to `designator`.
  static void checkStringLength(
    String string, {
    int maxLength = 32,
    String name = 'designator',
  }) {
    if (string.length > maxLength) {
      throw ArgumentError.value(
        string,
        name,
        'Length > $maxLength',
      );
    }
  }

  /// Checks whether [id] satisfies the regular expression [idRefPattern]
  /// whilst also having a length that satisfies `minLength<=length<=maxLength`.
  ///
  /// [id] can be given if the element argument name of the [id] is not equal
  /// to `id`.
  static void checkId({
    required String id,
    required String idRefPattern,
    int minLength = 4,
    int maxLength = 14,
    String idName = 'id',
  }) {
    if (id.length >= minLength && id.length <= maxLength) {
      final match = RegExp(idRefPattern).matchAsPrefix(id);
      if (match != null) {
        id = match.input;
      } else {
        throw ArgumentError.value(
          id,
          idName,
          '''Doesn't match pattern: $idRefPattern''',
        );
      }
    } else {
      throw ArgumentError.value(
        id,
        idName,
        'Length < $minLength or Length > $maxLength',
      );
    }
  }

  /// Checks whether [value] satisfies `min<=value<=max`.
  ///
  /// If [hex] is true, then the values printed in the error (if there is one)
  /// will be hex instead of decimal.
  static void checkValueInRange({
    required num value,
    required num min,
    required num max,
    required String name,
    bool hex = false,
  }) {
    if (value < min || value > max) {
      final minString = hex && min is int ? min.toRadixString(16) : '$min';
      final maxString = hex && max is int ? max.toRadixString(16) : '$max';
      throw ArgumentError.value(
        value,
        name,
        'Outside range: [$minString, $maxString]',
      );
    }
  }

  /// Checks whether the [string] has a length that satisfies
  /// `minBytes<=length<=maxBytes`.
  ///
  /// [name] is used when throwing errors to figure out which element argument
  /// caused the error.
  static void checkHexStringLength(
    String string, {
    required String name,
    int minBytes = 2,
    int maxBytes = 2,
  }) {
    final minLength = minBytes * 2;
    final maxLength = maxBytes * 2;
    if (string.length > maxLength) {
      throw ArgumentError.value(
        string,
        name,
        'Hex string length ${string.length}, max length: $maxLength',
      );
    }

    if (RegExp(
          '[0-9a-f]{$minLength,$maxLength}',
          caseSensitive: false,
        ).matchAsPrefix(string) ==
        null) {
      throw ArgumentError.value(
        string,
        name,
        'Not a HEX string of byte length [$minBytes, $maxBytes]',
      );
    }
  }
}
