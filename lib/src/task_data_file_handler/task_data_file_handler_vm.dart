// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:collection/collection.dart';
import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:xml/xml.dart';

/// A file handler for loading and saving [Iso11783TaskData] objects to and from
/// a directory or zip file.
class TaskDataFileHandler {
  /// Load an [Iso11783TaskData] from the zip file at [path].
  /// If [extract] is true, the zip file will be extracted to [extractionPath],
  /// which must not be null.
  static Future<Iso11783TaskData?> loadZip(
    String path, {
    bool extract = false,
    String? extractionPath,
  }) async {
    if (extract && extractionPath == null) {
      throw ArgumentError.value(
        [extractionPath, 'extractionPath'],
        'Can not be null if extract=true.',
      );
    }

    final inputStream = InputFileStream(path);

    final archive = ZipDecoder().decodeStream(inputStream);

    if (extract && extractionPath != null) {
      await extractArchiveToDisk(
        archive,
        '$extractionPath/${path.split('/').last.split('.zip').first}',
      );
      return loadDirectory(
        '$extractionPath/${path.split('/').last.split('.zip').first}',
      );
    }

    return Iso11783TaskData.fromZip(archive);
  }

  /// Load an [Iso11783TaskData] from the directory at [path].
  static Future<Iso11783TaskData?> loadDirectory(String path) async {
    final directory = Directory(path);
    if (directory.existsSync()) {
      final taskDirectory = (await directory.list().toList()).firstWhereOrNull(
        (element) =>
            element.path.toUpperCase().endsWith('TASKDATA') &&
            FileSystemEntity.typeSync(path) == FileSystemEntityType.directory,
      );
      List<File>? files;
      if (taskDirectory != null) {
        files = await Directory(
          taskDirectory.path,
        ).list().map((e) => File(e.path)).toList();
      }
      files ??= await directory.list().map((e) => File(e.path)).toList();

      final taskDataFile = files.firstWhereOrNull(
        (element) => element.path.toUpperCase().endsWith('TASKDATA.XML'),
      );
      if (taskDataFile == null) {
        return null;
      }
      final taskData = Iso11783TaskData.fromXmlDocument(
        XmlDocument.parse(await taskDataFile.readAsString()),
      );
      if (taskData == null) {
        return null;
      }
      for (final externalFile in taskData.externalFileReferences) {
        final archiveFile = files.firstWhereOrNull(
          (element) => element.path.toUpperCase().endsWith(
            '${externalFile.filename}.XML',
          ),
        );
        if (archiveFile != null) {
          final contents = ExternalFileContents.fromXmlDocument(
            XmlDocument.parse(await archiveFile.readAsString()),
          );
          contents?.contents.forEach(taskData.addTopLevelElement);
        }
      }
      Iso11783LinkList? linkList;
      final linkListFile = files.firstWhereOrNull(
        (element) => element.path.toUpperCase().endsWith('LINKLIST.XML'),
      );
      if (linkListFile != null) {
        linkList = Iso11783LinkList.fromXmlDocument(
          XmlDocument.parse(await linkListFile.readAsString()),
        );
      }

      for (final task in taskData.tasks) {
        if (task.grid != null) {
          final dataFile = files.firstWhereOrNull(
            (file) =>
                file.path.toUpperCase().endsWith('${task.grid!.fileName}.BIN'),
          );
          task.grid!
            ..byteData = await dataFile?.readAsBytes() ?? task.grid!.byteData
            ..numberOfProcessDataVariables = task.grid!.type == GridType.two
                ? task.treatmentZones
                      .firstWhereOrNull(
                        (element) =>
                            element.code == task.grid?.treatmentZoneCode,
                      )
                      ?.processDataVariables
                      .length
                : null
            ..parseData();
        }
        for (final timeLog in task.timeLogs) {
          final headerFile = files.firstWhereOrNull(
            (file) =>
                file.path.toUpperCase().endsWith('${timeLog.filename}.XML'),
          );
          final headerString = await headerFile?.readAsString();
          if (headerString != null) {
            timeLog.header = TimeLogHeader.fromXmlDocument(
              XmlDocument.parse(await headerFile!.readAsString()),
            );
          }
          final dataFile = files.firstWhereOrNull(
            (file) =>
                file.path.toUpperCase().endsWith('${timeLog.filename}.BIN'),
          );
          timeLog
            ..byteData = await dataFile?.readAsBytes() ?? timeLog.byteData
            ..parseData();
        }
      }

      return taskData.copyWith.linkList(linkList);
    }
    return null;
  }

