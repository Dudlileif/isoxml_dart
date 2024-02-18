// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

/// A library for interacting with ISO 11783-10 XML documents and the
/// ISO 11783-11 Data Directory.
library isoxml;

export 'src/iso11783_data_dictionary.dart';
export 'src/iso11783_element.dart';
export 'src/task_data_file_handler/task_data_file_handler_none.dart'
    if (dart.library.io) 'src/task_data_file_handler/task_data_file_handler_vm.dart'
    if (dart.library.html) 'src/task_data_file_handler/task_data_file_handler_web.dart';
