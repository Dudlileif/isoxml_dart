// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:collection/collection.dart';
import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:isoxml_dart/src/extensions/parsing_helpers.dart';
import 'package:isoxml_dart/src/iso_11783_xml_elements/argument_validation.dart';
import 'package:xml/xml.dart';

export 'package:isoxml_dart/src/iso_11783_xml_elements/data_transfer_origin.dart';
export 'package:isoxml_dart/src/iso_11783_xml_elements/iso_11783_element_type.dart';
export 'package:isoxml_dart/src/iso_11783_xml_elements/version.dart';

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
part 'mixins/allocation_stamp_mixin.dart';
part 'mixins/boundary_polygon_mixin.dart';
part 'mixins/document_mixin.dart';
part 'mixins/profile_mixin.dart';

/// A sealed parent class for all ISO 11783-10 elements.
///
/// This is a starting point on which the elements extend with their
/// attributes and children elements.
///
/// Some elements are not available in earlier versions of the standard,
/// these have the [onlyVersion4AndAbove] parameter set to true, which can be
/// used to filter them out if exporting to an older version.
sealed class Iso11783Element extends XmlElement {
  Iso11783Element({
    required this.elementType,
    required this.description,
    this.onlyVersion4AndAbove = false,
  }) : super(XmlName(elementType.xmlTag));

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
}
