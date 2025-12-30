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
  final taskDataFolder = (await TaskDataFileHandler.loadDirectory(
    '${Directory.current.path}/test/data_files/folder_test',
  ))!;
  final taskDataZip = (await TaskDataFileHandler.loadZip(
    '${Directory.current.path}/test/data_files/zip_test.zip',
  ))!;

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
      taskDataFolder.tasks.first.timeLogs.first.byteData,
      taskDataFolder.tasks.first.timeLogs.first.recordsToBytes(),
    ),
  );

  final taskDataWithGrid1 = await TaskDataFileHandler.loadDirectory(
    '${Directory.current.path}/test/data_files/grid/type_1',
  );
  final grid1 = taskDataWithGrid1?.tasks.first.grid;

  final taskDataWithGrid2 = await Iso11783TaskData.fromDirectory(
    '${Directory.current.path}/test/data_files/grid/type_2',
  );
  final grid2 = taskDataWithGrid2?.tasks.first.grid;

  group('Test grid loading', () {
    test(
      'Check that grid type 1 size is correct with 6 TZNs.',
      () {
        expect(
          grid1,
          isA<Grid>()
              .having(
                (grid) => grid.type,
                'Is correct grid type',
                equals(GridType.one),
              )
              .having(
                (grid) => grid.treatmentZoneCodeGrid?.length,
                'Correct y size',
                equals(38),
              )
              .having(
                (grid) => grid.treatmentZoneCodeGrid?.elementAt(0).length,
                'Correct x size',
                equals(33),
              )
              .having(
                (grid) => grid.treatmentZoneCodeGrid?.flattened
                    .toSet()
                    .sorted((a, b) => a.compareTo(b))
                    .toSet(),
                'Correct number of TZNs',
                equals({0, 1, 2, 3, 4, 5}),
              ),
        );
      },
    );

    test(
      'Check that grid type 1 export bytes equals import bytes.',
      () {
        expect(grid1?.gridToBytes(), grid1?.byteData);
      },
    );

    test(
      'Check that grid type 2 size is correct with 1 PDV.',
      () {
        expect(
          grid2,
          isA<Grid>()
              .having((grid) => grid.type, 'Correct type', equals(GridType.two))
              .having(
                (grid) => grid.processDataValueGrid?.length,
                'Correct y size',
                equals(38),
              )
              .having(
                (grid) => grid.processDataValueGrid?.elementAt(0).length,
                'Correct x size',
                equals(33),
              )
              .having(
                (grid) =>
                    grid.processDataValueGrid?.elementAt(0).elementAt(0).length,
                'Correct amount of PDVs',
                equals(1),
              )
              .having(
                (grid) => grid.treatmentZoneCode,
                'Correct TZN code',
                equals(2),
              ),
        );
      },
    );
    test(
      'Check that grid type 2 export bytes equals import bytes.',
      () {
        expect(grid2?.gridToBytes(), grid2?.byteData);
      },
    );
  });
}
