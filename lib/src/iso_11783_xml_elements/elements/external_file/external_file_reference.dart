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
class ExternalFileReference extends Iso11783Element {
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
  ExternalFileReference._({
    required String filename,
    FileType? filetype,
  }) : super(
         elementType: Iso11783ElementType.externalFileReference,
         description: 'ExternalFileReference',
       ) {
    this.filename = filename;
    this.filetype = filetype;
  }

  /// Regular expression matching pattern for the filenames of external files.
  static const filenamePattern =
      '''(AFE|BSN|CCG|CCT|CLD|CPC|CTP|CTR|DVC|FRM|OTQ|PDT|PFD|PGP|TSK|VPN|WKR)[0-9]{5}''';

  /// Filename of the external file.
  String get filename => parseString('A');
  set filename(String value) => setString('A', value);

  /// What type of file the referenced file is.
  ///
  /// Only [FileType.xml] is possible.
  FileType? get filetype => switch (tryParseInt('B')) {
    final int value => FileType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => throw ArgumentError(
        '''`$value` is not one of the supported values: ${FileType.values.join(', ')}''',
      ),
    ),
    _ => null,
  };
  set filetype(FileType? value) => setIntNullable('B', value?.value);

  /// Which type of element this file's content is.
  @override
  Iso11783ElementType get elementType => Iso11783ElementType.values.firstWhere(
    (element) => element.xmlTag == filename.substring(0, 3),
  );
}

/// An enumerator for which type of file an [ExternalFileReference] refers to.
enum FileType {
  /// An XML document file.
  xml(1, 'XML');

  const FileType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// Short description of the value.
  final String description;
}
