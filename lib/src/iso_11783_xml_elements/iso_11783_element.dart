// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:collection/collection.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:isoxml_dart/src/iso_11783_xml_elements/argument_validation.dart';
import 'package:xml/xml.dart';
import 'package:xml_annotation/xml_annotation.dart' as annotation;

export 'package:isoxml_dart/src/iso_11783_xml_elements/data_transfer_origin.dart';
export 'package:isoxml_dart/src/iso_11783_xml_elements/version.dart';
export 'package:isoxml_dart/src/iso_11783_xml_elements/xml_tag.dart';

part 'elements/allocation_stamp.dart';
part 'elements/base_station.dart';
part 'elements/coded_comment/coded_comment.dart';
part 'elements/coded_comment/coded_comment_group.dart';
part 'elements/coded_comment/coded_comment_list_value.dart';
part 'elements/coded_comment/comment_allocation.dart';
part 'elements/colour/colour_legend.dart';
part 'elements/colour/colour_range.dart';
part 'elements/crop/crop_type.dart';
part 'elements/crop/crop_variety.dart';
part 'elements/data_log/data_log_trigger.dart';
part 'elements/data_log/data_log_value.dart';
part 'elements/device/connection.dart';
part 'elements/device/control_assignment.dart';
part 'elements/device/device.dart';
part 'elements/device/device_allocation.dart';
part 'elements/device/device_element.dart';
part 'elements/device/device_object_reference.dart';
part 'elements/device/device_process_data.dart';
part 'elements/device/device_property.dart';
part 'elements/device/device_value_presentation.dart';
part 'elements/external_file/attached_file.dart';
part 'elements/external_file/external_file_contents.dart';
part 'elements/external_file/external_file_reference.dart';
part 'elements/geometry/grid.dart';
part 'elements/geometry/line_string.dart';
part 'elements/geometry/partfield.dart';
part 'elements/geometry/point.dart';
part 'elements/geometry/polygon.dart';
part 'elements/geometry/position.dart';
part 'elements/guidance/guidance_allocation.dart';
part 'elements/guidance/guidance_group.dart';
part 'elements/guidance/guidance_pattern.dart';
part 'elements/guidance/guidance_shift.dart';
part 'elements/link/iso_11783_link_list.dart';
part 'elements/link/link.dart';
part 'elements/link/link_group.dart';
part 'elements/operation_technique/operation_technique.dart';
part 'elements/operation_technique/operation_technique_practice.dart';
part 'elements/operation_technique/operation_technique_reference.dart';
part 'elements/product/product.dart';
part 'elements/product/product_allocation.dart';
part 'elements/product/product_group.dart';
part 'elements/product/product_relation.dart';
part 'elements/profiles/customer.dart';
part 'elements/profiles/farm.dart';
part 'elements/profiles/worker.dart';
part 'elements/task/cultural_practice.dart';
part 'elements/task/task.dart';
part 'elements/task/task_controller_capabilities.dart';
part 'elements/task/task_data.dart';
part 'elements/task/worker_allocation.dart';
part 'elements/time/time.dart';
part 'elements/time/time_log.dart';
part 'elements/time/time_log_header.dart';
part 'elements/treatment_zone/process_data_variable.dart';
part 'elements/treatment_zone/treatment_zone.dart';
part 'elements/value_presentation.dart';
part 'iso_11783_element.g.dart';

/// A sealed parent class for all ISO 11783-10 elements.
///
/// This is a starting point on which the elements extend with their
/// attributes and children elements.
///
/// Some elements are not available in earlier versions of the standard,
/// these have the [onlyVersion4AndAbove] parameter set to true, which can be
/// used to filter them out if exporting to an older version.
sealed class Iso11783Element with EquatableMixin {
  const Iso11783Element({
    required this.tag,
    required this.description,
    this.onlyVersion4AndAbove = false,
  });

