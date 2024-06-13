// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:web/web.dart' as web;

/// A file handler for loading and saving [Iso11783TaskData] objects to and from
/// a directory or zip file.
class TaskDataFileHandler {
  /// Unimplemented on the web platform.
  static Future<Iso11783TaskData?> loadZip(String path) async =>
      throw UnimplementedError();

  /// Unimplemented on the web platform.
  static Future<Iso11783TaskData?> loadDirectory(String path) async =>
      throw UnimplementedError();

  /// Exports the [taskData] to a zip file and downloads it.
  /// If [externalize] is true, the [taskData] will split up the main XML
  /// file to one for each type in [Iso11783XmlTag.tagsThatCanBeExternal].
  static Future<bool> saveToZip({
    required Iso11783TaskData taskData,
    required String path,
    bool externalize = false,
  }) async {
    final archive = taskData.toZip(externalize: externalize);
    final bytes = ZipEncoder().encode(archive);
    if (bytes != null) {
      final anchor = web.document.createElement('a') as web.HTMLAnchorElement
        ..href = 'data:application/octet-stream;base64,${base64Encode(bytes)}'
        ..download = '${path.split('/').last}.zip'
        ..style.display = 'none';

      web.document.body?.appendChild(anchor);
      anchor.click();
      web.document.body?.removeChild(anchor);
      return true;
    }
    return false;
  }

  /// Falls back to [saveToZip].
  ///
  /// Exports the [taskData] to a zip file and downloads it.
  /// If [externalize] is true, the [taskData] will split up the main XML
  /// file to one for each type in [Iso11783XmlTag.tagsThatCanBeExternal].
  static Future<bool> saveToFolder({
    required Iso11783TaskData taskData,
    required String path,
    bool externalize = false,
  }) async =>
      saveToZip(taskData: taskData, path: path, externalize: externalize);
}
