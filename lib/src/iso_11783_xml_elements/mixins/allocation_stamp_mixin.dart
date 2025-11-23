// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso_11783_element.dart';

mixin _AllocationStampMixin implements Iso11783Element {
  /// [AllocationStamp] for specifying the position and time of this allocation.
  AllocationStamp? get allocationStamp => _allocationStamp;

  set allocationStamp(AllocationStamp? value) {
    switch ((value, allocationStamp)) {
      case (
        AllocationStamp(xmlElement: final element),
        AllocationStamp(xmlElement: final existing),
      ):
        if (element.hasParent) {
          element.remove();
        }
        existing.replace(element);
      case (AllocationStamp(xmlElement: final element), null):
        if (element.hasParent) {
          element.remove();
        }
        xmlElement.children.add(
          element,
        );
      case (null, AllocationStamp(xmlElement: final existing)):
        existing.remove();
    }
    _allocationStamp = value;
  }

  AllocationStamp? _allocationStamp;

  void _parseAllocationStamp() =>
      allocationStamp = switch (xmlElement.getElement(
        Iso11783ElementType.allocationStamp.xmlTag,
      )) {
        final XmlElement element => AllocationStamp._fromXmlElement(element),
        _ => null,
      };
}
