// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:collection/collection.dart';
import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

export 'elements/geometry/point_binary/point_binary_none.dart'
    if (dart.library.io) 'elements/geometry/point_binary/point_binary_vm.dart'
    if (dart.library.js_interop) 'elements/geometry/point_binary/point_binary_web.dart';

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
part 'enums/data_transfer_origin.dart';
part 'enums/iso_11783_element_type.dart';
part 'enums/version.dart';
part 'extensions/parsing_extension.dart';
part 'mixins/allocation_stamp_mixin.dart';
part 'mixins/boundary_polygon_mixin.dart';
part 'mixins/document_mixin.dart';
part 'mixins/profile_mixin.dart';
part 'utils/argument_validation.dart';
part 'utils/xml_element_base.dart';
part 'utils/xml_synced_list.dart';

/// A sealed parent class for all ISO 11783-10 elements.
///
/// This is a starting point on which the elements extend with their
/// attributes and children elements.
///
/// Some elements are not available in earlier versions of the standard,
/// these have the [Iso11783ElementType.onlyVersion4AndAbove] parameter set to
/// true, which can be used to filter them out if exporting to an older version.
sealed class Iso11783Element extends _XmlElementBase {
  Iso11783Element({
    required this.elementType,
    XmlElement? xmlElement,
    String? description,
  }) : description = description ?? elementType.capitalizedName {
    this.xmlElement = xmlElement ?? XmlElement.tag(elementType.xmlTag);
    assert(
      this.xmlElement.name.local == elementType.xmlTag,
      '''XML tag ${this.xmlElement.name.local} does not matche expected tag ${elementType.xmlTag}''',
    );
  }

