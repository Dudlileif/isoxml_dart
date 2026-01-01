// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

@TestOn('vm')
library;

import 'dart:io';

import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:test/test.dart';

void main() async {
  late final Iso11783TaskData taskData;
  late final Directory exportDirectory;
  late final Directory extractDirectory;

  final basePath = '${Directory.current.path}/test/data_files';

  setUpAll(() async {
    exportDirectory = Directory(
      '$basePath/export',
    )..createSync(recursive: true);
    extractDirectory = Directory(
      '$basePath/extracted',
    )..createSync(recursive: true);
    taskData = (await TaskDataFileHandler.loadDirectory(
      '$basePath/folder_test',
    ))!;
  });

  tearDownAll(() async {
    exportDirectory.deleteSync(recursive: true);
    extractDirectory.deleteSync(recursive: true);
  });

  group('Zip import and export', () {
    test(
      'Import zip file with extract on load',
      () async {
        final file = File('$basePath/zip_test.zip');
        final loadedData = await TaskDataFileHandler.loadZip(
          file.path,
          extract: true,
          extractionPath: extractDirectory.path,
        );
        expect(
          loadedData,
          isA<Iso11783TaskData>().having(
            (data) => data.toBytes(),
            'Equals folder loaded data',
            taskData.toBytes(),
          ),
        );
      },
    );

    test(
      'Import zip file with grid and extract on load',
      () async {
        final zipData = await TaskDataFileHandler.loadZip(
          '$basePath/grid/type_2.zip',
        );
        final folderData = await TaskDataFileHandler.loadDirectory(
          '$basePath/grid/type_2',
        );
        expect(
          zipData,
          isA<Iso11783TaskData>().having(
            (data) => data.toBytes(),
            'Equals folder loaded data',
            folderData!.toBytes(),
          ),
        );
      },
    );

    test(
      'Export zip file',
      () async {
        final file = File('${exportDirectory.path}/parsing_zip_export.zip');
        final saved = await TaskDataFileHandler.saveToZip(
          taskData: taskData,
          path: file.path,
        );
        expect(saved, true);
      },
    );

    test(
      'Export zip file, externalized is true',
      () async {
        final file = File(
          '${exportDirectory.path}/parsing_zip_export_externalized.zip',
        );
        final readDataFile = File(
          '$basePath/zip_test.zip',
        );
        final taskData = await TaskDataFileHandler.loadZip(readDataFile.path);
        final saved = await TaskDataFileHandler.saveToZip(
          taskData: taskData!,
          path: file.path,
          externalize: true,
        );
        expect(saved, true);
      },
    );

    test(
      'Extract enabled with missing extractionPath throws ArgumentError',
      () {
        expect(
          () => TaskDataFileHandler.loadZip('', extract: true),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'extractionPath',
            ),
          ),
        );
      },
    );

    test('saveToDirectory', () async {
      final saved = await TaskDataFileHandler.saveToDirectory(
        taskData: taskData,
        path: '${exportDirectory.path}/saveToDirectory',
      );
      expect(saved, isTrue);
    });

    test('saveToDirectory externalized', () async {
      final directory = Directory(
        '${exportDirectory.path}/saveToDirectoryExternalized/TASKDATA',
      );
      await directory.create(recursive: true);

      final saved = await TaskDataFileHandler.saveToDirectory(
        taskData: taskData,
        path: '${exportDirectory.path}/saveToDirectoryExternalized',
        externalize: true,
      );
      expect(saved, isTrue);
    });

    test('saveToDirectory with grid', () async {
      final taskData = await TaskDataFileHandler.loadDirectory(
        '${Directory.current.path}/test/data_files/grid/type_1',
      );
      final saved = await TaskDataFileHandler.saveToDirectory(
        taskData: taskData!,
        path: '${exportDirectory.path}/saveToDirectoryWithGrid',
      );
      expect(saved, isTrue);
    });
  });
}
