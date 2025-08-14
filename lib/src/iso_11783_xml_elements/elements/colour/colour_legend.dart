// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a colour legend that can be used to display values
/// in different colours on a grid map.
///
/// The [ColourRange]s [ranges] specifies the colour for different value ranges.
/// If there is a value that falls outside all of the ranges, it will use the
/// [defaultColour].
@CopyWith()
@annotation.XmlRootElement(name: 'CLD')
@annotation.XmlSerializable(createMixin: true)
class ColourLegend extends Iso11783Element
    with _$ColourLegendXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [ColourLegend] with verified arguments.
  factory ColourLegend({
    required List<ColourRange> ranges,
    required String id,
    int? defaultColour,
    List<XmlAttribute>? customAttributes,
  }) {
    if (ranges.isEmpty) {
      throw ArgumentError.value(ranges, 'ranges', "List can't be empty");
    }
    ArgumentValidation.checkId(id: id, idRefPattern: staticIdRefPattern);

    if (defaultColour != null) {
      ArgumentValidation.checkValueInRange(
        value: defaultColour,
        min: 0,
        max: 254,
        name: 'defaultColour',
      );
    }

    return ColourLegend._(
      ranges: ranges,
      id: id,
      defaultColour: defaultColour,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const ColourLegend._({
    required this.ranges,
    required this.id,
    this.defaultColour,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.colourLegend,
         description: 'ColourLegend',
       );

  /// Creates a [ColourLegend] from [element].
  factory ColourLegend.fromXmlElement(XmlElement element) {
    final ranges = element.getElements('CRG')!;
    final id = element.getAttribute('A')!;
    final defaultColour = element.getAttribute('B');
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return ColourLegend(
      ranges: ranges.map(ColourRange.fromXmlElement).toList(),
      id: id,
      defaultColour: defaultColour != null ? int.parse(defaultColour) : null,
      customAttributes: customAttributes,
    );
  }

  /// Regular expression matching pattern for the [id] of [ColourLegend]s.
  static const staticIdRefPattern = '(CLD|CLD-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of [ColourRange]s that are used with this.
  @annotation.XmlElement(name: 'CRG')
  final List<ColourRange> ranges;

  /// Unique identifier for this colour legend.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Default colour to fall back to if a value is not in any of the [ranges].
  @annotation.XmlAttribute(name: 'B')
  final int? defaultColour;

  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
    ...[
      for (final a in ranges.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
  ];

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$ColourLegendBuildXmlChildren(this, builder, namespaces: namespaces);
    if (customAttributes != null && customAttributes!.isNotEmpty) {
      for (final attribute in customAttributes!) {
        builder.attribute(attribute.name.local, attribute.value);
      }
    }
  }

  /// Returns a list of the XML attributes of this.
  @override
  List<XmlAttribute> toXmlAttributes({
    Map<String, String?> namespaces = const {},
  }) {
    final attributes = _$ColourLegendToXmlAttributes(
      this,
      namespaces: namespaces,
    );
    if (customAttributes != null) {
      attributes.addAll(customAttributes!);
    }
    return attributes;
  }

  @override
  List<Object?> get props => [
    ranges,
    id,
    defaultColour,
  ];
}
