// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
part of '../iso_11783_element.dart';

mixin _BoundaryPolygonMixin implements Iso11783Element {
  /// Boundary [Polygon] for this.
  Polygon? get boundaryPolygon =>
      getElement(Iso11783ElementType.polygon.xmlTag) as Polygon?;
  set boundaryPolygon(Polygon? value) => switch ((value, boundaryPolygon)) {
    (final Polygon value, final Polygon existing) => existing.replace(
      value as XmlElement,
    ),
    (final Polygon value, null) => children.add(value),
    (null, final Polygon existing) => existing.remove(),
    _ => null,
  };
}
