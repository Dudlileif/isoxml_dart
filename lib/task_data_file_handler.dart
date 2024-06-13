// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

/// A library with a class with methods for importing and exporting
/// [Iso11783TaskData] to and from files and zip archives.
library task_data_file_handler;

import 'package:isoxml_dart/isoxml_dart.dart';

export 'src/task_data_file_handler/task_data_file_handler_none.dart'
    if (dart.library.io) 'src/task_data_file_handler/task_data_file_handler_vm.dart'
    if (dart.library.js_interop) 'src/task_data_file_handler/task_data_file_handler_web.dart';
