// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

@TestOn('vm')
library;

import 'dart:io';

import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() async {
  final dataFile =
      File('${Directory.current.path}/test/data_files/parsing_test.xml');
  final dataString = await dataFile.readAsString();

  final doc = XmlDocument.parse(dataString);
  final mapped = doc.childElements.map(Iso11783Element.fromXmlElement).toList();
  final taskData = Iso11783TaskData.fromXmlDocument(doc);

  group('Verify parsed document', () {
    test(
      'Check that all elements are parsed',
      () => expect(mapped.length, doc.childElements.length),
    );

    test(
      'Check that first elemeent is $Iso11783TaskData',
      () => expect(taskData.runtimeType, Iso11783TaskData),
    );
    taskData!;

    final manuallyEnteredData = Iso11783TaskData(
      versionMajor: VersionMajor.four,
      versionMinor: VersionMinor.two,
      dataTransferOrigin: DataTransferOrigin.fmis,
      managementSoftwareManufacturer: 'test',
      managementSoftwareVersion: '1.0',
      taskControllerManufacturer: 'SomeOne',
      taskControllerVersion: '1234',
      language: 'en',
      attachedFiles: [
        AttachedFile(
          filenameWithExtension: 'TEST1234.BIN',
          preserve: Preserve.preserve,
          manufacturerGLN: '0614141000111',
          fileType: 128,
          fileVersion: 'V1',
          fileLength: 400,
        ),
      ],
      baseStations: [
        BaseStation(
          id: 'BSN1',
          designator: 'GlonassBaseStation',
          north: 52.34424,
          east: 7.234353,
          up: 400,
        ),
      ],
      codedComments: [
        CodedComment(
          id: 'CCT1',
          designator: 'Emoji comments',
          scope: CodedCommmentScope.point,
          groupIdRef: 'CCG1',
          listValues: [
            CodedCommentListValue(id: 'CCL1', designator: ':)'),
            CodedCommentListValue(id: 'CCL2', designator: ':('),
            CodedCommentListValue(id: 'CCL3', designator: ':D'),
          ],
        ),
      ],
      codedCommentGroups: [
        CodedCommentGroup(id: 'CCG1', designator: 'InternetMemes'),
      ],
      colourLegends: [
        ColourLegend(
          id: 'CLD1',
          defaultColour: 1,
          ranges: [
            ColourRange(minimumValue: 0, maximumValue: 300, colour: 1),
            ColourRange(minimumValue: 301, maximumValue: 600, colour: 2),
            ColourRange(minimumValue: 601, maximumValue: 900, colour: 3),
            ColourRange(minimumValue: 901, maximumValue: 1300, colour: 4),
          ],
        ),
      ],
      cropTypes: [
        CropType(
          id: 'CTP1',
          designator: 'Corn',
          productGroupIdRef: 'PGP1',
          varieties: [
            CropVariety(
              id: 'CVT1',
              designator: 'PopCorn',
              productIdRef: 'PDT1',
            ),
            CropVariety(
              id: 'CVT2',
              designator: 'Golden Bantam',
              productIdRef: 'PDT1',
            ),
          ],
        ),
      ],
      culturalPractices: [
        CulturalPractice(
          id: 'CPC1',
          designator: 'Drilling',
          operationTechniqueReferences: [
            OperationTechniqueReference(operationTechniqueIdRef: 'OTQ1'),
          ],
        ),
      ],
      customers: [
        Customer(
          id: 'CTR1',
          lastName: 'Meyer',
          firstName: 'Peter',
          street: 'ExampleRoad',
          poBox: '12345',
          postalCode: '48485',
          city: 'Neuenkirchen',
          state: 'NRW',
          country: 'Germany',
          phone: '01189998819101187253',
          mobile: '01189998819101187254',
          fax: '01189998819101187153',
          email: 'tester@examplemail.com',
        ),
      ],
      devices: List.generate(
        2,
        (deviceIndex) => Device(
          id: 'DVC-${deviceIndex + 1}',
          designator: ['SuperBaler', 'SuperTractor'][deviceIndex],
          softwareVersion: 'V1.1',
          clientNAME: [
            'A00086000D300841',
            'A00086000F300842',
          ][deviceIndex],
          serialNumber: ['123453', '123455'][deviceIndex],
          structureLabel: [
            '00000330000000',
            '00000220000000',
          ][deviceIndex],
          localizationLabel: 'FF000000006564',
          elements: List.generate(
            3,
            (index) => DeviceElement(
              id: 'DET-${deviceIndex * 3 + 1 + index}',
              objectId: index + 1,
              type: [
                DeviceElementType.device,
                DeviceElementType.function,
                DeviceElementType.connector,
              ][index],
              designator: [
                'MainDevice',
                'SubFunction',
                'Connector',
              ][index],
              number: [
                [1, 2, 3],
                [0, 1, 3],
              ][deviceIndex][index],
              parentObjectId: [
                [0, 1, 1],
                [0, 0, 1],
              ][deviceIndex][index],
              objectReferences: [
                [
                  DeviceObjectReference(objectId: 10),
                  DeviceObjectReference(objectId: 50),
                ],
                [DeviceObjectReference(objectId: 11)],
                [
                  DeviceObjectReference(objectId: 52),
                  DeviceObjectReference(objectId: 53),
                ]
              ][index],
            ),
          ),
          processData: List.generate(
            2,
            (index) => DeviceProcessData(
              objectId: [10, 11][index],
              ddi: [
                ['00D4', '01E2'][deviceIndex],
                '0066',
              ][index],
              property: 1,
              triggerMethods: 31,
              designator: [
                'Last Bale Moisture',
                'Actual Bale Length',
              ][index],
              presentationObjectId: [100, 101][index],
            ),
          ),
          properties: List.generate(
            3,
            (index) => DeviceProperty(
              objectId: [50, 52, 53][index],
              ddi: ['0073', '0086', '0087'][index],
              value: [1400, 1000, 500][index],
              designator: [
                'Maximum Bale Width',
                'OffsetX',
                'OffsetY',
              ][index],
              valuePresentationObjectId: 101,
            ),
          ),
          valuePresentations: List.generate(
            2,
            (index) => DeviceValuePresentation(
              objectId: [100, 101][index],
              offset: 0,
              scale: [0.00001, 0.001][index],
              numberOfDecimals: [1, 2][index],
              unitDesignator: ['%', 'm'][index],
            ),
          ),
        ),
      ),
      farms: [
        Farm(
          id: 'FRM1',
          designator: 'Peters Farm',
          street: 'Example Road 1',
          poBox: '1234252',
          postalCode: '48432',
          city: 'Mesum',
          state: 'NRW',
          country: 'Germany',
          customerIdRef: 'CTR1',
        ),
      ],
      operationTechniques: [
        OperationTechnique(id: 'OTQ1', designator: 'Deep Drilling'),
      ],
      partfields: List.generate(
        2,
        (index) => Partfield(
          id: 'PFD${index + 1}',
          code: 'FD${123 + index}',
          designator: 'Near the Highway${index == 0 ? '' : ' Subfield'}',
          area: [13334, 3334][index],
          customerIdRef: 'CTR1',
          farmIdRef: 'FRM1',
          cropTypeIdRef: 'CTP1',
          cropVarietyIdRef: 'CVT1',
          fieldIdRef: [null, 'PFD1'][index],
          polygons: [
            null,
            [
              Polygon(
                type: PolygonType.partfieldBoundary,
                designator: 'Field Border',
                area: 3334,
                colour: 7,
                id: 'PLN1',
                lineStrings: [
                  LineString(
                    type: LineStringType.polygonExterior,
                    designator: 'Outer line',
                    width: 12121414,
                    length: 12231322,
                    colour: 8,
                    id: 'LSG1',
                    points: List.generate(
                      4,
                      (pointIndex) => Point(
                        type: PointType.flag,
                        designator: 'Marker${pointIndex + 1}',
                        north: [
                          52.213,
                          52.216,
                          52.216,
                          52.213,
                        ][pointIndex],
                        east: [
                          7.20001,
                          7.20001,
                          7.20007,
                          7.20007,
                        ][pointIndex],
                        up: 100,
                        colour: 9,
                        id: 'PNT${pointIndex + 1}',
                        horizontalAccuracy: 0,
                        verticalAccuracy: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ]
          ][index],
          points: [
            null,
            [
              Point(
                type: PointType.fieldAccess,
                designator: 'Entry',
                north: 52.214,
                east: 7.20007,
                up: 100,
                colour: 9,
                id: 'PNT21',
                horizontalAccuracy: 0,
                verticalAccuracy: 1,
              ),
            ]
          ][index],
          lineStrings: [
            null,
            [
              LineString(
                type: LineStringType.samplingRoute,
                id: 'LSG2',
                designator: 'Outer line',
                colour: 8,
                width: 12121414,
                length: 12231322,
                points: List.generate(
                  4,
                  (pointIndex) => Point(
                    type: PointType.flag,
                    designator: 'Marker${pointIndex + 5}',
                    north: [
                      52.2135,
                      52.215,
                      52.215,
                      52.2135,
                    ][pointIndex],
                    east: [
                      7.20002,
                      7.20002,
                      7.20006,
                      7.20006,
                    ][pointIndex],
                    up: 100,
                    colour: 9,
                    id: 'PNT${pointIndex + 5}',
                    horizontalAccuracy: 0,
                    verticalAccuracy: 1,
                  ),
                ),
              ),
            ],
          ][index],
          guidanceGroups: [
            null,
            [
              GuidanceGroup(
                id: 'GGP1',
                designator: 'Guidance for sampling',
                patterns: [
                  GuidancePattern(
                    id: 'GPN1',
                    designator: 'GuidancePattern',
                    type: GuidancePatternType.ab,
                    options: GuidancePatternOptions.clockwise,
                    propagationDirection:
                        GuidancePatternPropagationDirection.both,
                    extension: GuidancePatternExtension.fromBoth,
                    heading: 30,
                    radius: 400,
                    gnssMethod: GuidancePatternGnssMethod.rtkFixedInteger,
                    horizontalAccuracy: 5,
                    verticalAccuracy: 5.1,
                    baseStationIdRef: 'BSN1',
                    originalSRID: 'EPSG:4326',
                    numberOfSwathsLeft: 5,
                    numberOfSwathsRight: 8,
                    boundaryPolygon: Polygon(
                      type: PolygonType.partfieldBoundary,
                      designator: 'Field Border',
                      area: 3334,
                      colour: 7,
                      id: 'PLN2',
                      lineStrings: [
                        LineString(
                          type: LineStringType.polygonExterior,
                          designator: 'Outer line',
                          width: 12121414,
                          length: 12231322,
                          colour: 8,
                          id: 'LSG3',
                          points: List.generate(
                            4,
                            (pointIndex) => Point(
                              type: PointType.flag,
                              designator: 'Marker${pointIndex + 13}',
                              north: [
                                52.213,
                                52.216,
                                52.216,
                                52.213,
                              ][pointIndex],
                              east: [
                                7.20001,
                                7.20001,
                                7.20007,
                                7.20007,
                              ][pointIndex],
                              up: 100,
                              colour: 9,
                              id: 'PNT${pointIndex + 13}',
                              horizontalAccuracy: 0,
                              verticalAccuracy: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    lineStrings: [
                      LineString(
                        type: LineStringType.samplingRoute,
                        designator: 'Outer line',
                        width: 12121414,
                        length: 12231322,
                        colour: 8,
                        id: 'LSG4',
                        points: List.generate(
                          4,
                          (pointIndex) => Point(
                            type: PointType.flag,
                            designator: 'Marker${pointIndex + 17}',
                            north: [
                              52.2135,
                              52.215,
                              52.215,
                              52.2135,
                            ][pointIndex],
                            east: [
                              7.20002,
                              7.20002,
                              7.20006,
                              7.20006,
                            ][pointIndex],
                            up: 100,
                            colour: 9,
                            id: 'PNT${pointIndex + 17}',
                            horizontalAccuracy: 0,
                            verticalAccuracy: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                boundaryPolygon: Polygon(
                  type: PolygonType.partfieldBoundary,
                  designator: 'GuidanceBoundary',
                  area: 3334,
                  colour: 7,
                  id: 'PLN3',
                  lineStrings: [
                    LineString(
                      type: LineStringType.polygonExterior,
                      designator: 'Outer line',
                      width: 12121414,
                      length: 12231322,
                      colour: 8,
                      id: 'LSG5',
                      points: List.generate(
                        4,
                        (pointIndex) => Point(
                          type: PointType.flag,
                          designator: 'Marker${pointIndex + 9}',
                          north: [
                            52.213,
                            52.216,
                            52.216,
                            52.213,
                          ][pointIndex],
                          east: [
                            7.20001,
                            7.20001,
                            7.20007,
                            7.20007,
                          ][pointIndex],
                          up: 100,
                          colour: 9,
                          id: 'PNT${pointIndex + 9}',
                          horizontalAccuracy: 0,
                          verticalAccuracy: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ][index],
        ),
      ),
      products: List.generate(
        3,
        (index) => Product(
          id: 'PDT${index + 1}',
          designator: ['Schnecken', 'Korn', 'Schneckenkorn'][index],
          groupIdRef: 'PGP1',
          valuePresentationIdRef: 'VPN1',
          quantityDDI: ['0001', '0006', '0006'][index],
          type: [
            ProductType.single,
            ProductType.single,
            ProductType.mixture,
          ][index],
          mixtureRecipeQuantity: [800, 1000, 1800][index],
          densityMassPerVolume: 100,
          densityMassPerCount: 1234,
          relations: [
            null,
            null,
            [
              ProductRelation(
                productIdRef: 'PDT1',
                quantityValue: 800,
              ),
              ProductRelation(productIdRef: 'PDT2', quantityValue: 1000),
            ],
          ][index],
        ),
      ),
      productGroups: [
        ProductGroup(
          id: 'PGP1',
          designator: 'Zutaten für Schneckenkorn',
          type: ProductGroupType.productGroupDefault,
        ),
      ],
      tasks: [
        Task(
          id: 'TSK1',
          designator: 'Task 1',
          customerIdRef: 'CTR1',
          farmIdRef: 'FRM1',
          partfieldIdRef: 'PFD1',
          responsibleWorkerIdRef: 'WKR1',
          status: TaskStatus.completed,
          defaultTreatmentZoneCode: 0,
          positionLostTreatmentZoneCode: 0,
          outOfFieldTreatmentZoneCode: 1,
          operationTechniquePractice: OperationTechniquePractice(
            culturalPracticeIdRef: 'CPC1',
            operationTechniqueIdRef: 'OTQ1',
          ),
          controlAssignments: [
            ControlAssignment(
              sourceClientNAME: 'A00086000F300842',
              userClientNAME: 'A00086000D300841',
              sourceDeviceStructureLabel: '00000220000000',
              userDeviceStructureLabel: '00000330000000',
              sourceDeviceElementNumber: 1,
              userDeviceElementNumber: 1,
              processDataDDI: '0001',
              allocationStamp: AllocationStamp(
                start: DateTime.utc(2021, 3, 18, 22),
                type: AllocationStampType.planned,
              ),
            ),
          ],
          commentAllocations: List.generate(
            3,
            (index) => CommentAllocation(
              codedCommentIdRef: index == 0 ? 'CCT1' : null,
              codedCommentListValueIdRef: index == 1 ? 'CCL1' : null,
              freeCommentText: index == 2 ? 'Driver wrote this' : null,
              allocationStamp: AllocationStamp(
                start: DateTime.utc(2021, 3, 18, 22),
                stop: DateTime.utc(2021, 3, 18, 23),
                type: AllocationStampType.effective,
                position: List.generate(
                  2,
                  (index) => Position(
                    north: 52.3,
                    east: [7.25, 7.27][index],
                    up: 124,
                    status: PositionStatus.rtkFixedInteger,
                    pdop: [65.2, 65.1][index],
                    hdop: 12.3,
                    numberOfSatellites: 14,
                    gpsUtcTimeMs: [123455, 124495][index],
                    gpsUtcDate: 12222,
                  ),
                ),
              ),
            ),
          ),
          connections: [
            Connection(
              deviceIdRef_0: 'DVC-1',
              deviceElementIdRef_0: 'DET-3',
              deviceIdRef_1: 'DVC-2',
              deviceElementIdRef_1: 'DET-6',
            ),
          ],
          dataLogTriggers: List.generate(
            3,
            (index) => DataLogTrigger(
              ddi: ['DFFF', '00D4', 'DFFE'][index],
              method: 31,
              distanceInterval: [null, 300, 300][index],
              timeInterval: [null, 20, 20][index],
              thresholdMinimum: [null, 14, 14][index],
              thresholdMaximum: [null, 1800, 1800][index],
              thresholdChange: [null, 2, 2][index],
              deviceElementIdRef: [null, 'DET-1', 'DET-1'][index],
              valuePresentationIdRef: [null, 'VPN1', 'VPN1'][index],
              pgn: [null, null, 1242][index],
              pgnStartBit: [null, null, 1][index],
              pgnStopBit: [null, null, 5][index],
            ),
          ),
          deviceAllocations: List.generate(
            2,
            (index) => DeviceAllocation(
              clientNAMEValue: 'A00086000D300841',
              clientNAMEMask: 'FFFFFFFFFFFFFFFF',
              deviceIdRef: 'DVC-1',
              allocationStamp: AllocationStamp(
                start: DateTime.utc(2021, 3, 18, [21, 22][index]),
                stop: [null, DateTime.utc(2021, 3, 18, 23)][index],
                duration: [500, null][index],
                type: AllocationStampType.effective,
                position: List.generate(
                  2,
                  (index) => Position(
                    north: 52.3,
                    east: [7.25, 7.27][index],
                    up: 124,
                    status: PositionStatus.rtkFixedInteger,
                    pdop: [65.2, 65.1][index],
                    hdop: 12.3,
                    numberOfSatellites: 14,
                    gpsUtcTimeMs: [123455, 124495][index],
                    gpsUtcDate: 12222,
                  ),
                ),
              ),
            ),
          ),
          guidanceAllocations: [
            GuidanceAllocation(
              allocationStamps: [
                AllocationStamp(
                  start: DateTime.utc(2021, 3, 17, 22, 5),
                  type: AllocationStampType.planned,
                ),
              ],
              groupIdRef: 'GGP1',
              shifts: [
                GuidanceShift(
                  groupIdRef: 'GGP1',
                  patternIdRef: 'GPN1',
                  eastShift: 100,
                  northShift: 200,
                  propagationOffset: 20,
                  allocationStamp: AllocationStamp(
                    start: DateTime.utc(2021, 3, 18, 23),
                    type: AllocationStampType.planned,
                  ),
                ),
              ],
            ),
          ],
          productAllocations: List.generate(
            2,
            (index) => ProductAllocation(
              productIdRef: 'PDT3',
              quantityDDI: '0001',
              quantityValue: 400,
              transferMode: [
                TransferMode.filling,
                TransferMode.emptying,
              ][index],
              deviceElementIdRef: 'DET-1',
              valuePresentationIdRef: 'VPN1',
              allocationStamp: AllocationStamp(
                start: DateTime.utc(
                  2021,
                  3,
                  18,
                  [21, 22][index],
                ),
                stop: [null, DateTime.utc(2021, 3, 18, 23)][index],
                duration: [500, null][index],
                type: AllocationStampType.effective,
              ),
            ),
          ),
          times: List.generate(
            2,
            (index) => Time(
              start: DateTime.utc(2021, 3, 18, 21),
              stop: [DateTime.utc(2021, 3, 18, 23, 5), null][index],
              duration: [null, 400][index],
              type: [TimeType.planned, TimeType.effective][index],
              positions: List.generate(
                2,
                (positionIndex) => Position(
                  north: 52.3,
                  east: [7.25, 7.27][positionIndex],
                  up: 124,
                  status: PositionStatus.rtkFixedInteger,
                  pdop: 65.5,
                  hdop: 12.3,
                  numberOfSatellites: 14,
                  gpsUtcTimeMs: [123455, 124495][positionIndex],
                  gpsUtcDate: 12222,
                ),
              ),
              dataLogValues: [
                null,
                List.generate(
                  2,
                  (dataLogValueIndex) => DataLogValue(
                    processDataDDI: ['00D4', 'DFFE'][dataLogValueIndex],
                    processDataValue: [4321, 568][dataLogValueIndex],
                    deviceElementIdRef: 'DET-1',
                    pgn: [null, 1424][dataLogValueIndex],
                    pgnStartBit: [null, 1][dataLogValueIndex],
                    pgnStopBit: [null, 4][dataLogValueIndex],
                  ),
                ),
              ][index],
            ),
          ),
          workerAllocations: List.generate(
            2,
            (index) => WorkerAllocation(
              workerIdRef: 'WKR1',
              allocationStamp: AllocationStamp(
                start: DateTime.utc(2021, 3, 18, [21, 22][index]),
                stop: [null, DateTime.utc(2021, 3, 18, 23)][index],
                duration: [500, null][index],
                type: AllocationStampType.effective,
                position: List.generate(
                  2,
                  (positionIndex) => Position(
                    north: 52.3,
                    east: [7.25, 7.27][positionIndex],
                    up: 124,
                    status: PositionStatus.rtkFixedInteger,
                    pdop: [65.2, 65.1][positionIndex],
                    hdop: 12.3,
                    numberOfSatellites: 14,
                    gpsUtcTimeMs: [123455, 124495][positionIndex],
                    gpsUtcDate: 12222,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
      taskControllerCapabilities: [
        TaskControllerCapabilities(
          functionNAME: 'A0008F000F300DDD',
          designator: 'isoxml_dart',
          versionNumber: VersionNumber.e2fdis,
          providedCapabilities: 63,
          numberOfBoomsSectionControl: 1,
          numberOfSectionsSectionControl: 2,
          numberOfControlChannels: 3,
        ),
      ],
      valuePresentations: [
        ValuePresentation(
          id: 'VPN1',
          offset: 0,
          scale: 0.0001,
          numberOfDecimals: 4,
          unitDesignator: 'l/ha',
          colourLegendIdRef: 'CLD1',
        ),
      ],
      workers: [
        Worker(
          id: 'WKR1',
          lastName: 'Driver',
          firstName: 'Peter',
          street: 'ExampleRoad',
          poBox: '12345',
          postalCode: '48485',
          city: 'Newchurch',
          state: 'NRW',
          country: 'Germany',
          phone: '01189998819101187253',
          mobile: '01189998819101187254',
          licenseNumber: '01189998819101187153',
          email: 'driver@examplemail.com',
        ),
      ],
    );

    test(
      'Check task data parsing',
      () {
        expect(taskData.toString(), manuallyEnteredData.toString());
      },
    );
  });
  test(
    'Export document to string, check if equal to input string',
    () => expect(
      taskData?.toSingleXmlDocument().toXmlString(
            pretty: true,
            indent: '    ',
          ),
      dataString,
    ),
  );
}
