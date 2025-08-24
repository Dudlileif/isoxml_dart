// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Allow catching all errors and exceptions
// ignore_for_file: avoid_catches_without_on_clauses

@TestOn('dart2js')
library;

import 'dart:typed_data';

import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:isoxml_dart/src/lossy_web_int64.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  final doc = XmlDocument.parse(docString);
  final mapped = doc.childElements.map(Iso11783Element.fromXmlElement).toList();
  final taskData = Iso11783TaskData.fromXmlDocument(doc);

  group('Verify parsed document', () {
    test(
      'Check that all elements are parsed',
      () => expect(mapped.length, doc.childElements.length),
    );

    test(
      'Check that first element is Iso11783TaskData',
      () => expect(taskData, isA<Iso11783TaskData>()),
    );
    taskData!;
    test(
      'Check task data attributes',
      () => expect(
        (
          taskData.versionMajor,
          taskData.versionMinor,
          taskData.dataTransferOrigin,
          taskData.managementSoftwareManufacturer,
          taskData.managementSoftwareVersion,
          taskData.taskControllerManufacturer,
          taskData.taskControllerVersion,
        ),
        (
          VersionMajor.four,
          VersionMinor.two,
          DataTransferOrigin.fmis,
          'test',
          '1.0',
          'SomeOne',
          '1234',
        ),
      ),
    );

    test(
      'Check task data element count for each type',
      () => expect(
        (
          taskData.attachedFiles.length,
          taskData.baseStations.length,
          taskData.codedCommentGroups.length,
          taskData.codedComments.length,
          taskData.colourLegends.length,
          taskData.cropTypes.length,
          taskData.culturalPractices.length,
          taskData.customers.length,
          taskData.devices.length,
          taskData.externalFileReferences.length,
          taskData.farms.length,
          taskData.operationTechniques.length,
          taskData.partfields.length,
          taskData.products.length,
          taskData.productGroups.length,
          taskData.tasks.length,
          taskData.taskControllerCapabilities.length,
          taskData.valuePresentations.length,
          taskData.workers.length,
        ),
        (1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 1, 1, 2, 3, 1, 1, 1, 1, 1),
      ),
    );

    test(
      'Check the attached file attributes',
      () {
        final attachedFile = taskData.attachedFiles.first;
        expect(
          (
            attachedFile.filenameWithExtension,
            attachedFile.preserve,
            attachedFile.manufacturerGLN,
            attachedFile.fileType,
            attachedFile.fileVersion,
            attachedFile.fileLength,
          ),
          (
            'TEST1234.BIN',
            Preserve.preserve,
            '0614141000111',
            128,
            'V1',
            400,
          ),
        );
      },
    );

    test(
      'Check the base station attributes',
      () {
        final baseStation = taskData.baseStations.first;
        expect(
          (
            baseStation.id,
            baseStation.designator,
            baseStation.north,
            baseStation.east,
            baseStation.up,
          ),
          (
            'BSN1',
            'GlonassBaseStation',
            52.34424,
            7.234353,
            400,
          ),
        );
      },
    );

    test(
      'Check the coded comment attributes and children list elements',
      () {
        final codedComment = taskData.codedComments.first;
        expect(
          (
            codedComment.id,
            codedComment.designator,
            codedComment.scope,
            codedComment.groupIdRef,
            (
              codedComment.listValues.first.id,
              codedComment.listValues.elementAt(1).id,
              codedComment.listValues.elementAt(2).id,
            ),
            (
              codedComment.listValues.first.designator,
              codedComment.listValues.elementAt(1).designator,
              codedComment.listValues.elementAt(2).designator,
            ),
          ),
          (
            'CCT1',
            'Emoji comments',
            CodedCommmentScope.point,
            'CCG1',
            ('CCL1', 'CCL2', 'CCL3'),
            (':)', ':(', ':D'),
          ),
        );
      },
    );

    test(
      'Check the coded comment group attributes',
      () {
        final codedCommentGroup = taskData.codedCommentGroups.first;
        expect(
          (codedCommentGroup.id, codedCommentGroup.designator),
          ('CCG1', 'InternetMemes'),
        );
      },
    );

    test(
      'Check the colour legend attributes and child range elemens',
      () {
        final colourLegend = taskData.colourLegends.first;
        expect(
          (
            colourLegend.id,
            colourLegend.defaultColour,
            (
              colourLegend.ranges.first.minimumValue,
              colourLegend.ranges.elementAt(1).minimumValue,
              colourLegend.ranges.elementAt(2).minimumValue,
              colourLegend.ranges.elementAt(3).minimumValue,
            ),
            (
              colourLegend.ranges.first.maximumValue,
              colourLegend.ranges.elementAt(1).maximumValue,
              colourLegend.ranges.elementAt(2).maximumValue,
              colourLegend.ranges.elementAt(3).maximumValue,
            ),
            (
              colourLegend.ranges.first.colour,
              colourLegend.ranges.elementAt(1).colour,
              colourLegend.ranges.elementAt(2).colour,
              colourLegend.ranges.elementAt(3).colour,
            ),
          ),
          (
            'CLD1',
            1,
            (0, 301, 601, 901),
            (300, 600, 900, 1300),
            (1, 2, 3, 4),
          ),
        );
      },
    );

    test(
      'Check the crop type attributes and child varieties elements',
      () {
        final cropType = taskData.cropTypes.first;
        expect(
          (
            cropType.id,
            cropType.designator,
            cropType.productGroupIdRef,
            (cropType.varieties.first.id, cropType.varieties.last.id),
            (
              cropType.varieties.first.designator,
              cropType.varieties.last.designator,
            ),
            (
              cropType.varieties.first.productIdRef,
              cropType.varieties.last.productIdRef,
            ),
          ),
          (
            'CTP1',
            'Corn',
            'PGP1',
            ('CVT1', 'CVT2'),
            ('PopCorn', 'Golden Bantam'),
            ('PDT1', 'PDT1'),
          ),
        );
      },
    );

    test(
      '''Check the cultural practice attribues and operation technique id reference''',
      () {
        final culturalPractice = taskData.culturalPractices.first;
        expect(
          (
            culturalPractice.id,
            culturalPractice.designator,
            culturalPractice
                .operationTechniqueReferences
                .first
                .operationTechniqueIdRef,
          ),
          ('CPC1', 'Drilling', 'OTQ1'),
        );
      },
    );

    test(
      'Check the customer attributes',
      () {
        final customer = taskData.customers.first;
        expect(
          (
            customer.id,
            customer.lastName,
            customer.firstName,
            customer.street,
            customer.poBox,
            customer.postalCode,
            customer.city,
            customer.state,
            customer.country,
            customer.phone,
            customer.mobile,
            customer.fax,
            customer.email,
          ),
          (
            'CTR1',
            'Meyer',
            'Peter',
            'ExampleRoad',
            '12345',
            '48485',
            'Neuenkirchen',
            'NRW',
            'Germany',
            '01189998819101187253',
            '01189998819101187254',
            '01189998819101187153',
            'tester@examplemail.com',
          ),
        );
      },
    );

    group('Test device elements', () {
      test(
        'Check the count of device elements',
        () => expect(taskData.devices.length, 2),
      );
      final deviceAttributes = [
        (
          'DVC-1',
          'SuperBaler',
          'V1.1',
          'A00086000D300841',
          '123453',
          '00000330000000',
          'FF000000006564',
        ),
        (
          'DVC-2',
          'SuperTractor',
          'V1.1',
          'A00086000F300842',
          '123455',
          '00000220000000',
          'FF000000006564',
        ),
      ];

      for (final (deviceIndex, device) in taskData.devices.indexed) {
        group('Test device${deviceIndex + 1}', () {
          test(
            'Check device attributes',
            () => expect(
              (
                device.id,
                device.designator,
                device.softwareVersion,
                device.clientNAME,
                device.serialNumber,
                device.structureLabel,
                device.localizationLabel,
              ),
              deviceAttributes[deviceIndex],
            ),
          );

          test(
            'Check count of $DeviceElement children',
            () => expect(device.elements.length, 3),
          );
          group(
            'Test $DeviceElement children',
            () {
              for (final (index, element) in device.elements.indexed) {
                test(
                  'Check device element${index + 1} attributes',
                  () => expect(
                    (
                      element.id,
                      element.objectId,
                      element.type,
                      element.designator,
                      element.number,
                      element.parentObjectId,
                    ),
                    (
                      'DET-${deviceIndex * 3 + 1 + index}',
                      index + 1,
                      [
                        DeviceElementType.device,
                        DeviceElementType.function,
                        DeviceElementType.connector,
                      ][index],
                      ['MainDevice', 'SubFunction', 'Connector'][index],
                      [
                        [1, 2, 3],
                        [0, 1, 3],
                      ][deviceIndex][index],
                      [
                        [0, 1, 1],
                        [0, 0, 1],
                      ][deviceIndex][index],
                    ),
                  ),
                );
                test(
                  '''Check device element${index + 1} count of $DeviceObjectReference children''',
                  () => expect(
                    element.objectReferences.length,
                    [2, 1, 2][index],
                  ),
                );
                test(
                  '''Check device element${index + 1} $DeviceObjectReference children attributes''',
                  () => expect(
                    switch (index) {
                      1 => element.objectReferences.first.objectId,
                      _ => (
                        element.objectReferences.first.objectId,
                        element.objectReferences.last.objectId,
                      ),
                    },
                    switch (index) {
                      0 => (10, 50),
                      1 => 11,
                      _ => (52, 53),
                    },
                  ),
                );
              }
            },
          );
          test(
            'Check count of $DeviceProcessData children',
            () => expect(device.processData.length, 2),
          );
          group(
            'Test $DeviceProcessData children',
            () {
              for (final (index, processData) in device.processData.indexed) {
                test(
                  '''Check process data${index + 1} attributes''',
                  () => expect(
                    (
                      processData.objectId,
                      processData.ddi,
                      processData.property,
                      processData.triggerMethods,
                      processData.designator,
                      processData.presentationObjectId,
                    ),
                    (
                      [10, 11][index],
                      [
                        ['00D4', '01E2'][deviceIndex],
                        '0066',
                      ][index],
                      1,
                      31,
                      ['Last Bale Moisture', 'Actual Bale Length'][index],
                      [100, 101][index],
                    ),
                  ),
                );
              }
            },
          );
          test(
            'Check count of $DeviceProperty children',
            () => expect(device.properties.length, 3),
          );
          group(
            'Test $DeviceProperty children',
            () {
              for (final (index, property) in device.properties.indexed) {
                test(
                  '''Check property${index + 1} attributes''',
                  () => expect(
                    (
                      property.objectId,
                      property.ddi,
                      property.value,
                      property.designator,
                      property.valuePresentationObjectId,
                    ),
                    (
                      [50, 52, 53][index],
                      ['0073', '0086', '0087'][index],
                      [1400, 1000, 500][index],
                      ['Maximum Bale Width', 'OffsetX', 'OffsetY'][index],
                      101,
                    ),
                  ),
                );
              }
            },
          );

          test(
            'Check count of $ValuePresentation children',
            () => expect(device.valuePresentations.length, 2),
          );
          group(
            'Test $ValuePresentation children',
            () {
              for (final (index, valuePresentation)
                  in device.valuePresentations.indexed) {
                test(
                  '''Check valuePresentation${index + 1} attributes''',
                  () => expect(
                    (
                      valuePresentation.objectId,
                      valuePresentation.offset,
                      valuePresentation.scale,
                      valuePresentation.numberOfDecimals,
                      valuePresentation.unitDesignator,
                    ),
                    (
                      [100, 101][index],
                      0,
                      [0.00001, 0.001][index],
                      [1, 2][index],
                      ['%', 'm'][index],
                    ),
                  ),
                );
              }
            },
          );
        });
      }
    });

    test('Check the farm attributes', () {
      final farm = taskData.farms.first;

      expect(
        (
          farm.id,
          farm.designator,
          farm.street,
          farm.poBox,
          farm.postalCode,
          farm.city,
          farm.state,
          farm.country,
          farm.customerIdRef,
        ),
        (
          'FRM1',
          'Peters Farm',
          'Example Road 1',
          '1234252',
          '48432',
          'Mesum',
          'NRW',
          'Germany',
          'CTR1',
        ),
      );
    });

    test('Check the operation technique attributes', () {
      final operationTechnique = taskData.operationTechniques.first;
      expect(
        (operationTechnique.id, operationTechnique.designator),
        ('OTQ1', 'Deep Drilling'),
      );
    });

    group('Test partfield elements', () {
      test(
        'Check the count of $Partfield elments',
        () => expect(taskData.partfields.length, 2),
      );
      for (final (index, partfield) in taskData.partfields.indexed) {
        group('Test partfield${index + 1}', () {
          test(
            'Check partfield${index + 1} attributes',
            () => expect(
              (
                partfield.id,
                partfield.code,
                partfield.designator,
                partfield.area,
                partfield.customerIdRef,
                partfield.farmIdRef,
                partfield.cropTypeIdRef,
                partfield.cropVarietyIdRef,
                partfield.fieldIdRef,
              ),
              (
                'PFD${index + 1}',
                'FD${123 + index}',
                'Near the Highway${index == 0 ? '' : ' Subfield'}',
                [13334, 3334][index],
                'CTR1',
                'FRM1',
                'CTP1',
                'CVT1',
                [null, 'PFD1'][index],
              ),
            ),
          );
          if (index == 1) {
            group('Test partfield2 children elements', () {
              final partfield = taskData.partfields.last;
              final fieldBorder = partfield.polygons.first;
              test(
                'Check $Polygon attributes',
                () => expect(
                  (
                    fieldBorder.type,
                    fieldBorder.designator,
                    fieldBorder.area,
                    fieldBorder.colour,
                    fieldBorder.id,
                  ),
                  (
                    PolygonType.partfieldBoundary,
                    'Field Border',
                    3334,
                    7,
                    'PLN1',
                  ),
                ),
              );

              final borderLineString = fieldBorder.lineStrings.first;
              test(
                'Check polygon child $LineString attributes ',
                () => expect(
                  (
                    borderLineString.type,
                    borderLineString.designator,
                    borderLineString.width,
                    borderLineString.length,
                    borderLineString.colour,
                    borderLineString.id,
                  ),
                  (
                    LineStringType.polygonExterior,
                    'Outer line',
                    12121414,
                    12231322,
                    8,
                    'LSG1',
                  ),
                ),
              );
              test(
                'Check linestring count of $Point children',
                () => expect(borderLineString.points.length, 4),
              );

              group(
                'Test linestring points',
                () {
                  for (final (pointIndex, point)
                      in borderLineString.points.indexed) {
                    test(
                      'Test point${pointIndex + 1} attributes',
                      () => expect(
                        (
                          point.type,
                          point.designator,
                          point.north,
                          point.east,
                          point.up,
                          point.colour,
                          point.id,
                          point.horizontalAccuracy,
                          point.verticalAccuracy,
                        ),
                        (
                          PointType.flag,
                          'Marker${pointIndex + 1}',
                          [52.213, 52.216, 52.216, 52.213][pointIndex],
                          [7.20001, 7.20001, 7.20007, 7.20007][pointIndex],
                          100,
                          9,
                          'PNT${pointIndex + 1}',
                          0,
                          1,
                        ),
                      ),
                    );
                  }
                },
              );

              test('Check entry point attributes', () {
                final entryPoint = partfield.points.first;
                expect(
                  (
                    entryPoint.type,
                    entryPoint.designator,
                    entryPoint.north,
                    entryPoint.east,
                    entryPoint.up,
                    entryPoint.colour,
                    entryPoint.id,
                    entryPoint.horizontalAccuracy,
                    entryPoint.verticalAccuracy,
                  ),
                  (
                    PointType.fieldAccess,
                    'Entry',
                    52.214,
                    7.20007,
                    100,
                    9,
                    'PNT21',
                    0,
                    1,
                  ),
                );
              });

              group('Test outer linestring element', () {
                final outerLineString = partfield.lineStrings.first;
                test(
                  'Check outer linestring attributes',
                  () => expect(
                    (
                      outerLineString.type,
                      outerLineString.designator,
                      outerLineString.width,
                      outerLineString.length,
                      outerLineString.colour,
                      outerLineString.id,
                    ),
                    (
                      LineStringType.samplingRoute,
                      'Outer line',
                      12121414,
                      12231322,
                      8,
                      'LSG2',
                    ),
                  ),
                );
                test(
                  'Check outer linestring number of points',
                  () => expect(outerLineString.points.length, 4),
                );

                group(
                  'Test points attributes',
                  () {
                    for (final (pointIndex, point)
                        in outerLineString.points.indexed) {
                      test(
                        'Check point${pointIndex + 1} attributes',
                        () => expect(
                          (
                            point.type,
                            point.designator,
                            point.north,
                            point.east,
                            point.up,
                            point.colour,
                            point.id,
                            point.horizontalAccuracy,
                            point.verticalAccuracy,
                          ),
                          (
                            PointType.flag,
                            'Marker${pointIndex + 5}',
                            [52.2135, 52.215, 52.215, 52.2135][pointIndex],
                            [7.20002, 7.20002, 7.20006, 7.20006][pointIndex],
                            100,
                            9,
                            'PNT${pointIndex + 5}',
                            0,
                            1,
                          ),
                        ),
                      );
                    }
                  },
                );
              });

              group('Test guidance group element', () {
                final guidanceGroup = partfield.guidanceGroups.first;
                test(
                  'Check guidance group attributes',
                  () => expect(
                    (guidanceGroup.id, guidanceGroup.designator),
                    ('GGP1', 'Guidance for sampling'),
                  ),
                );

                group('Test guidance pattern element', () {
                  final guidancePattern = guidanceGroup.patterns.first;

                  test(
                    'Check guidance pattern attributes',
                    () => expect(
                      (
                        guidancePattern.id,
                        guidancePattern.designator,
                        guidancePattern.type,
                        guidancePattern.options,
                        guidancePattern.propagationDirection,
                        guidancePattern.extension,
                        guidancePattern.heading,
                        guidancePattern.radius,
                        guidancePattern.gnssMethod,
                        guidancePattern.horizontalAccuracy,
                        guidancePattern.verticalAccuracy,
                        guidancePattern.baseStationIdRef,
                        guidancePattern.originalSRID,
                        guidancePattern.numberOfSwathsLeft,
                        guidancePattern.numberOfSwathsRight,
                      ),
                      (
                        'GPN1',
                        'GuidancePattern',
                        GuidancePatternType.ab,
                        GuidancePatternOptions.clockwise,
                        GuidancePatternPropagationDirection.both,
                        GuidancePatternExtension.fromBoth,
                        30,
                        400,
                        GuidancePatternGnssMethod.rtkFixedInteger,
                        5,
                        5.1,
                        'BSN1',
                        'EPSG:4326',
                        5,
                        8,
                      ),
                    ),
                  );

                  final guidanceFieldBorder = guidancePattern.boundaryPolygon!;
                  test(
                    'Check guidance pattern field boundary polyogn attributes',
                    () => expect(
                      (
                        guidanceFieldBorder.type,
                        guidanceFieldBorder.designator,
                        guidanceFieldBorder.area,
                        guidanceFieldBorder.colour,
                        guidanceFieldBorder.id,
                      ),
                      (
                        PolygonType.partfieldBoundary,
                        'Field Border',
                        3334,
                        7,
                        'PLN2',
                      ),
                    ),
                  );

                  final guidanceBorderLineString =
                      guidanceFieldBorder.lineStrings.first;
                  test(
                    '''Check guidance pattern field border polygon linestring attributes''',
                    () => expect(
                      (
                        guidanceBorderLineString.type,
                        guidanceBorderLineString.designator,
                        guidanceBorderLineString.width,
                        guidanceBorderLineString.length,
                        guidanceBorderLineString.colour,
                        guidanceBorderLineString.id,
                      ),
                      (
                        LineStringType.polygonExterior,
                        'Outer line',
                        12121414,
                        12231322,
                        8,
                        'LSG3',
                      ),
                    ),
                  );
                  group(
                    'Check border linestring points',
                    () {
                      for (final (pointIndex, point)
                          in guidanceBorderLineString.points.indexed) {
                        test(
                          'Check point${pointIndex + 1} attributes',
                          () => expect(
                            (
                              point.type,
                              point.designator,
                              point.north,
                              point.east,
                              point.up,
                              point.colour,
                              point.id,
                              point.horizontalAccuracy,
                              point.verticalAccuracy,
                            ),
                            (
                              PointType.flag,
                              'Marker${pointIndex + 13}',
                              [52.213, 52.216, 52.216, 52.213][pointIndex],
                              [7.20001, 7.20001, 7.20007, 7.20007][pointIndex],
                              100,
                              9,
                              'PNT${pointIndex + 13}',
                              0,
                              1,
                            ),
                          ),
                        );
                      }
                    },
                  );

                  final guidanceOuterLineString =
                      guidancePattern.lineStrings.first;
                  test(
                    'Check guidance outer linestring attributes',
                    () => expect(
                      (
                        guidanceOuterLineString.type,
                        guidanceOuterLineString.designator,
                        guidanceOuterLineString.width,
                        guidanceOuterLineString.length,
                        guidanceOuterLineString.colour,
                        guidanceOuterLineString.id,
                      ),
                      (
                        LineStringType.samplingRoute,
                        'Outer line',
                        12121414,
                        12231322,
                        8,
                        'LSG4',
                      ),
                    ),
                  );
                  group(
                    'Check outer linestring points',
                    () {
                      for (final (pointIndex, point)
                          in guidanceOuterLineString.points.indexed) {
                        test(
                          'Check point${pointIndex + 1} attributes',
                          () => expect(
                            (
                              point.type,
                              point.designator,
                              point.north,
                              point.east,
                              point.up,
                              point.colour,
                              point.id,
                              point.horizontalAccuracy,
                              point.verticalAccuracy,
                            ),
                            (
                              PointType.flag,
                              'Marker${pointIndex + 17}',
                              [52.2135, 52.215, 52.215, 52.2135][pointIndex],
                              [7.20002, 7.20002, 7.20006, 7.20006][pointIndex],
                              100,
                              9,
                              'PNT${pointIndex + 17}',
                              0,
                              1,
                            ),
                          ),
                        );
                      }
                    },
                  );
                });

                group('Test polygon element', () {
                  final guidanceGroupPolygon = guidanceGroup.boundaryPolygon!;
                  test(
                    'Check polygon attributes',
                    () => expect(
                      (
                        guidanceGroupPolygon.type,
                        guidanceGroupPolygon.designator,
                        guidanceGroupPolygon.area,
                        guidanceGroupPolygon.colour,
                        guidanceGroupPolygon.id,
                      ),
                      (
                        PolygonType.partfieldBoundary,
                        'GuidanceBoundary',
                        3334,
                        7,
                        'PLN3',
                      ),
                    ),
                  );

                  final guidanceGroupPolygonLineString =
                      guidanceGroupPolygon.lineStrings.first;
                  test(
                    'Check polygon linestring attributes',
                    () => expect(
                      (
                        guidanceGroupPolygonLineString.type,
                        guidanceGroupPolygonLineString.designator,
                        guidanceGroupPolygonLineString.width,
                        guidanceGroupPolygonLineString.length,
                        guidanceGroupPolygonLineString.colour,
                        guidanceGroupPolygonLineString.id,
                      ),
                      (
                        LineStringType.polygonExterior,
                        'Outer line',
                        12121414,
                        12231322,
                        8,
                        'LSG5',
                      ),
                    ),
                  );
                  test(
                    'Check linestring number of points',
                    () =>
                        expect(guidanceGroupPolygonLineString.points.length, 4),
                  );
                  group(
                    'Test linestring points',
                    () {
                      for (final (pointIndex, point)
                          in guidanceGroupPolygonLineString.points.indexed) {
                        test(
                          'Check point${pointIndex + 1} attributes',
                          () => expect(
                            (
                              point.type,
                              point.designator,
                              point.north,
                              point.east,
                              point.up,
                              point.colour,
                              point.id,
                              point.horizontalAccuracy,
                              point.verticalAccuracy,
                            ),
                            (
                              PointType.flag,
                              'Marker${pointIndex + 9}',
                              [52.213, 52.216, 52.216, 52.213][pointIndex],
                              [7.20001, 7.20001, 7.20007, 7.20007][pointIndex],
                              100,
                              9,
                              'PNT${pointIndex + 9}',
                              0,
                              1,
                            ),
                          ),
                        );
                      }
                    },
                  );
                });
              });
            });
          }
        });
      }
    });

    group('Test product elements', () {
      test(
        'Check the number of product children',
        () => expect(taskData.products.length, 3),
      );
      for (final (index, product) in taskData.products.indexed) {
        test(
          'Check product${index + 1} attributes',
          () => expect(
            (
              product.id,
              product.designator,
              product.groupIdRef,
              product.valuePresentationIdRef,
              product.quantityDDI,
              product.type,
              product.mixtureRecipeQuantity,
              product.densityMassPerVolume,
              product.densityMassPerCount,
            ),
            (
              'PDT${index + 1}',
              ['Schnecken', 'Korn', 'Schneckenkorn'][index],
              'PGP1',
              'VPN1',
              ['0001', '0006', '0006'][index],
              [
                ProductType.single,
                ProductType.single,
                ProductType.mixture,
              ][index],
              [800, 1000, 1800][index],
              100,
              1234,
            ),
          ),
        );
      }
      final product = taskData.products.elementAt(2);
      test(
        'Check product2 number of relation children',
        () => expect(product.relations.length, 2),
      );
      group(
        'Test product2 relation children',
        () {
          for (final (index, relation) in product.relations.indexed) {
            test(
              'Check relation${index + 1} attributes',
              () => expect(
                (relation.productIdRef, relation.quantityValue),
                ('PDT${index + 1}', [800, 1000][index]),
              ),
            );
          }
        },
      );
    });

    test('Check product group attributes', () {
      final productGroup = taskData.productGroups.first;

      expect(
        (productGroup.id, productGroup.designator, productGroup.type),
        (
          'PGP1',
          'Zutaten für Schneckenkorn',
          ProductGroupType.productGroupDefault,
        ),
      );
    });

    group('Test task element', () {
      final task = taskData.tasks.first;
      test(
        'Check task attributions',
        () => expect(
          (
            task.id,
            task.designator,
            task.customerIdRef,
            task.farmIdRef,
            task.partfieldIdRef,
            task.responsibleWorkerIdRef,
            task.status,
            task.defaultTreatmentZoneCode,
            task.positionLostTreatmentZoneCode,
            task.outOfFieldTreatmentZoneCode,
          ),
          (
            'TSK1',
            'Task 1',
            'CTR1',
            'FRM1',
            'PFD1',
            'WKR1',
            TaskStatus.completed,
            0,
            0,
            1,
          ),
        ),
      );

      group('Test comment allocation elements', () {
        test(
          'Check number of comment allocation elements',
          () => expect(task.commentAllocations.length, 3),
        );

        test(
          "Check comment allocation elements' attributes",
          () => expect(
            (
              task.commentAllocations.first.codedCommentIdRef,
              task.commentAllocations.elementAt(1).codedCommentListValueIdRef,
              task.commentAllocations.elementAt(2).freeCommentText,
            ),
            ('CCT1', 'CCL1', 'Driver wrote this'),
          ),
        );
        group(
          "Test comment allocations' child allocation stamps",
          () {
            for (final (index, commentAllocation)
                in task.commentAllocations.indexed) {
              group('Test comment allocation${index + 1} allocation stamp', () {
                final stamp = commentAllocation.allocationStamp!;
                test(
                  'Check stamp attributes',
                  () => expect(
                    (stamp.start, stamp.stop, stamp.type),
                    (
                      DateTime.utc(2021, 3, 18, 22),
                      DateTime.utc(2021, 3, 18, 23),
                      AllocationStampType.effective,
                    ),
                  ),
                );
                test(
                  'Check stamp number of position children',
                  () => expect(stamp.position.length, 2),
                );

                group(
                  'Test stamp position elements',
                  () {
                    for (final (index, position) in stamp.position.indexed) {
                      test(
                        'Check position${index + 1} attributes',
                        () => expect(
                          (
                            position.north,
                            position.east,
                            position.up,
                            position.status,
                            position.pdop,
                            position.hdop,
                            position.numberOfSatellites,
                            position.gpsUtcTimeMs,
                            position.gpsUtcDate,
                          ),
                          (
                            52.3,
                            [7.25, 7.27][index],
                            124.0,
                            PositionStatus.rtkFixedInteger,
                            [65.2, 65.1][index],
                            12.3,
                            14,
                            [123455, 124495][index],
                            12222,
                          ),
                        ),
                      );
                    }
                  },
                );
              });
            }
          },
        );
      });

      group('Test device allocation elements', () {
        test(
          'Check number of device allocation elements',
          () => expect(task.deviceAllocations.length, 2),
        );

        group(
          "Test device allocations' attributes and child allocation stamps",
          () {
            for (final (index, deviceAllocation)
                in task.deviceAllocations.indexed) {
              group('Test device allocation elements${index + 1}', () {
                test(
                  'Check device allocation${index + 1} attributes',
                  () => expect(
                    (
                      deviceAllocation.clientNAMEValue,
                      deviceAllocation.clientNAMEMask,
                      deviceAllocation.deviceIdRef,
                    ),
                    ('A00086000D300841', 'FFFFFFFFFFFFFFFF', 'DVC-1'),
                  ),
                );

                final stamp = deviceAllocation.allocationStamp!;
                test(
                  'Check allocation stamp attributes',
                  () => expect(
                    (stamp.start, stamp.stop, stamp.duration, stamp.type),
                    (
                      DateTime.utc(2021, 3, 18, [21, 22][index]),
                      [null, DateTime.utc(2021, 3, 18, 23)][index],
                      [500, null][index],
                      AllocationStampType.effective,
                    ),
                  ),
                );
                test(
                  'Check number of position elements',
                  () => expect(stamp.position.length, 2),
                );
                group(
                  'Test position elements',
                  () {
                    for (final (index, position) in stamp.position.indexed) {
                      test(
                        'Check position${index + 1} attributes',
                        () => expect(
                          (
                            position.north,
                            position.east,
                            position.up,
                            position.status,
                            position.pdop,
                            position.hdop,
                            position.numberOfSatellites,
                            position.gpsUtcTimeMs,
                            position.gpsUtcDate,
                          ),
                          (
                            52.3,
                            [7.25, 7.27][index],
                            124.0,
                            PositionStatus.rtkFixedInteger,
                            [65.2, 65.1][index],
                            12.3,
                            14,
                            [123455, 124495][index],
                            12222,
                          ),
                        ),
                      );
                    }
                  },
                );
              });
            }
          },
        );
      });

      group('Test data log trigger elements', () {
        test(
          'Check number of data log trigger elements',
          () => expect(task.dataLogTriggers.length, 3),
        );
        group(
          "Test data log trigger elements' attributes",
          () {
            for (final (index, dataLogTrigger)
                in task.dataLogTriggers.indexed) {
              test(
                'Check data log trigger${index + 1} attributes',
                () => expect(
                  (
                    dataLogTrigger.ddi,
                    dataLogTrigger.method,
                    dataLogTrigger.distanceInterval,
                    dataLogTrigger.timeInterval,
                    dataLogTrigger.thresholdMinimum,
                    dataLogTrigger.thresholdMaximum,
                    dataLogTrigger.thresholdChange,
                    dataLogTrigger.deviceElementIdRef,
                    dataLogTrigger.valuePresentationIdRef,
                    dataLogTrigger.pgn,
                    dataLogTrigger.pgnStartBit,
                    dataLogTrigger.pgnStopBit,
                  ),
                  (
                    ['DFFF', '00D4', 'DFFE'][index],
                    31,
                    [null, 300, 300][index],
                    [null, 20, 20][index],
                    [null, 14, 14][index],
                    [null, 1800, 1800][index],
                    [null, 2, 2][index],
                    [null, 'DET-1', 'DET-1'][index],
                    [null, 'VPN1', 'VPN1'][index],
                    [null, null, 1242][index],
                    [null, null, 1][index],
                    [null, null, 5][index],
                  ),
                ),
              );
            }
          },
        );
      });

      group('Test guidance allocation element', () {
        final guidanceAllocation = task.guidanceAllocations.first;
        test(
          'Check guidance allocation attributes',
          () => expect(guidanceAllocation.groupIdRef, 'GGP1'),
        );

        test('Check allocation stamp attributes', () {
          final guidanceAllocationStamp =
              guidanceAllocation.allocationStamps.first;
          expect(
            (guidanceAllocationStamp.start, guidanceAllocationStamp.type),
            (DateTime.utc(2021, 3, 17, 22, 5), AllocationStampType.planned),
          );
        });

        group('Test guidance shift element', () {
          final guidanceShift = guidanceAllocation.shifts.first;

          test(
            'Check guidance shift attributes',
            () => expect(
              (
                guidanceShift.groupIdRef,
                guidanceShift.patternIdRef,
                guidanceShift.eastShift,
                guidanceShift.northShift,
                guidanceShift.propagationOffset,
              ),
              (
                'GGP1',
                'GPN1',
                100,
                200,
                20,
              ),
            ),
          );
          test('Check guidance shift allocation stamp attributes', () {
            final shiftStamp = guidanceShift.allocationStamp!;

            expect(
              (shiftStamp.start, shiftStamp.type),
              (DateTime.utc(2021, 3, 18, 23), AllocationStampType.planned),
            );
          });
        });
      });

      test('Check oper tech practice attributes', () {
        final operationTechniquePractice = task.operationTechniquePractice!;
        expect(
          (
            operationTechniquePractice.culturalPracticeIdRef,
            operationTechniquePractice.operationTechniqueIdRef,
          ),
          (
            'CPC1',
            'OTQ1',
          ),
        );
      });

      group('Test product allocation elements', () {
        test(
          'Check number of product allocation elements',
          () => expect(task.productAllocations.length, 2),
        );
        for (final (index, allocation) in task.productAllocations.indexed) {
          group('Test product allocation${index + 1}', () {
            test(
              'Check product allocation attributes',
              () => expect(
                (
                  allocation.productIdRef,
                  allocation.quantityDDI,
                  allocation.quantityValue,
                  allocation.transferMode,
                  allocation.deviceElementIdRef,
                  allocation.valuePresentationIdRef,
                ),
                (
                  'PDT3',
                  '0001',
                  400,
                  [TransferMode.filling, TransferMode.emptying][index],
                  'DET-1',
                  'VPN1',
                ),
              ),
            );

            test('Check allocation stamp attributes', () {
              final stamp = allocation.allocationStamp!;
              expect(
                (stamp.start, stamp.stop, stamp.duration, stamp.type),
                (
                  DateTime.utc(
                    2021,
                    3,
                    18,
                    [21, 22][index],
                  ),
                  [null, DateTime.utc(2021, 3, 18, 23)][index],
                  [500, null][index],
                  AllocationStampType.effective,
                ),
              );
            });
          });
        }
      });

      group('Test time elements', () {
        test(
          'Check number of time elements',
          () => expect(task.times.length, 2),
        );
        for (final (index, time) in task.times.indexed) {
          group('Test time${index + 1}', () {
            test(
              'Check time attributes',
              () => expect(
                (time.start, time.stop, time.duration, time.type),
                (
                  DateTime.utc(2021, 3, 18, 21),
                  [DateTime.utc(2021, 3, 18, 23, 5), null][index],
                  [null, 400][index],
                  [TimeType.planned, TimeType.effective][index],
                ),
              ),
            );
            if (index != 0) {
              test(
                'Check number of position elements',
                () => expect(time.positions.length, 2),
              );
              group(
                'Test position elements',
                () {
                  for (final (positionIndex, position)
                      in time.positions.indexed) {
                    test(
                      'Check position${positionIndex + 1} attributes',
                      () => expect(
                        (
                          position.north,
                          position.east,
                          position.up,
                          position.status,
                          position.pdop,
                          position.hdop,
                          position.numberOfSatellites,
                          position.gpsUtcTimeMs,
                          position.gpsUtcDate,
                        ),
                        (
                          52.3,
                          [7.25, 7.27][positionIndex],
                          124.0,
                          PositionStatus.rtkFixedInteger,
                          65.5,
                          12.3,
                          14,
                          [123455, 124495][positionIndex],
                          12222,
                        ),
                      ),
                    );
                  }
                },
              );

              group('Test data log value elements', () {
                test(
                  'Check number of data log value elements',
                  () => expect(time.dataLogValues.length, 2),
                );
                for (final (dataLogValueIndex, dataLogValue)
                    in time.dataLogValues.indexed) {
                  test(
                    'Check data log value${dataLogValueIndex + 1} attributes',
                    () => expect(
                      (
                        dataLogValue.processDataDDI,
                        dataLogValue.processDataValue,
                        dataLogValue.deviceElementIdRef,
                        dataLogValue.pgn,
                        dataLogValue.pgnStartBit,
                        dataLogValue.pgnStopBit,
                      ),
                      (
                        ['00D4', 'DFFE'][dataLogValueIndex],
                        [4321, 568][dataLogValueIndex],
                        'DET-1',
                        [null, 1424][dataLogValueIndex],
                        [null, 1][dataLogValueIndex],
                        [null, 4][dataLogValueIndex],
                      ),
                    ),
                  );
                }
              });
            }
          });
        }
      });

      group('Test worker allocation elements', () {
        test(
          'Check number of worker allocation elements',
          () => expect(task.workerAllocations.length, 2),
        );
        for (final (index, workerAllocation)
            in task.workerAllocations.indexed) {
          group('Test worker allocation${index + 1}', () {
            test(
              'Check worker allocation attributes',
              () => expect(workerAllocation.workerIdRef, 'WKR1'),
            );

            group('Test allocation stamp', () {
              final stamp = workerAllocation.allocationStamp!;
              test(
                'Check allocation stamp attributes',
                () => expect(
                  (stamp.start, stamp.stop, stamp.duration, stamp.type),
                  (
                    DateTime.utc(2021, 3, 18, [21, 22][index]),
                    [null, DateTime.utc(2021, 3, 18, 23)][index],
                    [500, null][index],
                    AllocationStampType.effective,
                  ),
                ),
              );

              test(
                'Check number of position elements',
                () => expect(stamp.position.length, 2),
              );
              group(
                'Test position elements',
                () {
                  for (final (positionIndex, position)
                      in stamp.position.indexed) {
                    test(
                      'Check position${positionIndex + 1} attributes',
                      () => expect(
                        (
                          position.north,
                          position.east,
                          position.up,
                          position.status,
                          position.pdop,
                          position.hdop,
                          position.numberOfSatellites,
                          position.gpsUtcTimeMs,
                          position.gpsUtcDate,
                        ),
                        (
                          52.3,
                          [7.25, 7.27][positionIndex],
                          124.0,
                          PositionStatus.rtkFixedInteger,
                          [65.2, 65.1][positionIndex],
                          12.3,
                          14,
                          [123455, 124495][positionIndex],
                          12222,
                        ),
                      ),
                    );
                  }
                },
              );
            });
          });
        }
      });
    });

    test('Check task data controller attributes', () {
      final taskControllerCapabilities =
          taskData.taskControllerCapabilities.first;

      expect(
        (
          taskControllerCapabilities.functionNAME,
          taskControllerCapabilities.designator,
          taskControllerCapabilities.versionNumber,
          taskControllerCapabilities.providedCapabilities,
          taskControllerCapabilities.numberOfBoomsSectionControl,
          taskControllerCapabilities.numberOfSectionsSectionControl,
          taskControllerCapabilities.numberOfControlChannels,
        ),
        ('A0008F000F300DDD', 'isoxml_dart', VersionNumber.e2fdis, 63, 1, 2, 3),
      );
    });

    test('Check value presentation attributes', () {
      final valuePresentation = taskData.valuePresentations.first;
      expect(
        (
          valuePresentation.id,
          valuePresentation.offset,
          valuePresentation.scale,
          valuePresentation.numberOfDecimals,
          valuePresentation.unitDesignator,
          valuePresentation.colourLegendIdRef,
        ),
        ('VPN1', 0, 0.0001, 4, 'l/ha', 'CLD1'),
      );
    });

    test('Check worker attributes', () {
      final worker = taskData.workers.first;
      expect(worker, isA<Worker>());
      expect(
        (
          worker.id,
          worker.lastName,
          worker.firstName,
          worker.street,
          worker.poBox,
          worker.postalCode,
          worker.city,
          worker.state,
          worker.country,
          worker.phone,
          worker.mobile,
          worker.licenseNumber,
          worker.email,
        ),
        (
          'WKR1',
          'Driver',
          'Peter',
          'ExampleRoad',
          '12345',
          '48485',
          'Newchurch',
          'NRW',
          'Germany',
          '01189998819101187253',
          '01189998819101187254',
          '01189998819101187153',
          'driver@examplemail.com',
        ),
      );
    });
  });
  test(
    'Export document to string, check if equal to input string',
    () => expect(
      taskData?.toSingleXmlDocument().toXmlString(
        pretty: true,
        indent: '    ',
      ),
      docString,
    ),
  );

  group('Point', () {
    test('.filename too long', () {
      Object? error;
      try {
        Point(
          north: 60,
          east: 10,
          type: PointType.other,
          filename: 'PNT000001',
        );
      } catch (e) {
        error = e;
      }
      expect(error, isArgumentError);
    });
    test('.filelength outside range', () {
      Object? error;
      try {
        Point(
          north: 60,
          east: 10,
          type: PointType.other,
          filename: 'PNT00001',
          fileLength: -1,
        );
      } catch (e) {
        error = e;
      }
      expect(error, isArgumentError);
    });

    test('binary', () {
      final data = ByteData(100);
      var offset = 0;
      data.setUint8(offset, 0x1);
      offset++;

      data.setTwoInt32FromDouble(
        offset,
        63.58 * 1e16,
        Endian.little,
      );
      offset += 8;

      data.setTwoInt32FromDouble(
        offset,
        11.21 * 1e16,
        Endian.little,
      );
      offset += 8;

      data.setInt32(offset, (96 * 1e3).round(), Endian.little);
      offset += 4;

      data.setUint8(offset, 0x5);
      offset++;

      data.setTwoInt32FromDouble(
        offset,
        63.5 * 1e16,
        Endian.little,
      );
      offset += 8;

      data.setTwoInt32FromDouble(
        offset,
        11.2 * 1e16,
        Endian.little,
      );
      offset += 8;

      data.setInt32(offset, (90 * 1e3).round(), Endian.little);
      offset += 4;
      final byteData = data.buffer.asUint8List(0, offset);

      final point = Point(
        binaryHeaderOptions: const PointBinaryHeaderOptions(
          readType: true,
          readNorth: true,
          readEast: true,
          readUp: true,
        ),
        byteData: byteData,
        filename: 'PNT00001',
      );
      expect(point.binaryPointsBytes, byteData);
      expect(
        point,
        Point.fromXmlElement(
          XmlElement(XmlName('PNT'), [
            XmlAttribute(XmlName('A'), ''),
            XmlAttribute(XmlName('C'), ''),
            XmlAttribute(XmlName('D'), ''),
            XmlAttribute(XmlName('E'), ''),
            XmlAttribute(XmlName('J'), 'PNT00001'),
          ]),
        ).copyWith(byteData: byteData),
      );
    });
  });
}

