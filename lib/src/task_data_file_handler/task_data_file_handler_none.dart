// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:isoxml/isoxml.dart';

class TaskDataFileHandler {
  static Iso11783TaskData? loadZip(String path) => throw UnimplementedError();

  static Iso11783TaskData? loadDirectory(String path) =>
      throw UnimplementedError();

  static void saveToZip({
    required Iso11783TaskData taskData,
    required String path,
    bool externalize = false,
  }) =>
      throw UnimplementedError();

  static void saveToFolder({
    required Iso11783TaskData taskData,
    required String path,
    bool externalize = false,
  }) =>
      throw UnimplementedError();
}