  factory Iso11783Element.fromXmlElement(
    XmlElement element,
  ) => switch (Iso11783ElementType.fromXmlTag(element.name.local)) {
    Iso11783ElementType.allocationStamp => AllocationStamp._fromXmlElement(
      element,
    ),
    Iso11783ElementType.attachedFile => AttachedFile._fromXmlElement(element),
    Iso11783ElementType.baseStation => BaseStation._fromXmlElement(element),
    Iso11783ElementType.codedComment => CodedComment._fromXmlElement(element),
    Iso11783ElementType.codedCommentGroup => CodedCommentGroup._fromXmlElement(
      element,
    ),
    Iso11783ElementType.codedCommentListValue =>
      CodedCommentListValue._fromXmlElement(element),
    Iso11783ElementType.colourLegend => ColourLegend._fromXmlElement(element),
    Iso11783ElementType.colourRange => ColourRange._fromXmlElement(element),
    Iso11783ElementType.commentAllocation => CommentAllocation._fromXmlElement(
      element,
    ),
    Iso11783ElementType.connection => Connection._fromXmlElement(element),
    Iso11783ElementType.controlAssignment => ControlAssignment._fromXmlElement(
      element,
    ),
    Iso11783ElementType.cropType => CropType._fromXmlElement(element),
    Iso11783ElementType.cropVariety => CropVariety._fromXmlElement(element),
    Iso11783ElementType.culturalPractice => CulturalPractice._fromXmlElement(
      element,
    ),
    Iso11783ElementType.customer => Customer._fromXmlElement(element),
    Iso11783ElementType.dataLogTrigger => DataLogTrigger._fromXmlElement(
      element,
    ),
    Iso11783ElementType.dataLogValue => DataLogValue._fromXmlElement(element),
    Iso11783ElementType.device => Device._fromXmlElement(element),
    Iso11783ElementType.deviceAllocation => DeviceAllocation._fromXmlElement(
      element,
    ),
    Iso11783ElementType.deviceElement => DeviceElement._fromXmlElement(element),
    Iso11783ElementType.deviceObjectReference =>
      DeviceObjectReference._fromXmlElement(element),
    Iso11783ElementType.deviceProperty => DeviceProperty._fromXmlElement(
      element,
    ),
    Iso11783ElementType.deviceProcessData => DeviceProcessData._fromXmlElement(
      element,
    ),
    Iso11783ElementType.deviceValuePresentation =>
      DeviceValuePresentation._fromXmlElement(element),
    Iso11783ElementType.externalFileContents =>
      ExternalFileContents._fromXmlElement(element),
    Iso11783ElementType.externalFileReference =>
      ExternalFileReference._fromXmlElement(element),
    Iso11783ElementType.farm => Farm._fromXmlElement(element),
    Iso11783ElementType.grid => Grid._fromXmlElement(element),
    Iso11783ElementType.guidanceAllocation =>
      GuidanceAllocation._fromXmlElement(
        element,
      ),
    Iso11783ElementType.guidanceGroup => GuidanceGroup._fromXmlElement(element),
    Iso11783ElementType.guidancePattern => GuidancePattern._fromXmlElement(
      element,
    ),
    Iso11783ElementType.guidanceShift => GuidanceShift._fromXmlElement(element),
    Iso11783ElementType.lineString => LineString._fromXmlElement(element),
    Iso11783ElementType.link => Link._fromXmlElement(element),
    Iso11783ElementType.linkGroup => LinkGroup._fromXmlElement(element),
    Iso11783ElementType.linkList => Iso11783LinkList._fromXmlElement(element),
    Iso11783ElementType.operationTechnique =>
      OperationTechnique._fromXmlElement(
        element,
      ),
    Iso11783ElementType.operationTechniqueReference =>
      OperationTechniqueReference._fromXmlElement(element),
    Iso11783ElementType.operationTechniquePractice =>
      OperationTechniquePractice._fromXmlElement(element),
    Iso11783ElementType.partfield => Partfield._fromXmlElement(element),
    Iso11783ElementType.polygon => Polygon._fromXmlElement(element),
    Iso11783ElementType.point => Point._fromXmlElement(element),
    Iso11783ElementType.position => Position._fromXmlElement(element),
    Iso11783ElementType.processDataVariable =>
      ProcessDataVariable._fromXmlElement(element),
    Iso11783ElementType.product => Product._fromXmlElement(element),
    Iso11783ElementType.productAllocation => ProductAllocation._fromXmlElement(
      element,
    ),
    Iso11783ElementType.productGroup => ProductGroup._fromXmlElement(element),
    Iso11783ElementType.productRelation => ProductRelation._fromXmlElement(
      element,
    ),
    Iso11783ElementType.task => Task._fromXmlElement(element),
    Iso11783ElementType.taskData => Iso11783TaskData._fromXmlElement(element),
    Iso11783ElementType.taskControllerCapabilities =>
      TaskControllerCapabilities._fromXmlElement(element),
    Iso11783ElementType.time => Time._fromXmlElement(element),
    Iso11783ElementType.timeLog => TimeLog._fromXmlElement(element),
    Iso11783ElementType.treatmentZone => TreatmentZone._fromXmlElement(element),
    Iso11783ElementType.valuePresentation => ValuePresentation._fromXmlElement(
      element,
    ),
    Iso11783ElementType.worker => Worker._fromXmlElement(element),
    Iso11783ElementType.workerAllocation => WorkerAllocation._fromXmlElement(
      element,
    ),
    _ => UnknownIso11783Element._fromXmlElement(element),
  };

  /// Which type of ISO 11783-10 element this is based on the XML tag.
  final Iso11783ElementType elementType;

  /// A short description of the element type.
  final String description;

  /// The ID of this, if it has one;
  String? get id => null;

  /// The ID reference pattern (regExp) for [id] if there is one.
  String? get idRefPattern => null;
}

/// An unknown XML element found within the ISO 11783 XML structure.
class UnknownIso11783Element extends Iso11783Element {
  /// Unknown ISO 11783 XMl element, which will be preserved
  UnknownIso11783Element(XmlElement element)
    : super(
        xmlElement: element,
        elementType: _elementType,
        description:
            '''Unknown XML element, not supported by the ISO 11783 standard up to 4.3''',
      );

  factory UnknownIso11783Element._fromXmlElement(XmlElement element) =>
      UnknownIso11783Element(element);

  static const Iso11783ElementType _elementType = Iso11783ElementType.unknown;
}
