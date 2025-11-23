// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element for grouping [GuidancePattern]s and a boundary [Polygon] used for
/// guidance.
///
/// The [patterns] are intended to be used simultaneously.
class GuidanceGroup extends Iso11783Element with _BoundaryPolygonMixin {
  /// Default factory for creating a [GuidanceGroup] with verified
  /// arguments.
  factory GuidanceGroup({
    required String id,
    List<GuidancePattern>? patterns,
    Polygon? boundaryPolygon,
    String? designator,
  }) {
    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator);
    }

    return GuidanceGroup._(
      id: id,
      patterns: patterns,
      boundaryPolygon: boundaryPolygon,
      designator: designator,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  GuidanceGroup._({
    required String id,
    List<GuidancePattern>? patterns,
    Polygon? boundaryPolygon,
    String? designator,
  }) : super(elementType: _elementType) {
    this.id = id;
    this.boundaryPolygon = boundaryPolygon;
    this.designator = designator;
    this.patterns.addAll(patterns);
    this.boundaryPolygon = boundaryPolygon;
  }

  GuidanceGroup._fromXmlElement(XmlElement element)
    : super(elementType: _elementType, xmlElement: element) {
    patterns.addAll(
      xmlElement
          .findElements(Iso11783ElementType.guidancePattern.xmlTag)
          .map(GuidancePattern._fromXmlElement)
          .toList(),
    );
    boundaryPolygon = switch (xmlElement.getElement(
      Iso11783ElementType.polygon.xmlTag,
    )) {
      final XmlElement element => Polygon._fromXmlElement(element),
      _ => null,
    };
    _argumentValidator();
  }

  void _argumentValidator() {
    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);
    if (designator != null) {
      ArgumentValidation.checkStringLength(designator!);
    }
  }

  static const Iso11783ElementType _elementType =
      Iso11783ElementType.guidanceGroup;

  /// Regular expression matching pattern for the [id] of [GuidanceGroup]s.
  static const staticIdRefPattern = '(GGP|GGP-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of [GuidancePattern]s for this.
  late final patterns = _XmlSyncedList<GuidancePattern>(xmlElement: xmlElement);

  /// Unique identifier for this guidance group.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  String get id => parseString('A');
  set id(String value) => setString('A', value);

  /// Name of the guidance group, description or comment.
  String? get designator => tryParseString('B');
  set designator(String? value) => setStringNullable('B', value);
}
