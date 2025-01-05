// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

@TestOn('vm')
library;

import 'dart:io';

import 'package:collection/collection.dart';
import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:test/test.dart';

void main() async {
  final taskDataFolder = await TaskDataFileHandler.loadDirectory(
    '${Directory.current.path}/test/data_files/folder_test',
  );
  final taskDataZip = await TaskDataFileHandler.loadZip(
    '${Directory.current.path}/test/data_files/zip_test.zip',
  );

  test(
    'Check that zip and folder data is the same',
    () => expect(
      taskDataZip.toString(),
      taskDataFolder.toString(),
    ),
  );

  test(
    'Check that time log export bytes equals import bytes',
    () => expect(
      taskDataFolder?.tasks.first.timeLogs.first.byteData.toString(),
      taskDataFolder?.tasks.first.timeLogs.first.recordsToBytes().toString(),
    ),
  );

  final taskDataWithGrid1 = await TaskDataFileHandler.loadDirectory(
    '${Directory.current.path}/test/data_files/grid/type_1',
  );
  final grid1 = taskDataWithGrid1?.tasks.first.grid;

  final taskDataWithGrid2 = await TaskDataFileHandler.loadDirectory(
    '${Directory.current.path}/test/data_files/grid/type_2',
  );
  final grid2 = taskDataWithGrid2?.tasks.first.grid;

  group('Test grid loading', () {
    test(
      'Check that grid type 1 size is correct with 6 TZNs.',
      () {
        expect(
          grid1?.treatmentZoneCodeGrid?.length,
          38,
        );
        expect(grid1?.treatmentZoneCodeGrid?.elementAt(0).length, 33);
        expect(
          const SetEquality<int>().equals(
            grid1?.treatmentZoneCodeGrid?.flattened
                .toSet()
                .sorted((a, b) => a.compareTo(b))
                .toSet(),
            {0, 1, 2, 3, 4, 5},
          ),
          true,
        );
      },
    );

    test(
      'Check that grid type 1 export bytes equals import bytes.',
      () {
        expect(
          grid1?.gridToBytes()?.toString(),
          grid1?.byteData.toString(),
        );
      },
    );

    test(
      'Check that grid type 2 size is correct with 1 PDV.',
      () {
        expect(
          (
            grid2?.processDataValueGrid?.length,
            grid2?.processDataValueGrid?.elementAt(0).length,
            grid2?.processDataValueGrid?.elementAt(0).elementAt(0).length,
            grid2?.treatmentZoneCode,
          ),
          (38, 33, 1, 2),
        );
      },
    );
    test(
      'Check that grid type 2 export bytes equals import bytes.',
      () {
        expect(
          grid2?.gridToBytes()?.toString(),
          grid2?.byteData.toString(),
        );
      },
    );
  });
}
