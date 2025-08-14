// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes varieties of a crop specified by [CropType] that
/// can be cultivated on a [Partfield].
///
/// Each [CropVariety] belongs to a single [CropType] definition.
@CopyWith()
@annotation.XmlRootElement(name: 'CVT')
@annotation.XmlSerializable(createMixin: true)
class CropVariety extends Iso11783Element
    with _$CropVarietyXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating a [CropVariety] with verified
  /// arguments.
  factory CropVariety({
    required String id,
    required String designator,
    String? productIdRef,
    List<XmlAttribute>? customAttributes,
  }) {
    ArgumentValidation.checkIdAndDesignator(
      id: id,
      idRefPattern: staticIdRefPattern,
      designator: designator,
    );
    if (productIdRef != null) {
      ArgumentValidation.checkId(
        id: productIdRef,
        idRefPattern: Product.staticIdRefPattern,
        idName: 'productIdRef',
      );
    }
    return CropVariety._(
      id: id,
      designator: designator,
      productIdRef: productIdRef,
      customAttributes: customAttributes,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const CropVariety._({
    required this.id,
    required this.designator,
    this.productIdRef,
    super.customAttributes,
  }) : super(
         elementType: Iso11783ElementType.cropVariety,
         description: 'CropVariety',
       );

  /// Creates a [CropVariety] from [element].
  factory CropVariety.fromXmlElement(XmlElement element) {
    final id = element.getAttribute('A')!;
    final designator = element.getAttribute('B')!;
    final productIdRef = element.getAttribute('C');
    final customAttributes = element.attributes.nonSingleAlphabeticNames;

    return CropVariety(
      id: id,
      designator: designator,
      productIdRef: productIdRef,
      customAttributes: customAttributes,
    );
  }

  /// Regular expression matching pattern for the [id] of [CropVariety]s.
  static const staticIdRefPattern = '(CVT|CVT-)[1-9]([0-9])*';

  @override
  String get idRefPattern => staticIdRefPattern;

  /// Unique identifier for this crop variety.
  ///
  /// Records generated on MICS have negative IDs.
  @override
  @annotation.XmlAttribute(name: 'A')
  final String id;

  /// Name of the crop variety, description or comment.
  @annotation.XmlAttribute(name: 'B')
  final String designator;

  /// Reference to a [Product] this variety can be a part of.
  @annotation.XmlAttribute(name: 'C')
  final String? productIdRef;

  /// Builds the XML children of this on the [builder].
  @override
  void buildXmlChildren(
    XmlBuilder builder, {
    Map<String, String> namespaces = const {},
  }) {
    _$CropVarietyBuildXmlChildren(this, builder, namespaces: namespaces);
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
    final attributes = _$CropVarietyToXmlAttributes(
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
    id,
    designator,
    productIdRef,
  ];
}