const docString = '''
<?xml version="1.0" encoding="UTF-8"?>
<ISO11783_TaskData VersionMajor="4" VersionMinor="2" ManagementSoftwareManufacturer="test" ManagementSoftwareVersion="1.0" TaskControllerManufacturer="SomeOne" TaskControllerVersion="1234" DataTransferOrigin="1" lang="en">
    <AFE A="TEST1234.BIN" B="2" C="0614141000111" D="128" E="V1" F="400"/>
    <BSN A="BSN1" B="GlonassBaseStation" C="52.34424" D="7.234353" E="400"/>
    <CCT A="CCT1" B="Emoji comments" C="1" D="CCG1">
        <CCL A="CCL1" B=":)"/>
        <CCL A="CCL2" B=":("/>
        <CCL A="CCL3" B=":D"/>
    </CCT>
    <CCG A="CCG1" B="InternetMemes"/>
    <CLD A="CLD1" B="1">
        <CRG A="0" B="300" C="1"/>
        <CRG A="301" B="600" C="2"/>
        <CRG A="601" B="900" C="3"/>
        <CRG A="901" B="1300" C="4"/>
    </CLD>
    <CTP A="CTP1" B="Corn" C="PGP1">
        <CVT A="CVT1" B="PopCorn" C="PDT1"/>
        <CVT A="CVT2" B="Golden Bantam" C="PDT1"/>
    </CTP>
    <CPC A="CPC1" B="Drilling">
        <OTR A="OTQ1"/>
    </CPC>
    <CTR A="CTR1" B="Meyer" C="Peter" D="ExampleRoad" E="12345" F="48485" G="Neuenkirchen" H="NRW" I="Germany" J="01189998819101187253" K="01189998819101187254" L="01189998819101187153" M="tester@examplemail.com"/>
    <DVC A="DVC-1" B="SuperBaler" C="V1.1" D="A00086000D300841" E="123453" F="00000330000000" G="FF000000006564">
        <DET A="DET-1" B="1" C="1" D="MainDevice" E="1" F="0">
            <DOR A="10"/>
            <DOR A="50"/>
        </DET>
        <DET A="DET-2" B="2" C="2" D="SubFunction" E="2" F="1">
            <DOR A="11"/>
        </DET>
        <DET A="DET-3" B="3" C="6" D="Connector" E="3" F="1">
            <DOR A="52"/>
            <DOR A="53"/>
        </DET>
        <DPD A="10" B="00D4" C="1" D="31" E="Last Bale Moisture" F="100"/>
        <DPD A="11" B="0066" C="1" D="31" E="Actual Bale Length" F="101"/>
        <DPT A="50" B="0073" C="1400" D="Maximum Bale Width" E="101"/>
        <DPT A="52" B="0086" C="1000" D="OffsetX" E="101"/>
        <DPT A="53" B="0087" C="500" D="OffsetY" E="101"/>
        <DVP A="100" B="0" C="0.00001" D="1" E="%"/>
        <DVP A="101" B="0" C="0.001" D="2" E="m"/>
    </DVC>
    <DVC A="DVC-2" B="SuperTractor" C="V1.1" D="A00086000F300842" E="123455" F="00000220000000" G="FF000000006564">
        <DET A="DET-4" B="1" C="1" D="MainDevice" E="0" F="0">
            <DOR A="10"/>
            <DOR A="50"/>
        </DET>
        <DET A="DET-5" B="2" C="2" D="SubFunction" E="1" F="0">
            <DOR A="11"/>
        </DET>
        <DET A="DET-6" B="3" C="6" D="Connector" E="3" F="1">
            <DOR A="52"/>
            <DOR A="53"/>
        </DET>
        <DPD A="10" B="01E2" C="1" D="31" E="Last Bale Moisture" F="100"/>
        <DPD A="11" B="0066" C="1" D="31" E="Actual Bale Length" F="101"/>
        <DPT A="50" B="0073" C="1400" D="Maximum Bale Width" E="101"/>
        <DPT A="52" B="0086" C="1000" D="OffsetX" E="101"/>
        <DPT A="53" B="0087" C="500" D="OffsetY" E="101"/>
        <DVP A="100" B="0" C="0.00001" D="1" E="%"/>
        <DVP A="101" B="0" C="0.001" D="2" E="m"/>
    </DVC>
    <FRM A="FRM1" B="Peters Farm" C="Example Road 1" D="1234252" E="48432" F="Mesum" G="NRW" H="Germany" I="CTR1"/>
    <OTQ A="OTQ1" B="Deep Drilling"/>
    <PFD A="PFD1" B="FD123" C="Near the Highway" D="13334" E="CTR1" F="FRM1" G="CTP1" H="CVT1"/>
    <PFD A="PFD2" B="FD124" C="Near the Highway Subfield" D="3334" E="CTR1" F="FRM1" G="CTP1" H="CVT1" I="PFD1">
        <PLN A="1" B="Field Border" C="3334" D="7" E="PLN1">
            <LSG A="1" B="Outer line" C="12121414" D="12231322" E="8" F="LSG1">
                <PNT A="1" B="Marker1" C="52.213" D="7.20001" E="100" F="9" G="PNT1" H="0" I="1"/>
                <PNT A="1" B="Marker2" C="52.216" D="7.20001" E="100" F="9" G="PNT2" H="0" I="1"/>
                <PNT A="1" B="Marker3" C="52.216" D="7.20007" E="100" F="9" G="PNT3" H="0" I="1"/>
                <PNT A="1" B="Marker4" C="52.213" D="7.20007" E="100" F="9" G="PNT4" H="0" I="1"/>
            </LSG>
        </PLN>
        <PNT A="3" B="Entry" C="52.214" D="7.20007" E="100" F="9" G="PNT21" H="0" I="1"/>
        <LSG A="4" B="Outer line" C="12121414" D="12231322" E="8" F="LSG2">
            <PNT A="1" B="Marker5" C="52.2135" D="7.20002" E="100" F="9" G="PNT5" H="0" I="1"/>
            <PNT A="1" B="Marker6" C="52.215" D="7.20002" E="100" F="9" G="PNT6" H="0" I="1"/>
            <PNT A="1" B="Marker7" C="52.215" D="7.20006" E="100" F="9" G="PNT7" H="0" I="1"/>
            <PNT A="1" B="Marker8" C="52.2135" D="7.20006" E="100" F="9" G="PNT8" H="0" I="1"/>
        </LSG>
        <GGP A="GGP1" B="Guidance for sampling">
            <GPN A="GPN1" B="GuidancePattern" C="1" D="1" E="1" F="1" G="30" H="400" I="4" J="5" K="5.1" L="BSN1" M="EPSG:4326" N="5" O="8">
                <PLN A="1" B="Field Border" C="3334" D="7" E="PLN2">
                    <LSG A="1" B="Outer line" C="12121414" D="12231322" E="8" F="LSG3">
                        <PNT A="1" B="Marker13" C="52.213" D="7.20001" E="100" F="9" G="PNT13" H="0" I="1"/>
                        <PNT A="1" B="Marker14" C="52.216" D="7.20001" E="100" F="9" G="PNT14" H="0" I="1"/>
                        <PNT A="1" B="Marker15" C="52.216" D="7.20007" E="100" F="9" G="PNT15" H="0" I="1"/>
                        <PNT A="1" B="Marker16" C="52.213" D="7.20007" E="100" F="9" G="PNT16" H="0" I="1"/>
                    </LSG>
                </PLN>
                <LSG A="4" B="Outer line" C="12121414" D="12231322" E="8" F="LSG4">
                    <PNT A="1" B="Marker17" C="52.2135" D="7.20002" E="100" F="9" G="PNT17" H="0" I="1"/>
                    <PNT A="1" B="Marker18" C="52.215" D="7.20002" E="100" F="9" G="PNT18" H="0" I="1"/>
                    <PNT A="1" B="Marker19" C="52.215" D="7.20006" E="100" F="9" G="PNT19" H="0" I="1"/>
                    <PNT A="1" B="Marker20" C="52.2135" D="7.20006" E="100" F="9" G="PNT20" H="0" I="1"/>
                </LSG>
            </GPN>
            <PLN A="1" B="GuidanceBoundary" C="3334" D="7" E="PLN3">
                <LSG A="1" B="Outer line" C="12121414" D="12231322" E="8" F="LSG5">
                    <PNT A="1" B="Marker9" C="52.213" D="7.20001" E="100" F="9" G="PNT9" H="0" I="1"/>
                    <PNT A="1" B="Marker10" C="52.216" D="7.20001" E="100" F="9" G="PNT10" H="0" I="1"/>
                    <PNT A="1" B="Marker11" C="52.216" D="7.20007" E="100" F="9" G="PNT11" H="0" I="1"/>
                    <PNT A="1" B="Marker12" C="52.213" D="7.20007" E="100" F="9" G="PNT12" H="0" I="1"/>
                </LSG>
            </PLN>
        </GGP>
    </PFD>
    <PDT A="PDT1" B="Schnecken" C="PGP1" D="VPN1" E="0001" F="1" G="800" H="100" I="1234"/>
    <PDT A="PDT2" B="Korn" C="PGP1" D="VPN1" E="0006" F="1" G="1000" H="100" I="1234"/>
    <PDT A="PDT3" B="Schneckenkorn" C="PGP1" D="VPN1" E="0006" F="2" G="1800" H="100" I="1234">
        <PRN A="PDT1" B="800"/>
        <PRN A="PDT2" B="1000"/>
    </PDT>
    <PGP A="PGP1" B="Zutaten für Schneckenkorn" C="1"/>
    <TSK A="TSK1" B="Task 1" C="CTR1" D="FRM1" E="PFD1" F="WKR1" G="4" H="0" I="0" J="1">
        <CAN A="CCT1">
            <ASP A="2021-03-18T22:00:00.000Z" B="2021-03-18T23:00:00.000Z" D="4">
                <PTN A="52.3" B="7.25" C="124" D="4" E="65.2" F="12.3" G="14" H="123455" I="12222"/>
                <PTN A="52.3" B="7.27" C="124" D="4" E="65.1" F="12.3" G="14" H="124495" I="12222"/>
            </ASP>
        </CAN>
        <CAN B="CCL1">
            <ASP A="2021-03-18T22:00:00.000Z" B="2021-03-18T23:00:00.000Z" D="4">
                <PTN A="52.3" B="7.25" C="124" D="4" E="65.2" F="12.3" G="14" H="123455" I="12222"/>
                <PTN A="52.3" B="7.27" C="124" D="4" E="65.1" F="12.3" G="14" H="124495" I="12222"/>
            </ASP>
        </CAN>
        <CAN C="Driver wrote this">
            <ASP A="2021-03-18T22:00:00.000Z" B="2021-03-18T23:00:00.000Z" D="4">
                <PTN A="52.3" B="7.25" C="124" D="4" E="65.2" F="12.3" G="14" H="123455" I="12222"/>
                <PTN A="52.3" B="7.27" C="124" D="4" E="65.1" F="12.3" G="14" H="124495" I="12222"/>
            </ASP>
        </CAN>
        <CAT A="A00086000F300842" B="A00086000D300841" C="00000220000000" D="00000330000000" E="1" F="1" G="0001">
            <ASP A="2021-03-18T22:00:00.000Z" D="1"/>
        </CAT>
        <CNN A="DVC-1" B="DET-3" C="DVC-2" D="DET-6"/>
        <DAN A="A00086000D300841" B="FFFFFFFFFFFFFFFF" C="DVC-1">
            <ASP A="2021-03-18T21:00:00.000Z" C="500" D="4">
                <PTN A="52.3" B="7.25" C="124" D="4" E="65.2" F="12.3" G="14" H="123455" I="12222"/>
                <PTN A="52.3" B="7.27" C="124" D="4" E="65.1" F="12.3" G="14" H="124495" I="12222"/>
            </ASP>
        </DAN>
        <DAN A="A00086000D300841" B="FFFFFFFFFFFFFFFF" C="DVC-1">
            <ASP A="2021-03-18T22:00:00.000Z" B="2021-03-18T23:00:00.000Z" D="4">
                <PTN A="52.3" B="7.25" C="124" D="4" E="65.2" F="12.3" G="14" H="123455" I="12222"/>
                <PTN A="52.3" B="7.27" C="124" D="4" E="65.1" F="12.3" G="14" H="124495" I="12222"/>
            </ASP>
        </DAN>
        <DLT A="DFFF" B="31"/>
        <DLT A="00D4" B="31" C="300" D="20" E="14" F="1800" G="2" H="DET-1" I="VPN1"/>
        <DLT A="DFFE" B="31" C="300" D="20" E="14" F="1800" G="2" H="DET-1" I="VPN1" J="1242" K="1" L="5"/>
        <GAN A="GGP1">
            <ASP A="2021-03-17T22:05:00.000Z" D="1"/>
            <GST A="GGP1" B="GPN1" C="100" D="200" E="20">
                <ASP A="2021-03-18T23:00:00.000Z" D="1"/>
            </GST>
        </GAN>
        <OTP A="CPC1" B="OTQ1"/>
        <PAN A="PDT3" B="0001" C="400" D="1" E="DET-1" F="VPN1">
            <ASP A="2021-03-18T21:00:00.000Z" C="500" D="4"/>
        </PAN>
        <PAN A="PDT3" B="0001" C="400" D="2" E="DET-1" F="VPN1">
            <ASP A="2021-03-18T22:00:00.000Z" B="2021-03-18T23:00:00.000Z" D="4"/>
        </PAN>
        <TIM A="2021-03-18T21:00:00.000Z" B="2021-03-18T23:05:00.000Z" D="1"/>
        <TIM A="2021-03-18T21:00:00.000Z" C="400" D="4">
            <PTN A="52.3" B="7.25" C="124" D="4" E="65.5" F="12.3" G="14" H="123455" I="12222"/>
            <PTN A="52.3" B="7.27" C="124" D="4" E="65.5" F="12.3" G="14" H="124495" I="12222"/>
            <DLV A="00D4" B="4321" C="DET-1"/>
            <DLV A="DFFE" B="568" C="DET-1" D="1424" E="1" F="4"/>
        </TIM>
        <WAN A="WKR1">
            <ASP A="2021-03-18T21:00:00.000Z" C="500" D="4">
                <PTN A="52.3" B="7.25" C="124" D="4" E="65.2" F="12.3" G="14" H="123455" I="12222"/>
                <PTN A="52.3" B="7.27" C="124" D="4" E="65.1" F="12.3" G="14" H="124495" I="12222"/>
            </ASP>
        </WAN>
        <WAN A="WKR1">
            <ASP A="2021-03-18T22:00:00.000Z" B="2021-03-18T23:00:00.000Z" D="4">
                <PTN A="52.3" B="7.25" C="124" D="4" E="65.2" F="12.3" G="14" H="123455" I="12222"/>
                <PTN A="52.3" B="7.27" C="124" D="4" E="65.1" F="12.3" G="14" H="124495" I="12222"/>
            </ASP>
        </WAN>
    </TSK>
    <TCC A="A0008F000F300DDD" B="isoxml_dart" C="4" D="63" E="1" F="2" G="3"/>
    <VPN A="VPN1" B="0" C="0.0001" D="4" E="l/ha" F="CLD1"/>
    <WKR A="WKR1" B="Driver" C="Peter" D="ExampleRoad" E="12345" F="48485" G="Newchurch" H="NRW" I="Germany" J="01189998819101187253" K="01189998819101187254" L="01189998819101187153" M="driver@examplemail.com"/>
</ISO11783_TaskData>''';
