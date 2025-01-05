// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:isoxml_dart/isoxml_dart.dart';

/// A file handler for loading and saving [Iso11783TaskData] objects to and from
/// a directory or zip file.
class TaskDataFileHandler {
  /// Load an [Iso11783TaskData] from the zip file at [path].
  ///
  /// Only implemented on native platforms.
  static Future<Iso11783TaskData?> loadZip(String path) async =>
      throw UnimplementedError();

  /// Load an [Iso11783TaskData] from the directory at [path].
  ///
  /// Only implemented on native platforms.
  static Future<Iso11783TaskData?> loadDirectory(String path) async =>
      throw UnimplementedError();

  /// Saves the [taskData] to a zip file at [path].
  /// If [externalize] is true, the [taskData] will split up the main XML
  /// file to one for each type in [Iso11783ElementType.tagsThatCanBeExternal].
  ///
  /// On web it will download the zip file directly.
  static Future<bool> saveToZip({
    required Iso11783TaskData taskData,
    required String path,
    bool externalize = false,
  }) async =>
      throw UnimplementedError();

  /// Saves the [taskData] to the directory at [path].
  /// If [externalize] is true, the [taskData] will split up the main XML
  /// file to one for each type in [Iso11783ElementType.tagsThatCanBeExternal].
  ///
  /// On web it will fall back to [saveToZip].
  static Future<bool> saveToFolder({
    required Iso11783TaskData taskData,
    required String path,
    bool externalize = false,
  }) async =>
      throw UnimplementedError();
}
