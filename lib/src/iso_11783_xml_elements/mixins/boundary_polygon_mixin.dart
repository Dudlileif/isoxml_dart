// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
part of '../iso_11783_element.dart';

mixin _BoundaryPolygonMixin implements Iso11783Element {
  Polygon? _boundaryPolygon;

  /// Boundary [Polygon] for this.
  Polygon? get boundaryPolygon => _boundaryPolygon;

  set boundaryPolygon(Polygon? value) {
    switch ((value, _boundaryPolygon)) {
      case (
        Polygon(xmlElement: final element),
        Polygon(xmlElement: final existing),
      ):
        if (element.hasParent) {
          element.remove();
        }
        if (existing.hasParent) {
          existing.replace(element);
        }
      case (Polygon(xmlElement: final element), null):
        if (element.hasParent) {
          element.remove();
        }
        xmlElement.children.add(element);
      case (null, Polygon(xmlElement: final existing)):
        existing.remove();
    }
    _boundaryPolygon = value;
  }
}