  /// Saves the [taskData] to a zip file at [path].
  /// If [externalize] is true, the [taskData] will split up the main XML
  /// file to one for each type in [Iso11783ElementType.tagsThatCanBeExternal].
  static Future<bool> saveToZip({
    required Iso11783TaskData taskData,
    required String path,
    bool externalize = false,
  }) async {
    final archive = taskData.toZip(externalize: externalize);
    final bytes = ZipEncoder().encode(archive);
    final file = File(path);
    await file.create(recursive: true);
    await file.writeAsBytes(Uint8List.fromList(bytes));

    return true;
  }

  /// Saves the [taskData] to the directory at [path].
  /// If [externalize] is true, the [taskData] will split up the main XML
  /// file to one for each type in [Iso11783ElementType.tagsThatCanBeExternal].
  static Future<bool> saveToFolder({
    required Iso11783TaskData taskData,
    required String path,
    bool externalize = false,
  }) async {
    try {
      final directory = Directory(path);
      await directory.create(recursive: true);

      await directory.list().forEach((element) async {
        if (element.path.endsWith('TASKDATA') && element is Directory) {
          await element.delete(recursive: true);
        }
      });

      if (!externalize) {
        final file = File('$path/TASKDATA/TASKDATA.XML');
        await file.create(recursive: true);
        await file.writeAsString(
          '${taskData.toSingleXmlDocument().toXmlString(
            pretty: true,
            indent: '    ',
          )}\n',
        );
      } else {
        for (final file in taskData.toXmlExternalDocuments()) {
          final externalFile = File('$path/TASKDATA/${file.fileName}.XML');
          await externalFile.create(recursive: true);
          await externalFile.writeAsString(
            '${file.document.toXmlString(
              pretty: true,
              indent: '    ',
            )}\n',
          );
        }
      }

      if (taskData.linkList != null) {
        final file = File('$path/TASKDATA/LINKLIST.XML');
        await file.create(recursive: true);
        await file.writeAsString(
          '${taskData.linkList!.toXmlDocument().toXmlString(
            pretty: true,
            indent: '    ',
          )}\n',
        );
      }

      for (final task in taskData.tasks) {
        if (task.grid != null) {
          final bytes = task.grid!.gridToBytes();
          if (bytes != null && bytes.isNotEmpty) {
            final file = File('$path/TASKDATA/${task.grid!.fileName}.BIN');
            await file.create(recursive: true);
            await file.writeAsBytes(
              bytes,
            );
          }
        }
        for (final timeLog in task.timeLogs) {
          final bytes = timeLog.recordsToBytes();
          if (bytes != null && bytes.isNotEmpty && timeLog.header != null) {
            final binaryFile = File('$path/TASKDATA/${timeLog.filename}.BIN');
            await binaryFile.create(recursive: true);
            await binaryFile.writeAsBytes(
              bytes,
            );
            final headerFile = File(
              '$path/TASKDATA/${timeLog.filename}.XML',
            );
            await headerFile.create(recursive: true);
            await headerFile.writeAsString(
              '${timeLog.header!.toXmlDocument().toXmlString(
                pretty: true,
                indent: '    ',
              )}\n',
            );
          }
        }
      }

      return true;
    } catch (e) {
      throw FileSystemException(e.toString());
    }
  }
}
