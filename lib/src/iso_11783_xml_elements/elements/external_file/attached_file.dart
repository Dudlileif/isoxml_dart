// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that is used to refer to an attached file, typically a
/// manufacturer's proprietary file that must be part of the data transfer file
/// set.

class AttachedFile extends Iso11783Element {
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
  AttachedFile._({
    required String filenameWithExtension,
    required Preserve preserve,
    required String manufacturerGLN,
    required int fileType,
    String? fileVersion,
    int? fileLength,
  }) : super(
         elementType: Iso11783ElementType.attachedFile,
         description: 'AttachedFile',
         onlyVersion4AndAbove: true,
       ) {
    this.filenameWithExtension = filenameWithExtension;
    this.preserve = preserve;
    this.manufacturerGLN = manufacturerGLN;
    this.fileType = fileType;
    this.fileVersion = fileVersion;
    this.fileLength = fileLength;
  }

  /// Regular expression matching pattern for the [filenameWithExtension].
  static const extensionPattern = '([0-9]|[A-Z]){8}.([0-9]|[A-Z]){3}';

  /// Filename with extension for the attached file.
  String get filenameWithExtension => parseString('A');
  set filenameWithExtension(String value) => setString('A', value);

  /// Whether the file should be preserved or not.
  Preserve get preserve => Preserve.values.firstWhere(
    (type) => type.value == parseInt('B'),
    orElse: () => throw ArgumentError(
      '''`${getAttribute('B')}` is not one of the supported values: ${Preserve.values.join(', ')}''',
    ),
  );
  set preserve(Preserve value) => setInt('B', value.value);

  /// GS1 Global Location Number for the manufacturer, can be blank for bindings
  /// predefined by ISO 11783.
  String get manufacturerGLN => parseString('C');
  set manufacturerGLN(String value) => setString('C', value);

  /// What type of file that is attached.
  /// 1 = LINKLIST
  /// 1-127 = reserved for ISO predefined file types.
  /// 128-254 = manufacturer proprietary file types.
  int get fileType => parseInt('D');
  set fileType(int value) => setInt('D', value);

  /// The version of the file.
  String? get fileVersion => tryParseString('E');
  set fileVersion(String? value) => setStringNullable('E', value);

  /// The length of the file in bytes.
  int? get fileLength => tryParseInt('F');
  set fileLength(int? value) => setIntNullable('F', value);
}

/// An enumerator for whether the [AttachedFile] should be preserved when
/// creating the data transfer file set from MICS to FMIS.
enum Preserve {
  /// The file is not preserved, and IS NOT added when creating the data
  /// transfer file set.
  doNotPreserve(1, 'Task Controller does not need to preserve attached file'),

  /// The file is preserved, and IS added when created when creating the
  /// data transfer file set.
  preserve(2, 'Preserve on Task Controller and send back to FMIS');

  const Preserve(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// Short description of the value.
  final String description;
}