  factory Iso11783Element.fromXmlElement(XmlElement element) =>
      switch (Iso11783XmlTag.fromName(element.name.local)) {
        Iso11783XmlTag.allocationStamp =>
          AllocationStamp.fromXmlElement(element),
        Iso11783XmlTag.attachedFile => AttachedFile.fromXmlElement(element),
        Iso11783XmlTag.baseStation => BaseStation.fromXmlElement(element),
        Iso11783XmlTag.codedComment => CodedComment.fromXmlElement(element),
        Iso11783XmlTag.codedCommentGroup =>
          CodedCommentGroup.fromXmlElement(element),
        Iso11783XmlTag.codedCommentListValue =>
          CodedCommentListValue.fromXmlElement(element),
        Iso11783XmlTag.colourLegend => ColourLegend.fromXmlElement(element),
        Iso11783XmlTag.colourRange => ColourRange.fromXmlElement(element),
        Iso11783XmlTag.commentAllocation =>
          CommentAllocation.fromXmlElement(element),
        Iso11783XmlTag.connection => Connection.fromXmlElement(element),
        Iso11783XmlTag.controlAssignment =>
          ControlAssignment.fromXmlElement(element),
        Iso11783XmlTag.cropType => CropType.fromXmlElement(element),
        Iso11783XmlTag.cropVariety => CropVariety.fromXmlElement(element),
        Iso11783XmlTag.culturalPractice =>
          CulturalPractice.fromXmlElement(element),
        Iso11783XmlTag.customer => Customer.fromXmlElement(element),
        Iso11783XmlTag.dataLogTrigger => DataLogTrigger.fromXmlElement(element),
        Iso11783XmlTag.dataLogValue => DataLogValue.fromXmlElement(element),
        Iso11783XmlTag.device => Device.fromXmlElement(element),
        Iso11783XmlTag.deviceAllocation =>
          DeviceAllocation.fromXmlElement(element),
        Iso11783XmlTag.deviceElement => DeviceElement.fromXmlElement(element),
        Iso11783XmlTag.deviceObjectReference =>
          DeviceObjectReference.fromXmlElement(element),
        Iso11783XmlTag.deviceProperty => DeviceProperty.fromXmlElement(element),
        Iso11783XmlTag.deciveProcessData =>
          DeviceProcessData.fromXmlElement(element),
        Iso11783XmlTag.deviceValuePresentation =>
          DeviceValuePresentation.fromXmlElement(element),
        Iso11783XmlTag.externalFileContents =>
          ExternalFileContents.fromXmlElement(element),
        Iso11783XmlTag.externalFileReference =>
          ExternalFileReference.fromXmlElement(element),
        Iso11783XmlTag.farm => Farm.fromXmlElement(element),
        Iso11783XmlTag.grid => Grid.fromXmlElement(element),
        Iso11783XmlTag.guidanceAllocation =>
          GuidanceAllocation.fromXmlElement(element),
        Iso11783XmlTag.guidanceGroup => GuidanceGroup.fromXmlElement(element),
        Iso11783XmlTag.guidancePattern =>
          GuidancePattern.fromXmlElement(element),
        Iso11783XmlTag.guidanceShift => GuidanceShift.fromXmlElement(element),
        Iso11783XmlTag.lineString => LineString.fromXmlElement(element),
        Iso11783XmlTag.link => Link.fromXmlElement(element),
        Iso11783XmlTag.linkGroup => LinkGroup.fromXmlElement(element),
        Iso11783XmlTag.linkList => Iso11783LinkList.fromXmlElement(element),
        Iso11783XmlTag.operationTechnique =>
          OperationTechnique.fromXmlElement(element),
        Iso11783XmlTag.operationTechniqueReference =>
          OperationTechniqueReference.fromXmlElement(element),
        Iso11783XmlTag.operationTechniquePractice =>
          OperationTechniquePractice.fromXmlElement(element),
        Iso11783XmlTag.partfield => Partfield.fromXmlElement(element),
        Iso11783XmlTag.polygon => Polygon.fromXmlElement(element),
        Iso11783XmlTag.point => Point.fromXmlElement(element),
        Iso11783XmlTag.position => Position.fromXmlElement(element),
        Iso11783XmlTag.processDataVariable =>
          ProcessDataVariable.fromXmlElement(element),
        Iso11783XmlTag.product => Product.fromXmlElement(element),
        Iso11783XmlTag.productAllocation =>
          ProductAllocation.fromXmlElement(element),
        Iso11783XmlTag.productGroup => ProductGroup.fromXmlElement(element),
        Iso11783XmlTag.productRelation =>
          ProductRelation.fromXmlElement(element),
        Iso11783XmlTag.task => Task.fromXmlElement(element),
        Iso11783XmlTag.taskData => Iso11783TaskData.fromXmlElement(element),
        Iso11783XmlTag.taskControllerCapabilities =>
          TaskControllerCapabilities.fromXmlElement(element),
        Iso11783XmlTag.time => Time.fromXmlElement(element),
        Iso11783XmlTag.timeLog => TimeLog.fromXmlElement(element),
        Iso11783XmlTag.treatmentZone => TreatmentZone.fromXmlElement(element),
        Iso11783XmlTag.valuePresentation =>
          ValuePresentation.fromXmlElement(element),
        Iso11783XmlTag.worker => Worker.fromXmlElement(element),
        Iso11783XmlTag.workerAllocation =>
          WorkerAllocation.fromXmlElement(element),
        _ => const EmptyIso11783Element(),
      };

  /// Which type of ISO 11783-10 element this is based on the XML tag.
  final Iso11783XmlTag tag;

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
          tag: Iso11783XmlTag.emptyElement,
          description: 'Empty element, should not have been created.',
        );
}
