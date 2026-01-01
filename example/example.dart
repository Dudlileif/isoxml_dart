// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:io';

import 'package:isoxml_dart/isoxml_dart.dart';

void main() async {
  // Create ISO11783 TaskData objects with constructors.
  final taskData = Iso11783TaskData(
    versionMajor: VersionMajor.four,
    versionMinor: VersionMinor.three,
    managementSoftwareManufacturer: 'Your manufacturer',
    managementSoftwareVersion: '1.0',
    dataTransferOrigin: DataTransferOrigin.fmis,
    culturalPractices: [
      CulturalPractice(id: 'CPC1', designator: 'Plowing'),
    ],
    customers: [
      Customer(id: 'CTR1', lastName: 'Customerson'),
    ],
    farms: [
      Farm(id: 'FRM1', designator: 'Farmington'),
    ],
    tasks: [
      Task(
        id: 'TSK1',
        status: TaskStatus.completed,
        designator: 'Example task',
        customerIdRef: 'CTR1',
        farmIdRef: 'FRM1',
        responsibleWorkerIdRef: 'WKR1',
        partfieldIdRef: 'PFD1',
        operationTechniquePractice: OperationTechniquePractice(
          culturalPracticeIdRef: 'CPC1',
        ),
        workerAllocations: [
          WorkerAllocation(
            workerIdRef: 'WKR1',
            allocationStamp: AllocationStamp(
              start: DateTime.utc(2025, 10, 15, 12),
              stop: DateTime.utc(2025, 10, 15, 14),
              duration: 7200,
              type: AllocationStampType.effective,
            ),
          ),
        ],
      ),
    ],
    partfields: [
      Partfield(
        id: 'PFD1',
        designator: 'Example field',
        area: 10000,
        farmIdRef: 'FRM1',
        customerIdRef: 'CTR1',
        polygons: [
          Polygon(
            id: 'PLN1',
            type: PolygonType.mainfield,
            area: 10000,
            lineStrings: [
              LineString(
                id: 'LSG1',
                points: [
                  Point(
                    north: 60,
                    east: 10,
                    type: PointType.other,
                  ),
                  Point(
                    north: 60,
                    east: 11,
                    type: PointType.other,
                  ),
                  Point(
                    north: 61,
                    east: 11,
                    type: PointType.other,
                  ),
                  Point(
                    north: 61,
                    east: 10,
                    type: PointType.other,
                  ),
                ],
                type: LineStringType.polygonExterior,
              ),
            ],
          ),
        ],
      ),
    ],
    workers: [
      Worker(id: 'WKR1', lastName: 'Workerson'),
    ],
  );

  // Save created task data to a directory in the file system.
  await TaskDataFileHandler.saveToDirectory(
    taskData: taskData,
    path: '${Directory.current.path}/example/data',
  );

  // Save created task data to a zip file in the file system.
  await TaskDataFileHandler.saveToZip(
    taskData: taskData,
    path: '${Directory.current.path}/example/data.zip',
    externalize: true, // Optional splitting of the task data files.
  );

  // Load task data from a directory in the file system.
  await TaskDataFileHandler.loadDirectory(
    '${Directory.current.path}/example/data',
  );

  // Load task data from a zip file in the file system.
  await TaskDataFileHandler.loadZip(
    '${Directory.current.path}/example/data.zip',
    extract: true, // Optional extraction of the zipped data
    extractionPath: '${Directory.current.path}/example/extracted',
  );
}
