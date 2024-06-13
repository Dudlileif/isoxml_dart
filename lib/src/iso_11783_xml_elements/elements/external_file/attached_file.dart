// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that is used to refer to an attached file, typically a
/// manufacturer's proprietary file that must be part of the data transfer file
/// set.
@CopyWith()
@annotation.XmlRootElement(name: 'AFE')
@annotation.XmlSerializable(createMixin: true)
class AttachedFile extends Iso11783Element
    with _$AttachedFileXmlSerializableMixin {
  /// Default factory for creating an [AttachedFile] with verified
  /// arguments.
  factory AttachedFile({
    required String filenameWithExtension,
    required Preserve preserve,
    required String manufacturerGLN,
    required int fileType,
    String? fileVersion,
    int? fileLength,
  }) {
    ArgumentValidation.checkId(
      id: filenameWithExtension,
      idRefPattern: extensionPattern,
      idName: 'filenameWithExtension',
      minLength: 12,
      maxLength: 12,
    );
    ArgumentValidation.checkValueInRange(
      value: fileType,
      min: 1,
      max: 254,
      name: 'fileType',
    );
    if (fileVersion != null) {
      ArgumentValidation.checkStringLength(fileVersion, name: 'fileVersion');
    }
    if (fileLength != null) {
      ArgumentValidation.checkValueInRange(
        value: fileLength,
        min: 0,
        max: 4294967294,
        name: 'fileLength',
      );
    }

    return AttachedFile._(
      filenameWithExtension: filenameWithExtension,
      preserve: preserve,
      manufacturerGLN: manufacturerGLN,
      fileType: fileType,
      fileVersion: fileVersion,
      fileLength: fileLength,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  const AttachedFile._({
    required this.filenameWithExtension,
    required this.preserve,
    required this.manufacturerGLN,
    required this.fileType,
    this.fileVersion,
    this.fileLength,
  }) : super(
          tag: Iso11783XmlTag.attachedFile,
          description: 'AttachedFile',
          onlyVersion4AndAbove: true,
        );

  /// Creates an [AttachedFile] from [element].
  factory AttachedFile.fromXmlElement(XmlElement element) =>
      _$AttachedFileFromXmlElement(element);

  /// Regular expression matching pattern for the [filenameWithExtension].
  static const extensionPattern = '([0-9]|[A-Z]){8}.([0-9]|[A-Z]){3}';

  /// Filename with extension for the attached file.
  @annotation.XmlAttribute(name: 'A')
  final String filenameWithExtension;

  /// Whether the file should be preserved or not.
  @annotation.XmlAttribute(name: 'B')
  final Preserve preserve;

  /// GS1 Global Location Number for the manufacturer, can be blank for bindings
  /// predefined by ISO 11783.
  @annotation.XmlAttribute(name: 'C')
  final String manufacturerGLN;

  /// What type of file that is attached.
  /// 1 = LINKLIST
  /// 1-127 = reserved for ISO predefined file types.
  /// 128-254 = manufacturer proprietary file types.
  @annotation.XmlAttribute(name: 'D')
  final int fileType;

  /// The version of the file.
  @annotation.XmlAttribute(name: 'E')
  final String? fileVersion;

  /// The length of the file in bytes.
  @annotation.XmlAttribute(name: 'F')
  final int? fileLength;

  @override
  List<Object?> get props => super.props
    ..addAll([
      filenameWithExtension,
      preserve,
      manufacturerGLN,
      fileType,
      fileVersion,
      fileLength,
    ]);
}

/// An enumerator for whether the [AttachedFile] should be preserved when
/// creating the data transfer file set from MICS to FMIS.
@annotation.XmlEnum()
enum Preserve {
  /// The file is not preserved, and IS NOT added when creating the data
  /// transfer file set.
  @annotation.XmlValue('1')
  doNotPreserve(1, 'Task Controller does not need to preserve attached file'),

  /// The file is preserved, and IS added when created when creating the
  /// data transfer file set.
  @annotation.XmlValue('2')
  preserve(2, 'Preserve on Task Controller and send back to FMIS');

  const Preserve(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// Short description of the value.
  final String description;
}
