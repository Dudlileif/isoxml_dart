// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:isoxml/isoxml.dart';

class TaskDataFileHandler {
  Iso11783TaskData? loadZip(String path) => throw UnimplementedError();

  Iso11783TaskData? loadDirectory(String path) => throw UnimplementedError();

  static void saveToZip({
    required Iso11783TaskData taskData,
    required String path,
  }) {}

  static void saveToFolder({
    required Iso11783TaskData taskData,
    required String path,
  }) {}
}
