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
export 'package:isoxml_dart/src/iso_11783_xml_elements/iso_11783_element_type.dart';
export 'package:isoxml_dart/src/iso_11783_xml_elements/version.dart';

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
    required this.elementType,
    required this.description,
    this.onlyVersion4AndAbove = false,
  });

  factory Iso11783Element.fromXmlElement(XmlElement element) =>
      switch (Iso11783ElementType.fromXmlTag(element.name.local)) {
        Iso11783ElementType.allocationStamp =>
          AllocationStamp.fromXmlElement(element),
        Iso11783ElementType.attachedFile =>
          AttachedFile.fromXmlElement(element),
        Iso11783ElementType.baseStation => BaseStation.fromXmlElement(element),
        Iso11783ElementType.codedComment =>
          CodedComment.fromXmlElement(element),
        Iso11783ElementType.codedCommentGroup =>
          CodedCommentGroup.fromXmlElement(element),
        Iso11783ElementType.codedCommentListValue =>
          CodedCommentListValue.fromXmlElement(element),
        Iso11783ElementType.colourLegend =>
          ColourLegend.fromXmlElement(element),
        Iso11783ElementType.colourRange => ColourRange.fromXmlElement(element),
        Iso11783ElementType.commentAllocation =>
          CommentAllocation.fromXmlElement(element),
        Iso11783ElementType.connection => Connection.fromXmlElement(element),
        Iso11783ElementType.controlAssignment =>
          ControlAssignment.fromXmlElement(element),
        Iso11783ElementType.cropType => CropType.fromXmlElement(element),
        Iso11783ElementType.cropVariety => CropVariety.fromXmlElement(element),
        Iso11783ElementType.culturalPractice =>
          CulturalPractice.fromXmlElement(element),
        Iso11783ElementType.customer => Customer.fromXmlElement(element),
        Iso11783ElementType.dataLogTrigger =>
          DataLogTrigger.fromXmlElement(element),
        Iso11783ElementType.dataLogValue =>
          DataLogValue.fromXmlElement(element),
        Iso11783ElementType.device => Device.fromXmlElement(element),
        Iso11783ElementType.deviceAllocation =>
          DeviceAllocation.fromXmlElement(element),
        Iso11783ElementType.deviceElement =>
          DeviceElement.fromXmlElement(element),
        Iso11783ElementType.deviceObjectReference =>
          DeviceObjectReference.fromXmlElement(element),
        Iso11783ElementType.deviceProperty =>
          DeviceProperty.fromXmlElement(element),
        Iso11783ElementType.deciveProcessData =>
          DeviceProcessData.fromXmlElement(element),
        Iso11783ElementType.deviceValuePresentation =>
          DeviceValuePresentation.fromXmlElement(element),
        Iso11783ElementType.externalFileContents =>
          ExternalFileContents.fromXmlElement(element),
        Iso11783ElementType.externalFileReference =>
          ExternalFileReference.fromXmlElement(element),
        Iso11783ElementType.farm => Farm.fromXmlElement(element),
        Iso11783ElementType.grid => Grid.fromXmlElement(element),
        Iso11783ElementType.guidanceAllocation =>
          GuidanceAllocation.fromXmlElement(element),
        Iso11783ElementType.guidanceGroup =>
          GuidanceGroup.fromXmlElement(element),
        Iso11783ElementType.guidancePattern =>
          GuidancePattern.fromXmlElement(element),
        Iso11783ElementType.guidanceShift =>
          GuidanceShift.fromXmlElement(element),
        Iso11783ElementType.lineString => LineString.fromXmlElement(element),
        Iso11783ElementType.link => Link.fromXmlElement(element),
        Iso11783ElementType.linkGroup => LinkGroup.fromXmlElement(element),
        Iso11783ElementType.linkList =>
          Iso11783LinkList.fromXmlElement(element),
        Iso11783ElementType.operationTechnique =>
          OperationTechnique.fromXmlElement(element),
        Iso11783ElementType.operationTechniqueReference =>
          OperationTechniqueReference.fromXmlElement(element),
        Iso11783ElementType.operationTechniquePractice =>
          OperationTechniquePractice.fromXmlElement(element),
        Iso11783ElementType.partfield => Partfield.fromXmlElement(element),
        Iso11783ElementType.polygon => Polygon.fromXmlElement(element),
        Iso11783ElementType.point => Point.fromXmlElement(element),
        Iso11783ElementType.position => Position.fromXmlElement(element),
        Iso11783ElementType.processDataVariable =>
          ProcessDataVariable.fromXmlElement(element),
        Iso11783ElementType.product => Product.fromXmlElement(element),
        Iso11783ElementType.productAllocation =>
          ProductAllocation.fromXmlElement(element),
        Iso11783ElementType.productGroup =>
          ProductGroup.fromXmlElement(element),
        Iso11783ElementType.productRelation =>
          ProductRelation.fromXmlElement(element),
        Iso11783ElementType.task => Task.fromXmlElement(element),
        Iso11783ElementType.taskData =>
          Iso11783TaskData.fromXmlElement(element),
        Iso11783ElementType.taskControllerCapabilities =>
          TaskControllerCapabilities.fromXmlElement(element),
        Iso11783ElementType.time => Time.fromXmlElement(element),
        Iso11783ElementType.timeLog => TimeLog.fromXmlElement(element),
        Iso11783ElementType.treatmentZone =>
          TreatmentZone.fromXmlElement(element),
        Iso11783ElementType.valuePresentation =>
          ValuePresentation.fromXmlElement(element),
        Iso11783ElementType.worker => Worker.fromXmlElement(element),
        Iso11783ElementType.workerAllocation =>
          WorkerAllocation.fromXmlElement(element),
        _ => const EmptyIso11783Element(),
      };

  /// Which type of ISO 11783-10 element this is based on the XML tag.
  final Iso11783ElementType elementType;

  /// A short description of the element type.
  final String description;

  /// Whether this element type is only supported in version 4 and above.
  final bool onlyVersion4AndAbove;

  /// The ID of this, if it has one;
  String? get id => null;

  /// The ID reference pattern (regExp) for [id] if there is one.
  String? get idRefPattern => null;

  /// All the element children connected to this, and their children
  /// recursively.
  Iterable<Iso11783Element>? get recursiveChildren => null;

  /// All the element children connected to this, and their children
  /// recursively.
  Iterable<Iso11783Element> get selfWithRecursiveChildren =>
      [this, ...recursiveChildren ?? []];

  @override
  List<Object?> get props => [
        elementType,
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
          elementType: Iso11783ElementType.emptyElement,
          description: 'Empty element, should not have been created.',
        );
}
