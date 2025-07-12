// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that is used to refer to an XML file external to the main XML
/// file.
///
/// The external file can only include top level XML elements. Top level XML
/// elements are the elements that can be included in XML element
/// `ISO11783_TaskData` ([Iso11783TaskData]), see
/// [Iso11783ElementType.tagsThatCanBeExternal]. Inside an external XML file,
/// only a single type of XML element can be specified per file. There shall be
/// no recursive use of XFR elements, and no recursive use XFC elements.
@CopyWith()
@annotation.XmlRootElement(name: 'XFR')
@annotation.XmlSerializable(createMixin: true)
class ExternalFileReference extends Iso11783Element
    with _$ExternalFileReferenceXmlSerializableMixin, EquatableMixin {
  /// Default factory for creating an [ExternalFileReference] with verified
  /// arguments.
  factory ExternalFileReference({
    required String filename,
    FileType? filetype,
  }) {
    ArgumentValidation.checkId(
      id: filename,
      idRefPattern: filenamePattern,
      idName: 'filename',
      minLength: 8,
      maxLength: 8,
    );
    return ExternalFileReference._(
      filename: filename,
      filetype: filetype,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const ExternalFileReference._({
    required this.filename,
    this.filetype,
  }) : super(
         elementType: Iso11783ElementType.externalFileReference,
         description: 'ExternalFileReference',
       );

  /// Creates an [ExternalFileReference] from [element].
  factory ExternalFileReference.fromXmlElement(XmlElement element) =>
      _$ExternalFileReferenceFromXmlElement(element);

  /// Regular expression matching pattern for the filenames of external files.
  static const filenamePattern =
      '''(AFE|BSN|CCG|CCT|CLD|CPC|CTP|CTR|DVC|FRM|OTQ|PDT|PFD|PGP|TSK|VPN|WKR)[0-9]{5}''';

  /// Filename of the external file.
  @annotation.XmlAttribute(name: 'A')
  final String filename;

  /// What type of file the referenced file is.
  ///
  /// Only [FileType.xml] is possible.
  @annotation.XmlAttribute(name: 'B')
  final FileType? filetype;

  /// Which type of element this file's content is.
  @override
  Iso11783ElementType get elementType => Iso11783ElementType.values.firstWhere(
    (element) => element.xmlTag == filename.substring(0, 3),
  );

  @override
  List<Object?> get props => [
    filename,
    filetype,
  ];
}

/// An enumerator for which type of file an [ExternalFileReference] refers to.
@annotation.XmlEnum()
enum FileType {
  /// An XML document file.
  @annotation.XmlValue('1')
  xml(1, 'XML');

  const FileType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// Short description of the value.
  final String description;
}
