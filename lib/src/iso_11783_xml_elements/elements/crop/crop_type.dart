// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes a crop that can be cultivated on a [Partfield].
/// Several [CropVariety] elements can be included.
@CopyWith()
@annotation.XmlRootElement(name: 'CTP')
@annotation.XmlSerializable(createMixin: true)
class CropType extends Iso11783Element
    with _$CropTypeXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [CropType] with verified
  /// arguments.
  factory CropType({
    required String id,
    required String designator,
    List<CropVariety>? varieties,
    String? productGroupIdRef,
    List<XmlAttribute>? customAttributes,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );

    if (productGroupIdRef != null) {
      ArgumentValidation.checkId(
        id: productGroupIdRef,
        idRefPattern: ProductGroup.staticIdRefPattern,
        idName: 'productGroupIdRef',
      );
    }

    return CropType._(
      id: id,
      designator: designator,
      varieties: varieties,
      productGroupIdRef: productGroupIdRef,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  CropType._({
    required this.id,
    required this.designator,
    List<CropVariety>? varieties,
    this.productGroupIdRef,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.cropType,
         description: 'CropType',
       ) {
    if (varieties != null) {
      this.varieties.addAll(varieties);
    }
  }

  /// Creates a [CropType] from [element].
  factory CropType.fromXmlElement(XmlElement element) {
    final varieties = element.getElements('CVT');
    final id = element.getAttribute('A')!;
    final designator = element.getAttribute('B')!;
    final productGroupIdRef = element.getAttribute('C');
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return CropType(
      varieties: varieties?.map(CropVariety.fromXmlElement).toList(),
      id: id,
      designator: designator,
      productGroupIdRef: productGroupIdRef,
      customAttributes: customAttributes,
    );
  }

  /// Regular expression matching pattern for the [id] of [CropType]s.
  static const staticIdRefPattern = '(CTP|CTP-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// A list of different varieties of this crop.
  @annotation.XmlElement(name: 'CVT')
  final List<CropVariety> varieties = [];

  /// Unique identifier for this crop type.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the crop type, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  /// Reference to a [ProductGroup] that this is a part of.
  @annotation.XmlAttribute(name: 'C')
  final String? productGroupIdRef;

  @override
  Iterable<Iso11783Element>? get recursiveChildren => [
    ...[
      for (final a in varieties.map((e) => e.selfWithRecursiveChildren)) ...a,
    ],
  ];

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$CropTypeBuildXmlChildren(this, builder, namespaces: namespaces);
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
    final attributes = _$CropTypeToXmlAttributes(
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
    varieties,
    id,
    designator,
    productGroupIdRef,
  ];
}
