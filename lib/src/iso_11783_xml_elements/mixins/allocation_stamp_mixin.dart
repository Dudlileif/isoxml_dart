// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../iso_11783_element.dart';

mixin _AllocationStampMixin implements Iso11783Element {
  /// [AllocationStamp] for specifying the position and time of this allocation.
  AllocationStamp? get allocationStamp =>
      getElement(Iso11783ElementType.allocationStamp.xmlTag)
          as AllocationStamp?;
  set allocationStamp(AllocationStamp? value) =>
      switch ((value, allocationStamp)) {
        (final AllocationStamp value, final AllocationStamp existing) =>
          existing.replace(value as XmlElement),
        (final AllocationStamp value, null) => children.add(value),
        (null, final AllocationStamp existing) => existing.remove(),
        _ => null,
      };
}
