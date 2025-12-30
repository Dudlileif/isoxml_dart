// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Allow catching all errors and exceptions

import 'dart:typed_data';

import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('AllocationStamp', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        AllocationStamp(
          start: DateTime.utc(2024, 1, 1, 12),
          stop: DateTime.utc(2024, 1, 1, 12, 45),
          duration: 2700,
          type: AllocationStampType.planned,
          position: [
            Position(
              north: 50,
              east: 10,
              status: PositionStatus.manualInput,
            ),
          ],
        ),
        isA<AllocationStamp>()
            .having(
              (element) => element.start,
              'Correct `start`',
              DateTime.utc(2024, 1, 1, 12),
            )
            .having(
              (element) => element.stop,
              'Correct `stop`',
              DateTime.utc(2024, 1, 1, 12, 45),
            )
            .having(
              (element) => element.duration,
              'Correct `duration`',
              2700,
            )
            .having(
              (element) => element.type,
              'Correct `type`',
              AllocationStampType.planned,
            )
            .having(
              (element) => element.position,
              'Correct `positions`',
              [
                isA<Position>()
                    .having(
                      (position) => position.north,
                      'Correct `north`',
                      50,
                    )
                    .having(
                      (position) => position.east,
                      'Correct `east`',
                      10,
                    )
                    .having(
                      (position) => position.status,
                      'Correct `status`',
                      PositionStatus.manualInput,
                    ),
              ],
            ),
      );
    });

    test('Too many position children', () {
      expect(
        () => AllocationStamp(
          start: DateTime.utc(2024),
          type: AllocationStampType.planned,
          position: List.generate(
            3,
            (index) => Position(
              north: 50,
              east: 10,
              status: PositionStatus.manualInput,
            ),
            growable: false,
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'AllocationStamp.position',
          ),
        ),
      );
    });

    test('Invalid `type` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(XmlName('ASP'), [
            XmlAttribute(XmlName('A'), '2025-12-12'),
            XmlAttribute(XmlName('D'), '100'),
          ]),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'AllocationStamp.type',
          ),
        ),
      );
    });

    test('Adding and removing Positions on `position` list', () {
      final element = AllocationStamp(
        start: DateTime.utc(2025),
        type: AllocationStampType.effective,
      );
      final position = Position(
        north: 60,
        east: 10,
        status: PositionStatus.gnssFix,
      );
      element.position.add(position);

      expect(
        element,
        isA<AllocationStamp>().having(
          (element) => element.position,
          'Correct `position`',
          [
            isA<Position>().having((pos) => pos.north, 'Correct `north`', 60),
          ],
        ),
      );
      element.position.clear();
      expect(
        element,
        isA<AllocationStamp>().having(
          (element) => element.position,
          'Correct `position`',
          <Position>[],
        ),
      );
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local == Iso11783ElementType.position.xmlTag,
            )
            .length,
        0,
      );
      XmlElement.tag('ABC').children.add(position.xmlElement);
      element.position.add(position);
      expect(
        element,
        isA<AllocationStamp>().having(
          (element) => element.position,
          'Correct `position`',
          [
            isA<Position>().having((pos) => pos.north, 'Correct `north`', 60),
          ],
        ),
      );
      element.position.remove(position);
      expect(
        element,
        isA<AllocationStamp>().having(
          (element) => element.position,
          'Correct `position`',
          <Position>[],
        ),
      );
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local == Iso11783ElementType.position.xmlTag,
            )
            .length,
        0,
      );
    });
  });

  group('BaseStation', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        BaseStation(
          id: 'BSN1',
          designator: 'Test',
          north: 50.5,
          east: 20.2,
          up: 50,
        ),
        isA<BaseStation>()
            .having((element) => element.id, 'Correct `id`', 'BSN1')
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test',
            )
            .having(
              (element) => element.north,
              'Correct `north`',
              50.5,
            )
            .having((element) => element.east, 'Correct `east`', 20.2)
            .having((element) => element.up, 'Correct `up`', 50)
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern',
              BaseStation.staticIdRefPattern,
            ),
      );
    });

    test(
      '''Get FormatException from XmlElement with name BSN with no attributes due to null check''',
      () {
        expect(
          () => Iso11783Element.fromXmlElement(
            XmlElement(
              XmlName.fromString('BSN'),
            ),
          ),
          throwsFormatException,
        );
      },
    );
  });

  group('CodedCommentGroup', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        CodedCommentGroup(
          id: 'CCG1',
          designator: 'Test',
        ),
        isA<CodedCommentGroup>()
            .having((element) => element.id, 'Correct `id`', 'CCG1')
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test',
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern',
              CodedCommentGroup.staticIdRefPattern,
            ),
      );
    });
  });

  group('CodedCommentListValue', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        CodedCommentListValue(
          id: 'CCL1',
          designator: 'Test',
        ),
        isA<CodedCommentListValue>()
            .having((element) => element.id, 'Correct `id`', 'CCL1')
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test',
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern',
              CodedCommentListValue.staticIdRefPattern,
            ),
      );
    });

    test('.fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.codedCommentListValue.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'CCL1'),
              XmlAttribute(XmlName('B'), 'Test string'),
            ],
          ),
        ),
        isA<CodedCommentListValue>()
            .having((element) => element.id, 'Correct `id`', 'CCL1')
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            ),
      );
    });
  });

  group('CodedComment', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        CodedComment(
          id: 'CCT1',
          designator: 'Test',
          scope: CodedCommentScope.global,
          groupIdRef: 'CCG1',
          listValues: [CodedCommentListValue(id: 'CCL1', designator: 'Test')],
        ),
        isA<CodedComment>()
            .having((element) => element.id, 'Correct `id`', 'CCT1')
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test',
            )
            .having(
              (element) => element.scope,
              'Correct `scope`',
              CodedCommentScope.global,
            )
            .having(
              (element) => element.listValues,
              'Correct `listValues`',
              [
                isA<CodedCommentListValue>()
                    .having((element) => element.id, 'Correct `id`', 'CCL1')
                    .having(
                      (element) => element.designator,
                      'Correct `designator`',
                      'Test',
                    ),
              ],
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern',
              CodedComment.staticIdRefPattern,
            ),
      );
    });

    test('Invalid `type` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.codedComment.xmlTag), [
            XmlAttribute(XmlName('A'), 'CCT1'),
            XmlAttribute(XmlName('B'), 'Test'),
            XmlAttribute(XmlName('C'), '100'),
          ]),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'CodedComment.type',
          ),
        ),
      );
    });
  });

  group('CommentAllocation', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        CommentAllocation(
          allocationStamp: AllocationStamp(
            start: DateTime.utc(2024),
            type: AllocationStampType.effective,
          ),
          codedCommentIdRef: 'CCT1',
          codedCommentListValueIdRef: 'CCL1',
        ),
        isA<CommentAllocation>()
            .having(
              (element) => element.allocationStamp,
              'Correct `allocationStamp`',
              isA<AllocationStamp>()
                  .having(
                    (stamp) => stamp.start,
                    'Correct `start',
                    DateTime.utc(2024),
                  )
                  .having(
                    (element) => element.type,
                    'Correct `type`',
                    AllocationStampType.effective,
                  ),
            )
            .having(
              (element) => element.codedCommentIdRef,
              'Correct `codedCommentIdRef',
              'CCT1',
            )
            .having(
              (element) => element.codedCommentListValueIdRef,
              'Correct `codedCommentListValueIdRef',
              'CCL1',
            ),
      );
    });

    test('.fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.commentAllocation.xmlTag), [
            XmlAttribute(XmlName('B'), 'CCL2'),
            XmlAttribute(XmlName('C'), 'Test string'),
          ]),
        ),
        isA<CommentAllocation>()
            .having(
              (element) => element.codedCommentListValueIdRef,
              'Correct `codedCommentListValueRef`',
              'CCL2',
            )
            .having(
              (element) => element.freeCommentText,
              'Correct `freeCommentText`',
              'Test string',
            ),
      );
    });

    test(
      '''ArgumentError is thrown when both `codedCommentIdRef` and `freeCommentText` are set''',
      () {
        expect(
          () => CommentAllocation(
            allocationStamp: AllocationStamp(
              start: DateTime.utc(2024),
              type: AllocationStampType.effective,
            ),
            codedCommentIdRef: 'CCT1',
            codedCommentListValueIdRef: 'CCL1',
            freeCommentText: 'Free text',
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              '[codedCommentIdRef, freeCommentText]',
            ),
          ),
        );
      },
    );

    test('Too long `freeCommentText`', () {
      expect(
        () => CommentAllocation(
          freeCommentText: 'Too long free comment text is here',
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'CommentAllocation.freeCommentText',
          ),
        ),
      );
    });
  });

  group(
    'ColourLegend and ColourRange',
    () {
      test(
        'Correct values are set and read from the underlying XML element',
        () {
          expect(
            ColourLegend(
              ranges: [
                ColourRange(minimumValue: 10, maximumValue: 100, colour: 15),
              ],
              id: 'CLD1',
              defaultColour: 10,
            ),
            isA<ColourLegend>()
                .having((element) => element.ranges, 'Correct `ranges`', [
                  isA<ColourRange>()
                      .having(
                        (range) => range.maximumValue,
                        'Correct `maximumValue',
                        100,
                      )
                      .having(
                        (range) => range.minimumValue,
                        'Correct `minimumValue',
                        10,
                      )
                      .having(
                        (range) => range.colour,
                        'Correct `colour',
                        15,
                      ),
                ])
                .having(
                  (range) => range.id,
                  'Correct `id',
                  'CLD1',
                )
                .having(
                  (range) => range.defaultColour,
                  'Correct `defaultColour',
                  10,
                )
                .having(
                  (range) => range.idRefPattern,
                  'Correct `idRefPattern',
                  ColourLegend.staticIdRefPattern,
                ),
          );
        },
      );

      test('.fromXmlElement', () {
        expect(
          Iso11783Element.fromXmlElement(
            XmlElement(
              XmlName(Iso11783ElementType.colourLegend.xmlTag),
              [
                XmlAttribute(XmlName('A'), 'CLD1'),
                XmlAttribute(XmlName('B'), '10'),
              ],
              [
                XmlElement(XmlName(Iso11783ElementType.colourRange.xmlTag), [
                  XmlAttribute(XmlName('A'), '10'),
                  XmlAttribute(XmlName('B'), '100'),
                  XmlAttribute(XmlName('C'), '15'),
                ]),
              ],
            ),
          ),
          isA<ColourLegend>()
              .having(
                (element) => element.id,
                'Correct `id`',
                'CLD1',
              )
              .having(
                (element) => element.defaultColour,
                'Correct `defaultColour`',
                10,
              )
              .having((element) => element.ranges, 'Correct `ranges`', [
                isA<ColourRange>()
                    .having(
                      (range) => range.minimumValue,
                      'Correct `minimumValue`',
                      10,
                    )
                    .having(
                      (range) => range.maximumValue,
                      'Correct `maximumRange`',
                      100,
                    )
                    .having((range) => range.colour, 'Correct `colour`', 15),
              ]),
        );
      });

      test('Empty `ranges` list throws ArgumentError', () {
        expect(
          () => ColourLegend(ranges: const [], id: 'CLD1'),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'ColourLegend.ranges',
            ),
          ),
        );
      });
    },
  );

  group('CropType and CropVariety', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        CropType(
          id: 'CTP1',
          designator: 'Test',
          productGroupIdRef: 'PGP1',
          varieties: [
            CropVariety(id: 'CVT1', designator: 'Test', productIdRef: 'PDT1'),
          ],
        ),
        isA<CropType>()
            .having((element) => element.id, 'Correct `id`', 'CTP1')
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test',
            )
            .having(
              (element) => element.productGroupIdRef,
              'Correct `productGroupIdRef`',
              'PGP1',
            )
            .having((element) => element.varieties, 'Correct `varieties`', [
              isA<CropVariety>()
                  .having((element) => element.id, 'Correct `id`', 'CVT1')
                  .having(
                    (element) => element.designator,
                    'Correct `designator`',
                    'Test',
                  )
                  .having(
                    (element) => element.productIdRef,
                    'Correct `productIdRef`',
                    'PDT1',
                  )
                  .having(
                    (element) => element.idRefPattern,
                    'Correct `idRefPattern`',
                    CropVariety.staticIdRefPattern,
                  ),
            ])
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              CropType.staticIdRefPattern,
            ),
      );
    });
  });

  group('DataLogTrigger', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        DataLogTrigger(
          ddi: 'DFFE',
          method: 10,
          distanceInterval: 500,
          timeInterval: 200,
          thresholdMinimum: 100,
          thresholdMaximum: 1000,
          thresholdChange: 1,
          deviceElementIdRef: 'DET1',
          valuePresentationIdRef: 'VPN1',
          pgn: 123,
          pgnStartBit: 5,
          pgnStopBit: 8,
        ),
        isA<DataLogTrigger>()
            .having(
              (element) => element.ddi,
              'Correct `ddi`',
              'DFFE',
            )
            .having(
              (element) => element.method,
              'Correct `method`',
              10,
            )
            .having(
              (element) => element.distanceInterval,
              'Correct `distanceInteval`',
              500,
            )
            .having(
              (element) => element.timeInterval,
              'Correct `timeInterval`',
              200,
            )
            .having(
              (element) => element.thresholdMinimum,
              'Correct `thresholdMinimum`',
              100,
            )
            .having(
              (element) => element.thresholdMaximum,
              'Correct `thresholdMaximum`',
              1000,
            )
            .having(
              (element) => element.thresholdChange,
              'Correct `thresholdChange`',
              1,
            )
            .having(
              (element) => element.deviceElementIdRef,
              'Correct `deviceElementIdRef`',
              'DET1',
            )
            .having(
              (element) => element.valuePresentationIdRef,
              'Correct `valuePresentationIdRef`',
              'VPN1',
            )
            .having(
              (element) => element.pgn,
              'Correct `pgn`',
              123,
            )
            .having(
              (element) => element.pgnStartBit,
              'Correct `pgnStartBit`',
              5,
            )
            .having(
              (element) => element.pgnStopBit,
              'Correct `pgnStopBit`',
              8,
            ),
      );
    });

    test('`ddi` not being `DFFE` when `pgn` is set throws ArgumentError', () {
      expect(
        () => DataLogTrigger(
          ddi: 'ABCD',
          method: 10,
          pgn: 123,
          pgnStartBit: 5,
          pgnStopBit: 8,
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            '[ddi, pgn]',
          ),
        ),
      );
    });
  });

  group('DataLogValue', () {
    test(
      'Correct values are set and read from the underlying XML element',
      () {
        expect(
          DataLogValue(
            processDataDDI: 'DFFE',
            processDataValue: 10,
            deviceElementIdRef: 'DET1',
            pgn: 123,
            pgnStartBit: 5,
            pgnStopBit: 8,
          ),
          isA<DataLogValue>()
              .having(
                (element) => element.processDataDDI,
                'Correct `processDataDDI`',
                'DFFE',
              )
              .having(
                (element) => element.processDataValue,
                'Correct `processDataValue`',
                10,
              )
              .having(
                (element) => element.deviceElementIdRef,
                'Correct `deviceElementIdRef`',
                'DET1',
              )
              .having(
                (element) => element.pgn,
                'Correct `pgn`',
                123,
              )
              .having(
                (element) => element.pgnStartBit,
                'Correct `pgnStartBit`',
                5,
              )
              .having(
                (element) => element.pgnStopBit,
                'Correct `pgnStopBit`',
                8,
              ),
        );
      },
    );

    test(
      '.fromXmlElement',
      () {
        expect(
          Iso11783Element.fromXmlElement(
            XmlElement(XmlName(Iso11783ElementType.dataLogValue.xmlTag), [
              XmlAttribute(XmlName('A'), 'DFFE'),
              XmlAttribute(XmlName('B'), '10'),
              XmlAttribute(XmlName('C'), 'DET1'),
              XmlAttribute(XmlName('D'), '123'),
              XmlAttribute(XmlName('E'), '5'),
              XmlAttribute(XmlName('F'), '8'),
            ]),
          ),
          isA<DataLogValue>()
              .having(
                (element) => element.processDataDDI,
                'Correct `processDataDDI`',
                'DFFE',
              )
              .having(
                (element) => element.processDataValue,
                'Correct `processDataValue`',
                10,
              )
              .having(
                (element) => element.deviceElementIdRef,
                'Correct `deviceElementIdRef`',
                'DET1',
              )
              .having(
                (element) => element.pgn,
                'Correct `pgn`',
                123,
              )
              .having(
                (element) => element.pgnStartBit,
                'Correct `pgnStartBit`',
                5,
              )
              .having(
                (element) => element.pgnStopBit,
                'Correct `pgnStopBit`',
                8,
              ),
        );
      },
    );

    test(
      '''`processDataDDI` not being `DFFE` when `pgn` is set throws ArgumentError''',
      () {
        expect(
          () => DataLogValue(
            processDataDDI: 'ABCD',
            processDataValue: 10,
            deviceElementIdRef: 'DET1',
            pgn: 123,
            pgnStartBit: 5,
            pgnStopBit: 8,
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              '[processDataDDI, pgn]',
            ),
          ),
        );
      },
    );
  });

  group('Connection', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        Connection(
          deviceIdRef0: 'DVC1',
          deviceElementIdRef0: 'DET1',
          deviceIdRef1: 'DVC2',
          deviceElementIdRef1: 'DET2',
        ),
        isA<Connection>()
            .having(
              (element) => element.deviceIdRef0,
              'Correct `deviceIdRef0`',
              'DVC1',
            )
            .having(
              (element) => element.deviceElementIdRef0,
              'Correct `deviceElementIdRef0`',
              'DET1',
            )
            .having(
              (element) => element.deviceIdRef1,
              'Correct `deviceIdRef1`',
              'DVC2',
            )
            .having(
              (element) => element.deviceElementIdRef1,
              'Correct `deviceIdElementIdRef1`',
              'DET2',
            ),
      );
    });

    test('.fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.connection.xmlTag), [
            XmlAttribute(XmlName('A'), 'DVC1'),
            XmlAttribute(XmlName('B'), 'DET1'),
            XmlAttribute(XmlName('C'), 'DVC2'),
            XmlAttribute(XmlName('D'), 'DET2'),
          ]),
        ),
        isA<Connection>()
            .having(
              (element) => element.deviceIdRef0,
              'Correct `deviceIdRef0`',
              'DVC1',
            )
            .having(
              (element) => element.deviceElementIdRef0,
              'Correct `deviceElementIdRef0`',
              'DET1',
            )
            .having(
              (element) => element.deviceIdRef1,
              'Correct `deviceIdRef1`',
              'DVC2',
            )
            .having(
              (element) => element.deviceElementIdRef1,
              'Correct `deviceIdElementIdRef1`',
              'DET2',
            ),
      );
    });
  });

  group('ControlAssignment', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        ControlAssignment(
          sourceClientNAME: 'A00086000F300842',
          userClientNAME: 'A00086000D300841',
          sourceDeviceStructureLabel: '00000220000000',
          userDeviceStructureLabel: '00000330000000',
          sourceDeviceElementNumber: 1,
          userDeviceElementNumber: 1,
          processDataDDI: '0001',
          allocationStamp: AllocationStamp(
            start: DateTime.utc(2024),
            type: AllocationStampType.effective,
          ),
        ),
        isA<ControlAssignment>()
            .having(
              (element) => element.sourceClientNAME,
              'Correct `sourceClientNAME`',
              'A00086000F300842',
            )
            .having(
              (element) => element.userClientNAME,
              'Correct `userClientNAME`',
              'A00086000D300841',
            )
            .having(
              (element) => element.sourceDeviceStructureLabel,
              'Correct `sourceDeviceStructureLabel`',
              '00000220000000',
            )
            .having(
              (element) => element.userDeviceStructureLabel,
              'Correct `userDeviceStructureLabel`',
              '00000330000000',
            )
            .having(
              (element) => element.sourceDeviceElementNumber,
              'Correct `sourceDeviceElementNumber`',
              1,
            )
            .having(
              (element) => element.userDeviceElementNumber,
              'Correct `userDeviceElementNumber`',
              1,
            )
            .having(
              (element) => element.processDataDDI,
              'Correct `processDataDDI`',
              '0001',
            )
            .having(
              (element) => element.allocationStamp,
              'Correct `allocationStamp`',
              isA<AllocationStamp>()
                  .having(
                    (stamp) => stamp.start,
                    'Correct `start`',
                    DateTime.utc(2024),
                  )
                  .having(
                    (stamp) => stamp.type,
                    'Correct `type`',
                    AllocationStampType.effective,
                  ),
            ),
      );
    });

    test('.fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.controlAssignment.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'A00086000F300842'),
              XmlAttribute(XmlName('B'), 'A00086000D300841'),
              XmlAttribute(XmlName('C'), '00000220000000'),
              XmlAttribute(XmlName('D'), '00000330000000'),
              XmlAttribute(XmlName('E'), '1'),
              XmlAttribute(XmlName('F'), '1'),
              XmlAttribute(XmlName('G'), '0001'),
            ],
            [
              XmlElement(XmlName(Iso11783ElementType.allocationStamp.xmlTag), [
                XmlAttribute(
                  XmlName('A'),
                  DateTime.utc(2024).toIso8601String(),
                ),
                XmlAttribute(XmlName('D'), '4'),
              ]),
            ],
          ),
        ),
        isA<ControlAssignment>()
            .having(
              (element) => element.sourceClientNAME,
              'Correct `sourceClientNAME`',
              'A00086000F300842',
            )
            .having(
              (element) => element.userClientNAME,
              'Correct `userClientNAME`',
              'A00086000D300841',
            )
            .having(
              (element) => element.sourceDeviceStructureLabel,
              'Correct `sourceDeviceStructureLabel`',
              '00000220000000',
            )
            .having(
              (element) => element.userDeviceStructureLabel,
              'Correct `userDeviceStructureLabel`',
              '00000330000000',
            )
            .having(
              (element) => element.sourceDeviceElementNumber,
              'Correct `sourceDeviceElementNumber`',
              1,
            )
            .having(
              (element) => element.userDeviceElementNumber,
              'Correct `userDeviceElementNumber`',
              1,
            )
            .having(
              (element) => element.processDataDDI,
              'Correct `processDataDDI`',
              '0001',
            )
            .having(
              (element) => element.allocationStamp,
              'Correct `allocationStamp`',
              isA<AllocationStamp>()
                  .having(
                    (stamp) => stamp.start,
                    'Correct `start`',
                    DateTime.utc(2024),
                  )
                  .having(
                    (stamp) => stamp.type,
                    'Correct `type`',
                    AllocationStampType.effective,
                  ),
            ),
      );
    });
  });

  group('DeviceAllocation', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        DeviceAllocation(
          clientNAMEValue: 'A00086000D300841',
          clientNAMEMask: 'FFFFFFFFFFFFFFFF',
          deviceIdRef: 'DVC1',
          allocationStamp: AllocationStamp(
            start: DateTime.utc(2024),
            type: AllocationStampType.effective,
          ),
        ),
        isA<DeviceAllocation>()
            .having(
              (element) => element.clientNAMEValue,
              'Correct `clientNAMEValue`',
              'A00086000D300841',
            )
            .having(
              (element) => element.clientNAMEMask,
              'Correct `clientNAMEMask`',
              'FFFFFFFFFFFFFFFF',
            )
            .having(
              (element) => element.deviceIdRef,
              'Correct `deviceIdRef`',
              'DVC1',
            )
            .having(
              (element) => element.allocationStamp,
              'Correct `allocationStamp`',
              isA<AllocationStamp>()
                  .having(
                    (stamp) => stamp.start,
                    'Correct `start`',
                    DateTime.utc(2024),
                  )
                  .having(
                    (stamp) => stamp.type,
                    'Correct `type`',
                    AllocationStampType.effective,
                  ),
            ),
      );
    });
  });

  group('DeviceElement', () {
    test(
      'Correct values are set and read from the underlying XML element',
      () {
        expect(
          DeviceElement(
            id: 'DET1',
            objectId: 1,
            type: DeviceElementType.device,
            number: 0,
            parentObjectId: 0,
            designator: 'Test',
            objectReferences: [DeviceObjectReference(objectId: 1)],
          ),
          isA<DeviceElement>()
              .having(
                (element) => element.id,
                'Correct `id',
                'DET1',
              )
              .having(
                (element) => element.objectId,
                'Correct `objectId',
                1,
              )
              .having(
                (element) => element.type,
                'Correct `type',
                DeviceElementType.device,
              )
              .having(
                (element) => element.number,
                'Correct `number',
                0,
              )
              .having(
                (element) => element.parentObjectId,
                'Correct `parentObjectId',
                0,
              )
              .having(
                (element) => element.designator,
                'Correct `designator',
                'Test',
              )
              .having(
                (element) => element.objectReferences,
                'Correct `objectReferences',
                [
                  isA<DeviceObjectReference>().having(
                    (ref) => ref.objectId,
                    'Correct `objectId`',
                    1,
                  ),
                ],
              )
              .having(
                (element) => element.idRefPattern,
                'Correct `idRefPattern',
                DeviceElement.staticIdRefPattern,
              ),
        );
      },
    );

    test('Invalid `type` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.deviceElement.xmlTag), [
            XmlAttribute(XmlName('A'), 'DET1'),
            XmlAttribute(XmlName('B'), '0'),
            XmlAttribute(XmlName('C'), '100'),
            XmlAttribute(XmlName('E'), '0'),
            XmlAttribute(XmlName('F'), '1'),
          ]),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'DeviceElement.type',
          ),
        ),
      );
    });
  });

  group('DeviceObjectReference', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        DeviceObjectReference(objectId: 1),
        isA<DeviceObjectReference>().having(
          (element) => element.objectId,
          'Correct `objectId`',
          1,
        ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.deviceObjectReference.xmlTag),
            [XmlAttribute(XmlName('A'), '1')],
          ),
        ),
        isA<DeviceObjectReference>().having(
          (element) => element.objectId,
          'Correct `objectId`',
          1,
        ),
      );
    });
  });

  group('DeviceProcessData', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        DeviceProcessData(
          objectId: 1,
          ddi: '0001',
          property: 1,
          triggerMethods: 2,
          presentationObjectId: 5,
          designator: 'Test',
        ),
        isA<DeviceProcessData>()
            .having(
              (element) => element.objectId,
              'Correct `objectId`',
              1,
            )
            .having(
              (element) => element.ddi,
              'Correct `ddi`',
              '0001',
            )
            .having(
              (element) => element.property,
              'Correct `property`',
              1,
            )
            .having(
              (element) => element.triggerMethods,
              'Correct `triggerMethods`',
              2,
            )
            .having(
              (element) => element.presentationObjectId,
              'Correct `presentationObjectId`',
              5,
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test',
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.deviceProcessData.xmlTag),
            [
              XmlAttribute(XmlName('A'), '1'),
              XmlAttribute(XmlName('B'), '0001'),
              XmlAttribute(XmlName('C'), '1'),
              XmlAttribute(XmlName('D'), '2'),
              XmlAttribute(XmlName('E'), 'Test'),
              XmlAttribute(XmlName('F'), '5'),
            ],
          ),
        ),
        isA<DeviceProcessData>()
            .having(
              (element) => element.objectId,
              'Correct `objectId`',
              1,
            )
            .having(
              (element) => element.ddi,
              'Correct `ddi`',
              '0001',
            )
            .having(
              (element) => element.property,
              'Correct `property`',
              1,
            )
            .having(
              (element) => element.triggerMethods,
              'Correct `triggerMethods`',
              2,
            )
            .having(
              (element) => element.presentationObjectId,
              'Correct `presentationObjectId`',
              5,
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test',
            ),
      );
    });
  });

  group('DeviceProperty', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        DeviceProperty(
          objectId: 1,
          ddi: '0001',
          propertyValue: 10,
          designator: 'Test',
          valuePresentationObjectId: 5,
        ),
        isA<DeviceProperty>()
            .having(
              (element) => element.objectId,
              'Correct `objectId`',
              1,
            )
            .having(
              (element) => element.ddi,
              'Correct `ddi`',
              '0001',
            )
            .having(
              (element) => element.propertyValue,
              'Correct `propertyValue`',
              10,
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test',
            )
            .having(
              (element) => element.valuePresentationObjectId,
              'Correct `valuePresentationObjectId`',
              5,
            ),
      );
    });
  });

  group('DeviceValuePresentation', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        DeviceValuePresentation(
          objectId: 1,
          offset: 2,
          scale: 3,
          numberOfDecimals: 4,
          unitDesignator: 'm/s',
        ),
        isA<DeviceValuePresentation>()
            .having(
              (element) => element.objectId,
              'Correct `objectId`',
              1,
            )
            .having(
              (element) => element.offset,
              'Correct `offset`',
              2,
            )
            .having(
              (element) => element.scale,
              'Correct `scale`',
              3,
            )
            .having(
              (element) => element.numberOfDecimals,
              'Correct `numberOfDecimals`',
              4,
            )
            .having(
              (element) => element.unitDesignator,
              'Correct `unitDesignator`',
              'm/s',
            ),
      );
    });

    test('.fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.deviceValuePresentation.xmlTag),
            [
              XmlAttribute(XmlName('A'), '1'),
              XmlAttribute(XmlName('B'), '2'),
              XmlAttribute(XmlName('C'), '3'),
              XmlAttribute(XmlName('D'), '4'),
              XmlAttribute(XmlName('E'), 'm/s'),
            ],
          ),
        ),
        isA<DeviceValuePresentation>()
            .having(
              (element) => element.objectId,
              'Correct `objectId`',
              1,
            )
            .having(
              (element) => element.offset,
              'Correct `offset`',
              2,
            )
            .having(
              (element) => element.scale,
              'Correct `scale`',
              3,
            )
            .having(
              (element) => element.numberOfDecimals,
              'Correct `numberOfDecimals`',
              4,
            )
            .having(
              (element) => element.unitDesignator,
              'Correct `unitDesignator`',
              'm/s',
            ),
      );
    });
  });

  group('Device', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        Device(
          id: 'DVC1',
          clientNAME: 'A00086000D300841',
          structureLabel: '00000330000000',
          localizationLabel: 'FF000000006564',
          elements: [
            DeviceElement(
              id: 'DET1',
              objectId: 1,
              type: DeviceElementType.device,
              number: 0,
              parentObjectId: 0,
            ),
          ],
          properties: [
            DeviceProperty(objectId: 1, ddi: '0001', propertyValue: 10),
          ],
          processData: [
            DeviceProcessData(
              objectId: 1,
              ddi: '0001',
              property: 1,
              triggerMethods: 2,
            ),
          ],
          valuePresentations: [
            DeviceValuePresentation(
              objectId: 1,
              offset: 2,
              scale: 3,
              numberOfDecimals: 4,
            ),
          ],
          designator: 'Test',
          softwareVersion: '1.0.0',
          serialNumber: '123456',
        ),
        isA<Device>()
            .having((element) => element.id, 'Correct `id`', 'DVC1')
            .having(
              (element) => element.clientNAME,
              'Correct `clientNAME`',
              'A00086000D300841',
            )
            .having(
              (element) => element.structureLabel,
              'Correct `structureLabel`',
              '00000330000000',
            )
            .having(
              (element) => element.localizationLabel,
              'Correct `localizationLabel`',
              'FF000000006564',
            )
            .having(
              (element) => element.elements,
              'Correct `elemnts`',
              [
                isA<DeviceElement>()
                    .having(
                      (element) => element.id,
                      'Correct `id',
                      'DET1',
                    )
                    .having(
                      (element) => element.objectId,
                      'Correct `objectId',
                      1,
                    )
                    .having(
                      (element) => element.type,
                      'Correct `type',
                      DeviceElementType.device,
                    )
                    .having(
                      (element) => element.number,
                      'Correct `number',
                      0,
                    )
                    .having(
                      (element) => element.parentObjectId,
                      'Correct `parentObjectId',
                      0,
                    ),
              ],
            )
            .having((element) => element.properties, 'Correct `properties`', [
              isA<DeviceProperty>()
                  .having(
                    (element) => element.objectId,
                    'Correct `objectId`',
                    1,
                  )
                  .having(
                    (element) => element.ddi,
                    'Correct `ddi`',
                    '0001',
                  )
                  .having(
                    (element) => element.propertyValue,
                    'Correct `propertyValue`',
                    10,
                  ),
            ])
            .having((element) => element.processData, 'Correct `processData`', [
              isA<DeviceProcessData>()
                  .having(
                    (element) => element.objectId,
                    'Correct `objectId`',
                    1,
                  )
                  .having(
                    (element) => element.ddi,
                    'Correct `ddi`',
                    '0001',
                  )
                  .having(
                    (element) => element.property,
                    'Correct `property`',
                    1,
                  )
                  .having(
                    (element) => element.triggerMethods,
                    'Correct `triggerMethods`',
                    2,
                  ),
            ])
            .having(
              (element) => element.valuePresentations,
              'Correct `valuePresentations`',
              [
                isA<DeviceValuePresentation>()
                    .having(
                      (element) => element.objectId,
                      'Correct `objectId`',
                      1,
                    )
                    .having(
                      (element) => element.offset,
                      'Correct `offset`',
                      2,
                    )
                    .having(
                      (element) => element.scale,
                      'Correct `scale`',
                      3,
                    )
                    .having(
                      (element) => element.numberOfDecimals,
                      'Correct `numberOfDecimals`',
                      4,
                    ),
              ],
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test',
            )
            .having(
              (element) => element.softwareVersion,
              'Correct `softwareVersion`',
              '1.0.0',
            )
            .having(
              (element) => element.serialNumber,
              'Correct `serialNumber`',
              '123456',
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              Device.staticIdRefPattern,
            ),
      );
    });

    test('Throws ArgumentError if `elements` is empty', () {
      expect(
        () => Device(
          id: 'DVC1',
          clientNAME: 'A00086000D300841',
          structureLabel: '00000330000000',
          localizationLabel: 'FF000000006564',
          elements: [],
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error is thrown',
            'Device.elements',
          ),
        ),
      );
    });
  });

  group('AttachedFile', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        AttachedFile(
          filenameWithExtension: 'TST00001.XML',
          preserve: Preserve.preserve,
          manufacturerGLN: '10',
          fileType: 1,
          fileLength: 1000,
          fileVersion: '4',
        ),
        isA<AttachedFile>()
            .having(
              (element) => element.filenameWithExtension,
              'Correct `filenameWithExtension`',
              'TST00001.XML',
            )
            .having(
              (element) => element.preserve,
              'Correct `preserve`',
              Preserve.preserve,
            )
            .having(
              (element) => element.manufacturerGLN,
              'Correct `manufacturerGLN`',
              '10',
            )
            .having(
              (element) => element.fileType,
              'Correct `fileType`',
              1,
            )
            .having(
              (element) => element.fileLength,
              'Correct `fileLength`',
              1000,
            )
            .having(
              (element) => element.fileVersion,
              'Correct `fileVersion`',
              '4',
            ),
      );
    });
    test('Invalid `preserve` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.attachedFile.xmlTag), [
            XmlAttribute(XmlName('A'), 'TST00001.XML'),
            XmlAttribute(XmlName('B'), '100'),
            XmlAttribute(XmlName('C'), '10'),
            XmlAttribute(XmlName('D'), '2'),
          ]),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error is thrown',
            'AttachedFile.preserve',
          ),
        ),
      );
    });
  });

  group('ExternalFileContents', () {
    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(XmlElement(XmlName('XFC'))),
        isA<ExternalFileContents>(),
      );
    });
    test('._fromXmlElement with invalid base station child element', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(XmlName('XFC'), [], [
            XmlElement(XmlName('BSN')),
          ]),
        ),
        throwsException,
      );
    });

    test('.document with base station child element', () {
      expect(
        ExternalFileContents(
          baseStations: [
            BaseStation(
              id: 'BSN1',
              designator: 'BaseStation',
              north: 60.1,
              east: 10.1,
              up: 95,
            ),
          ],
        ).toXmlDocument().toXmlString(pretty: true),
        XmlDocument([
          XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
          XmlElement(XmlName('XFC'), [], [
            XmlElement(XmlName('BSN'), [
              XmlAttribute(XmlName('A'), 'BSN1'),
              XmlAttribute(XmlName('B'), 'BaseStation'),
              XmlAttribute(XmlName('C'), '60.1'),
              XmlAttribute(XmlName('D'), '10.1'),
              XmlAttribute(XmlName('E'), '95'),
            ]),
          ]),
        ]).toXmlString(pretty: true),
      );
    });
  });

  group('ExternalFileReference', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        ExternalFileReference(filename: 'BSN00001', filetype: FileType.xml),
        isA<ExternalFileReference>()
            .having(
              (element) => element.filename,
              'Correct `filename`',
              'BSN00001',
            )
            .having(
              (element) => element.filetype,
              'Correct `fileType`',
              FileType.xml,
            ),
      );
    });

    test('Throws ArgumentError with invalid `fileType`', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.externalFileReference.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'BSN00001'),
              XmlAttribute(XmlName('B'), '100'),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error is thrown',
            'ExternalFileReference.fileType',
          ),
        ),
      );
    });
    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
              XmlElement(XmlName('XFR'), [
                XmlAttribute(XmlName('A'), 'DVC00001'),
              ]),
            )
            as ExternalFileReference,
        isA<ExternalFileReference>().having(
          (e) => e.filename,
          'Correct `filename`',
          'DVC00001',
        ),
      );
    });
  });

  group('Grid', () {
    test(
      '''Correct values are set and read from the underlying XML element for `type = GridType.one`''',
      () {
        expect(
          Grid(
            minimumNorthPosition: 60,
            minimumEastPosition: 10,
            cellNorthSize: 0.1,
            cellEastSize: 0.1,
            maximumColumn: 3,
            maximumRow: 3,
            fileName: 'GRD00001',
            type: GridType.one,
            treatmentZoneCodeGrid: [
              [0, 0, 1],
              [1, 2, 1],
              [2, 1, 1],
            ],
          ),
          isA<Grid>()
              .having(
                (element) => element.minimumNorthPosition,
                'Correct `minimumNorthPosition',
                60,
              )
              .having(
                (element) => element.minimumEastPosition,
                'Correct `minimumEastPosition',
                10,
              )
              .having(
                (element) => element.cellNorthSize,
                'Correct `cellNorthSize',
                0.1,
              )
              .having(
                (element) => element.cellEastSize,
                'Correct `cellEastSize',
                0.1,
              )
              .having(
                (element) => element.maximumColumn,
                'Correct `maximumColumn',
                3,
              )
              .having(
                (element) => element.maximumRow,
                'Correct `maximumRow',
                3,
              )
              .having(
                (element) => element.fileName,
                'Correct `filename',
                'GRD00001',
              )
              .having(
                (element) => element.type,
                'Correct `type',
                GridType.one,
              )
              .having(
                (element) => element.treatmentZoneCodeGrid,
                'Correct `treatmentZoneCodeGrid',
                [
                  [0, 0, 1],
                  [1, 2, 1],
                  [2, 1, 1],
                ],
              ),
        );
      },
    );

    test(
      '''Correct values are set and read from the underlying XML element for `type = GridType.two`''',
      () {
        expect(
          Grid(
            minimumNorthPosition: 60,
            minimumEastPosition: 10,
            cellNorthSize: 0.1,
            cellEastSize: 0.1,
            maximumColumn: 3,
            maximumRow: 3,
            fileName: 'GRD00001',
            type: GridType.two,
            treatmentZoneCode: 1,
            numberOfProcessDataVariables: 2,
            processDataValueGrid: [
              [
                [1, 2],
                [1, 2],
                [2, 1],
              ],
              [
                [2, 1],
                [2, 1],
                [1, 2],
              ],
              [
                [1, 2],
                [2, 2],
                [1, 1],
              ],
            ],
          ),
          isA<Grid>()
              .having(
                (element) => element.minimumNorthPosition,
                'Correct `minimumNorthPosition',
                60,
              )
              .having(
                (element) => element.minimumEastPosition,
                'Correct `minimumEastPosition',
                10,
              )
              .having(
                (element) => element.cellNorthSize,
                'Correct `cellNorthSize',
                0.1,
              )
              .having(
                (element) => element.cellEastSize,
                'Correct `cellEastSize',
                0.1,
              )
              .having(
                (element) => element.maximumColumn,
                'Correct `maximumColumn',
                3,
              )
              .having(
                (element) => element.maximumRow,
                'Correct `maximumRow',
                3,
              )
              .having(
                (element) => element.fileName,
                'Correct `filename',
                'GRD00001',
              )
              .having(
                (element) => element.type,
                'Correct `type',
                GridType.two,
              )
              .having(
                (element) => element.treatmentZoneCode,
                'Correct `treatmentZoneCode',
                1,
              )
              .having(
                (element) => element.numberOfProcessDataVariables,
                'Correct `numberOfProcessDataVariables',
                2,
              )
              .having(
                (element) => element.processDataValueGrid,
                'Correct `processDataValueGrid',
                [
                  [
                    [1, 2],
                    [1, 2],
                    [2, 1],
                  ],
                  [
                    [2, 1],
                    [2, 1],
                    [1, 2],
                  ],
                  [
                    [1, 2],
                    [2, 2],
                    [1, 1],
                  ],
                ],
              ),
        );
      },
    );

    test('Throws ArgumentError with invalid `type`', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName('GRD'),
            [
              XmlAttribute(XmlName.fromString('A'), '60'),
              XmlAttribute(XmlName.fromString('B'), '10'),
              XmlAttribute(XmlName.fromString('C'), '0.2'),
              XmlAttribute(XmlName.fromString('D'), '0.1'),
              XmlAttribute(XmlName.fromString('E'), '1000'),
              XmlAttribute(XmlName.fromString('F'), '1000'),
              XmlAttribute(XmlName.fromString('G'), 'GRD00001'),
              XmlAttribute(XmlName.fromString('H'), '1234'),
              XmlAttribute(XmlName.fromString('I'), '100'),
              XmlAttribute(XmlName.fromString('J'), '101'),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error is thrown',
            'Grid.type',
          ),
        ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName('GRD'),
            [
              XmlAttribute(XmlName.fromString('A'), '60'),
              XmlAttribute(XmlName.fromString('B'), '10'),
              XmlAttribute(XmlName.fromString('C'), '0.2'),
              XmlAttribute(XmlName.fromString('D'), '0.1'),
              XmlAttribute(XmlName.fromString('E'), '3'),
              XmlAttribute(XmlName.fromString('F'), '3'),
              XmlAttribute(XmlName.fromString('G'), 'GRD00001'),
              XmlAttribute(XmlName.fromString('H'), '1234'),
              XmlAttribute(XmlName.fromString('I'), '1'),
              XmlAttribute(XmlName.fromString('J'), '101'),
            ],
          ),
        ),
        isA<Grid>()
            .having(
              (element) => element.minimumNorthPosition,
              'Correct `minimumNorthPosition',
              60,
            )
            .having(
              (element) => element.minimumEastPosition,
              'Correct `minimumEastPosition',
              10,
            )
            .having(
              (element) => element.cellNorthSize,
              'Correct `cellNorthSize',
              0.2,
            )
            .having(
              (element) => element.cellEastSize,
              'Correct `cellEastSize',
              0.1,
            )
            .having(
              (element) => element.maximumColumn,
              'Correct `maximumColumn',
              3,
            )
            .having(
              (element) => element.maximumRow,
              'Correct `maximumRow',
              3,
            )
            .having(
              (element) => element.fileLength,
              'Correct `fileLength`',
              1234,
            )
            .having(
              (element) => element.fileName,
              'Correct `filename',
              'GRD00001',
            )
            .having(
              (element) => element.type,
              'Correct `type',
              GridType.one,
            )
            .having(
              (element) => element.treatmentZoneCode,
              'Correct `treatmentZoneCode`',
              101,
            ),
      );
    });

    test('Type one with byteData in constructor', () {
      expect(
        Grid(
          minimumNorthPosition: 60,
          minimumEastPosition: 10,
          cellNorthSize: 0.05,
          cellEastSize: 0.1,
          maximumColumn: 3,
          maximumRow: 3,
          fileName: 'GRD00001',
          type: GridType.one,
          byteData: Uint8List.fromList([1, 2, 1, 2, 1, 2, 1, 2, 1]),
        ),
        isA<Grid>()
            .having(
              (element) => element.treatmentZoneCodeGrid,
              'Correct `treatmendZoneCodeGrid`',
              [
                [1, 2, 1],
                [2, 1, 2],
                [1, 2, 1],
              ],
            )
            .having(
              (element) => element.minimumNorthPosition,
              'Correct `minimumNorthPosition',
              60,
            )
            .having(
              (element) => element.minimumEastPosition,
              'Correct `minimumEastPosition',
              10,
            )
            .having(
              (element) => element.cellNorthSize,
              'Correct `cellNorthSize',
              0.05,
            )
            .having(
              (element) => element.cellEastSize,
              'Correct `cellEastSize',
              0.1,
            )
            .having(
              (element) => element.maximumColumn,
              'Correct `maximumColumn',
              3,
            )
            .having(
              (element) => element.maximumRow,
              'Correct `maximumRow',
              3,
            )
            .having(
              (element) => element.fileName,
              'Correct `filename',
              'GRD00001',
            )
            .having(
              (element) => element.type,
              'Correct `type',
              GridType.one,
            ),
      );
    });

    test('Type two with byteData in constructor', () {
      expect(
        Grid(
          minimumNorthPosition: 60,
          minimumEastPosition: 10,
          cellNorthSize: 0.05,
          cellEastSize: 0.1,
          maximumColumn: 3,
          maximumRow: 3,
          fileName: 'GRD00001',
          type: GridType.two,
          treatmentZoneCode: 1,
          numberOfProcessDataVariables: 2,
          byteData: Int32List.fromList([
            1,
            5,
            2,
            0,
            1,
            1,
            2,
            1,
            1,
            3,
            2,
            4,
            1,
            0,
            2,
            6,
            1,
            1,
          ]).buffer.asUint8List(),
        ),
        isA<Grid>()
            .having(
              (element) => element.processDataValueGrid,
              'Correct `processDataValueGrid`',
              [
                [
                  [1, 5],
                  [2, 0],
                  [1, 1],
                ],
                [
                  [2, 1],
                  [1, 3],
                  [2, 4],
                ],
                [
                  [1, 0],
                  [2, 6],
                  [1, 1],
                ],
              ],
            )
            .having(
              (element) => element.minimumNorthPosition,
              'Correct `minimumNorthPosition',
              60,
            )
            .having(
              (element) => element.minimumEastPosition,
              'Correct `minimumEastPosition',
              10,
            )
            .having(
              (element) => element.cellNorthSize,
              'Correct `cellNorthSize',
              0.05,
            )
            .having(
              (element) => element.cellEastSize,
              'Correct `cellEastSize',
              0.1,
            )
            .having(
              (element) => element.maximumColumn,
              'Correct `maximumColumn',
              3,
            )
            .having(
              (element) => element.maximumRow,
              'Correct `maximumRow',
              3,
            )
            .having(
              (element) => element.fileName,
              'Correct `filename',
              'GRD00001',
            )
            .having(
              (element) => element.type,
              'Correct `type',
              GridType.two,
            )
            .having(
              (element) => element.treatmentZoneCode,
              'Correct `treatmentZoneCode',
              1,
            )
            .having(
              (element) => element.numberOfProcessDataVariables,
              'Correct `numberOfProcessDataVariables',
              2,
            ),
      );
    });

    test('Type two throws ArgumentError when missing `treatmentZoneCode', () {
      expect(
        () => Grid(
          minimumNorthPosition: 60,
          minimumEastPosition: 10,
          cellNorthSize: 0.05,
          cellEastSize: 0.1,
          maximumColumn: 3,
          maximumRow: 3,
          fileName: 'GRD00001',
          type: GridType.two,
          numberOfProcessDataVariables: 2,
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error is thrown',
            'Grid.treatmentZoneCode',
          ),
        ),
      );
    });

    test(
      '''Type two throws ArgumentError when missing `numberOfProcessDataVariables''',
      () {
        expect(
          () => Grid(
            minimumNorthPosition: 60,
            minimumEastPosition: 10,
            cellNorthSize: 0.05,
            cellEastSize: 0.1,
            maximumColumn: 3,
            maximumRow: 3,
            fileName: 'GRD00001',
            type: GridType.two,
            treatmentZoneCode: 1,
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error is thrown',
              'Grid.numberOfProcessDataVariables',
            ),
          ),
        );
      },
    );
  });

  group(
    'LineString',
    () {
      test(
        'Correct values are set and read from the underlying XML element',
        () {
          expect(
            LineString(
              points: [
                Point(north: 60, east: 10, type: PointType.other),
                Point(north: 61, east: 11, type: PointType.other),
                Point(north: 62, east: 12, type: PointType.other),
              ],
              type: LineStringType.tramline,
              colour: 14,
              designator: 'Test string',
              id: 'LSG1',
              width: 1500,
              length: 1000,
            ),
            isA<LineString>()
                .having(
                  (element) => element.id,
                  'Correct `id`',
                  'LSG1',
                )
                .having(
                  (element) => element.type,
                  'Correct `type`',
                  LineStringType.tramline,
                )
                .having(
                  (element) => element.colour,
                  'Correct `colour`',
                  14,
                )
                .having(
                  (element) => element.designator,
                  'Correct `designator`',
                  'Test string',
                )
                .having(
                  (element) => element.width,
                  'Correct `width`',
                  1500,
                )
                .having(
                  (element) => element.length,
                  'Correct `length`',
                  1000,
                )
                .having(
                  (element) => element.idRefPattern,
                  'Correct `idRefPattern`',
                  LineString.staticIdRefPattern,
                )
                .having(
                  (element) => element.points,
                  'Correct `points`',
                  [
                    isA<Point>()
                        .having(
                          (point) => point.north,
                          'Correct `north`',
                          60,
                        )
                        .having(
                          (point) => point.east,
                          'Correct `east`',
                          10,
                        )
                        .having(
                          (point) => point.type,
                          'Correct `type`',
                          PointType.other,
                        ),
                    isA<Point>()
                        .having(
                          (point) => point.north,
                          'Correct `north`',
                          61,
                        )
                        .having(
                          (point) => point.east,
                          'Correct `east`',
                          11,
                        )
                        .having(
                          (point) => point.type,
                          'Correct `type`',
                          PointType.other,
                        ),
                    isA<Point>()
                        .having(
                          (point) => point.north,
                          'Correct `north`',
                          62,
                        )
                        .having(
                          (point) => point.east,
                          'Correct `east`',
                          12,
                        )
                        .having(
                          (point) => point.type,
                          'Correct `type`',
                          PointType.other,
                        ),
                  ],
                ),
          );
        },
      );
      test('Empty `points` throws ArgumentError', () {
        expect(
          () =>
              LineString(points: const [], type: LineStringType.samplingRoute),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error is thrown',
              'LineString.points',
            ),
          ),
        );
      });
      test('Invalid `type` throws ArgumentError', () {
        expect(
          () => Iso11783Element.fromXmlElement(
            XmlElement(
              XmlName(Iso11783ElementType.lineString.xmlTag),
              [
                XmlAttribute(XmlName('A'), '100'),
              ],
              [
                XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                  XmlAttribute(XmlName('A'), '2'),
                  XmlAttribute(XmlName('C'), '60'),
                  XmlAttribute(XmlName('D'), '10'),
                ]),
                XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                  XmlAttribute(XmlName('A'), '2'),
                  XmlAttribute(XmlName('C'), '61'),
                  XmlAttribute(XmlName('D'), '11'),
                ]),
              ],
            ),
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error is thrown',
              'LineString.type',
            ),
          ),
        );
      });
    },
  );

  group('Partfield', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        Partfield(
          id: 'PFD1',
          code: '100',
          designator: 'Test string',
          area: 1000,
          customerIdRef: 'CTR1',
          farmIdRef: 'FRM1',
          cropTypeIdRef: 'CTP1',
          cropVarietyIdRef: 'CVT1',
          fieldIdRef: 'PFD2',
        ),
        isA<Partfield>()
            .having(
              (element) => element.id,
              'Correct `id`',
              'PFD1',
            )
            .having(
              (element) => element.code,
              'Correct `code`',
              '100',
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.area,
              'Correct `area`',
              1000,
            )
            .having(
              (element) => element.customerIdRef,
              'Correct `customerIdRef`',
              'CTR1',
            )
            .having(
              (element) => element.farmIdRef,
              'Correct `farmIdRef`',
              'FRM1',
            )
            .having(
              (element) => element.cropTypeIdRef,
              'Correct `cropTypeIdRef`',
              'CTP1',
            )
            .having(
              (element) => element.cropVarietyIdRef,
              'Correct `cropVarietyIdRef`',
              'CVT1',
            )
            .having(
              (element) => element.fieldIdRef,
              'Correct `fieldIdRef`',
              'PFD2',
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              Partfield.staticIdRefPattern,
            ),
      );
    });

    test('.fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.partfield.xmlTag), [
            XmlAttribute(XmlName('A'), 'PFD1'),
            XmlAttribute(XmlName('B'), '100'),
            XmlAttribute(XmlName('C'), 'Test string'),
            XmlAttribute(XmlName('D'), '1000'),
            XmlAttribute(XmlName('E'), 'CTR1'),
            XmlAttribute(XmlName('F'), 'FRM1'),
            XmlAttribute(XmlName('G'), 'CTP1'),
            XmlAttribute(XmlName('H'), 'CVT1'),
            XmlAttribute(XmlName('I'), 'PFD2'),
          ]),
        ),
        isA<Partfield>()
            .having(
              (element) => element.id,
              'Correct `id`',
              'PFD1',
            )
            .having(
              (element) => element.code,
              'Correct `code`',
              '100',
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.area,
              'Correct `area`',
              1000,
            )
            .having(
              (element) => element.customerIdRef,
              'Correct `customerIdRef`',
              'CTR1',
            )
            .having(
              (element) => element.farmIdRef,
              'Correct `farmIdRef`',
              'FRM1',
            )
            .having(
              (element) => element.cropTypeIdRef,
              'Correct `cropTypeIdRef`',
              'CTP1',
            )
            .having(
              (element) => element.cropVarietyIdRef,
              'Correct `cropVarietyIdRef`',
              'CVT1',
            )
            .having(
              (element) => element.fieldIdRef,
              'Correct `fieldIdRef`',
              'PFD2',
            ),
      );
    });
  });

  group('Point', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        Point(
          type: PointType.flag,
          designator: 'Test string',
          north: 60,
          east: 10,
          up: 1000,
          colour: 10,
          id: 'PNT1',
          horizontalAccuracy: 0.1,
          verticalAccuracy: 0.2,
        ),
        isA<Point>()
            .having(
              (element) => element.type,
              'Correct `type`',
              PointType.flag,
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.north,
              'Correct `north`',
              60,
            )
            .having(
              (element) => element.east,
              'Correct `east`',
              10,
            )
            .having(
              (element) => element.up,
              'Correct `up`',
              1000,
            )
            .having(
              (element) => element.colour,
              'Correct `colour`',
              10,
            )
            .having(
              (element) => element.id,
              'Correct `id`',
              'PNT1',
            )
            .having(
              (element) => element.horizontalAccuracy,
              'Correct `horizontalAccuracy`',
              0.1,
            )
            .having(
              (element) => element.verticalAccuracy,
              'Correct `verticalAccuracy`',
              0.2,
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPatter`',
              Point.staticIdRefPattern,
            ),
      );
    });

    test(
      '''Throws ArgumentError if `filename` and any of `north`, `east`, `type` values are null''',
      () {
        expect(
          Point.new,
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.message,
              'Correct error',
              'north, east and type must not be null if filename is null',
            ),
          ),
        );
      },
    );

    test(
      'Throws ArgumentError if `type` is invalid`',
      () {
        expect(
          () => Iso11783Element.fromXmlElement(
            XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
              XmlAttribute(XmlName('A'), '100'),
              XmlAttribute(XmlName('C'), '60'),
              XmlAttribute(XmlName('D'), '10'),
            ]),
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'Point.type',
            ),
          ),
        );
      },
    );

    test('binaryRecordLength', () {
      final point = Point(
        filename: 'PNT00001',
        fileLength: 128,
        binaryPoints: [Point(type: PointType.flag, north: 60, east: 10)],
      );
      expect(
        point,
        isA<Point>()
            .having(
              (element) => element.filename,
              'Correct `filename`',
              'PNT00001',
            )
            .having(
              (element) => element.fileLength,
              'Correct `fileLengt`',
              128,
            )
            .having(
              (element) => element.binaryPoints,
              'Correct `binaryPoints`',
              [
                isA<Point>()
                    .having(
                      (element) => element.type,
                      'Correct `type`',
                      PointType.flag,
                    )
                    .having(
                      (element) => element.north,
                      'Correct `north`',
                      60,
                    )
                    .having(
                      (element) => element.east,
                      'Correct `east`',
                      10,
                    ),
              ],
            ),
      );
      expect(point.binaryRecordLength, null);
      point.binaryHeaderOptions = const PointBinaryHeaderOptions(
        readType: true,
      );
      expect(point.binaryRecordLength, 1);
      point.binaryHeaderOptions = const PointBinaryHeaderOptions(
        readType: true,
        readNorth: true,
      );
      expect(point.binaryRecordLength, 9);
      point.binaryHeaderOptions = const PointBinaryHeaderOptions(
        readType: true,
        readNorth: true,
        readEast: true,
      );
      expect(point.binaryRecordLength, 17);
      point.binaryHeaderOptions = const PointBinaryHeaderOptions(
        readType: true,
        readNorth: true,
        readEast: true,
        readUp: true,
      );
      expect(point.binaryRecordLength, 21);
      point.binaryHeaderOptions = const PointBinaryHeaderOptions(
        readType: true,
        readNorth: true,
        readEast: true,
        readUp: true,
        readColour: true,
      );
      expect(point.binaryRecordLength, 22);
      point.binaryHeaderOptions = const PointBinaryHeaderOptions(
        readType: true,
        readNorth: true,
        readEast: true,
        readUp: true,
        readColour: true,
        readHorizontalAccuracy: true,
      );
      expect(point.binaryRecordLength, 24);
      point.binaryHeaderOptions = const PointBinaryHeaderOptions(
        readType: true,
        readNorth: true,
        readEast: true,
        readUp: true,
        readColour: true,
        readHorizontalAccuracy: true,
        readVerticalAccuracy: true,
      );
      expect(point.binaryRecordLength, 26);
    });

    test('.binaryPointsBytes', () {
      final element = Point(
        filename: 'PNT00001',
        binaryHeaderOptions: const PointBinaryHeaderOptions(
          readType: true,
          readNorth: true,
          readEast: true,
          readUp: true,
          readColour: true,
          readHorizontalAccuracy: true,
          readVerticalAccuracy: true,
        ),
        binaryPoints: [
          Point(
            type: PointType.flag,
            north: 60,
            east: 10,
            up: 100,
            colour: 10,
            horizontalAccuracy: 0.1,
            verticalAccuracy: 0.2,
          ),
          Point(
            type: PointType.flag,
            north: 61,
            east: 11,
            up: 100,
            colour: 10,
            horizontalAccuracy: 0.1,
            verticalAccuracy: 0.2,
          ),
        ],
      );
      expect(
        element.binaryPointsBytes,
        isA<Uint8List>().having(
          (bytes) => bytes.lengthInBytes,
          'Correct `lengthInBytes`',
          element.binaryRecordLength! * 2,
        ),
      );
    });

    test('.parseData', () {
      final bytes = Point(
        filename: 'PNT00001',
        binaryHeaderOptions: const PointBinaryHeaderOptions(
          readType: true,
          readNorth: true,
          readEast: true,
          readUp: true,
          readColour: true,
          readHorizontalAccuracy: true,
          readVerticalAccuracy: true,
        ),
        binaryPoints: [
          Point(
            type: PointType.flag,
            north: 60,
            east: 10,
            up: 100,
            colour: 10,
            horizontalAccuracy: 0.1,
            verticalAccuracy: 0.2,
          ),
          Point(
            type: PointType.flag,
            north: 61,
            east: 11,
            up: 100,
            colour: 10,
            horizontalAccuracy: 0.1,
            verticalAccuracy: 0.2,
          ),
        ],
      ).binaryPointsBytes;
      expect(
        Point(
          filename: 'PNT00001',
          binaryHeaderOptions: const PointBinaryHeaderOptions(
            readType: true,
            readNorth: true,
            readEast: true,
            readUp: true,
            readColour: true,
            readHorizontalAccuracy: true,
            readVerticalAccuracy: true,
          ),
          byteData: bytes,
        )..parseData(),
        isA<Point>().having(
          (element) => element.binaryPoints,
          'Correct `binaryPoints`',
          [
            isA<Point>()
                .having(
                  (element) => element.type,
                  'Correct `type`',
                  PointType.flag,
                )
                .having(
                  (element) => element.north,
                  'Correct `north`',
                  60,
                )
                .having(
                  (element) => element.east,
                  'Correct `east`',
                  10,
                )
                .having(
                  (element) => element.up,
                  'Correct `up`',
                  100,
                )
                .having(
                  (element) => element.colour,
                  'Correct `colour`',
                  10,
                )
                .having(
                  (element) => element.horizontalAccuracy,
                  'Correct `horizontalAccuracy`',
                  0.1,
                )
                .having(
                  (element) => element.verticalAccuracy,
                  'Correct `verticalAccuracy`',
                  0.2,
                ),
            isA<Point>()
                .having(
                  (element) => element.type,
                  'Correct `type`',
                  PointType.flag,
                )
                .having(
                  (element) => element.north,
                  'Correct `north`',
                  61,
                )
                .having(
                  (element) => element.east,
                  'Correct `east`',
                  11,
                )
                .having(
                  (element) => element.up,
                  'Correct `up`',
                  100,
                )
                .having(
                  (element) => element.colour,
                  'Correct `colour`',
                  10,
                )
                .having(
                  (element) => element.horizontalAccuracy,
                  'Correct `horizontalAccuracy`',
                  0.1,
                )
                .having(
                  (element) => element.verticalAccuracy,
                  'Correct `verticalAccuracy`',
                  0.2,
                ),
          ],
        ),
      );
    });

    test('.parseData with nearly all header options as false', () {
      final bytes = Point(
        filename: 'PNT00001',
        binaryHeaderOptions: const PointBinaryHeaderOptions(
          readColour: true,
        ),
        binaryPoints: [
          Point(
            type: PointType.flag,
            north: 60,
            east: 10,
            up: 100,
            colour: 10,
            horizontalAccuracy: 0.1,
            verticalAccuracy: 0.2,
          ),
          Point(
            type: PointType.flag,
            north: 61,
            east: 11,
            up: 100,
            colour: 11,
            horizontalAccuracy: 0.1,
            verticalAccuracy: 0.2,
          ),
        ],
      ).binaryPointsBytes;
      expect(
        Point(
          filename: 'PNT00001',
          binaryHeaderOptions: const PointBinaryHeaderOptions(
            readColour: true,
          ),
          north: 0,
          east: 1,
          up: 2,
          type: PointType.homebase,
          horizontalAccuracy: 3,
          verticalAccuracy: 4,
          byteData: bytes,
        )..parseData(),
        isA<Point>().having(
          (element) => element.binaryPoints,
          'Correct `binaryPoints`',
          [
            isA<Point>()
                .having(
                  (element) => element.type,
                  'Correct `type`',
                  PointType.homebase,
                )
                .having(
                  (element) => element.north,
                  'Correct `north`',
                  0,
                )
                .having(
                  (element) => element.east,
                  'Correct `east`',
                  1,
                )
                .having(
                  (element) => element.up,
                  'Correct `up`',
                  2,
                )
                .having(
                  (element) => element.colour,
                  'Correct `colour`',
                  10,
                )
                .having(
                  (element) => element.horizontalAccuracy,
                  'Correct `horizontalAccuracy`',
                  3,
                )
                .having(
                  (element) => element.verticalAccuracy,
                  'Correct `verticalAccuracy`',
                  4,
                ),
            isA<Point>()
                .having(
                  (element) => element.type,
                  'Correct `type`',
                  PointType.homebase,
                )
                .having(
                  (element) => element.north,
                  'Correct `north`',
                  0,
                )
                .having(
                  (element) => element.east,
                  'Correct `east`',
                  1,
                )
                .having(
                  (element) => element.up,
                  'Correct `up`',
                  2,
                )
                .having(
                  (element) => element.colour,
                  'Correct `colour`',
                  11,
                )
                .having(
                  (element) => element.horizontalAccuracy,
                  'Correct `horizontalAccuracy`',
                  3,
                )
                .having(
                  (element) => element.verticalAccuracy,
                  'Correct `verticalAccuracy`',
                  4,
                ),
          ],
        ),
      );
    });
  });

  group('PointBinaryHeaderOptions', () {
    test('Equality', () {
      bool readType;
      readType = true;
      expect(
        const PointBinaryHeaderOptions(
          readColour: true,
          readType: true,
          readVerticalAccuracy: true,
        ),
        PointBinaryHeaderOptions(
          readColour: true,
          readVerticalAccuracy: true,
          readType: readType,
        ),
      );
      expect(
        const PointBinaryHeaderOptions(
          readColour: true,
          readType: true,
          readVerticalAccuracy: true,
        ).hashCode,
        PointBinaryHeaderOptions(
          readColour: true,
          readVerticalAccuracy: true,
          readType: readType,
        ).hashCode,
      );
    });
  });

  group('Polygon', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        Polygon(
          type: PolygonType.mainfield,
          lineStrings: [
            LineString(
              points: [
                Point(type: PointType.flag, north: 60, east: 10),
                Point(type: PointType.flag, north: 61, east: 10),
                Point(type: PointType.flag, north: 61, east: 11),
                Point(type: PointType.flag, north: 60, east: 11),
              ],
              type: LineStringType.polygonExterior,
            ),
          ],
          designator: 'Test string',
          area: 1000,
          colour: 10,
          id: 'PLN1',
        ),
        isA<Polygon>()
            .having(
              (element) => element.type,
              'Correct `type`',
              PolygonType.mainfield,
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.area,
              'Correct `area`',
              1000,
            )
            .having(
              (element) => element.colour,
              'Correct `colour`',
              10,
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              Polygon.staticIdRefPattern,
            )
            .having(
              (element) => element.lineStrings,
              'Correct `lineStrings`',
              [
                isA<LineString>()
                    .having(
                      (lineString) => lineString.type,
                      'Correct `type`',
                      LineStringType.polygonExterior,
                    )
                    .having(
                      (lineString) => lineString.points,
                      'Correct `points`',
                      [
                        isA<Point>()
                            .having(
                              (point) => point.type,
                              'Correct `type`',
                              PointType.flag,
                            )
                            .having(
                              (point) => point.north,
                              'Correct `north`',
                              60,
                            )
                            .having(
                              (point) => point.east,
                              'Correct `east`',
                              10,
                            ),
                        isA<Point>()
                            .having(
                              (point) => point.type,
                              'Correct `type`',
                              PointType.flag,
                            )
                            .having(
                              (point) => point.north,
                              'Correct `north`',
                              61,
                            )
                            .having(
                              (point) => point.east,
                              'Correct `east`',
                              10,
                            ),
                        isA<Point>()
                            .having(
                              (point) => point.type,
                              'Correct `type`',
                              PointType.flag,
                            )
                            .having(
                              (point) => point.north,
                              'Correct `north`',
                              61,
                            )
                            .having(
                              (point) => point.east,
                              'Correct `east`',
                              11,
                            ),
                        isA<Point>()
                            .having(
                              (point) => point.type,
                              'Correct `type`',
                              PointType.flag,
                            )
                            .having(
                              (point) => point.north,
                              'Correct `north`',
                              60,
                            )
                            .having(
                              (point) => point.east,
                              'Correct `east`',
                              11,
                            ),
                      ],
                    ),
              ],
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.polygon.xmlTag),
            [
              XmlAttribute(XmlName('A'), '9'),
              XmlAttribute(XmlName('B'), 'Test string'),
              XmlAttribute(XmlName('C'), '1000'),
              XmlAttribute(XmlName('D'), '10'),
              XmlAttribute(XmlName('E'), 'PLN1'),
            ],
            [
              XmlElement(
                XmlName(Iso11783ElementType.lineString.xmlTag),
                [XmlAttribute(XmlName('A'), '1')],
                [
                  XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                    XmlAttribute(XmlName('A'), '1'),
                    XmlAttribute(XmlName('C'), '60'),
                    XmlAttribute(XmlName('D'), '10'),
                  ]),
                  XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                    XmlAttribute(XmlName('A'), '1'),
                    XmlAttribute(XmlName('C'), '61'),
                    XmlAttribute(XmlName('D'), '10'),
                  ]),
                  XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                    XmlAttribute(XmlName('A'), '1'),
                    XmlAttribute(XmlName('C'), '61'),
                    XmlAttribute(XmlName('D'), '11'),
                  ]),
                  XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                    XmlAttribute(XmlName('A'), '1'),
                    XmlAttribute(XmlName('C'), '60'),
                    XmlAttribute(XmlName('D'), '11'),
                  ]),
                ],
              ),
            ],
          ),
        ),
        isA<Polygon>()
            .having(
              (element) => element.type,
              'Correct `type`',
              PolygonType.mainfield,
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.area,
              'Correct `area`',
              1000,
            )
            .having(
              (element) => element.colour,
              'Correct `colour`',
              10,
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              Polygon.staticIdRefPattern,
            )
            .having(
              (element) => element.lineStrings,
              'Correct `lineStrings`',
              [
                isA<LineString>()
                    .having(
                      (lineString) => lineString.type,
                      'Correct `type`',
                      LineStringType.polygonExterior,
                    )
                    .having(
                      (lineString) => lineString.points,
                      'Correct `points`',
                      [
                        isA<Point>()
                            .having(
                              (point) => point.type,
                              'Correct `type`',
                              PointType.flag,
                            )
                            .having(
                              (point) => point.north,
                              'Correct `north`',
                              60,
                            )
                            .having(
                              (point) => point.east,
                              'Correct `east`',
                              10,
                            ),
                        isA<Point>()
                            .having(
                              (point) => point.type,
                              'Correct `type`',
                              PointType.flag,
                            )
                            .having(
                              (point) => point.north,
                              'Correct `north`',
                              61,
                            )
                            .having(
                              (point) => point.east,
                              'Correct `east`',
                              10,
                            ),
                        isA<Point>()
                            .having(
                              (point) => point.type,
                              'Correct `type`',
                              PointType.flag,
                            )
                            .having(
                              (point) => point.north,
                              'Correct `north`',
                              61,
                            )
                            .having(
                              (point) => point.east,
                              'Correct `east`',
                              11,
                            ),
                        isA<Point>()
                            .having(
                              (point) => point.type,
                              'Correct `type`',
                              PointType.flag,
                            )
                            .having(
                              (point) => point.north,
                              'Correct `north`',
                              60,
                            )
                            .having(
                              (point) => point.east,
                              'Correct `east`',
                              11,
                            ),
                      ],
                    ),
              ],
            ),
      );
    });

    test(
      'Throws ArgumentError if `type` is invalid`',
      () {
        expect(
          () => Iso11783Element.fromXmlElement(
            XmlElement(XmlName(Iso11783ElementType.polygon.xmlTag), [
              XmlAttribute(XmlName('A'), '100'),
            ]),
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'Polygon.type',
            ),
          ),
        );
      },
    );
  });

  group('Position', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        Position(
          north: 60,
          east: 10,
          up: 100,
          status: PositionStatus.rtkFixedInteger,
          pdop: 0.5,
          hdop: 0.2,
          numberOfSatellites: 14,
          gpsUtcTimeMs: 43200,
          gpsUtcDate: 16600,
        ),
        isA<Position>()
            .having(
              (element) => element.north,
              'Correct `north`',
              60,
            )
            .having(
              (element) => element.east,
              'Correct `east`',
              10,
            )
            .having(
              (element) => element.up,
              'Correct `up`',
              100,
            )
            .having(
              (element) => element.status,
              'Correct `status`',
              PositionStatus.rtkFixedInteger,
            )
            .having(
              (element) => element.pdop,
              'Correct `pdop`',
              0.5,
            )
            .having(
              (element) => element.hdop,
              'Correct `hdop`',
              0.2,
            )
            .having(
              (element) => element.numberOfSatellites,
              'Correct `numberOfSatellites`',
              14,
            )
            .having(
              (element) => element.gpsUtcTimeMs,
              'Correct `gpsUtcTimeMs`',
              43200,
            )
            .having(
              (element) => element.gpsUtcDate,
              'Correct `gpsUtcDate`',
              16600,
            ),
      );
    });

    test(
      'Throws ArgumentError if `status` is invalid`',
      () {
        expect(
          () => Iso11783Element.fromXmlElement(
            XmlElement(XmlName(Iso11783ElementType.position.xmlTag), [
              XmlAttribute(XmlName('A'), '60'),
              XmlAttribute(XmlName('B'), '10'),
              XmlAttribute(XmlName('D'), '100'),
            ]),
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'Position.status',
            ),
          ),
        );
      },
    );
  });

  group('GuidanceAllocation', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        GuidanceAllocation(
          allocationStamps: [
            AllocationStamp(
              start: DateTime.utc(2025),
              type: AllocationStampType.effective,
            ),
          ],
          groupIdRef: 'GGP1',
          shifts: [
            GuidanceShift(
              allocationStamp: AllocationStamp(
                start: DateTime.utc(2025),
                type: AllocationStampType.effective,
              ),
              groupIdRef: 'GGP1',
              patternIdRef: 'GPN1',
              eastShift: 5000,
              northShift: 2500,
            ),
          ],
        ),
        isA<GuidanceAllocation>()
            .having(
              (element) => element.groupIdRef,
              'Correct `groupIdRef`',
              'GGP1',
            )
            .having(
              (element) => element.allocationStamps,
              'Correct `allocationStamps`',
              [
                isA<AllocationStamp>()
                    .having(
                      (element) => element.start,
                      'Correct `start`',
                      DateTime.utc(2025),
                    )
                    .having(
                      (element) => element.type,
                      'Correct `type`',
                      AllocationStampType.effective,
                    ),
              ],
            )
            .having(
              (element) => element.shifts,
              'Correct `shifts`',
              [
                isA<GuidanceShift>()
                    .having(
                      (element) => element.groupIdRef,
                      'Correct `groupIdRef`',
                      'GGP1',
                    )
                    .having(
                      (element) => element.patternIdRef,
                      'Correct `patternIdRef`',
                      'GPN1',
                    )
                    .having(
                      (element) => element.eastShift,
                      'Correct `eastShift`',
                      5000,
                    )
                    .having(
                      (element) => element.northShift,
                      'Correct `northShift`',
                      2500,
                    )
                    .having(
                      (element) => element.allocationStamp,
                      'Correct `allocationStamp`',
                      isA<AllocationStamp>()
                          .having(
                            (element) => element.start,
                            'Correct `start`',
                            DateTime.utc(2025),
                          )
                          .having(
                            (element) => element.type,
                            'Correct `type`',
                            AllocationStampType.effective,
                          ),
                    ),
              ],
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.guidanceAllocation.xmlTag),
            [XmlAttribute(XmlName('A'), 'GGP1')],
            [
              XmlElement(XmlName(Iso11783ElementType.allocationStamp.xmlTag), [
                XmlAttribute(
                  XmlName('A'),
                  DateTime.utc(2025).toIso8601String(),
                ),
                XmlAttribute(XmlName('D'), '4'),
              ]),
              XmlElement(
                XmlName(Iso11783ElementType.guidanceShift.xmlTag),
                [
                  XmlAttribute(XmlName('A'), 'GGP1'),
                  XmlAttribute(XmlName('B'), 'GPN1'),
                  XmlAttribute(XmlName('C'), '5000'),
                  XmlAttribute(XmlName('D'), '2500'),
                ],
                [
                  XmlElement(
                    XmlName(Iso11783ElementType.allocationStamp.xmlTag),
                    [
                      XmlAttribute(
                        XmlName('A'),
                        DateTime.utc(2025).toIso8601String(),
                      ),
                      XmlAttribute(XmlName('D'), '4'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        isA<GuidanceAllocation>()
            .having(
              (element) => element.groupIdRef,
              'Correct `groupIdRef`',
              'GGP1',
            )
            .having(
              (element) => element.allocationStamps,
              'Correct `allocationStamps`',
              [
                isA<AllocationStamp>()
                    .having(
                      (element) => element.start,
                      'Correct `start`',
                      DateTime.utc(2025),
                    )
                    .having(
                      (element) => element.type,
                      'Correct `type`',
                      AllocationStampType.effective,
                    ),
              ],
            )
            .having(
              (element) => element.shifts,
              'Correct `shifts`',
              [
                isA<GuidanceShift>()
                    .having(
                      (element) => element.groupIdRef,
                      'Correct `groupIdRef`',
                      'GGP1',
                    )
                    .having(
                      (element) => element.patternIdRef,
                      'Correct `patternIdRef`',
                      'GPN1',
                    )
                    .having(
                      (element) => element.eastShift,
                      'Correct `eastShift`',
                      5000,
                    )
                    .having(
                      (element) => element.northShift,
                      'Correct `northShift`',
                      2500,
                    )
                    .having(
                      (element) => element.allocationStamp,
                      'Correct `allocationStamp`',
                      isA<AllocationStamp>()
                          .having(
                            (element) => element.start,
                            'Correct `start`',
                            DateTime.utc(2025),
                          )
                          .having(
                            (element) => element.type,
                            'Correct `type`',
                            AllocationStampType.effective,
                          ),
                    ),
              ],
            ),
      );
    });

    test('Empty `allocationStamps` throws ArgumentError', () {
      expect(
        () => GuidanceAllocation(
          allocationStamps: const [],
          groupIdRef: 'GGP1',
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'GuidanceAllocation.allocationStamps',
          ),
        ),
      );
    });

    test('XmlSyncedList.clear with multiple types of elements', () {
      final element = GuidanceAllocation(
        allocationStamps: [
          AllocationStamp(
            start: DateTime.utc(2025),
            type: AllocationStampType.effective,
          ),
        ],
        groupIdRef: 'GGP1',
        shifts: [GuidanceShift(), GuidanceShift()],
      );
      expect(element.xmlElement.children.length, 3);
      element.shifts.clear();
      expect(element.xmlElement.children.length, 1);
    });
  });

  group('GuidanceGroup', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        GuidanceGroup(
          id: 'GGP1',
          designator: 'Test string',
          boundaryPolygon: Polygon(
            type: PolygonType.partfieldBoundary,
            lineStrings: [
              LineString(
                points: [
                  Point(north: 60, east: 10, type: PointType.flag),
                  Point(north: 61, east: 10, type: PointType.flag),
                  Point(north: 61, east: 11, type: PointType.flag),
                  Point(north: 60, east: 11, type: PointType.flag),
                ],
                type: LineStringType.polygonExterior,
              ),
            ],
          ),
          patterns: [
            GuidancePattern(
              lineString: LineString(
                points: [
                  Point(north: 60.1, east: 10.1, type: PointType.flag),
                  Point(north: 60.9, east: 10.1, type: PointType.flag),
                ],
                type: LineStringType.guidancePattern,
              ),

              id: 'GPN1',
              type: GuidancePatternType.ab,
            ),
          ],
        ),
        isA<GuidanceGroup>()
            .having(
              (element) => element.id,
              'Correct `id`',
              'GGP1',
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              GuidanceGroup.staticIdRefPattern,
            )
            .having(
              (element) => element.boundaryPolygon,
              'Correct `boundaryPolygon`',
              isA<Polygon>()
                  .having(
                    (polygon) => polygon.type,
                    'Correct `type`',
                    PolygonType.partfieldBoundary,
                  )
                  .having(
                    (element) => element.lineStrings,
                    'Correct `lineStrings`',
                    [
                      isA<LineString>()
                          .having(
                            (lineString) => lineString.type,
                            'Correct `type`',
                            LineStringType.polygonExterior,
                          )
                          .having(
                            (lineString) => lineString.points,
                            'Correct `points`',
                            [
                              isA<Point>()
                                  .having(
                                    (point) => point.type,
                                    'Correct `type`',
                                    PointType.flag,
                                  )
                                  .having(
                                    (point) => point.north,
                                    'Correct `north`',
                                    60,
                                  )
                                  .having(
                                    (point) => point.east,
                                    'Correct `east`',
                                    10,
                                  ),
                              isA<Point>()
                                  .having(
                                    (point) => point.type,
                                    'Correct `type`',
                                    PointType.flag,
                                  )
                                  .having(
                                    (point) => point.north,
                                    'Correct `north`',
                                    61,
                                  )
                                  .having(
                                    (point) => point.east,
                                    'Correct `east`',
                                    10,
                                  ),
                              isA<Point>()
                                  .having(
                                    (point) => point.type,
                                    'Correct `type`',
                                    PointType.flag,
                                  )
                                  .having(
                                    (point) => point.north,
                                    'Correct `north`',
                                    61,
                                  )
                                  .having(
                                    (point) => point.east,
                                    'Correct `east`',
                                    11,
                                  ),
                              isA<Point>()
                                  .having(
                                    (point) => point.type,
                                    'Correct `type`',
                                    PointType.flag,
                                  )
                                  .having(
                                    (point) => point.north,
                                    'Correct `north`',
                                    60,
                                  )
                                  .having(
                                    (point) => point.east,
                                    'Correct `east`',
                                    11,
                                  ),
                            ],
                          ),
                    ],
                  ),
            )
            .having(
              (element) => element.patterns,
              'Correct `patterns`',
              [
                isA<GuidancePattern>()
                    .having(
                      (pattern) => pattern.type,
                      'Correct `type`',
                      GuidancePatternType.ab,
                    )
                    .having(
                      (pattern) => pattern.id,
                      'Correct `id`',
                      'GPN1',
                    )
                    .having(
                      (pattern) => pattern.lineString,
                      'Correct `lineStrings`',

                      isA<LineString>()
                          .having(
                            (lineString) => lineString.type,
                            'Correct `type`',
                            LineStringType.guidancePattern,
                          )
                          .having(
                            (lineString) => lineString.points,
                            'Correct `points`',
                            [
                              isA<Point>()
                                  .having(
                                    (point) => point.type,
                                    'Correct `type`',
                                    PointType.flag,
                                  )
                                  .having(
                                    (point) => point.north,
                                    'Correct `north`',
                                    60.1,
                                  )
                                  .having(
                                    (point) => point.east,
                                    'Correct `east`',
                                    10.1,
                                  ),
                              isA<Point>()
                                  .having(
                                    (point) => point.type,
                                    'Correct `type`',
                                    PointType.flag,
                                  )
                                  .having(
                                    (point) => point.north,
                                    'Correct `north`',
                                    60.9,
                                  )
                                  .having(
                                    (point) => point.east,
                                    'Correct `east`',
                                    10.1,
                                  ),
                            ],
                          ),
                    ),
              ],
            ),
      );
    });
  });

  group('GuidancePattern', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        GuidancePattern(
          lineString: LineString(
            points: [
              Point(north: 60.1, east: 10.1, type: PointType.flag),
              Point(north: 60.9, east: 10.1, type: PointType.flag),
            ],
            type: LineStringType.guidancePattern,
          ),
          id: 'GPN1',
          designator: 'Test string',
          type: GuidancePatternType.ab,
          boundaryPolygon: Polygon(
            type: PolygonType.partfieldBoundary,
            lineStrings: [
              LineString(
                points: [
                  Point(north: 60, east: 10, type: PointType.flag),
                  Point(north: 61, east: 10, type: PointType.flag),
                  Point(north: 61, east: 11, type: PointType.flag),
                  Point(north: 60, east: 11, type: PointType.flag),
                ],
                type: LineStringType.polygonExterior,
              ),
            ],
          ),
          propagationDirection: GuidancePatternPropagationDirection.rightOnly,
          extension: GuidancePatternExtension.fromAOnly,
          heading: 0,
          gnssMethod: GuidancePatternGnssMethod.rtkFixedInteger,
          horizontalAccuracy: 0.2,
          verticalAccuracy: 0.5,
          baseStationIdRef: 'BSN1',
          originalSRID: 'EPSG:4326',
          numberOfSwathsLeft: 1,
          numberOfSwathsRight: 10,
        ),
        isA<GuidancePattern>()
            .having(
              (pattern) => pattern.type,
              'Correct `type`',
              GuidancePatternType.ab,
            )
            .having(
              (pattern) => pattern.id,
              'Correct `id`',
              'GPN1',
            )
            .having(
              (pattern) => pattern.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (pattern) => pattern.propagationDirection,
              'Correct `propagationDirection`',
              GuidancePatternPropagationDirection.rightOnly,
            )
            .having(
              (pattern) => pattern.extension,
              'Correct `extension`',
              GuidancePatternExtension.fromAOnly,
            )
            .having(
              (pattern) => pattern.heading,
              'Correct `heading`',
              0,
            )
            .having(
              (pattern) => pattern.gnssMethod,
              'Correct `gnssMethod`',
              GuidancePatternGnssMethod.rtkFixedInteger,
            )
            .having(
              (pattern) => pattern.horizontalAccuracy,
              'Correct `horizontalAccuracty`',
              0.2,
            )
            .having(
              (pattern) => pattern.verticalAccuracy,
              'Correct `verticalAccuracty`',
              0.5,
            )
            .having(
              (pattern) => pattern.baseStationIdRef,
              'Correct `baseStationIdRef`',
              'BSN1',
            )
            .having(
              (pattern) => pattern.originalSRID,
              'Correct `originalSRID`',
              'EPSG:4326',
            )
            .having(
              (pattern) => pattern.numberOfSwathsLeft,
              'Correct `numberOfSwathsLeft`',
              1,
            )
            .having(
              (pattern) => pattern.numberOfSwathsRight,
              'Correct `numberOfSwathsRight`',
              10,
            )
            .having(
              (pattern) => pattern.idRefPattern,
              'Correct `idRefPattern`',
              GuidancePattern.staticIdRefPattern,
            )
            .having(
              (pattern) => pattern.lineString,
              'Correct `lineString`',
              isA<LineString>()
                  .having(
                    (lineString) => lineString.type,
                    'Correct `type`',
                    LineStringType.guidancePattern,
                  )
                  .having(
                    (lineString) => lineString.points,
                    'Correct `points`',
                    [
                      isA<Point>()
                          .having(
                            (point) => point.type,
                            'Correct `type`',
                            PointType.flag,
                          )
                          .having(
                            (point) => point.north,
                            'Correct `north`',
                            60.1,
                          )
                          .having(
                            (point) => point.east,
                            'Correct `east`',
                            10.1,
                          ),
                      isA<Point>()
                          .having(
                            (point) => point.type,
                            'Correct `type`',
                            PointType.flag,
                          )
                          .having(
                            (point) => point.north,
                            'Correct `north`',
                            60.9,
                          )
                          .having(
                            (point) => point.east,
                            'Correct `east`',
                            10.1,
                          ),
                    ],
                  ),
            )
            .having(
              (element) => element.boundaryPolygon,
              'Correct `boundaryPolygon`',
              isA<Polygon>()
                  .having(
                    (polygon) => polygon.type,
                    'Correct `type`',
                    PolygonType.partfieldBoundary,
                  )
                  .having(
                    (element) => element.lineStrings,
                    'Correct `lineStrings`',
                    [
                      isA<LineString>()
                          .having(
                            (lineString) => lineString.type,
                            'Correct `type`',
                            LineStringType.polygonExterior,
                          )
                          .having(
                            (lineString) => lineString.points,
                            'Correct `points`',
                            [
                              isA<Point>()
                                  .having(
                                    (point) => point.type,
                                    'Correct `type`',
                                    PointType.flag,
                                  )
                                  .having(
                                    (point) => point.north,
                                    'Correct `north`',
                                    60,
                                  )
                                  .having(
                                    (point) => point.east,
                                    'Correct `east`',
                                    10,
                                  ),
                              isA<Point>()
                                  .having(
                                    (point) => point.type,
                                    'Correct `type`',
                                    PointType.flag,
                                  )
                                  .having(
                                    (point) => point.north,
                                    'Correct `north`',
                                    61,
                                  )
                                  .having(
                                    (point) => point.east,
                                    'Correct `east`',
                                    10,
                                  ),
                              isA<Point>()
                                  .having(
                                    (point) => point.type,
                                    'Correct `type`',
                                    PointType.flag,
                                  )
                                  .having(
                                    (point) => point.north,
                                    'Correct `north`',
                                    61,
                                  )
                                  .having(
                                    (point) => point.east,
                                    'Correct `east`',
                                    11,
                                  ),
                              isA<Point>()
                                  .having(
                                    (point) => point.type,
                                    'Correct `type`',
                                    PointType.flag,
                                  )
                                  .having(
                                    (point) => point.north,
                                    'Correct `north`',
                                    60,
                                  )
                                  .having(
                                    (point) => point.east,
                                    'Correct `east`',
                                    11,
                                  ),
                            ],
                          ),
                    ],
                  ),
            ),
      );
    });

    test('Invalid `type` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.guidancePattern.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'GPN1'),
              XmlAttribute(XmlName('C'), '100'),
            ],
            [
              XmlElement(
                XmlName(Iso11783ElementType.lineString.xmlTag),
                [XmlAttribute(XmlName('A'), '1')],
                [
                  XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                    XmlAttribute(XmlName('A'), '1'),
                    XmlAttribute(XmlName('C'), '60'),
                    XmlAttribute(XmlName('D'), '10'),
                  ]),
                  XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                    XmlAttribute(XmlName('A'), '1'),
                    XmlAttribute(XmlName('C'), '61'),
                    XmlAttribute(XmlName('D'), '10'),
                  ]),
                ],
              ),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'GuidancePattern.type',
          ),
        ),
      );
    });

    test('Invalid `options` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.guidancePattern.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'GPN1'),
              XmlAttribute(XmlName('C'), '4'),
              XmlAttribute(XmlName('D'), '100'),
            ],
            [
              XmlElement(
                XmlName(Iso11783ElementType.lineString.xmlTag),
                [XmlAttribute(XmlName('A'), '1')],
                [
                  XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                    XmlAttribute(XmlName('A'), '1'),
                    XmlAttribute(XmlName('C'), '60'),
                    XmlAttribute(XmlName('D'), '10'),
                  ]),
                  XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                    XmlAttribute(XmlName('A'), '1'),
                    XmlAttribute(XmlName('C'), '61'),
                    XmlAttribute(XmlName('D'), '10'),
                  ]),
                ],
              ),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'GuidancePattern.options',
          ),
        ),
      );
    });

    test('Invalid `propacationDirection` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.guidancePattern.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'GPN1'),
              XmlAttribute(XmlName('C'), '1'),
              XmlAttribute(XmlName('E'), '100'),
            ],
            [
              XmlElement(
                XmlName(Iso11783ElementType.lineString.xmlTag),
                [XmlAttribute(XmlName('A'), '1')],
                [
                  XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                    XmlAttribute(XmlName('A'), '1'),
                    XmlAttribute(XmlName('C'), '60'),
                    XmlAttribute(XmlName('D'), '10'),
                  ]),
                  XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                    XmlAttribute(XmlName('A'), '1'),
                    XmlAttribute(XmlName('C'), '61'),
                    XmlAttribute(XmlName('D'), '10'),
                  ]),
                ],
              ),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'GuidancePattern.propagationDirection',
          ),
        ),
      );
    });

    test('Invalid `extension` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.guidancePattern.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'GPN1'),
              XmlAttribute(XmlName('C'), '1'),
              XmlAttribute(XmlName('F'), '100'),
            ],
            [
              XmlElement(
                XmlName(Iso11783ElementType.lineString.xmlTag),
                [XmlAttribute(XmlName('A'), '1')],
                [
                  XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                    XmlAttribute(XmlName('A'), '1'),
                    XmlAttribute(XmlName('C'), '60'),
                    XmlAttribute(XmlName('D'), '10'),
                  ]),
                  XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                    XmlAttribute(XmlName('A'), '1'),
                    XmlAttribute(XmlName('C'), '61'),
                    XmlAttribute(XmlName('D'), '10'),
                  ]),
                ],
              ),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'GuidancePattern.extension',
          ),
        ),
      );
    });

    test('Invalid `gnssMethod` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.guidancePattern.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'GPN1'),
              XmlAttribute(XmlName('C'), '1'),
              XmlAttribute(XmlName('I'), '100'),
            ],
            [
              XmlElement(
                XmlName(Iso11783ElementType.lineString.xmlTag),
                [XmlAttribute(XmlName('A'), '1')],
                [
                  XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                    XmlAttribute(XmlName('A'), '1'),
                    XmlAttribute(XmlName('C'), '60'),
                    XmlAttribute(XmlName('D'), '10'),
                  ]),
                  XmlElement(XmlName(Iso11783ElementType.point.xmlTag), [
                    XmlAttribute(XmlName('A'), '1'),
                    XmlAttribute(XmlName('C'), '61'),
                    XmlAttribute(XmlName('D'), '10'),
                  ]),
                ],
              ),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'GuidancePattern.gnssMethod',
          ),
        ),
      );
    });

    test('`lineString` setter', () {
      final element = GuidancePattern(
        lineString: LineString(
          points: [
            Point(north: 60, east: 10, type: PointType.flag),
            Point(north: 60, east: 11, type: PointType.flag),
          ],
          type: LineStringType.guidancePattern,
          id: 'LSG1',
        ),
        id: 'GPN1',
        type: GuidancePatternType.ab,
      );

      expect(
        element.lineString,
        isA<LineString>().having(
          (lineString) => lineString.id,
          'Correct `id`',
          'LSG1',
        ),
      );
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local ==
                  Iso11783ElementType.lineString.xmlTag,
            )
            .length,
        1,
      );

      final newLineString = LineString(
        points: [
          Point(north: 60, east: 10, type: PointType.flag),
          Point(north: 60, east: 11, type: PointType.flag),
        ],
        type: LineStringType.guidancePattern,
        id: 'LSG2',
      );
      // Tests removal of parent.
      XmlElement.tag('ABC').children.add(newLineString.xmlElement);

      element.lineString = newLineString;
      expect(
        element.lineString,
        isA<LineString>().having(
          (lineString) => lineString.id,
          'Correct `id`',
          'LSG2',
        ),
      );
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local ==
                  Iso11783ElementType.lineString.xmlTag,
            )
            .length,
        1,
      );
    });

    test('`boundaryPolygon` setter', () {
      final element = GuidancePattern(
        lineString: LineString(
          points: [
            Point(north: 60, east: 10, type: PointType.flag),
            Point(north: 60, east: 11, type: PointType.flag),
          ],
          type: LineStringType.guidancePattern,
        ),
        id: 'GPN1',
        type: GuidancePatternType.ab,
      );
      final polygon = Polygon(
        type: PolygonType.partfieldBoundary,
        lineStrings: [],
        id: 'PLN1',
      );

      expect(element.boundaryPolygon, isNull);
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local == Iso11783ElementType.polygon.xmlTag,
            )
            .isEmpty,
        isTrue,
      );
      element.boundaryPolygon = polygon;
      expect(
        element.boundaryPolygon,
        isA<Polygon>().having(
          (polygon) => polygon.id,
          'Correct `id`',
          polygon.id,
        ),
      );
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local == Iso11783ElementType.polygon.xmlTag,
            )
            .length,
        1,
      );

      final newPolygon = Polygon(
        type: PolygonType.partfieldBoundary,
        lineStrings: [],
        id: 'PLN2',
      );
      element.boundaryPolygon = newPolygon;
      expect(
        element.boundaryPolygon,
        isA<Polygon>().having(
          (polygon) => polygon.id,
          'Correct `id`',
          newPolygon.id,
        ),
      );
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local == Iso11783ElementType.polygon.xmlTag,
            )
            .length,
        1,
      );

      element.boundaryPolygon = null;
      expect(
        element.boundaryPolygon,
        isNull,
      );
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local == Iso11783ElementType.polygon.xmlTag,
            )
            .isEmpty,
        isTrue,
      );
    });
  });

  group('Iso11783LinkList', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        Iso11783LinkList(
          versionMajor: VersionMajor.four,
          versionMinor: VersionMinor.three,
          managementSoftwareManufacturer: 'Manufacturer',
          managementSoftwareVersion: '1.0.0',
          dataTransferOrigin: DataTransferOrigin.mics,
          taskControllerManufacturer: 'Controller Manufacturer',
          taskControllerVersion: '2.0.0',
          fileVersion: '1.0',
          linkGroups: [
            LinkGroup(
              id: 'LGP1',
              type: LinkGroupType.uuids,
              links: [
                Link(
                  objectIdRef: 'BSN1',
                  linkValue: '123abc',
                  designator: 'Test string',
                ),
              ],
            ),
          ],
        ),
        isA<Iso11783LinkList>()
            .having(
              (element) => element.versionMajor,
              'Correct `versionMajor`',
              VersionMajor.four,
            )
            .having(
              (element) => element.versionMinor,
              'Correct `versionMinor`',
              VersionMinor.three,
            )
            .having(
              (element) => element.managementSoftwareManufacturer,
              'Correct `managementSoftwareManufacturer`',
              'Manufacturer',
            )
            .having(
              (element) => element.managementSoftwareVersion,
              'Correct `managementSoftwareVersion`',
              '1.0.0',
            )
            .having(
              (element) => element.dataTransferOrigin,
              'Correct `dataTransferOrigin`',
              DataTransferOrigin.mics,
            )
            .having(
              (element) => element.taskControllerManufacturer,
              'Correct `taskControllerManufacturer`',
              'Controller Manufacturer',
            )
            .having(
              (element) => element.taskControllerVersion,
              'Correct `taskControllerVersion`',
              '2.0.0',
            )
            .having(
              (element) => element.fileVersion,
              'Correct `fileVersion`',
              '1.0',
            )
            .having(
              (element) => element.linkGroups,
              'Correct `linkGroups`',
              [
                isA<LinkGroup>()
                    .having(
                      (linkGroup) => linkGroup.id,
                      'Correct `id`',
                      'LGP1',
                    )
                    .having(
                      (linkGroup) => linkGroup.type,
                      'Correct `type`',
                      LinkGroupType.uuids,
                    )
                    .having(
                      (linkGroup) => linkGroup.links,
                      'Correct `links`',
                      [
                        isA<Link>()
                            .having(
                              (link) => link.objectIdRef,
                              'Correct `objectIdRef`',
                              'BSN1',
                            )
                            .having(
                              (link) => link.linkValue,
                              'Correct `linkValue`',
                              '123abc',
                            )
                            .having(
                              (link) => link.designator,
                              'Correct `designator`',
                              'Test string',
                            ),
                      ],
                    ),
              ],
            ),
      );
    });

    test('.fromXmlDocument', () {
      expect(
        Iso11783LinkList.fromXmlDocument(
          XmlDocument([
            XmlElement(
              XmlName(Iso11783ElementType.linkList.xmlTag),
              [
                XmlAttribute(XmlName('VersionMajor'), '4'),
                XmlAttribute(XmlName('VersionMinor'), '3'),
                XmlAttribute(
                  XmlName('ManagementSoftwareManufacturer'),
                  'Manufacturer',
                ),
                XmlAttribute(XmlName('ManagementSoftwareVersion'), '1.0.0'),
                XmlAttribute(
                  XmlName('TaskControllerManufacturer'),
                  'Controller Manufacturer',
                ),
                XmlAttribute(XmlName('TaskControllerVersion'), '2.0.0'),
                XmlAttribute(XmlName('DataTransferOrigin'), '2'),
                XmlAttribute(XmlName('FileVersion'), '1.0'),
              ],
              [
                XmlElement(
                  XmlName(Iso11783ElementType.linkGroup.xmlTag),
                  [
                    XmlAttribute(XmlName('A'), 'LGP1'),
                    XmlAttribute(XmlName('B'), '1'),
                  ],
                  [
                    XmlElement(XmlName(Iso11783ElementType.link.xmlTag), [
                      XmlAttribute(XmlName('A'), 'BSN1'),
                      XmlAttribute(XmlName('B'), '123abc'),
                      XmlAttribute(XmlName('C'), 'Test string'),
                    ]),
                  ],
                ),
              ],
            ),
          ]),
        ),
        isA<Iso11783LinkList>()
            .having(
              (element) => element.versionMajor,
              'Correct `versionMajor`',
              VersionMajor.four,
            )
            .having(
              (element) => element.versionMinor,
              'Correct `versionMinor`',
              VersionMinor.three,
            )
            .having(
              (element) => element.managementSoftwareManufacturer,
              'Correct `managementSoftwareManufacturer`',
              'Manufacturer',
            )
            .having(
              (element) => element.managementSoftwareVersion,
              'Correct `managementSoftwareVersion`',
              '1.0.0',
            )
            .having(
              (element) => element.dataTransferOrigin,
              'Correct `dataTransferOrigin`',
              DataTransferOrigin.mics,
            )
            .having(
              (element) => element.taskControllerManufacturer,
              'Correct `taskControllerManufacturer`',
              'Controller Manufacturer',
            )
            .having(
              (element) => element.taskControllerVersion,
              'Correct `taskControllerVersion`',
              '2.0.0',
            )
            .having(
              (element) => element.fileVersion,
              'Correct `fileVersion`',
              '1.0',
            )
            .having(
              (element) => element.linkGroups,
              'Correct `linkGroups`',
              [
                isA<LinkGroup>()
                    .having(
                      (linkGroup) => linkGroup.id,
                      'Correct `id`',
                      'LGP1',
                    )
                    .having(
                      (linkGroup) => linkGroup.type,
                      'Correct `type`',
                      LinkGroupType.uuids,
                    )
                    .having(
                      (linkGroup) => linkGroup.links,
                      'Correct `links`',
                      [
                        isA<Link>()
                            .having(
                              (link) => link.objectIdRef,
                              'Correct `objectIdRef`',
                              'BSN1',
                            )
                            .having(
                              (link) => link.linkValue,
                              'Correct `linkValue`',
                              '123abc',
                            )
                            .having(
                              (link) => link.designator,
                              'Correct `designator`',
                              'Test string',
                            ),
                      ],
                    ),
              ],
            ),
      );
    });

    test('._fromXmlElement comparison with XML string', () {
      expect(
        (Iso11783Element.fromXmlElement(
                  XmlElement(
                    XmlName('ISO11783LinkList'),
                    [
                      XmlAttribute(XmlName.fromString('VersionMajor'), '4'),
                      XmlAttribute(XmlName.fromString('VersionMinor'), '3'),
                      XmlAttribute(
                        XmlName.fromString('ManagementSoftwareManufacturer'),
                        'Some manufacturer',
                      ),
                      XmlAttribute(
                        XmlName.fromString('ManagementSoftwareVersion'),
                        '12.4',
                      ),
                      XmlAttribute(
                        XmlName.fromString('TaskControllerManufacturer'),
                        'Some manufacturer',
                      ),
                      XmlAttribute(
                        XmlName.fromString('TaskControllerVersion'),
                        '0.54',
                      ),
                      XmlAttribute(XmlName.fromString('FileVersion'), '1.0'),
                      XmlAttribute(
                        XmlName.fromString('DataTransferOrigin'),
                        '1',
                      ),
                    ],
                  ),
                )
                as Iso11783LinkList)
            .toXmlDocument()
            .toXmlString(pretty: true),
        XmlDocument([
          XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
          XmlElement(
            XmlName('ISO11783LinkList'),
            [
              XmlAttribute(XmlName.fromString('VersionMajor'), '4'),
              XmlAttribute(XmlName.fromString('VersionMinor'), '3'),
              XmlAttribute(
                XmlName.fromString('ManagementSoftwareManufacturer'),
                'Some manufacturer',
              ),
              XmlAttribute(
                XmlName.fromString('ManagementSoftwareVersion'),
                '12.4',
              ),
              XmlAttribute(
                XmlName.fromString('TaskControllerManufacturer'),
                'Some manufacturer',
              ),
              XmlAttribute(XmlName.fromString('TaskControllerVersion'), '0.54'),
              XmlAttribute(XmlName.fromString('FileVersion'), '1.0'),
              XmlAttribute(XmlName.fromString('DataTransferOrigin'), '1'),
            ],
          ),
        ]).toXmlString(pretty: true),
      );
    });

    test('Invalid `versionMajor` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName('ISO11783LinkList'),
            [
              XmlAttribute(XmlName.fromString('VersionMajor'), '100'),
              XmlAttribute(XmlName.fromString('VersionMinor'), '3'),
              XmlAttribute(
                XmlName.fromString('ManagementSoftwareManufacturer'),
                'Some manufacturer',
              ),
              XmlAttribute(
                XmlName.fromString('ManagementSoftwareVersion'),
                '12.4',
              ),
              XmlAttribute(
                XmlName.fromString('TaskControllerManufacturer'),
                'Some manufacturer',
              ),
              XmlAttribute(
                XmlName.fromString('TaskControllerVersion'),
                '0.54',
              ),
              XmlAttribute(XmlName.fromString('FileVersion'), '1.0'),
              XmlAttribute(
                XmlName.fromString('DataTransferOrigin'),
                '1',
              ),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'Iso11783LinkList.versionMajor',
          ),
        ),
      );
    });

    test('Invalid `versionMinor` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName('ISO11783LinkList'),
            [
              XmlAttribute(XmlName.fromString('VersionMajor'), '4'),
              XmlAttribute(XmlName.fromString('VersionMinor'), '100'),
              XmlAttribute(
                XmlName.fromString('ManagementSoftwareManufacturer'),
                'Some manufacturer',
              ),
              XmlAttribute(
                XmlName.fromString('ManagementSoftwareVersion'),
                '12.4',
              ),
              XmlAttribute(
                XmlName.fromString('TaskControllerManufacturer'),
                'Some manufacturer',
              ),
              XmlAttribute(
                XmlName.fromString('TaskControllerVersion'),
                '0.54',
              ),
              XmlAttribute(XmlName.fromString('FileVersion'), '1.0'),
              XmlAttribute(
                XmlName.fromString('DataTransferOrigin'),
                '1',
              ),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'Iso11783LinkList.versionMinor',
          ),
        ),
      );
    });

    test('Invalid `dataTransferOrigin` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName('ISO11783LinkList'),
            [
              XmlAttribute(XmlName.fromString('VersionMajor'), '4'),
              XmlAttribute(XmlName.fromString('VersionMinor'), '3'),
              XmlAttribute(
                XmlName.fromString('ManagementSoftwareManufacturer'),
                'Some manufacturer',
              ),
              XmlAttribute(
                XmlName.fromString('ManagementSoftwareVersion'),
                '12.4',
              ),
              XmlAttribute(
                XmlName.fromString('TaskControllerManufacturer'),
                'Some manufacturer',
              ),
              XmlAttribute(
                XmlName.fromString('TaskControllerVersion'),
                '0.54',
              ),
              XmlAttribute(XmlName.fromString('FileVersion'), '1.0'),
              XmlAttribute(
                XmlName.fromString('DataTransferOrigin'),
                '100',
              ),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'Iso11783LinkList.dataTransferOrigin',
          ),
        ),
      );
    });
  });

  group('LinkGroup', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        LinkGroup(
          id: 'LGP1',
          type: LinkGroupType.uuids,
          designator: 'Test designator',
          manufacturerGLN: 'Some Manufacturer GLN',
          namespace: 'Some Namespace',
          links: [
            Link(
              objectIdRef: 'BSN1',
              linkValue: '123abc',
              designator: 'Test string',
            ),
          ],
        ),
        isA<LinkGroup>()
            .having(
              (linkGroup) => linkGroup.id,
              'Correct `id`',
              'LGP1',
            )
            .having(
              (linkGroup) => linkGroup.type,
              'Correct `type`',
              LinkGroupType.uuids,
            )
            .having(
              (linkGroup) => linkGroup.designator,
              'Correct `designator`',
              'Test designator',
            )
            .having(
              (linkGroup) => linkGroup.manufacturerGLN,
              'Correct `manufacturerGLN`',
              'Some Manufacturer GLN',
            )
            .having(
              (linkGroup) => linkGroup.namespace,
              'Correct `namespace`',
              'Some Namespace',
            )
            .having(
              (linkGroup) => linkGroup.links,
              'Correct `links`',
              [
                isA<Link>()
                    .having(
                      (link) => link.objectIdRef,
                      'Correct `objectIdRef`',
                      'BSN1',
                    )
                    .having(
                      (link) => link.linkValue,
                      'Correct `linkValue`',
                      '123abc',
                    )
                    .having(
                      (link) => link.designator,
                      'Correct `designator`',
                      'Test string',
                    ),
              ],
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName.fromString('LGP'),
            [
              XmlAttribute(XmlName.fromString('A'), 'LGP1'),
              XmlAttribute(XmlName.fromString('B'), '1'),
              XmlAttribute(XmlName.fromString('C'), 'Some manufacturer GLN'),
              XmlAttribute(XmlName.fromString('D'), 'A namespace'),
              XmlAttribute(XmlName.fromString('E'), 'Some designator'),
            ],
          ),
        ),
        isA<LinkGroup>()
            .having(
              (element) => element.id,
              'Correct `id`',
              'LGP1',
            )
            .having(
              (element) => element.type,
              'Correct `type`',
              LinkGroupType.uuids,
            )
            .having(
              (element) => element.manufacturerGLN,
              'Correct `GLN`',
              'Some manufacturer GLN',
            )
            .having(
              (element) => element.namespace,
              'Correct `namespace`',
              'A namespace',
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Some designator',
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              LinkGroup.staticIdRefPattern,
            ),
      );
    });

    test('Invalid `type` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.linkGroup.xmlTag), [
            XmlAttribute(XmlName('A'), 'LGP1'),
            XmlAttribute(XmlName('B'), '100'),
          ]),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'LinkGroup.type',
          ),
        ),
      );
    });

    test(
      'Missing `namespace` throws ArgumentError when type is resolvable',
      () {
        expect(
          () => Iso11783Element.fromXmlElement(
            XmlElement(XmlName(Iso11783ElementType.linkGroup.xmlTag), [
              XmlAttribute(XmlName('A'), 'LGP1'),
              XmlAttribute(XmlName('B'), '3'),
            ]),
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'LinkGroup.namespace',
            ),
          ),
        );
      },
    );
  });

  group('Link', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        Link(
          objectIdRef: 'BSN1',
          linkValue: '123abc',
          designator: 'Test string',
        ),
        isA<Link>()
            .having(
              (element) => element.objectIdRef,
              'Correct `objectIdRef`',
              'BSN1',
            )
            .having(
              (element) => element.linkValue,
              'Correct `linkValue`',
              '123abc',
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName.fromString('LNK'),
            [
              XmlAttribute(XmlName.fromString('A'), 'BSN1'),
              XmlAttribute(XmlName.fromString('B'), '123abc'),
              XmlAttribute(XmlName.fromString('C'), 'Test string'),
            ],
          ),
        ),
        isA<Link>()
            .having(
              (element) => element.objectIdRef,
              'Correct `objectIdRef`',
              'BSN1',
            )
            .having(
              (element) => element.linkValue,
              'Correct `linkValue`',
              '123abc',
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            ),
      );
    });
  });

  group('OperationTechniquePractice', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        OperationTechniquePractice(
          culturalPracticeIdRef: 'CPC1',
          operationTechniqueIdRef: 'OTQ1',
        ),
        isA<OperationTechniquePractice>()
            .having(
              (element) => element.culturalPracticeIdRef,
              'Correct `culturalPracticeIdRef`',
              'CPC1',
            )
            .having(
              (element) => element.operationTechniqueIdRef,
              'Correct `operationTechniqueIdRef`',
              'OTQ1',
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.operationTechniquePractice.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'CPC1'),
              XmlAttribute(XmlName('B'), 'OTQ1'),
            ],
          ),
        ),
        isA<OperationTechniquePractice>()
            .having(
              (element) => element.culturalPracticeIdRef,
              'Correct `culturalPracticeIdRef`',
              'CPC1',
            )
            .having(
              (element) => element.operationTechniqueIdRef,
              'Correct `operationTechniqueIdRef`',
              'OTQ1',
            ),
      );
    });
  });

  group('OperationTechniqueReference', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        OperationTechniqueReference(
          operationTechniqueIdRef: 'OTQ1',
        ),
        isA<OperationTechniqueReference>().having(
          (element) => element.operationTechniqueIdRef,
          'Correct `operationTechniqueIdRef`',
          'OTQ1',
        ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.operationTechniqueReference.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'OTQ1'),
            ],
          ),
        ),
        isA<OperationTechniqueReference>().having(
          (element) => element.operationTechniqueIdRef,
          'Correct `operationTechniqueIdRef`',
          'OTQ1',
        ),
      );
    });
  });

  group('OperationTechnique', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        OperationTechnique(
          id: 'OTQ1',
          designator: 'Test string',
        ),
        isA<OperationTechnique>()
            .having(
              (element) => element.id,
              'Correct `id`',
              'OTQ1',
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              OperationTechnique.staticIdRefPattern,
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.operationTechnique.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'OTQ1'),
              XmlAttribute(XmlName('B'), 'Test string'),
            ],
          ),
        ),
        isA<OperationTechnique>()
            .having(
              (element) => element.id,
              'Correct `id`',
              'OTQ1',
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            ),
      );
    });
  });

  group('ProductAllocation', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        ProductAllocation(
          productIdRef: 'PDT1',
          deviceElementIdRef: 'DET1',
          productSubTypeIdRef: 'PDT2',
          quantityDDI: 'DBBA',
          quantityValue: 10,
          transferMode: TransferMode.remainder,
          valuePresentationIdRef: 'VPN1',
          allocationStamp: AllocationStamp(
            start: DateTime.utc(2025),
            type: AllocationStampType.effective,
          ),
        ),
        isA<ProductAllocation>()
            .having(
              (element) => element.productIdRef,
              'Correct `productIdRef`',
              'PDT1',
            )
            .having(
              (element) => element.deviceElementIdRef,
              'Correct `deviceElementIdRef`',
              'DET1',
            )
            .having(
              (element) => element.productSubTypeIdRef,
              'Correct `productSubTypeIdRef`',
              'PDT2',
            )
            .having(
              (element) => element.quantityDDI,
              'Correct `quantityDDI`',
              'DBBA',
            )
            .having(
              (element) => element.quantityValue,
              'Correct `quantityValue`',
              10,
            )
            .having(
              (element) => element.transferMode,
              'Correct `transferMode`',
              TransferMode.remainder,
            )
            .having(
              (element) => element.valuePresentationIdRef,
              'Correct `valuePresenstationIdRef`',
              'VPN1',
            )
            .having(
              (element) => element.allocationStamp,
              'Correct `allocationStamp`',
              isA<AllocationStamp>()
                  .having(
                    (allocationStamp) => allocationStamp.start,
                    'Correct `start`',
                    DateTime.utc(2025),
                  )
                  .having(
                    (allocationStamp) => allocationStamp.type,
                    'Correct `type`',
                    AllocationStampType.effective,
                  ),
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.productAllocation.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'PDT1'),
              XmlAttribute(XmlName('B'), 'DBBA'),
              XmlAttribute(XmlName('C'), '10'),
              XmlAttribute(XmlName('E'), 'DET1'),
              XmlAttribute(XmlName('F'), 'VPN1'),
              XmlAttribute(XmlName('G'), 'PDT2'),
            ],
            [
              XmlElement(XmlName(Iso11783ElementType.allocationStamp.xmlTag), [
                XmlAttribute(
                  XmlName('A'),
                  DateTime.utc(2025).toIso8601String(),
                ),
                XmlAttribute(XmlName('D'), '4'),
              ]),
            ],
          ),
        ),
        isA<ProductAllocation>()
            .having(
              (element) => element.productIdRef,
              'Correct `productIdRef`',
              'PDT1',
            )
            .having(
              (element) => element.deviceElementIdRef,
              'Correct `deviceElementIdRef`',
              'DET1',
            )
            .having(
              (element) => element.productSubTypeIdRef,
              'Correct `productSubTypeIdRef`',
              'PDT2',
            )
            .having(
              (element) => element.quantityDDI,
              'Correct `quantityDDI`',
              'DBBA',
            )
            .having(
              (element) => element.quantityValue,
              'Correct `quantityValue`',
              10,
            )
            .having(
              (element) => element.valuePresentationIdRef,
              'Correct `valuePresenstationIdRef`',
              'VPN1',
            )
            .having(
              (element) => element.allocationStamp,
              'Correct `allocationStamp`',
              isA<AllocationStamp>()
                  .having(
                    (allocationStamp) => allocationStamp.start,
                    'Correct `start`',
                    DateTime.utc(2025),
                  )
                  .having(
                    (allocationStamp) => allocationStamp.type,
                    'Correct `type`',
                    AllocationStampType.effective,
                  ),
            ),
      );
    });

    test('Invalid `transferMode` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.productAllocation.xmlTag), [
            XmlAttribute(XmlName('A'), 'PDT1'),
            XmlAttribute(XmlName('D'), '100'),
          ]),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'ProductAllocation.transferMode',
          ),
        ),
      );
    });
  });

  group('ProductGroup', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        ProductGroup(
          id: 'PGP1',
          designator: 'Test string',
          type: ProductGroupType.productGroupDefault,
        ),
        isA<ProductGroup>()
            .having(
              (element) => element.id,
              'Correct `id`',
              'PGP1',
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.type,
              'Correct `type`',
              ProductGroupType.productGroupDefault,
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              ProductGroup.staticIdRefPattern,
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.productGroup.xmlTag), [
            XmlAttribute(XmlName('A'), 'PGP1'),
            XmlAttribute(XmlName('B'), 'Test string'),
          ]),
        ),
        isA<ProductGroup>()
            .having(
              (element) => element.id,
              'Correct `id`',
              'PGP1',
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            ),
      );
    });

    test('Invalid `type` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.productGroup.xmlTag), [
            XmlAttribute(XmlName('A'), 'PGP1'),
            XmlAttribute(XmlName('B'), 'Test string'),
            XmlAttribute(XmlName('C'), '100'),
          ]),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'ProductGroup.type',
          ),
        ),
      );
    });
  });

  group('ProductRelation', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        ProductRelation(
          productIdRef: 'PDT1',
          quantityValue: 10,
        ),
        isA<ProductRelation>()
            .having(
              (element) => element.productIdRef,
              'Correct `productIdRef`',
              'PDT1',
            )
            .having(
              (element) => element.quantityValue,
              'Correct `quantityValue`',
              10,
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.productRelation.xmlTag), [
            XmlAttribute(XmlName('A'), 'PDT1'),
            XmlAttribute(XmlName('B'), '10'),
          ]),
        ),
        isA<ProductRelation>()
            .having(
              (element) => element.productIdRef,
              'Correct `productIdRef`',
              'PDT1',
            )
            .having(
              (element) => element.quantityValue,
              'Correct `quantityValue`',
              10,
            ),
      );
    });
  });

  group('Product', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        Product(
          id: 'PDT1',
          designator: 'Test string',
          groupIdRef: 'PGP1',
          valuePresentationIdRef: 'VPN1',
          quantityDDI: 'DBBA',
          type: ProductType.single,
          mixtureRecipeQuantity: 100000,
          densityMassPerVolume: 1200,
          densityVolumePerCount: 10,
        ),
        isA<Product>()
            .having(
              (element) => element.id,
              'Correct `id`',
              'PDT1',
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.groupIdRef,
              'Correct `groupIdRef`',
              'PGP1',
            )
            .having(
              (element) => element.valuePresentationIdRef,
              'Correct `valuePresentationIdRef`',
              'VPN1',
            )
            .having(
              (element) => element.quantityDDI,
              'Correct `quantityDDI`',
              'DBBA',
            )
            .having(
              (element) => element.type,
              'Correct `type`',
              ProductType.single,
            )
            .having(
              (element) => element.mixtureRecipeQuantity,
              'Correct `mixtureRecipeQuantity`',
              100000,
            )
            .having(
              (element) => element.densityMassPerVolume,
              'Correct `densityMassPerVolume`',
              1200,
            )
            .having(
              (element) => element.densityVolumePerCount,
              'Correct `densityVolumePerCount`',
              10,
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              Product.staticIdRefPattern,
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.product.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'PDT1'),
              XmlAttribute(XmlName('B'), 'Test string'),
              XmlAttribute(XmlName('C'), 'PGP1'),
              XmlAttribute(XmlName('D'), 'VPN1'),
              XmlAttribute(XmlName('E'), 'DBBA'),
              XmlAttribute(XmlName('F'), '2'),
              XmlAttribute(XmlName('G'), '100000'),
              XmlAttribute(XmlName('H'), '1200'),
              XmlAttribute(XmlName('I'), '1000'),
              XmlAttribute(XmlName('J'), '10'),
            ],
            [
              XmlElement(XmlName(Iso11783ElementType.productRelation.xmlTag), [
                XmlAttribute(XmlName('A'), 'PDT2'),
                XmlAttribute(XmlName('B'), '10'),
              ]),
            ],
          ),
        ),
        isA<Product>()
            .having(
              (element) => element.id,
              'Correct `id`',
              'PDT1',
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.groupIdRef,
              'Correct `groupIdRef`',
              'PGP1',
            )
            .having(
              (element) => element.valuePresentationIdRef,
              'Correct `valuePresentationIdRef`',
              'VPN1',
            )
            .having(
              (element) => element.quantityDDI,
              'Correct `quantityDDI`',
              'DBBA',
            )
            .having(
              (element) => element.type,
              'Correct `type`',
              ProductType.mixture,
            )
            .having(
              (element) => element.mixtureRecipeQuantity,
              'Correct `mixtureRecipeQuantity`',
              100000,
            )
            .having(
              (element) => element.densityMassPerVolume,
              'Correct `densityMassPerVolume`',
              1200,
            )
            .having(
              (element) => element.densityMassPerCount,
              'Correct `densityMassPerCount`',
              1000,
            )
            .having(
              (element) => element.densityVolumePerCount,
              'Correct `densityVolumePerCount`',
              10,
            )
            .having((element) => element.relations, 'Correct `relations`', [
              isA<ProductRelation>()
                  .having(
                    (element) => element.productIdRef,
                    'Correct `productIdRef`',
                    'PDT2',
                  )
                  .having(
                    (element) => element.quantityValue,
                    'Correct `quantityValue`',
                    10,
                  ),
            ]),
      );
    });

    test('Invalid `type` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.product.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'PDT1'),
              XmlAttribute(XmlName('B'), 'Test string'),
              XmlAttribute(XmlName('F'), '100'),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'Product.type',
          ),
        ),
      );
    });

    test(
      '''Non-empty `relations` throws ArgumentError when `type == ProductType.single''',
      () {
        expect(
          () => Iso11783Element.fromXmlElement(
            XmlElement(
              XmlName(Iso11783ElementType.product.xmlTag),
              [
                XmlAttribute(XmlName('A'), 'PDT1'),
                XmlAttribute(XmlName('B'), 'Test string'),
                XmlAttribute(XmlName('F'), '1'),
              ],
              [
                XmlElement(
                  XmlName(Iso11783ElementType.productRelation.xmlTag),
                  [
                    XmlAttribute(XmlName('A'), 'PDT2'),
                    XmlAttribute(XmlName('B'), '10'),
                  ],
                ),
              ],
            ),
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'Product.relations',
            ),
          ),
        );
      },
    );

    test(
      '''Empty `relations` throws ArgumentError when `type != ProductType.single''',
      () {
        expect(
          () => Iso11783Element.fromXmlElement(
            XmlElement(
              XmlName(Iso11783ElementType.product.xmlTag),
              [
                XmlAttribute(XmlName('A'), 'PDT1'),
                XmlAttribute(XmlName('B'), 'Test string'),
                XmlAttribute(XmlName('F'), '2'),
              ],
            ),
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'Product.relations',
            ),
          ),
        );
      },
    );
  });

  group('Customer', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        Customer(
          id: 'CTR1',
          lastName: 'Lastname',
          firstName: 'Firstname',
          city: 'City',
          country: 'Country',
          state: 'State',
          street: 'Street',
          poBox: 'PoBox',
          postalCode: '105060',
          phone: '46474849',
          mobile: '56575859',
          email: 'email@domain.com',
          fax: '66676869',
        ),
        isA<Customer>()
            .having((element) => element.id, 'Correct `id`', 'CTR1')
            .having(
              (element) => element.lastName,
              'Correct `lastName`',
              'Lastname',
            )
            .having(
              (element) => element.firstName,
              'Correct `firstName`',
              'Firstname',
            )
            .having((element) => element.city, 'Correct `city`', 'City')
            .having(
              (element) => element.country,
              'Correct `country`',
              'Country',
            )
            .having((element) => element.state, 'Correct `state`', 'State')
            .having((element) => element.street, 'Correct `street`', 'Street')
            .having((element) => element.poBox, 'Correct `poBox`', 'PoBox')
            .having(
              (element) => element.postalCode,
              'Correct `postalCode`',
              '105060',
            )
            .having((element) => element.phone, 'Correct `phone`', '46474849')
            .having((element) => element.mobile, 'Correct `mobile`', '56575859')
            .having(
              (element) => element.email,
              'Correct `email`',
              'email@domain.com',
            )
            .having((element) => element.fax, 'Correct `fax`', '66676869')
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              Customer.staticIdRefPattern,
            ),
      );
    });

    test('.fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.customer.xmlTag), [
            XmlAttribute(XmlName('A'), 'CTR1'),
            XmlAttribute(XmlName('B'), 'Lastname'),
            XmlAttribute(XmlName('C'), 'Firstname'),
            XmlAttribute(XmlName('D'), 'Street'),
            XmlAttribute(XmlName('E'), 'PoBox'),
            XmlAttribute(XmlName('F'), '105060'),
            XmlAttribute(XmlName('G'), 'City'),
            XmlAttribute(XmlName('H'), 'State'),
            XmlAttribute(XmlName('I'), 'Country'),
            XmlAttribute(XmlName('J'), '46474849'),
            XmlAttribute(XmlName('K'), '56575859'),
            XmlAttribute(XmlName('L'), '66676869'),
            XmlAttribute(XmlName('M'), 'email@domain.com'),
          ]),
        ),
        isA<Customer>()
            .having((element) => element.id, 'Correct `id`', 'CTR1')
            .having(
              (element) => element.lastName,
              'Correct `lastName`',
              'Lastname',
            )
            .having(
              (element) => element.firstName,
              'Correct `firstName`',
              'Firstname',
            )
            .having((element) => element.city, 'Correct `city`', 'City')
            .having(
              (element) => element.country,
              'Correct `country`',
              'Country',
            )
            .having((element) => element.state, 'Correct `state`', 'State')
            .having((element) => element.street, 'Correct `street`', 'Street')
            .having((element) => element.poBox, 'Correct `poBox`', 'PoBox')
            .having(
              (element) => element.postalCode,
              'Correct `postalCode`',
              '105060',
            )
            .having((element) => element.phone, 'Correct `phone`', '46474849')
            .having((element) => element.mobile, 'Correct `mobile`', '56575859')
            .having(
              (element) => element.email,
              'Correct `email`',
              'email@domain.com',
            )
            .having((element) => element.fax, 'Correct `fax`', '66676869'),
      );
    });

    const tooLongString =
        '''This string is over 64 characters long and should therefore throw errors.''';
    const attributes = 'ABCDEFGHIJKLM';
    const argumentNames = [
      'id',
      'lastName',
      'firstName',
      'street',
      'poBox',
      'postalCode',
      'city',
      'state',
      'country',
      'phone',
      'mobile',
      'fax',
      'email',
    ];

    for (final (index, attribute) in attributes.split('').indexed) {
      test('${argumentNames[index]} too long', () {
        final element = XmlElement(
          XmlName.fromString('CTR'),
          [
            XmlAttribute(
              XmlName.fromString('A'),
              attribute == 'A' ? tooLongString : 'CTR1',
            ),
            XmlAttribute(
              XmlName.fromString('B'),
              attribute == 'B' ? tooLongString : 'LastName',
            ),
            if (attribute != 'A' && attribute != 'B')
              XmlAttribute(XmlName.fromString(attribute), tooLongString),
          ],
        );

        expect(
          () => Iso11783Element.fromXmlElement(element),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'Customer.${argumentNames[index]}',
            ),
          ),
        );
      });
    }
  });

  group('Farm', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        Farm(
          id: 'FRM1',
          designator: 'Test string',
          city: 'City',
          country: 'Country',
          state: 'State',
          street: 'Street',
          poBox: 'PoBox',
          postalCode: '105060',
          customerIdRef: 'CTR1',
        ),
        isA<Farm>()
            .having((element) => element.id, 'Correct `id`', 'FRM1')
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having((element) => element.city, 'Correct `city`', 'City')
            .having(
              (element) => element.country,
              'Correct `country`',
              'Country',
            )
            .having((element) => element.state, 'Correct `state`', 'State')
            .having((element) => element.street, 'Correct `street`', 'Street')
            .having((element) => element.poBox, 'Correct `poBox`', 'PoBox')
            .having(
              (element) => element.postalCode,
              'Correct `postalCode`',
              '105060',
            )
            .having(
              (element) => element.customerIdRef,
              'Correct `customerIdRef`',
              'CTR1',
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              Farm.staticIdRefPattern,
            ),
      );
    });

    test('.fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.farm.xmlTag), [
            XmlAttribute(XmlName('A'), 'FRM1'),
            XmlAttribute(XmlName('B'), 'Test string'),
            XmlAttribute(XmlName('C'), 'Street'),
            XmlAttribute(XmlName('D'), 'PoBox'),
            XmlAttribute(XmlName('E'), '105060'),
            XmlAttribute(XmlName('F'), 'City'),
            XmlAttribute(XmlName('G'), 'State'),
            XmlAttribute(XmlName('H'), 'Country'),
            XmlAttribute(XmlName('I'), 'CTR1'),
          ]),
        ),
        isA<Farm>()
            .having((element) => element.id, 'Correct `id`', 'FRM1')
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having((element) => element.city, 'Correct `city`', 'City')
            .having(
              (element) => element.country,
              'Correct `country`',
              'Country',
            )
            .having((element) => element.state, 'Correct `state`', 'State')
            .having((element) => element.street, 'Correct `street`', 'Street')
            .having((element) => element.poBox, 'Correct `poBox`', 'PoBox')
            .having(
              (element) => element.postalCode,
              'Correct `postalCode`',
              '105060',
            )
            .having(
              (element) => element.customerIdRef,
              'Correct `customerIdRef`',
              'CTR1',
            ),
      );
    });

    const tooLongString =
        '''This string is over 64 characters long and should therefore throw errors.''';
    const attributes = 'ABCDEFGHI';
    const argumentNames = [
      'id',
      'designator',
      'street',
      'poBox',
      'postalCode',
      'city',
      'state',
      'country',
      'customerIdRef',
    ];

    for (final (index, attribute) in attributes.split('').indexed) {
      test('${argumentNames[index]} too long', () {
        final element = XmlElement(
          XmlName.fromString('FRM'),
          [
            XmlAttribute(
              XmlName.fromString('A'),
              attribute == 'A' ? tooLongString : 'FRM1',
            ),
            XmlAttribute(
              XmlName.fromString('B'),
              attribute == 'B' ? tooLongString : 'Some farm name',
            ),
            if (attribute != 'A' && attribute != 'B')
              XmlAttribute(XmlName.fromString(attribute), tooLongString),
          ],
        );

        expect(
          () => Iso11783Element.fromXmlElement(element),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'Farm.${argumentNames[index]}',
            ),
          ),
        );
      });
    }
  });

  group('Worker', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        Worker(
          id: 'WKR1',
          lastName: 'Lastname',
          firstName: 'Firstname',
          city: 'City',
          country: 'Country',
          state: 'State',
          street: 'Street',
          poBox: 'PoBox',
          postalCode: '105060',
          phone: '46474849',
          mobile: '56575859',
          email: 'email@domain.com',
          licenseNumber: '66676869',
        ),
        isA<Worker>()
            .having((element) => element.id, 'Correct `id`', 'WKR1')
            .having(
              (element) => element.lastName,
              'Correct `lastName`',
              'Lastname',
            )
            .having(
              (element) => element.firstName,
              'Correct `firstName`',
              'Firstname',
            )
            .having((element) => element.city, 'Correct `city`', 'City')
            .having(
              (element) => element.country,
              'Correct `country`',
              'Country',
            )
            .having((element) => element.state, 'Correct `state`', 'State')
            .having((element) => element.street, 'Correct `street`', 'Street')
            .having((element) => element.poBox, 'Correct `poBox`', 'PoBox')
            .having(
              (element) => element.postalCode,
              'Correct `postalCode`',
              '105060',
            )
            .having((element) => element.phone, 'Correct `phone`', '46474849')
            .having((element) => element.mobile, 'Correct `mobile`', '56575859')
            .having(
              (element) => element.email,
              'Correct `email`',
              'email@domain.com',
            )
            .having(
              (element) => element.licenseNumber,
              'Correct `licenseNumber`',
              '66676869',
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              Worker.staticIdRefPattern,
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              Worker.staticIdRefPattern,
            ),
      );
    });

    test('.fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.worker.xmlTag), [
            XmlAttribute(XmlName('A'), 'WKR1'),
            XmlAttribute(XmlName('B'), 'Lastname'),
            XmlAttribute(XmlName('C'), 'Firstname'),
            XmlAttribute(XmlName('D'), 'Street'),
            XmlAttribute(XmlName('E'), 'PoBox'),
            XmlAttribute(XmlName('F'), '105060'),
            XmlAttribute(XmlName('G'), 'City'),
            XmlAttribute(XmlName('H'), 'State'),
            XmlAttribute(XmlName('I'), 'Country'),
            XmlAttribute(XmlName('J'), '46474849'),
            XmlAttribute(XmlName('K'), '56575859'),
            XmlAttribute(XmlName('L'), '66676869'),
            XmlAttribute(XmlName('M'), 'email@domain.com'),
          ]),
        ),
        isA<Worker>()
            .having((element) => element.id, 'Correct `id`', 'WKR1')
            .having(
              (element) => element.lastName,
              'Correct `lastName`',
              'Lastname',
            )
            .having(
              (element) => element.firstName,
              'Correct `firstName`',
              'Firstname',
            )
            .having((element) => element.city, 'Correct `city`', 'City')
            .having(
              (element) => element.country,
              'Correct `country`',
              'Country',
            )
            .having((element) => element.state, 'Correct `state`', 'State')
            .having((element) => element.street, 'Correct `street`', 'Street')
            .having((element) => element.poBox, 'Correct `poBox`', 'PoBox')
            .having(
              (element) => element.postalCode,
              'Correct `postalCode`',
              '105060',
            )
            .having((element) => element.phone, 'Correct `phone`', '46474849')
            .having((element) => element.mobile, 'Correct `mobile`', '56575859')
            .having(
              (element) => element.email,
              'Correct `email`',
              'email@domain.com',
            )
            .having(
              (element) => element.licenseNumber,
              'Correct `licenseNumber`',
              '66676869',
            ),
      );
    });

    const tooLongString =
        '''This string is over 64 characters long and should therefore throw errors.''';
    const attributes = 'ABCDEFGHIJKLM';
    const argumentNames = [
      'id',
      'lastName',
      'firstName',
      'street',
      'poBox',
      'postalCode',
      'city',
      'state',
      'country',
      'phone',
      'mobile',
      'licenseNumber',
      'email',
    ];

    for (final (index, attribute) in attributes.split('').indexed) {
      test('${argumentNames[index]} too long', () {
        final element = XmlElement(
          XmlName.fromString('WKR'),
          [
            XmlAttribute(
              XmlName.fromString('A'),
              attribute == 'A' ? tooLongString : 'WKR1',
            ),
            XmlAttribute(
              XmlName.fromString('B'),
              attribute == 'B' ? tooLongString : 'LastName',
            ),
            if (attribute != 'A' && attribute != 'B')
              XmlAttribute(XmlName.fromString(attribute), tooLongString),
          ],
        );

        expect(
          () => Iso11783Element.fromXmlElement(element),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'Worker.${argumentNames[index]}',
            ),
          ),
        );
      });
    }
  });

  group('CulturalPractice', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        CulturalPractice(
          id: 'CPC1',
          designator: 'Test string',
          operationTechniqueReferences: [
            OperationTechniqueReference(operationTechniqueIdRef: 'OTQ1'),
          ],
        ),
        isA<CulturalPractice>()
            .having((element) => element.id, 'Correct `id`', 'CPC1')
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.operationTechniqueReferences,
              'Correct `operationTechniqueReferences`',
              [
                isA<OperationTechniqueReference>().having(
                  (element) => element.operationTechniqueIdRef,
                  'Correct `operationTechniqueIdRef`',
                  'OTQ1',
                ),
              ],
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.culturalPractice.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'CPC1'),
              XmlAttribute(XmlName('B'), 'Test string'),
            ],
            [
              XmlElement(
                XmlName(Iso11783ElementType.operationTechniqueReference.xmlTag),
                [XmlAttribute(XmlName('A'), 'OTQ1')],
              ),
            ],
          ),
        ),
        isA<CulturalPractice>()
            .having((element) => element.id, 'Correct `id`', 'CPC1')
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              CulturalPractice.staticIdRefPattern,
            )
            .having(
              (element) => element.operationTechniqueReferences,
              'Correct `operationTechniqueReferences`',
              [
                isA<OperationTechniqueReference>().having(
                  (element) => element.operationTechniqueIdRef,
                  'Correct `operationTechniqueIdRef`',
                  'OTQ1',
                ),
              ],
            ),
      );
    });
  });

  group('TaskControllerCapabilites', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        TaskControllerCapabilities(
          functionNAME: 'A0008F000F300DDD',
          designator: 'Test string',
          versionNumber: VersionNumber.e2fdis,
          providedCapabilities: 25,
          numberOfBoomsSectionControl: 5,
          numberOfSectionsSectionControl: 10,
          numberOfControlChannels: 15,
        ),
        isA<TaskControllerCapabilities>()
            .having(
              (element) => element.functionNAME,
              'Correct `functionNAME`',
              'A0008F000F300DDD',
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.versionNumber,
              'Correct `versionNumber`',
              VersionNumber.e2fdis,
            )
            .having(
              (element) => element.providedCapabilities,
              'Correct `providedCapabilities`',
              25,
            )
            .having(
              (element) => element.numberOfBoomsSectionControl,
              'Correct `numberOfBoomsSectionControl`',
              5,
            )
            .having(
              (element) => element.numberOfSectionsSectionControl,
              'Correct `numberOfSectionsSectionControl`',
              10,
            )
            .having(
              (element) => element.numberOfControlChannels,
              'Correct `numberOfControlChannels`',
              15,
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.taskControllerCapabilities.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'A0008F000F300DDD'),
              XmlAttribute(XmlName('B'), 'Test string'),
              XmlAttribute(XmlName('C'), '4'),
              XmlAttribute(XmlName('D'), '25'),
              XmlAttribute(XmlName('E'), '5'),
              XmlAttribute(XmlName('F'), '10'),
              XmlAttribute(XmlName('G'), '15'),
            ],
          ),
        ),
        isA<TaskControllerCapabilities>()
            .having(
              (element) => element.functionNAME,
              'Correct `functionNAME`',
              'A0008F000F300DDD',
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.versionNumber,
              'Correct `versionNumber`',
              VersionNumber.e2fdis,
            )
            .having(
              (element) => element.providedCapabilities,
              'Correct `providedCapabilities`',
              25,
            )
            .having(
              (element) => element.numberOfBoomsSectionControl,
              'Correct `numberOfBoomsSectionControl`',
              5,
            )
            .having(
              (element) => element.numberOfSectionsSectionControl,
              'Correct `numberOfSectionsSectionControl`',
              10,
            )
            .having(
              (element) => element.numberOfControlChannels,
              'Correct `numberOfControlChannels`',
              15,
            ),
      );
    });

    test('Invalid `versionNumber` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.taskControllerCapabilities.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'A0008F000F300DDD'),
              XmlAttribute(XmlName('B'), 'isoxml_dart'),
              XmlAttribute(XmlName('C'), '100'),
              XmlAttribute(XmlName('D'), '25'),
              XmlAttribute(XmlName('E'), '5'),
              XmlAttribute(XmlName('F'), '10'),
              XmlAttribute(XmlName('G'), '15'),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'TaskControllerCapabilities.versionNumber',
          ),
        ),
      );
    });
  });

  group('TaskData', () {
    test('.fromBytes', () async {
      expect(
        await Iso11783TaskData.fromBytes(
          zipBytes.split(' ').map((e) => int.parse(e, radix: 16)).toList(),
        ),
        isA<Iso11783TaskData>(),
      );
    });

    test('.toExternalDocuments remove overshooting external refs', () {
      final taskData = Iso11783TaskData(
        versionMajor: VersionMajor.four,
        versionMinor: VersionMinor.three,
        managementSoftwareManufacturer: 'Test',
        managementSoftwareVersion: '1.0',
        dataTransferOrigin: DataTransferOrigin.mics,
        customers: [
          Customer(id: 'CTR-1', lastName: 'Negative', firstName: '00001'),
          Customer(id: 'CTR1', lastName: 'Positive', firstName: '00000'),
          Customer(id: 'CTR2', lastName: 'Positive-2', firstName: '00000'),
        ],
        externalFileReferences: [
          ExternalFileReference(
            filename: 'CTR00000',
          ),
          ExternalFileReference(
            filename: 'CTR00001',
          ),
          ExternalFileReference(
            filename: 'CTR00002',
          ),
        ],
      );
      expect(taskData.toXmlExternalDocuments(), [
        isA<({String fileName, XmlDocument document})>().having(
          (doc) => doc.fileName,
          'Correct `fileName`',
          'CTR00001',
        ),
        isA<({String fileName, XmlDocument document})>().having(
          (doc) => doc.fileName,
          'Correct `fileName`',
          'CTR00000',
        ),
        isA<({String fileName, XmlDocument document})>().having(
          (doc) => doc.fileName,
          'Correct `fileName`',
          'TASKDATA',
        ),
      ]);
    });

    test('.elementsOfType', () {
      final taskData = Iso11783TaskData(
        versionMajor: VersionMajor.four,
        versionMinor: VersionMinor.three,
        managementSoftwareManufacturer: 'Test',
        managementSoftwareVersion: '1.0',
        dataTransferOrigin: DataTransferOrigin.fmis,
        customers: [
          Customer(id: 'CTR1', lastName: 'One'),
          Customer(id: 'CTR2', lastName: 'Two'),
          Customer(id: 'CTR3', lastName: 'Three'),
        ],
        products: [
          Product(
            id: 'PDT1',
            designator: 'Product',
            relations: [
              ProductRelation(
                productIdRef: 'PDT2',
                quantityValue: 100,
              ),
            ],
          ),
          Product(
            id: 'PDT2',
            designator: 'Product2',
          ),
        ],
      );
      expect(taskData.elementsOfType(Iso11783ElementType.customer), [
        isA<Customer>(),
        isA<Customer>(),
        isA<Customer>(),
      ]);
      expect(taskData.elementsOfType(Iso11783ElementType.product), [
        isA<Product>(),
        isA<Product>(),
      ]);
      expect(taskData.elementsOfType(Iso11783ElementType.productRelation), [
        isA<ProductRelation>(),
      ]);
    });

    test('.idsOfType', () {
      final taskData = Iso11783TaskData(
        versionMajor: VersionMajor.four,
        versionMinor: VersionMinor.three,
        managementSoftwareManufacturer: 'Test',
        managementSoftwareVersion: '1.0',
        dataTransferOrigin: DataTransferOrigin.fmis,
        customers: [
          Customer(id: 'CTR1', lastName: 'One'),
          Customer(id: 'CTR2', lastName: 'Two'),
          Customer(id: 'CTR3', lastName: 'Three'),
        ],
        products: [
          Product(
            id: 'PDT1',
            designator: 'Product',
            relations: [
              ProductRelation(
                productIdRef: 'PDT2',
                quantityValue: 100,
              ),
            ],
          ),
          Product(
            id: 'PDT2',
            designator: 'Product2',
          ),
        ],
      );
      expect(taskData.idsOfType(Iso11783ElementType.customer), [
        'CTR1',
        'CTR2',
        'CTR3',
      ]);
      expect(taskData.idsOfType(Iso11783ElementType.product), ['PDT1', 'PDT2']);
      expect(taskData.idsOfType(Iso11783ElementType.productRelation), null);
    });

    test('.nextIdForType', () {
      final taskData = Iso11783TaskData(
        versionMajor: VersionMajor.four,
        versionMinor: VersionMinor.three,
        managementSoftwareManufacturer: 'Test',
        managementSoftwareVersion: '1.0',
        dataTransferOrigin: DataTransferOrigin.fmis,
        customers: [
          Customer(id: 'CTR1', lastName: 'One'),
          Customer(id: 'CTR2', lastName: 'Two'),
          Customer(id: 'CTR3', lastName: 'Three'),
        ],
        products: [
          Product(
            id: 'PDT1',
            designator: 'Product',
            relations: [
              ProductRelation(
                productIdRef: 'PDT2',
                quantityValue: 100,
              ),
            ],
          ),
          Product(
            id: 'PDT2',
            designator: 'Product2',
          ),
        ],
      );
      expect(taskData.nextIdForType(Iso11783ElementType.customer), 'CTR4');
      expect(
        taskData.nextIdForType(
          Iso11783ElementType.customer,
          additionalIncrement: 5,
        ),
        'CTR9',
      );
      expect(
        taskData.nextIdForType(
          Iso11783ElementType.customer,
          overrideTransferOrigin: DataTransferOrigin.mics,
        ),
        'CTR-1',
      );
      expect(taskData.nextIdForType(Iso11783ElementType.product), 'PDT3');
      expect(taskData.nextIdForType(Iso11783ElementType.productRelation), null);
    });

    test('.elementById', () {
      final taskData = Iso11783TaskData(
        versionMajor: VersionMajor.four,
        versionMinor: VersionMinor.three,
        managementSoftwareManufacturer: 'Test',
        managementSoftwareVersion: '1.0',
        dataTransferOrigin: DataTransferOrigin.fmis,
        customers: [
          Customer(id: 'CTR1', lastName: 'One'),
          Customer(id: 'CTR2', lastName: 'Two'),
          Customer(id: 'CTR3', lastName: 'Three'),
        ],
        products: [
          Product(
            id: 'PDT1',
            designator: 'Product',
            relations: [
              ProductRelation(
                productIdRef: 'PDT2',
                quantityValue: 100,
              ),
            ],
          ),
          Product(
            id: 'PDT2',
            designator: 'Product2',
          ),
        ],
      );
      expect(
        taskData.elementById('CTR1'),
        isA<Customer>()
            .having((element) => element.id, 'Correct `id`', 'CTR1')
            .having((element) => element.lastName, 'Correct `lastName`', 'One'),
      );
      expect(
        taskData.elementById('PDT1'),
        isA<Product>()
            .having((element) => element.id, 'Correct `id`', 'PDT1')
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Product',
            )
            .having((element) => element.relations, 'Correct `relations`', [
              isA<ProductRelation>().having(
                (relation) => relation.productIdRef,
                'Correct `productIdRef`',
                'PDT2',
              ),
            ]),
      );
    });
  });

  group('Task', () {
    test(
      'Correct values are set and read from the underlying XML element',
      () {
        expect(
          Task(
            id: 'TSK1',
            designator: 'Test string',
            customerIdRef: 'CTR1',
            farmIdRef: 'FRM1',
            partfieldIdRef: 'PFD1',
            responsibleWorkerIdRef: 'WKR1',
            status: TaskStatus.planned,
            defaultTreatmentZoneCode: 10,
            positionLostTreatmentZoneCode: 1,
            outOfFieldTreatmentZoneCode: 2,
          ),
          isA<Task>()
              .having((element) => element.id, 'Correct `id`', 'TSK1')
              .having(
                (element) => element.designator,
                'Correct `designator`',
                'Test string',
              )
              .having(
                (element) => element.customerIdRef,
                'Correct `customerIdRef`',
                'CTR1',
              )
              .having(
                (element) => element.farmIdRef,
                'Correct `farmIdRef`',
                'FRM1',
              )
              .having(
                (element) => element.partfieldIdRef,
                'Correct `partfieldIdRef`',
                'PFD1',
              )
              .having(
                (element) => element.responsibleWorkerIdRef,
                'Correct `responsibleWorkerIdRef`',
                'WKR1',
              )
              .having(
                (element) => element.status,
                'Correct `status`',
                TaskStatus.planned,
              )
              .having(
                (element) => element.defaultTreatmentZoneCode,
                'Correct `defaultTreatmentZoneCode`',
                10,
              )
              .having(
                (element) => element.positionLostTreatmentZoneCode,
                'Correct `positionLostTreatmentZoneCode`',
                1,
              )
              .having(
                (element) => element.outOfFieldTreatmentZoneCode,
                'Correct `outOfFieldTreatmentZoneCode`',
                2,
              )
              .having(
                (element) => element.idRefPattern,
                'Correct `idRefPattern`',
                Task.staticIdRefPattern,
              ),
        );
      },
    );

    test('`grid` setter', () {
      final task = Task(id: 'TSK1', status: TaskStatus.running);
      expect(task.grid, isNull);
      final grid = Grid(
        minimumNorthPosition: 60,
        minimumEastPosition: 10,
        cellEastSize: 0.001,
        cellNorthSize: 0.001,
        fileName: 'GRD00001',
        maximumColumn: 10,
        maximumRow: 10,
        type: GridType.one,
      );

      task.grid = grid;
      expect(
        task.grid,
        isA<Grid>().having(
          (grid) => grid.fileName,
          'Correct `fileName`',
          grid.fileName,
        ),
      );

      final grid2 = Grid(
        minimumNorthPosition: 60,
        minimumEastPosition: 10,
        cellEastSize: 0.001,
        cellNorthSize: 0.001,
        fileName: 'GRD00002',
        maximumColumn: 10,
        maximumRow: 10,
        type: GridType.one,
      );
      XmlElement.tag('ABC').children.add(grid2.xmlElement);
      task.grid = grid2;
      expect(
        task.grid,
        isA<Grid>().having(
          (grid) => grid.fileName,
          'Correct `fileName`',
          grid2.fileName,
        ),
      );
      task.grid = null;
      expect(task.grid, isNull);
    });

    test('`operationTechniquePractice` setter', () {
      final task = Task(id: 'TSK1', status: TaskStatus.running);
      expect(task.grid, isNull);
      final opt = OperationTechniquePractice(culturalPracticeIdRef: 'CPC1');

      task.operationTechniquePractice = opt;
      expect(
        task.operationTechniquePractice,
        isA<OperationTechniquePractice>().having(
          (opt) => opt.culturalPracticeIdRef,
          'Correct `culturalPracticeIdRef`',
          opt.culturalPracticeIdRef,
        ),
      );

      final opt2 = OperationTechniquePractice(culturalPracticeIdRef: 'CPC2');
      XmlElement.tag('ABC').children.add(opt2.xmlElement);
      task.operationTechniquePractice = opt2;
      expect(
        task.operationTechniquePractice,
        isA<OperationTechniquePractice>().having(
          (opt) => opt.culturalPracticeIdRef,
          'Correct `culturalPracticeIdRef`',
          opt2.culturalPracticeIdRef,
        ),
      );
      task.operationTechniquePractice = null;
      expect(task.operationTechniquePractice, isNull);
    });

    test('Invalid `status` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement.tag(
            Iso11783ElementType.task.xmlTag,
            attributes: [
              XmlAttribute(XmlName('A'), 'TSK1'),
              XmlAttribute(XmlName('G'), '100'),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'Task.status',
          ),
        ),
      );
    });
  });

  group('WorkerAllocation', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        WorkerAllocation(
          workerIdRef: 'WKR1',
          allocationStamp: AllocationStamp(
            start: DateTime.utc(2025),
            type: AllocationStampType.effective,
          ),
        ),
        isA<WorkerAllocation>()
            .having(
              (element) => element.workerIdRef,
              'Correct `workerIdRef`',
              'WKR1',
            )
            .having(
              (element) => element.allocationStamp,
              'Correct `allocationStamp`',
              isA<AllocationStamp>()
                  .having(
                    (element) => element.start,
                    'Correct `start`',
                    DateTime.utc(2025),
                  )
                  .having(
                    (element) => element.type,
                    'Correct `type`',
                    AllocationStampType.effective,
                  ),
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.workerAllocation.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'WKR1'),
            ],
            [
              XmlElement(XmlName(Iso11783ElementType.allocationStamp.xmlTag), [
                XmlAttribute(
                  XmlName('A'),
                  DateTime.utc(2025).toIso8601String(),
                ),
                XmlAttribute(XmlName('D'), '4'),
              ]),
            ],
          ),
        ),
        isA<WorkerAllocation>()
            .having(
              (element) => element.workerIdRef,
              'Correct `workerIdRef`',
              'WKR1',
            )
            .having(
              (element) => element.allocationStamp,
              'Correct `allocationStamp`',
              isA<AllocationStamp>()
                  .having(
                    (element) => element.start,
                    'Correct `start`',
                    DateTime.utc(2025),
                  )
                  .having(
                    (element) => element.type,
                    'Correct `type`',
                    AllocationStampType.effective,
                  ),
            ),
      );
    });

    test('`allocationStamp` setter', () {
      final element = WorkerAllocation(workerIdRef: 'WKR1');
      expect(element.allocationStamp, isNull);
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local == Iso11783ElementType.polygon.xmlTag,
            )
            .isEmpty,
        isTrue,
      );
      final allocationStamp = AllocationStamp(
        start: DateTime.utc(2024),
        type: AllocationStampType.effective,
      );
      element.allocationStamp = allocationStamp;
      expect(
        element.allocationStamp,
        isA<AllocationStamp>().having(
          (stamp) => stamp.start,
          'Correct `start`',
          allocationStamp.start,
        ),
      );
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local ==
                  Iso11783ElementType.allocationStamp.xmlTag,
            )
            .length,
        1,
      );

      final newAllocationStamp = AllocationStamp(
        start: DateTime.utc(2025),
        type: AllocationStampType.effective,
      );
      // Testing removal from parent when using setter
      XmlElement.tag('ABC').children.add(newAllocationStamp.xmlElement);

      element.allocationStamp = newAllocationStamp;
      expect(
        element.allocationStamp,
        isA<AllocationStamp>().having(
          (stamp) => stamp.start,
          'Correct `start`',
          newAllocationStamp.start,
        ),
      );
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local ==
                  Iso11783ElementType.allocationStamp.xmlTag,
            )
            .length,
        1,
      );

      element.allocationStamp = null;
      expect(
        element.allocationStamp,
        isNull,
      );
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local ==
                  Iso11783ElementType.allocationStamp.xmlTag,
            )
            .isEmpty,
        isTrue,
      );
    });
  });

  group('TimeLogHeader', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        TimeLogHeader(
          type: TimeType.planned,
          start: DateTime.utc(2025),
          dataLogValues: [
            TimeLogHeaderDataLogValue(
              processDataDDI: 'DFFE',
              deviceElementIdRef: 'DET1',
            ),
          ],
        ),
        isA<TimeLogHeader>()
            .having(
              (element) => element.type,
              'Correct `type`',
              TimeType.planned,
            )
            .having(
              (element) => element.start,
              'Correct `start`',
              DateTime.utc(2025),
            )
            .having(
              (element) => element.dataLogValues,
              'Correct `dataLogValues`',
              [
                isA<TimeLogHeaderDataLogValue>()
                    .having(
                      (dlv) => dlv.processDataDDI,
                      'Correct `processDataDDI`',
                      'DFFE',
                    )
                    .having(
                      (dlv) => dlv.deviceElementIdRef,
                      'Correct `deviceElementIdRef`',
                      'DET1',
                    ),
              ],
            ),
      );
    });

    test('.fromXmlDocument', () {
      expect(
        TimeLogHeader.fromXmlDocument(
          XmlDocument([
            XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
            XmlElement.tag(
              Iso11783ElementType.time.xmlTag,
              attributes: [
                XmlAttribute(
                  XmlName('A'),
                  DateTime.utc(2025).toIso8601String(),
                ),
                XmlAttribute(XmlName('D'), '1'),
              ],
              children: [
                XmlElement.tag(
                  Iso11783ElementType.dataLogValue.xmlTag,
                  attributes: [
                    XmlAttribute(XmlName('A'), 'DFFE'),
                    XmlAttribute(XmlName('B'), ''),
                    XmlAttribute(XmlName('C'), 'DET1'),
                  ],
                ),
              ],
            ),
          ]),
        ),
        isA<TimeLogHeader>()
            .having(
              (element) => element.type,
              'Correct `type`',
              TimeType.planned,
            )
            .having(
              (element) => element.start,
              'Correct `start`',
              DateTime.utc(2025),
            )
            .having(
              (element) => element.dataLogValues,
              'Correct `dataLogValues`',
              [
                isA<TimeLogHeaderDataLogValue>()
                    .having(
                      (dlv) => dlv.processDataDDI,
                      'Correct `processDataDDI`',
                      'DFFE',
                    )
                    .having(
                      (dlv) => dlv.deviceElementIdRef,
                      'Correct `deviceElementIdRef`',
                      'DET1',
                    ),
              ],
            ),
      );
    });

    test('Invalid `type` throws ArgumentError', () {
      expect(
        () => TimeLogHeader.fromXmlDocument(
          XmlDocument(
            [
              XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
              XmlElement.tag(
                Iso11783ElementType.time.xmlTag,
                attributes: [
                  XmlAttribute(
                    XmlName('A'),
                    DateTime.utc(2025).toIso8601String(),
                  ),
                  XmlAttribute(XmlName('D'), '100'),
                ],
              ),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'TimeLogHeader.type',
          ),
        ),
      );
    });

    test('`position` setter', () {
      final element = TimeLogHeader(
        type: TimeType.planned,
      );
      final position = TimeLogHeaderPosition(north: 50);

      expect(element.position, isNull);
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local == Iso11783ElementType.position.xmlTag,
            )
            .isEmpty,
        isTrue,
      );
      element.position = position;
      expect(
        element.position,
        isA<TimeLogHeaderPosition>().having(
          (position) => position.north,
          'Correct `north`',
          position.north,
        ),
      );
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local == Iso11783ElementType.position.xmlTag,
            )
            .length,
        1,
      );

      final newPosition = TimeLogHeaderPosition(north: 60);
      XmlElement.tag('ABC').children.add(newPosition.xmlElement);
      element.position = newPosition;
      expect(
        element.position,
        isA<TimeLogHeaderPosition>().having(
          (position) => position.north,
          'Correct `north`',
          newPosition.north,
        ),
      );
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local == Iso11783ElementType.position.xmlTag,
            )
            .length,
        1,
      );

      element.position = null;
      expect(
        element.position,
        isNull,
      );
      expect(
        element.xmlElement.childElements
            .where(
              (xmlElement) =>
                  xmlElement.name.local == Iso11783ElementType.position.xmlTag,
            )
            .isEmpty,
        isTrue,
      );
    });
  });

  group('TimeLogHeaderPosition', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        TimeLogHeaderPosition(
          north: 60,
          binaryHeaderOptions: const PositionBinaryHeaderOptions(
            readEast: true,
          ),
          status: PositionStatus.gnssFix,
        ),
        isA<TimeLogHeaderPosition>()
            .having(
              (element) => element.binaryHeaderOptions,
              'Correct `binaryHeaderOptions`',
              const PositionBinaryHeaderOptions(readEast: true),
            )
            .having(
              (element) => element.north,
              'Correct `north`',
              60,
            )
            .having(
              (element) => element.status,
              'Correct `status`',
              PositionStatus.gnssFix,
            ),
      );
    });

    test('.fromPosition', () {
      expect(
        TimeLogHeaderPosition.fromPosition(
          Position(
            north: 60,
            east: 10,
            up: 1000,
            status: PositionStatus.gnssFix,
            pdop: 0.2,
            hdop: 0.5,
            numberOfSatellites: 14,
            gpsUtcTimeMs: 54039,
            gpsUtcDate: 24003,
          ),
        ),
        isA<TimeLogHeaderPosition>().having(
          (element) => element.binaryHeaderOptions,
          'Correct `binaryHeaderOptions`',
          const PositionBinaryHeaderOptions(
            readNorth: true,
            readEast: true,
            readUp: true,
            readStatus: true,
            readPdop: true,
            readHdop: true,
            readNumberOfSatellites: true,
            readGpsUtcTimeMs: true,
            readGpsUtcDate: true,
          ),
        ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        TimeLogHeader.fromXmlDocument(
          XmlDocument(
            [
              XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
              XmlElement.tag(
                Iso11783ElementType.time.xmlTag,
                attributes: [
                  XmlAttribute(
                    XmlName('A'),
                    DateTime.utc(2025).toIso8601String(),
                  ),
                  XmlAttribute(XmlName('D'), '1'),
                ],
                children: [
                  XmlElement.tag(
                    Iso11783ElementType.position.xmlTag,
                    attributes: [
                      XmlAttribute(XmlName('A'), ''),
                      XmlAttribute(XmlName('B'), ''),
                      XmlAttribute(XmlName('C'), ''),
                      XmlAttribute(XmlName('D'), ''),
                      XmlAttribute(XmlName('E'), ''),
                      XmlAttribute(XmlName('F'), ''),
                      XmlAttribute(XmlName('G'), ''),
                      XmlAttribute(XmlName('H'), ''),
                      XmlAttribute(XmlName('I'), ''),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ).position,
        isA<TimeLogHeaderPosition>().having(
          (element) => element.binaryHeaderOptions,
          'Correct `binaryHeaderOptions`',
          const PositionBinaryHeaderOptions(
            readNorth: true,
            readEast: true,
            readUp: true,
            readStatus: true,
            readPdop: true,
            readHdop: true,
            readNumberOfSatellites: true,
            readGpsUtcTimeMs: true,
            readGpsUtcDate: true,
          ),
        ),
      );
    });

    test('Invalid `status` throws ArgumentError', () {
      expect(
        () => TimeLogHeader.fromXmlDocument(
          XmlDocument(
            [
              XmlProcessing('xml', 'version="1.0" encoding="UTF-8"'),
              XmlElement.tag(
                Iso11783ElementType.time.xmlTag,
                attributes: [
                  XmlAttribute(
                    XmlName('A'),
                    DateTime.utc(2025).toIso8601String(),
                  ),
                  XmlAttribute(XmlName('D'), '1'),
                ],
                children: [
                  XmlElement.tag(
                    Iso11783ElementType.position.xmlTag,
                    attributes: [
                      XmlAttribute(XmlName('D'), '100'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'TimeLogHeaderPosition.status',
          ),
        ),
      );
    });

    test('PositionBinaryHeaderOptions equality', () {
      expect(
        const PositionBinaryHeaderOptions().hashCode,
        const PositionBinaryHeaderOptions().hashCode,
      );
      expect(
        const PositionBinaryHeaderOptions(
          readNorth: true,
          readEast: true,
          readUp: true,
          readStatus: true,
          readPdop: true,
          readHdop: true,
          readNumberOfSatellites: true,
          readGpsUtcTimeMs: true,
          readGpsUtcDate: true,
        ).hashCode,
        const PositionBinaryHeaderOptions(
          readNorth: true,
          readEast: true,
          readUp: true,
          readStatus: true,
          readPdop: true,
          readHdop: true,
          readNumberOfSatellites: true,
          readGpsUtcTimeMs: true,
          readGpsUtcDate: true,
        ).hashCode,
      );
      expect(
        const PositionBinaryHeaderOptions(
          readNorth: true,
          readEast: true,
          readUp: true,
          readStatus: true,
          readPdop: true,
          readHdop: true,
          readNumberOfSatellites: true,
          readGpsUtcTimeMs: true,
          readGpsUtcDate: true,
        ),
        const PositionBinaryHeaderOptions(
          readNorth: true,
          readEast: true,
          readUp: true,
          readStatus: true,
          readPdop: true,
          readHdop: true,
          readNumberOfSatellites: true,
          readGpsUtcTimeMs: true,
          readGpsUtcDate: true,
        ),
      );
    });
  });

  group('TimeLog', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        TimeLog(
          filename: 'TLG00001',
          fileLength: 100,
          records: [Time(start: DateTime.utc(2025), type: TimeType.effective)],
        ),
        isA<TimeLog>()
            .having(
              (element) => element.filename,
              'Correct `filename`',
              'TLG00001',
            )
            .having(
              (element) => element.fileLength,
              'Correct `fileLength`',
              100,
            )
            .having(
              (element) => element.type,
              'Correct `type`',
              TimeLogType.binaryTimeLogFileType1,
            )
            .having(
              (element) => element.records,
              'Correct `records`',
              [isA<Time>()],
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.timeLog.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'TLG00001'),
              XmlAttribute(XmlName('B'), '100'),
              XmlAttribute(XmlName('C'), '1'),
            ],
          ),
        ),
        isA<TimeLog>()
            .having(
              (element) => element.filename,
              'Correct `filename`',
              'TLG00001',
            )
            .having(
              (element) => element.fileLength,
              'Correct `fileLength`',
              100,
            )
            .having(
              (element) => element.type,
              'Correct `type`',
              TimeLogType.binaryTimeLogFileType1,
            ),
      );
    });

    test('Invalid `type` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.timeLog.xmlTag),
            [
              XmlAttribute(XmlName('A'), 'TLG00001'),
              XmlAttribute(XmlName('B'), '100'),
              XmlAttribute(XmlName('C'), '100'),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'TimeLog.type',
          ),
        ),
      );
    });

    test('.parseData use all data from position header', () {
      expect(
        TimeLog(
          filename: 'TLG00001',
          header: TimeLogHeader(
            type: TimeType.effective,
            position: TimeLogHeaderPosition(
              north: 60,
              east: 10,
              up: 1000,
              status: PositionStatus.gnssFix,
              hdop: 0.2,
              pdop: 0.5,
              numberOfSatellites: 14,
              gpsUtcTimeMs: 54000,
              gpsUtcDate: 15000,
            ),
          ),
          byteData: TimeLog(
            filename: 'TLG00001',
            header: TimeLogHeader(
              type: TimeType.effective,
            ),
            records: [
              Time(
                start: DateTime.utc(2025),
                type: TimeType.effective,
                positions: [
                  Position(
                    north: 50,
                    east: 0,
                    status: PositionStatus.noGnssFix,
                  ),
                ],
              ),
            ],
          ).recordsToBytes(),
        ).parseData(),
        [
          isA<Time>()
              .having(
                (time) => time.start,
                'Correct `start`',
                DateTime.utc(2025),
              )
              .having(
                (time) => time.type,
                'Correct `type`',
                TimeType.effective,
              )
              .having(
                (time) => time.positions,
                'Correct `positions`',
                [
                  isA<Position>()
                      .having(
                        (position) => position.north,
                        'Correct `north`',
                        60,
                      )
                      .having(
                        (position) => position.east,
                        'Correct `east`',
                        10,
                      )
                      .having(
                        (position) => position.up,
                        'Correct `up`',
                        1000,
                      )
                      .having(
                        (position) => position.status,
                        'Correct `status`',
                        PositionStatus.gnssFix,
                      )
                      .having(
                        (position) => position.hdop,
                        'Correct `hdop`',
                        0.2,
                      )
                      .having(
                        (position) => position.pdop,
                        'Correct `pdop`',
                        0.5,
                      )
                      .having(
                        (position) => position.numberOfSatellites,
                        'Correct `numberOfSatellites`',
                        14,
                      )
                      .having(
                        (position) => position.gpsUtcDate,
                        'Correct `gpsUtcDate`',
                        15000,
                      )
                      .having(
                        (position) => position.gpsUtcTimeMs,
                        'Correct `gpsUtcTimeMs`',
                        54000,
                      ),
                ],
              ),
        ],
      );
    });

    test('.parseData read all position data from bytes', () {
      expect(
        TimeLog(
          filename: 'TLG00001',
          header: TimeLogHeader(
            type: TimeType.effective,
            position: TimeLogHeaderPosition(
              binaryHeaderOptions: const PositionBinaryHeaderOptions(
                readEast: true,
                readGpsUtcDate: true,
                readGpsUtcTimeMs: true,
                readHdop: true,
                readNorth: true,
                readNumberOfSatellites: true,
                readPdop: true,
                readStatus: true,
                readUp: true,
              ),
              north: 60,
              east: 10,
              up: 1000,
              status: PositionStatus.gnssFix,
              hdop: 0.2,
              pdop: 0.5,
              numberOfSatellites: 14,
              gpsUtcTimeMs: 54000,
              gpsUtcDate: 15000,
            ),
          ),
          byteData: TimeLog(
            filename: 'TLG00001',
            header: TimeLogHeader(
              type: TimeType.effective,
              position: TimeLogHeaderPosition(
                binaryHeaderOptions: const PositionBinaryHeaderOptions(
                  readEast: true,
                  readGpsUtcDate: true,
                  readGpsUtcTimeMs: true,
                  readHdop: true,
                  readNorth: true,
                  readNumberOfSatellites: true,
                  readPdop: true,
                  readStatus: true,
                  readUp: true,
                ),
              ),
            ),
            records: [
              Time(
                start: DateTime.utc(2025),
                type: TimeType.effective,
                positions: [
                  Position(
                    north: 50,
                    east: 0,
                    up: 100,
                    status: PositionStatus.rtkFixedInteger,
                    hdop: 0.1,
                    pdop: 0.4,
                    numberOfSatellites: 20,
                    gpsUtcTimeMs: 50000,
                    gpsUtcDate: 16000,
                  ),
                ],
              ),
            ],
          ).recordsToBytes(),
        ).parseData(),
        [
          isA<Time>()
              .having(
                (time) => time.start,
                'Correct `start`',
                DateTime.utc(2025),
              )
              .having(
                (time) => time.type,
                'Correct `type`',
                TimeType.effective,
              )
              .having(
                (time) => time.positions,
                'Correct `positions`',
                [
                  isA<Position>()
                      .having(
                        (position) => position.north,
                        'Correct `north`',
                        50,
                      )
                      .having(
                        (position) => position.east,
                        'Correct `east`',
                        0,
                      )
                      .having(
                        (position) => position.up,
                        'Correct `up`',
                        100,
                      )
                      .having(
                        (position) => position.status,
                        'Correct `status`',
                        PositionStatus.rtkFixedInteger,
                      )
                      .having(
                        (position) => position.hdop,
                        'Correct `hdop`',
                        0.1,
                      )
                      .having(
                        (position) => position.pdop,
                        'Correct `pdop`',
                        0.4,
                      )
                      .having(
                        (position) => position.numberOfSatellites,
                        'Correct `numberOfSatellites`',
                        20,
                      )
                      .having(
                        (position) => position.gpsUtcDate,
                        'Correct `gpsUtcDate`',
                        16000,
                      )
                      .having(
                        (position) => position.gpsUtcTimeMs,
                        'Correct `gpsUtcTimeMs`',
                        50000,
                      ),
                ],
              ),
        ],
      );
    });
  });

  group('Time', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        Time(
          start: DateTime.utc(2025),
          stop: DateTime.utc(2025, 1, 1, 12),
          duration: 43200,
          type: TimeType.repair,
          dataLogValues: [
            DataLogValue(
              processDataDDI: 'DFFE',
              processDataValue: 13,
              deviceElementIdRef: 'DET1',
            ),
          ],
          positions: [
            Position(north: 60, east: 13, status: PositionStatus.gnssFix),
          ],
        ),
        isA<Time>()
            .having(
              (element) => element.start,
              'Correct `start`',
              DateTime.utc(2025),
            )
            .having(
              (element) => element.stop,
              'Correct `stop`',
              DateTime.utc(2025, 1, 1, 12),
            )
            .having(
              (element) => element.duration,
              'Correct `duration`',
              43200,
            )
            .having(
              (element) => element.type,
              'Correct `type`',
              TimeType.repair,
            )
            .having(
              (element) => element.dataLogValues,
              'Correct `dataLogValues`',
              [isA<DataLogValue>()],
            )
            .having(
              (element) => element.positions,
              'Correct `positions`',
              [isA<Position>()],
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.time.xmlTag),
            [
              XmlAttribute(XmlName('A'), DateTime.utc(2025).toIso8601String()),
              XmlAttribute(
                XmlName('B'),
                DateTime.utc(2025, 1, 1, 12).toIso8601String(),
              ),
              XmlAttribute(XmlName('C'), '43200'),
              XmlAttribute(XmlName('D'), '6'),
            ],
            [
              XmlElement(XmlName(Iso11783ElementType.dataLogValue.xmlTag), [
                XmlAttribute(XmlName('A'), 'DFFE'),
                XmlAttribute(XmlName('B'), '13'),
                XmlAttribute(XmlName('C'), 'DET1'),
              ]),

              XmlElement(XmlName(Iso11783ElementType.position.xmlTag), [
                XmlAttribute(XmlName('A'), '60'),
                XmlAttribute(XmlName('B'), '10'),
                XmlAttribute(XmlName('D'), '1'),
              ]),
            ],
          ),
        ),
        isA<Time>()
            .having(
              (element) => element.start,
              'Correct `start`',
              DateTime.utc(2025),
            )
            .having(
              (element) => element.stop,
              'Correct `stop`',
              DateTime.utc(2025, 1, 1, 12),
            )
            .having(
              (element) => element.duration,
              'Correct `duration`',
              43200,
            )
            .having(
              (element) => element.type,
              'Correct `type`',
              TimeType.repair,
            )
            .having(
              (element) => element.dataLogValues,
              'Correct `dataLogValues`',
              [isA<DataLogValue>()],
            )
            .having(
              (element) => element.positions,
              'Correct `positions`',
              [isA<Position>()],
            ),
      );
    });

    test('Invalid `type` throws ArgumentError', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.time.xmlTag),
            [
              XmlAttribute(XmlName('A'), DateTime.utc(2025).toIso8601String()),
              XmlAttribute(XmlName('D'), '100'),
            ],
          ),
        ),
        throwsA(
          isA<ArgumentError>().having(
            (error) => error.name,
            'Correct error',
            'Time.type',
          ),
        ),
      );
    });

    test(
      '`positions` that has more than two elements throws ArgumentError',
      () {
        expect(
          () => Time(
            start: DateTime.utc(2025),
            type: TimeType.repair,
            positions: [
              Position(north: 60, east: 13, status: PositionStatus.gnssFix),
              Position(north: 61, east: 13, status: PositionStatus.gnssFix),
              Position(north: 62, east: 13, status: PositionStatus.gnssFix),
            ],
          ),
          throwsA(
            isA<ArgumentError>().having(
              (error) => error.name,
              'Correct error',
              'Time.positions',
            ),
          ),
        );
      },
    );
  });

  group('ProcessDataVariable', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        ProcessDataVariable(
          ddi: 'FE5A',
          variableValue: 123,
          productIdRef: 'PDT1',
          deviceElementIdRef: 'DET1',
          valuePresentationIdRef: 'VPN1',
          actualCulturalPracticeValue: 10,
          elementTypeInstanceValue: 5,
        ),
        isA<ProcessDataVariable>()
            .having(
              (element) => element.ddi,
              'Correct `ddi`',
              'FE5A',
            )
            .having(
              (element) => element.variableValue,
              'Correct `variableValue`',
              123,
            )
            .having(
              (element) => element.productIdRef,
              'Correct `productIdRef`',
              'PDT1',
            )
            .having(
              (element) => element.deviceElementIdRef,
              'Correct `deviceElementIdRef`',
              'DET1',
            )
            .having(
              (element) => element.valuePresentationIdRef,
              'Correct `valuePresentationIdRef`',
              'VPN1',
            )
            .having(
              (element) => element.actualCulturalPracticeValue,
              'Correct `actualCulturalPracticeValue`',
              10,
            )
            .having(
              (element) => element.elementTypeInstanceValue,
              'Correct `elementTypeInstanceValue`',
              5,
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName.fromString('PDV'),
            [
              XmlAttribute(XmlName.fromString('A'), 'FE5A'),
              XmlAttribute(XmlName.fromString('B'), '123'),
              XmlAttribute(XmlName.fromString('C'), 'PDT1'),
              XmlAttribute(XmlName.fromString('D'), 'DET1'),
              XmlAttribute(XmlName.fromString('E'), 'VPN1'),
              XmlAttribute(XmlName.fromString('F'), '10'),
              XmlAttribute(XmlName.fromString('G'), '5'),
            ],
          ),
        ),
        isA<ProcessDataVariable>()
            .having(
              (element) => element.ddi,
              'Correct `ddi`',
              'FE5A',
            )
            .having(
              (element) => element.variableValue,
              'Correct `variableValue`',
              123,
            )
            .having(
              (element) => element.productIdRef,
              'Correct `productIdRef`',
              'PDT1',
            )
            .having(
              (element) => element.deviceElementIdRef,
              'Correct `deviceElementIdRef`',
              'DET1',
            )
            .having(
              (element) => element.valuePresentationIdRef,
              'Correct `valuePresentationIdRef`',
              'VPN1',
            )
            .having(
              (element) => element.actualCulturalPracticeValue,
              'Correct `actualCulturalPracticeValue`',
              10,
            )
            .having(
              (element) => element.elementTypeInstanceValue,
              'Correct `elementTypeInstanceValue`',
              5,
            ),
      );
    });
  });

  group('TreatmentZone', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        TreatmentZone(
          code: 5,
          designator: 'Test string',
          colour: 15,
          polygons: [
            Polygon(
              type: PolygonType.partfieldBoundary,
              lineStrings: [
                LineString(
                  points: [
                    Point(type: PointType.flag, north: 60, east: 10),
                    Point(type: PointType.flag, north: 61, east: 10),
                    Point(type: PointType.flag, north: 61, east: 11),
                    Point(type: PointType.flag, north: 60, east: 11),
                  ],
                  type: LineStringType.polygonExterior,
                ),
              ],
              designator: 'Test string',
              area: 1000,
              colour: 10,
              id: 'PLN1',
            ),
          ],
          processDataVariables: [
            ProcessDataVariable(
              ddi: 'FE5A',
              variableValue: 123,
              productIdRef: 'PDT1',
              deviceElementIdRef: 'DET1',
              valuePresentationIdRef: 'VPN1',
              actualCulturalPracticeValue: 10,
              elementTypeInstanceValue: 5,
            ),
          ],
        ),
        isA<TreatmentZone>()
            .having(
              (element) => element.code,
              'Correct `code`',
              5,
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.colour,
              'Correct `colour`',
              15,
            )
            .having(
              (element) => element.polygons,
              'Correct `polygons`',
              [isA<Polygon>()],
            )
            .having(
              (element) => element.processDataVariables,
              'Correct `processDataVariables`',
              [isA<ProcessDataVariable>()],
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName(Iso11783ElementType.treatmentZone.xmlTag),
            [
              XmlAttribute(XmlName('A'), '5'),
              XmlAttribute(XmlName('B'), 'Test string'),
              XmlAttribute(XmlName('C'), '15'),
            ],
          ),
        ),
        isA<TreatmentZone>()
            .having(
              (element) => element.code,
              'Correct `code`',
              5,
            )
            .having(
              (element) => element.designator,
              'Correct `designator`',
              'Test string',
            )
            .having(
              (element) => element.colour,
              'Correct `colour`',
              15,
            ),
      );
    });
  });

  group('ValuePresentation', () {
    test('Correct values are set and read from the underlying XML element', () {
      expect(
        ValuePresentation(
          id: 'VPN1',
          offset: 0,
          scale: 1,
          numberOfDecimals: 2,
          colourLegendIdRef: 'CLD1',
          unitDesignator: 'm/s',
        ),
        isA<ValuePresentation>()
            .having(
              (element) => element.id,
              'Correct `id`',
              'VPN1',
            )
            .having((element) => element.offset, 'Correct `offset`', 0)
            .having((element) => element.scale, 'Correct `scale`', 1)
            .having(
              (element) => element.numberOfDecimals,
              'Correct `numberOfDecimals`',
              2,
            )
            .having(
              (element) => element.colourLegendIdRef,
              'Correct `colourLegendIdRef`',
              'CLD1',
            )
            .having(
              (element) => element.unitDesignator,
              'Correct `unitDesignator`',
              'm/s',
            )
            .having(
              (element) => element.idRefPattern,
              'Correct `idRefPattern`',
              ValuePresentation.staticIdRefPattern,
            ),
      );
    });

    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.valuePresentation.xmlTag), [
            XmlAttribute(XmlName('A'), 'VPN1'),
            XmlAttribute(XmlName('B'), '0'),
            XmlAttribute(XmlName('C'), '1'),
            XmlAttribute(XmlName('D'), '2'),
            XmlAttribute(XmlName('E'), 'm/s'),
            XmlAttribute(XmlName('F'), 'CLD1'),
          ]),
        ),
        isA<ValuePresentation>()
            .having(
              (element) => element.id,
              'Correct `id`',
              'VPN1',
            )
            .having((element) => element.offset, 'Correct `offset`', 0)
            .having((element) => element.scale, 'Correct `scale`', 1)
            .having(
              (element) => element.numberOfDecimals,
              'Correct `numberOfDecimals`',
              2,
            )
            .having(
              (element) => element.colourLegendIdRef,
              'Correct `colourLegendIdRef`',
              'CLD1',
            )
            .having(
              (element) => element.unitDesignator,
              'Correct `unitDesignator`',
              'm/s',
            ),
      );
    });
  });

  group('UnknownIso11783Element', () {
    test('._fromXmlElement', () {
      expect(
        Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName('ABC'),
            [XmlAttribute(XmlName('SomeAttribute'), 'Value')],
            [XmlElement(XmlName('DEF'))],
          ),
        ),
        isA<UnknownIso11783Element>()
            .having(
              (element) => element.id,
              'Null `id`',
              isNull,
            )
            .having(
              (element) => element.idRefPattern,
              'Null `idRefPattern`',
              isNull,
            )
            .having(
              (element) => element.elementType,
              '`elementType` is unknown',
              Iso11783ElementType.unknown,
            )
            .having(
              (element) => element.xmlElement,
              'Correct `xmlElement`',
              isA<XmlElement>()
                  .having(
                    (xmlElement) => xmlElement.name.local,
                    'Correct `name`',
                    'ABC',
                  )
                  .having(
                    (xmlElement) => xmlElement.attributes,
                    'Correct `attributes`',
                    [
                      isA<XmlAttribute>()
                          .having(
                            (attribute) => attribute.name.local,
                            'Correct `name`',
                            'SomeAttribute',
                          )
                          .having(
                            (attribute) => attribute.value,
                            'Correct `value`',
                            'Value',
                          ),
                    ],
                  )
                  .having(
                    (xmlElement) => xmlElement.children,
                    'Correct `children`',
                    [
                      isA<XmlElement>().having(
                        (childElement) => childElement.name.local,
                        'Correct `name`',
                        'DEF',
                      ),
                    ],
                  ),
            ),
      );
    });
  });
}

const zipBytes =
    '''50 4B 03 04 14 03 00 00 00 00 55 8B 41 54 00 00 00 00 00 00 00 00 00 00 00 00 09 00 00 00 54 41 53 4B 44 41 54 41 2F 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 E5 EC 8F 56 5C 00 00 00 61 00 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 41 46 45 30 30 30 30 30 2E 58 4D 4C B3 B1 AF C8 CD 51 28 4B 2D 2A CE CC CF B3 55 32 D4 33 50 52 48 CD 4B CE 4F C9 CC 4B B7 55 0A 0D 71 D3 B5 50 B2 B7 E3 B2 89 70 73 B6 E3 52 00 02 1B 47 37 57 05 47 5B 25 1F 4F 3F 6F 1F CF E0 10 BD 08 5F 1F 25 05 27 5B 25 23 25 05 67 5B 25 25 05 17 A0 29 4A FA 40 2D FA 60 3D 00 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 53 89 EC A1 5C 00 00 00 62 00 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 43 43 47 30 30 30 30 30 2E 58 4D 4C B3 B1 AF C8 CD 51 28 4B 2D 2A CE CC CF B3 55 32 D4 33 50 52 48 CD 4B CE 4F C9 CC 4B B7 55 0A 0D 71 D3 B5 50 B2 B7 E3 B2 89 70 73 B6 E3 52 00 02 1B 67 67 77 05 47 5B 25 20 65 A8 A4 E0 64 AB E4 97 5A 51 E2 96 58 94 0B D4 10 92 58 9C ED 96 99 93 EA 99 A2 A4 0F D4 A3 0F D6 04 00 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 F9 D4 87 DD 73 00 00 00 7C 00 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 43 43 54 30 30 30 30 30 2E 58 4D 4C 1D 8C 41 0A C2 30 14 05 F7 3D C5 E7 ED B5 26 96 98 40 7E 8B 46 EA 05 2A B8 0D 3F 51 0A 9A 82 82 78 7C A3 B3 99 D5 8C 1F 3E 8F 3B BD F3 F3 35 2F 85 A1 D6 1B 50 2E B2 A4 B9 DC 18 E7 69 5C 59 0C 7D E3 2F 63 E8 1B AA F8 10 26 DA 33 AA 14 E8 C0 D8 45 EB AE DB 68 B4 32 D2 49 A7 6C 4A D1 8A CE 2E 1A 2B D9 39 50 60 68 D0 F1 D7 9C 14 DA 7A 6B FF BB 2F 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 9D 09 85 A0 87 00 00 00 F5 00 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 43 54 50 30 30 30 30 30 2E 58 4D 4C B3 B1 AF C8 CD 51 28 4B 2D 2A CE CC CF B3 55 32 D4 33 50 52 48 CD 4B CE 4F C9 CC 4B B7 55 0A 0D 71 D3 B5 50 B2 B7 E3 B2 89 70 73 B6 E3 52 00 02 1B E7 90 00 05 47 5B 25 20 65 A8 A4 E0 64 AB 14 9E 99 57 92 5A 94 52 5A 54 9A AB A4 E0 6C AB 14 E0 1E A0 6B A8 04 51 0C D1 10 16 02 D2 00 A4 74 8D C0 3A 20 CA 5C 40 5C 7D A8 A1 FA 40 E3 30 CC 37 42 32 3F 1D E8 C2 92 54 82 16 18 A2 5A 60 88 66 81 8D 3E D8 1F 00 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 59 51 B8 68 56 00 00 00 5B 00 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 43 54 52 30 30 30 30 30 2E 58 4D 4C B3 B1 AF C8 CD 51 28 4B 2D 2A CE CC CF B3 55 32 D4 33 50 52 48 CD 4B CE 4F C9 CC 4B B7 55 0A 0D 71 D3 B5 50 B2 B7 E3 B2 89 70 73 B6 E3 52 00 02 1B E7 90 20 05 47 5B 25 20 65 A8 A4 E0 64 AB E4 94 5A 52 94 99 9A A4 E0 9C 5A 9C 98 97 A8 A4 0F 54 AC 0F 56 0D 00 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 E9 C5 5D 21 96 01 00 00 00 06 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 44 56 43 30 30 30 30 30 2E 58 4D 4C 8D 94 CD 4E 83 40 14 85 F7 3E C5 64 F6 95 F9 61 28 4D A0 8D 02 E3 D2 A6 62 A3 4B 42 A1 36 41 68 28 6A F5 E9 C5 0B 68 CB 30 58 16 43 E0 E6 9C F3 DD E4 64 9C C5 F1 35 43 EF 49 79 D8 15 B9 8B E9 35 C1 28 C9 E3 62 B3 CB B7 2E 7E 0C E5 C4 C6 8B F9 95 F3 24 BD F9 15 AA 1F C7 5F 7B E8 C6 C5 F5 6B 42 31 BA 75 B1 CD 04 99 D8 CC 26 28 0C D7 18 F9 2E 26 BD 07 23 39 F4 F3 CE C5 52 36 1F 42 5A 81 25 70 13 D1 C4 04 21 C4 04 61 1B 53 9F 1E 9C BE 12 19 B8 B8 CD 68 1D FE 5C EE 57 3F 2E 54 50 D3 C4 86 7E 28 C6 86 96 7E C8 67 53 DD D0 B2 C9 D9 CC 31 EA 5D 86 17 64 B0 20 83 05 2D 58 B0 4C A2 12 C5 45 9E 27 71 55 94 B0 21 85 0D A9 6E 43 42 B4 94 84 5E C8 C1 81 83 9F 70 A4 65 91 57 3D 10 36 0A C2 F4 20 EC 62 10 13 40 4C 00 99 02 C8 76 7F 80 70 3E 1A CE F5 E1 9C 50 FD 88 8D 72 2D FD AE 09 0D 17 21 33 72 52 46 02 60 CF D1 07 36 86 55 A2 53 51 45 B5 2A B2 4C 27 B3 3A 19 53 64 CB 5D 15 BF A8 BA AE 91 A0 A3 B6 AF E8 1E F6 49 B2 51 75 50 D6 46 E6 4B 29 15 99 9F A4 D1 5B 56 21 3F AA A2 9E 3A 6C CB D7 B2 DA 16 88 27 94 0B 31 50 64 74 44 45 9A 1E 92 6A D8 85 76 2E 53 70 21 43 0E 9F 23 0E AC CF 61 72 AA F4 F8 5F 0E A6 72 A8 16 E3 20 BC 0F 42 05 FB ED F1 68 38 57 C3 3B D9 78 20 EB 64 76 4F F6 75 26 83 7A AF BD FA 46 37 E0 4A FF 06 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 10 5B 83 00 5F 00 00 00 64 00 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 46 52 4D 30 30 30 30 30 2E 58 4D 4C B3 B1 AF C8 CD 51 28 4B 2D 2A CE CC CF B3 55 32 D4 33 50 52 48 CD 4B CE 4F C9 CC 4B B7 55 0A 0D 71 D3 B5 50 B2 B7 E3 B2 89 70 73 B6 E3 52 00 02 1B B7 20 5F 05 47 5B 25 20 65 A8 A4 E0 64 AB E4 94 5A 52 94 99 9A A4 E0 9C 5A 9C 98 97 A8 A4 E0 69 AB E4 1C 12 64 A8 A4 0F D4 A5 0F D6 06 00 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 C7 6A DA A8 73 05 00 00 2B 0D 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 4C 49 4E 4B 4C 49 53 54 2E 58 4D 4C 74 D2 4B 8F 13 31 0C 00 E0 3B BF A2 9A BB 21 0F 27 76 24 16 C4 43 8B 10 AF 0A CA DE ED C4 59 15 96 16 CD 96 87 84 F8 EF CC AA B3 20 A0 93 CB 4C EC E4 93 2D E7 FE C3 EF 9F AE 56 5F 6D BC DE EE 77 67 83 BF EB 86 95 ED EA BE 6D 77 97 67 C3 FB CD 39 F0 F0 F0 C1 9D FB CF DF BD F1 9E 38 BE DC EE 3E BE DC 5E 1F 56 17 C7 2B AF E4 C3 7E 3C 1B 70 F8 1D D8 EE 6E 02 7E 58 BD 92 9D 5C DA 27 DB 1D DE ED FB E1 9B 8C 36 45 BE 74 A9 87 2F A3 4D 47 CE 65 FC 74 3E ED AE 4F 1D BD B8 AD 68 AA 67 23 D7 1F 9F EC 77 87 71 7F 75 65 E3 DF C8 66 FF B9 EE 77 AB F5 68 75 7B 73 61 F5 E8 72 DC D6 2F 57 37 E9 7F 6F FE 36 87 D5 53 39 C8 66 94 DD 75 B7 F1 CD B8 BD DC 4E D1 30 3C B8 B3 9A D6 FD 97 CF D6 AB 47 67 C3 F4 81 A9 8D C7 53 33 73 E6 98 7D FD E2 26 FB 64 F3 F6 98 FC 51 9A 12 93 27 E8 9D 09 90 12 82 78 97 A1 90 43 91 68 21 33 FE 1C EE FD 4F 9C BF 7D 35 13 E6 D8 1A 96 00 AD 25 03 B4 66 C0 98 1B 24 F4 99 82 35 8D 94 27 E2 54 15 EB 99 48 A1 A0 59 ED 80 C5 31 A0 EF 1D 54 8A 00 22 B2 4F C9 51 09 6E 89 08 47 82 35 67 74 4D 81 24 07 C0 8A 0C CC 62 D0 0A D6 90 62 F7 2D 96 93 C4 FA FC E9 6D 23 56 23 76 09 40 A8 1D D0 5B 02 E9 AC 80 EA 5D CB 48 2E FB B4 44 CC 55 E4 A8 3E 72 2E D0 5C 9A 88 CC 04 45 6A 01 72 95 83 43 27 A4 6E 89 88 47 42 92 F5 90 7C 03 96 E0 00 D5 0C 98 2A 03 27 55 9D 9C 42 58 97 08 9C 87 8A B1 26 27 11 B2 29 CF 8D 04 9F C0 B5 C0 25 AB 68 6C 8B 55 A4 99 68 88 CD 73 84 90 18 01 9D F3 50 74 72 72 D7 1E 0A 71 AA 51 97 88 3C 37 42 DE 71 34 84 2A 9C 00 43 9F 08 33 0F D1 11 4B C5 62 9A 16 27 42 47 C2 91 70 C5 4E 20 21 29 60 2B 1D B4 1B 83 2F D2 8D 72 E7 C4 75 89 E0 23 A1 42 9E D0 0C 54 6A 04 D4 D2 60 FA 49 E0 A2 12 93 E6 D0 4B 5C 22 CA 91 E8 29 E4 3A 2D 08 2E 66 C0 E2 32 70 8E 06 29 A7 28 9E 7D 2A A1 9F 24 2E D6 AF E7 A7 E5 D9 39 9F 33 42 76 D5 00 39 17 28 11 1B 38 95 16 AD B9 48 1E 4F 3F F0 27 CF 66 02 43 EA D9 BB 00 DA 84 00 9B 32 28 6A 03 8C EC 7A C1 DA 72 A2 05 62 33 13 B9 74 87 A1 35 20 8A 02 E8 49 41 1D 7B 48 8A CC 19 63 2A 79 71 A8 30 1B 3D A6 D4 AD 22 70 6D 1E 30 D7 00 92 10 A1 9B 1A 96 22 2E A6 85 B7 F5 6C 7D 6B 70 D4 9E 31 37 50 1F 3B 20 7B 0F 82 68 D0 7A 08 B9 68 6D 82 E9 74 2B 17 9B 5B C3 69 48 E4 53 85 4E 9C 00 AB 8F A0 5C 15 D0 57 16 2E 18 4A C3 D3 75 3C FD 6D 78 23 CC D4 08 12 47 03 CC D1 03 FB 6C 80 93 2C 05 6B A6 1A 96 06 FB A7 17 49 55 D9 01 55 49 80 5D 7F D5 5D EE AA 42 C6 40 10 EE 7D 97 C1 5C 76 93 5D 10 1B 15 0B ED 14 FB BD BE FF 23 A8 70 54 90 F3 37 29 3F 26 33 C3 6E 72 20 54 84 71 EE 99 7B F2 A2 AE 47 4F D7 CB E0 D1 D5 29 F3 62 4E 2F 10 87 42 B2 07 8E B9 53 9F BB 3D FA 91 B1 5F 7A DE BD 87 7B 22 B7 4F 50 8C 09 E5 35 21 BE 33 83 67 A8 F4 A3 A7 2F 3A AC 5B 35 EF 41 9C DC 20 1B 04 13 39 C8 2C 12 97 91 CA F1 E8 E9 0B 43 73 AD 99 EB 82 6B 0C D0 DD 02 65 9E 28 B5 7B B4 C6 89 38 8F 77 A1 97 5C C4 C8 87 5C 9C 60 79 19 3E C5 82 C5 AB 58 88 65 9D D7 B3 FD FC AF 63 A3 87 DB BC 05 AB D8 A0 13 0E 0D 9B D0 90 D0 74 9D D6 E3 75 C6 BF 6C D7 B8 5E E4 0B AB 35 41 D9 04 AB C3 70 1D A2 5D E5 3A E5 51 C7 7A B9 4B 57 1C 9F 01 0D 6F 90 55 C1 56 4E F8 CC 41 A4 CC BE 9E 75 BC 30 FC 4A EE C1 8C A9 B1 40 46 03 96 D3 30 3A B4 96 F0 B2 B8 8F 8C 97 7E F4 C9 E2 28 42 5D 16 10 CF 84 A6 4E E8 2C B2 EC A1 7C F3 91 41 2F 3D 75 67 BF 19 88 AD 0D B2 B1 A1 19 8D CD 27 89 EB 2E 2B 7D 64 F0 4B C7 66 EE 13 4D B8 29 17 44 25 F0 69 0B DA 87 3D 53 97 8A 3C 32 5E 36 CB 5E B7 28 58 51 32 07 C8 D5 A1 3D 0B E1 66 57 DC FC 76 3F E6 F2 E2 87 9F 15 67 5A 60 A8 0A 48 85 A0 A7 0C 3B D5 85 8C 23 73 3E EA B8 2F 5D 8F E9 2C BB 10 74 0B 74 9A 61 B9 0B 4A B9 42 85 5B 1F 1E 4F DF BF 7D F9 D3 B1 5B B7 66 84 A1 2D 0B 34 63 41 F3 2E DC D3 3B 0E 55 A6 3E 6E C9 3F 9E F2 1C 2B EF 0A A4 F6 06 B9 08 CC 57 22 A3 C9 CE EE 7B 96 BD CA F8 F8 E3 C3 5F 1D DD 74 7C 34 DA 06 81 DC 1A 9E AB 70 86 0D 97 E8 55 B7 5F 67 7C FA 3B 4F 85 59 7A DE 04 ED 33 7E 1F 06 A5 DA 90 31 4E 6F 5D 5E 23 1E 19 EB 45 47 74 2C 0F C2 2C 2E D0 62 86 D0 16 D4 90 C9 67 6F 52 BB 8F 8C 97 6C 0F 53 F8 F2 8D B8 7E 41 36 0A 3A CC E0 C5 63 37 1F 9D DB 1E 19 2F 5D 5F 4B 24 9B 27 D8 66 80 0E 17 7C 0D 02 8B A4 9C 9A D3 53 1E 73 79 E9 69 8D 9A 46 36 51 73 32 48 E9 40 7B 26 DC 75 FB 5A FB C4 8E D7 FB F1 F5 CF D6 3F 63 2C AB 65 B0 33 12 24 ED F0 43 0B 1C 23 5D 69 B7 49 FE 45 BC 7B FB EB D9 FF EB BF F3 F6 FF 0F CF FB 37 3F 01 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 60 40 D2 02 93 00 00 00 ED 00 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 50 44 54 30 30 30 30 30 2E 58 4D 4C B3 B1 AF C8 CD 51 28 4B 2D 2A CE CC CF B3 55 32 D4 33 50 52 48 CD 4B CE 4F C9 CC 4B B7 55 0A 0D 71 D3 B5 50 B2 B7 E3 B2 89 70 73 B6 E3 52 00 02 9B 00 97 10 05 47 5B 25 20 A5 6B A8 A4 E0 64 AB 14 9E 99 57 92 5A 94 0E 34 A2 24 55 49 C1 19 28 E5 1E 00 92 72 B1 55 0A 0B F0 03 B1 5C 6D 95 0C 0C 4C 9C 94 14 02 8C 8C 0D E3 93 8B F2 0B E2 CB 12 8B 32 53 4B 2A 6D 95 9C C3 40 E6 E8 63 1A 6E 84 64 78 4A 69 51 69 2E 79 66 1B 81 CC B6 D1 07 BB 1F 00 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 7C 77 79 A0 43 08 00 00 98 29 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 50 46 44 30 30 30 30 30 2E 58 4D 4C B4 98 CB 6E D3 50 10 86 F7 3C 85 E5 BD C3 CC 9C B9 4A 04 04 94 54 48 80 10 94 CB AE 72 62 1B 55 40 8B 52 EE 4F 8F 63 07 70 CC 45 31 34 5E D4 8D E3 F9 CE 99 DF FF 8C 47 B9 71 EB F3 DB 37 D9 C7 7A 7D 79 76 71 3E CF 71 06 79 56 9F AF 2E AA B3 F3 57 F3 FC D9 C9 A2 F0 FC D6 CD 6B 37 5E 2E EE DE BC 96 B5 C7 8D C7 8B A3 EC F6 3C 6F 4F 98 67 77 E6 B9 D7 2B 8A 55 59 16 42 35 14 5C 83 14 EE B4 2A 82 B5 A9 15 3C CF EE CE 73 CA 4E EA CB F7 27 EB F2 FC B2 39 A5 8C 00 23 3B FA F0 22 CF 8E DA 35 DD D1 F2 EC DE 3C BF 7B F2 A4 65 2E E6 F9 E2 C9 C3 F6 9F E3 CD 95 C7 98 F7 0B F7 8B 3F 78 B4 59 1C 3B 68 17 38 F8 B6 BB E3 C1 D3 E3 EE 8E D1 F5 3E FA D1 C9 E6 3B EA A2 59 66 42 2E 68 0A 04 9B A3 DB 4C CC C4 24 B1 9A 6A 7F F1 FA 5E 1C 53 13 F3 18 71 C4 C9 01 A6 70 1C 54 35 A5 5D 8E A9 32 86 4C E1 04 21 39 C3 2E 47 23 B1 26 9E C4 C1 64 EA 23 8E 04 9B 38 4E CA 4B 5D 0D 65 B4 1F 54 42 F1 2D E7 30 CF EB C6 F5 D6 10 03 03 5D 6F 1D 34 F8 78 7C FC 78 B3 42 7B 2A 7A 37 3F 4F D9 49 79 F9 BA 2A DF 97 D9 FD B7 EF 2E D6 EF C7 06 3B 7E DC 59 B0 3D 6D 43 7E 38 FB F4 F6 9D D3 7E AF 43 F7 8D 9D 29 5D D0 F6 86 7D AC E5 20 0C 44 2E C9 7E A6 AC 22 16 01 A8 1E A3 94 FF 6E 2F 93 70 11 C5 01 CB 92 6D 0E 32 82 11 6B 24 E1 F0 52 9B FE 50 D5 56 C0 F6 63 2F F0 E2 E8 97 4E 41 5D CE D5 6A 59 AA AE A8 B0 66 B9 2A D8 51 8B 80 5A 8B D2 0C 84 9B AA EF 14 9C DD BD 68 1B D0 BA 3A 2B B3 AE 51 F4 4D 82 D1 D3 AF 5D E2 8F CD A1 0F F8 8F EE C0 B3 20 72 26 E7 41 55 23 CE 00 9C 5C D9 6D 2F DB F6 20 D4 40 43 A5 11 88 49 13 5A 9A 04 52 0F 94 F1 8E 54 19 9D A7 80 28 01 01 10 EF 82 10 91 2D 24 B6 A0 03 69 F4 BB 92 FC 9B 79 52 67 1E 5D D6 52 0B D4 85 96 65 14 DC 68 14 B1 42 2D EA A6 A9 4B A8 B0 37 0F 64 B7 D7 F5 D7 AF 17 D9 E2 AC 7E 53 0D EC 03 18 94 26 D8 A7 0F F8 77 FB A4 19 BB 0A 63 12 D9 91 C6 2D 00 12 10 ED A7 71 0F E2 10 17 D1 31 88 D0 24 62 12 48 2D 21 C5 2E C8 D9 05 88 61 0A 48 CC 24 C0 C7 A0 88 44 31 11 C4 11 8A 23 90 12 73 F8 A4 D4 54 22 91 C0 18 94 84 C8 6C 12 48 9D 41 79 04 22 03 66 4B 93 40 6C CA 6E 63 90 80 99 E9 16 74 20 1F 4D 2D 31 EE 4A 6C E5 42 BC 5A 7A 81 24 55 C1 A5 68 E1 55 43 85 31 D6 51 26 EF 0B 23 7B 7A B4 38 BD AC EB CD 84 B8 79 F5 F5 C3 DC 8B E3 6E 67 24 88 F8 E7 59 8E FE 54 6F 7D E0 FF CD 72 06 28 C9 C7 33 86 24 02 9F 36 63 90 83 12 EC 70 1C 49 D1 D0 26 71 14 34 61 8C 38 E0 14 40 53 38 66 49 34 C6 79 81 1A 1A 6E 39 87 D1 67 AA 8B A4 7F CB 3B 61 0D 4B 2D 96 CD D2 0A C6 A6 2E BC 32 29 6A F1 6A D5 24 E9 36 A4 D9 ED 57 EB B3 27 17 1F DE D7 EB D3 AA 5E 61 FC B0 52 B7 35 46 90 C0 09 FD BA 0B F8 77 03 15 89 67 0E 8A C6 0E 69 50 68 C9 67 8A 12 60 9C 3A AD 31 BF BE 1F CA 30 59 08 8C 50 D4 62 DC 93 C5 E6 D8 13 85 64 11 C8 34 46 11 BB D9 F6 71 EE 8D 72 04 77 1B 27 18 8E 64 64 53 12 44 04 0E E4 5F 50 6A E0 82 DF FD 74 30 D9 F7 1F EB 69 FA 58 DF 87 7C 2A BF BC 39 3B AF AF 72 9E DF 5A 43 1C 13 0B 0A A6 18 3C CF E4 E6 21 26 6E 34 B0 C6 1E CF 34 25 47 D1 60 46 1E DA 83 02 C1 C3 05 04 FF 6D AA 1F CB 92 0E 2A 0B 52 12 74 87 10 E2 34 F4 66 B0 1B 20 25 D7 34 49 16 46 F3 B0 E4 E2 69 28 4B 62 70 32 66 52 BF 1A 59 F8 A0 B2 80 2A 28 8B 3B 21 F1 B0 CE 5C 04 59 92 25 A7 29 B2 80 26 C1 44 0A CC 36 C0 19 84 A7 84 EE 16 76 35 B2 C8 41 65 41 D0 48 2E 16 C1 E2 3B 79 38 03 19 41 98 4F 2B 22 8E 00 74 74 89 5D F3 09 70 18 11 CB D5 C8 A2 07 95 05 4C 19 03 53 F7 67 F8 DA 41 11 67 64 65 9B 52 44 A0 12 6C 48 A6 61 BB E6 63 F0 14 4E 24 7C A0 5F 0C 7A 9D 00 49 A9 5A 61 51 95 15 17 BC 5C 36 45 40 6A 8A A6 8A 52 96 8D 6D 27 D2 07 E5 87 76 18 AD BF D5 6A 37 2B 4F 44 31 18 80 6F C5 1B 18 CD CF 9B BC 09 B8 53 D1 A5 A0 B8 95 8E 6D 41 10 11 7F 56 E2 BD AB AD E2 71 50 39 A3 7E BB B6 B4 0F C9 69 A6 27 27 D3 D7 C3 79 4F 09 CF 1D FD C3 F5 03 7F DF 80 D6 ED 20 24 34 31 1E D3 E4 36 A4 CA C9 61 7A 37 01 79 37 2A B6 50 36 3A 4C F6 40 96 29 46 DB 40 21 5A EE 7B A0 6C B0 0B D8 46 A4 A4 00 BB A0 68 87 6F A1 EA CC 80 7E 83 6E 68 B1 F7 B6 B3 BC 94 E0 1A 38 66 74 2D C5 3C 2D D0 B3 2F 55 75 5E E2 2C AA AB 5E 87 56 FE 7D BC FD EE F5 F9 B9 FF 28 43 13 43 CC 57 E1 F5 FD FF 38 D1 96 0C CF CD 24 BA C4 3C C2 77 9D 16 A2 E0 AE 3F 3B 01 8A B4 EC 71 A2 11 4C DF 4E 7E BB 33 74 8F 93 A2 0E D5 8D 13 22 12 B5 CB 09 52 B1 8D C7 2A 50 FB E2 49 6B 46 6D E3 51 61 71 97 D3 8C F8 0F 79 11 6C 95 4D 5E E5 EA E6 DF F3 BA 99 FA 99 6F C5 7D 7F 2B 7E BD 06 87 8B EB CB 88 DD FF E7 B6 F9 BD D6 25 68 E9 B0 1E 4E D8 AA D5 A9 EE B0 1D 23 76 92 D1 8D 0E 1F 2C 4A BA 9B 49 D2 F2 86 36 CC BA E4 5C 47 D3 73 DB 71 D1 93 E4 02 0B 2E EB 41 74 39 B7 F7 2A 67 B9 2E 5D DD 7A F2 E1 CD E9 ED BD C3 DB C3 FB D3 66 52 4A E9 3D 73 52 4A FB BF FC 60 25 43 1A 15 1C 0B CE 1C 95 94 CE F9 C2 4D 22 43 24 F5 67 27 D2 0D 26 7B 9C 88 44 FA 26 9E 0C B0 51 BB 1C 02 11 BA 71 24 35 E8 DF 9C 9B 59 9F BD FB 5C 5F 2A E7 B0 1E FC BC AE BE 88 D6 79 41 97 2E E5 AC C5 8E 2F E4 B4 9E CE 97 80 FA B2 CF DD 7A B8 3C B9 FF E4 47 C9 24 77 6D 72 88 B8 E6 F1 9B BA B1 EB D5 7B EB B1 B9 3E 3F BD 3E AC AF 4E C7 CB 67 2F 2F 7C F8 F0 F2 CB B3 8F 67 A0 85 EB 8B C5 90 BE A0 15 4B E3 70 58 B4 FA 28 12 2F F4 45 E0 D3 E4 DC 10 C1 74 7A 47 62 B8 E7 4A 15 4D 4F 4A 4E FF 02 87 0A 19 E2 65 83 93 5D 01 A9 2A 4C 3B 48 2B 3A D5 7C 70 68 D7 D9 71 71 DA 71 44 B7 A0 BC 7E 8A 07 E2 61 48 9D 76 CC 53 94 DA 3A C6 53 9A A1 22 2E 35 ED 48 59 4A 68 05 46 27 D1 15 CE CC 59 C7 3B 84 D1 A1 DD A3 23 56 2D A0 F5 B4 53 ED 1A AD D6 3A 38 04 BD C8 D2 98 77 60 DD 0D EA 18 4F 66 8A 95 56 E8 BC 23 55 E9 2D CA C1 89 28 43 A1 5A 76 38 88 74 CD F6 C1 41 46 C1 54 B8 27 2F 26 B4 54 73 70 4C AB 5C DB D9 D3 4E 47 4B 0B 0A C3 FA 44 97 44 75 AB 60 D6 81 3A 35 9D AA 35 38 34 8A 45 88 F5 B4 63 88 48 03 12 83 93 61 12 2E 22 3E ED A0 BD 48 AB 18 F3 8A 30 16 4A 7C BE D3 56 63 0B C4 68 83 03 67 57 A1 1A D3 0E ED 7A F8 29 0E 8E A9 5A 28 81 9A 76 BA 3A 8A 6C 1F 1D 8D 80 86 BA E5 AC 93 EA 99 04 59 35 3A 54 40 AA 5D A7 1D F3 B6 54 A8 F9 4F 79 95 A9 A7 D0 A6 9D EC 8C 44 85 D9 E0 A4 09 0D 02 9D 77 CA 3A A4 2C 0B 83 43 4D 66 74 01 F3 4E B7 98 EA CF 79 95 96 55 A6 98 4E 3B 9D 1A 42 93 31 AF 94 90 B0 D4 9A FF BE 28 EA EC CE C2 E8 A4 16 C5 02 D6 F3 4E 93 54 41 0F 0E 15 D1 0D F5 C0 B4 63 0C 78 BB C0 07 A7 D4 60 4C 7E 75 6E 66 7F FF D3 89 66 DB CC 24 F1 E7 6E 46 67 BA 19 3D 9E 5A 79 3E 2D 0A 93 05 88 5A D6 63 63 59 D9 90 63 AF 7C 71 AC D9 6E C6 D1 00 37 E7 37 63 E4 BE F3 2D CB 61 C8 9F 9D 64 5A 6B EC 72 58 9A 6E 1B C7 D1 15 D8 E5 88 E5 AF E2 29 63 7F 73 6E 66 7D F6 B6 D3 CB B5 30 9E 3E 78 F2 F4 E2 5F D5 3F DD 13 BF F5 E8 CB 83 67 4F 97 CB 05 7F F7 CE E5 AF 96 9F 01 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 1B E0 D3 2F A5 00 00 00 8C 01 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 50 46 44 30 30 30 30 31 2E 58 4D 4C 85 90 41 0B C2 30 0C 85 EF FB 15 21 67 E7 DA BA 4D 07 ED C6 D8 AC 5E 84 31 AA 78 77 45 0A B3 93 09 E2 CF B7 13 F1 A2 C5 5C F2 08 F9 1E 79 E1 C5 E3 D2 C3 5D 8F 37 33 58 81 74 4E 10 B4 3D 0D 9D B1 67 81 7B 25 C3 15 16 79 C0 8F B2 CA 03 70 C5 1B 59 43 29 D0 B5 90 21 54 02 A5 D1 7D 07 19 94 D7 71 06 8C 30 0A 34 8E 53 84 5A 20 C1 E8 9B 5A F8 A9 E5 9B 82 B5 C0 4A B5 14 41 BA CD 76 E7 C4 66 9A 34 4E 6C 9D 38 A8 90 FD B2 8E FD D6 99 FF A0 C4 4B 25 C4 4F A5 7E 8A FD 8B C1 3E 31 E8 64 CD A3 D7 7B 9F 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 A5 48 7A 1B 6F 00 00 00 74 00 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 50 47 50 30 30 30 30 30 2E 58 4D 4C B3 B1 AF C8 CD 51 28 4B 2D 2A CE CC CF B3 55 32 D4 33 50 52 48 CD 4B CE 4F C9 CC 4B B7 55 0A 0D 71 D3 B5 50 B2 B7 E3 B2 89 70 73 B6 E3 52 00 02 9B 00 F7 00 05 47 5B 25 20 A5 6B A8 A4 E0 64 AB E4 5C 94 5F A0 10 90 93 98 57 52 AC A4 E0 6C AB 64 A4 A4 10 60 64 6C 18 9F 58 5A 92 1F 9F 92 9A 96 58 9A 53 62 AB A4 A4 0F 34 45 1F 6C 0C 00 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 8B D7 7A 28 0D 01 00 00 C1 02 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 54 41 53 4B 44 41 54 41 2E 58 4D 4C 85 92 51 4F 83 30 10 C7 DF F7 29 9A BE CF 8D CD C4 3D 00 0B 82 5D 8C C1 11 A8 C4 37 D2 D4 42 AA D0 9A A3 A8 1F DF 56 E3 92 4D ED EE AD F7 BB FF F5 7F 97 0B B7 1F 43 8F DE 04 8C 52 AB 08 07 17 4B 8C 84 E2 FA 49 AA 2E C2 0F 94 CC 37 78 1B CF C2 DB 6A 1F 04 57 9B 75 43 D9 F8 92 31 C3 50 FD AD C9 D9 B3 86 08 5F E2 43 42 2A 97 58 61 94 33 C5 3A 31 08 65 2A DD 9A 77 06 C2 66 A6 96 71 33 81 B0 25 84 C1 40 EC 6B FC AB B4 FE B1 64 0D B9 3F 53 AD 0C E8 BE 17 70 DC 84 EA 57 AE 15 2A 40 70 E9 04 28 E9 40 F2 A9 77 F8 54 79 E8 89 91 1B 81 02 53 63 2B 60 0F B2 93 EA CB 72 B1 5A 07 0D 9F A0 31 56 68 9B 57 77 F3 00 C7 33 64 23 7C 24 25 4A 22 9C 90 9B A5 0B 8C AE ED BE F0 E2 98 A6 29 F5 D2 9D 8F D2 C2 4B 4B 0F 25 65 EE A1 59 9D 7A 68 41 B2 F3 34 F8 87 66 D4 A7 DD 79 26 72 DB F5 D0 BA B8 3F A1 E1 E2 D7 15 C6 B3 4F 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 67 D5 A5 32 E3 08 00 00 CD 1B 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 54 4C 47 30 30 30 30 31 2E 42 49 4E 75 D6 65 50 94 51 14 C6 F1 EB B2 8B D8 AD 28 06 76 77 77 77 77 61 8E DD 63 B7 8E DD 62 77 B7 62 12 76 07 28 D8 85 AD 18 98 80 18 28 20 F8 9C 73 F5 8E CE 9C 97 4F 0C BF 79 FE DC DD F7 2E C3 AE 05 25 9C 42 2A 3C 8D C9 E1 D6 60 B8 AF A3 C9 0E 9B B2 25 51 CE CA F5 FE EE E6 F8 B9 AA BF 90 38 04 DC 0E 5C D6 F0 C6 3D CC 29 3D 89 43 C1 7D C0 C5 0D F7 F1 22 B6 AB B6 CE 09 54 82 C2 09 94 B2 3D 8C 8B 8F 77 6A 69 53 6A 04 4F DE 63 32 E4 BF 49 20 4F D4 43 E6 4F E0 31 E0 32 86 2B EC D5 45 77 2A CE 53 28 16 8F 45 D1 E1 A4 94 63 31 4D BE 61 B2 14 93 0A 66 E2 B1 8F 8B 57 99 A3 C1 5B C1 25 0C 17 D9 AF 8B 43 1C 28 DA E9 8C F1 BF 50 DC 85 33 2E 5B 42 93 78 4C 0E 62 92 C7 4C 42 78 A2 3C 96 12 DB 63 73 B8 9D 01 67 35 EC 7D 40 17 3F DA 51 EC 43 67 CC 14 8F 62 2D 14 73 2F A3 89 0B 26 D7 31 C9 62 26 E3 0F 72 71 2E 73 12 F0 3D 70 76 C3 F7 C0 54 9C 46 C5 2F 88 D9 E6 D2 19 D7 A2 D8 62 39 4D 52 62 F2 06 93 DC 66 B2 E3 10 17 C7 AF 20 CE 00 8E F9 EF 17 5E F1 D6 C5 6C 54 4C 44 67 7C 4E 4F A6 13 8A B5 57 D2 C4 0D 93 44 23 7C 1D 69 CC 64 8D 0F 17 93 AE 22 76 07 BB 82 53 1A EE E1 AB 8B 7E 4E 28 3E A6 33 FA 50 B1 1B 8A 77 79 92 1B 93 3C 98 38 9B 49 21 3F 2E AE 5B 4D 5C 00 5C 06 EC 30 1C 07 A6 62 79 2A 7A D0 19 77 52 71 3A 8A BD D6 D0 A4 28 26 B5 31 B1 99 C9 A1 C3 5C 2C B2 96 B8 14 B8 35 38 6E FB 5F 9E 7A 44 17 BD 6C 28 B6 A5 A2 3F 15 67 A0 F8 9D 27 E5 31 E9 81 49 B4 99 34 3A CA C5 93 EB 88 AB 80 87 83 A3 0C A7 3D A6 8B CD A8 E8 49 C5 FE 54 DC 83 E2 8C F5 34 A9 85 C9 74 4C BE 9A C9 1B 9E A8 46 1B 88 EB 83 97 82 C3 0C AF 3E AE 8B C1 09 50 EC 44 C5 DE 54 DC 89 62 BA 8D 34 69 82 C9 56 4C DE 99 49 FF 13 5C 7C CC DC 0A EC 07 0E 31 5C EA A4 2E 76 A1 E2 36 2A 36 C1 35 77 5A 8F 62 CD 4D 34 69 47 57 18 93 27 66 B2 80 27 2A D1 66 E2 2E E0 BB E0 60 C3 5D 4E E9 62 3B 85 62 2B 2A 5E 57 28 E6 C5 A7 F0 06 4F 7A 63 F2 09 93 C7 66 92 EF 34 17 57 6E 21 1E 02 76 1E E9 EB 78 69 38 02 4C C5 90 5F 4A 25 F8 4C B7 E7 12 DD F0 36 76 A5 BA 6E A5 C9 18 4C B2 61 F2 C2 4C CE 9D E1 E2 45 E6 09 E0 82 E0 67 86 33 9F D5 C5 A7 31 28 DA E8 73 BD 97 DE C7 D2 28 CE DF 46 93 99 98 D4 C4 E4 91 99 BC E2 89 8A 64 9E 0B 6E 0A 0E 36 5C F7 9C 2E B6 FF 89 E2 01 2A CE A5 62 2A 14 DB 6E A7 C9 42 4C 3A FE 37 F1 E3 89 CA BC 83 78 25 78 E8 7F BF B0 DF 79 5D BC FC 1D C5 D4 54 1C 46 45 57 14 5F F1 64 33 26 B3 31 B9 6B 26 15 2F 70 71 EF 4E 62 2F F0 26 F0 75 C3 F6 8B BA 38 E6 0B 8A 45 A9 78 8A 8A E9 50 1C BE 8B 26 7E 98 1C C5 24 C8 4C 82 78 A2 2A ED 26 3E 0B BE 03 0E 30 BC FE 92 2E 7E 0B 47 B1 1E 15 23 E3 51 6C 85 A2 7D 0F 4D 82 30 09 C7 E4 E2 DF 49 C6 16 FE 5C EC C7 7C 0B 1C 07 F6 37 7C 06 4C C5 83 61 28 46 50 31 96 9E F5 0B 14 4B 78 D1 E4 09 26 6E A3 7C 1D E7 CD 64 71 00 17 7F 30 BF 03 57 00 1F 33 5C E7 B2 2E 76 A0 33 F6 B4 A1 18 44 67 CC E2 50 AA D3 5E 9A 84 63 D2 10 93 A3 66 E2 C3 13 95 6B 1F 71 0C 78 00 F8 B0 E1 19 57 74 31 20 02 C5 DB 74 C6 7C 74 C3 07 A2 F8 91 27 2E BF 72 B8 2D F8 6F 52 21 90 8B CD F7 13 A7 00 6F 06 FB 1A DE 09 A6 E2 F0 48 14 BD A9 F8 83 9E 4C 71 67 A5 5C 0F D0 24 0B 26 81 98 F8 98 C9 D8 20 2E 86 30 17 06 7F 07 7B 19 2E 72 55 17 7D BE A2 B8 85 8A 15 E8 55 BF 44 71 F7 41 9A 54 C2 C4 7D B4 AF 63 87 99 C4 F3 44 0D 39 44 DC 08 DC 18 BC CE 70 C0 35 5D 3C 44 F7 31 C8 86 E2 21 2A 76 49 A8 54 79 6F 9A 78 60 32 1E 93 B5 66 E2 79 9D 8B CA 87 78 00 78 2F 78 8D E1 EE 37 74 71 32 7D 66 C2 A8 B8 8A 5E 75 5A 17 A5 02 78 32 01 93 67 98 2C 37 93 F4 37 B9 E8 E9 4B BC 00 9C 7A 8C AF 63 A9 E1 50 30 15 3D E9 73 1D 4A C5 59 74 7B 66 A1 18 C5 93 E5 98 14 C2 64 89 99 B4 B9 C5 C5 93 7E C4 DB C0 9D FE 2D BA 26 BE AD 8B D5 7E A1 18 E3 84 E2 F3 9F 28 6E 46 71 FA 61 9A F8 60 32 1B 93 95 66 F2 88 27 AA D1 11 E2 B3 E0 43 E0 D5 86 B7 DE D1 C5 D2 F1 28 4E A7 E2 06 2A F6 C6 FB 98 FE 28 4D 02 31 B9 8B C9 42 33 19 70 97 8B 4F 98 EF 80 23 C1 9E 86 AB DC D3 C5 8A F4 37 BC 19 15 F7 FF 40 B1 3F EE 63 8D 63 34 09 C6 24 0E 93 45 66 B2 92 27 CA E5 38 F1 53 70 BA B1 78 D6 86 BB DE D7 C5 85 36 14 6B DB 51 AC 1F 85 E2 60 7C 57 FA 04 4D DE 60 52 14 93 F9 66 32 2F 98 8B B1 CC EF C1 95 C0 13 0D B7 7A A0 8B 65 ED 28 2E A5 27 B3 30 FA CF FF 3D 17 4E D2 24 0C 93 BA 98 8C 34 93 3C 0F B9 38 EF 14 71 04 B8 31 78 82 E1 87 60 2A E6 A7 E2 24 2A 26 A1 57 7D 16 77 BD D5 69 9A 44 62 D2 1C 93 31 66 B2 E7 11 17 DD CE FC CB FD 0C 0F 7F AC 8B 69 A9 B8 86 8A CF 63 50 CC AB 94 7A F9 DF A4 AF 99 54 7A C2 45 AF B3 32 27 7F AA 8B AE 54 DC 41 45 15 8B A2 C2 D7 88 73 F2 E4 1C 4F 54 C5 F3 32 2F 79 C6 6C BF 20 B3 C7 73 E6 AB 16 9C EB 05 F3 92 8B 32 7F D7 EC 71 49 E6 DD 21 CC E7 2C D8 F5 25 F3 4C 7F 99 DF 6B 6E 16 20 F3 FA 57 CC 19 2E CB 3C F8 35 F3 73 0B 2E F7 86 79 C7 15 99 55 28 F3 90 40 99 6F 69 2E 17 24 F3 8C B7 CC EA AA CC 6D DF 31 FB 5B B0 FB 7B E6 85 D7 64 7E AB B9 ED 75 99 8F 7D 60 CE 76 43 E6 41 1F 99 DF 5A 70 D5 4F CC FB 6F CA EC 12 C6 3C EA 96 CC 37 34 57 BD 2D F3 E6 70 E6 AD 16 1C AB B9 FF 1D 99 2F 44 30 97 BC 2B F3 F2 CF CC D1 16 DC 20 92 B9 DB 3D 99 8F 68 CE 77 5F E6 39 5F 98 C3 2D B8 CA 57 E6 C3 C1 32 A7 F8 C6 3C F9 81 CC C1 9A EB 3E 94 79 E3 77 E6 14 8F 64 1E 1A C5 7C DF 82 F3 FC 60 DE F4 58 E6 28 CD BD 9F C8 7C E6 27 73 D1 A7 32 CF 8A 66 8E B2 E0 0E 31 CC A7 9F C9 9C 3C 96 79 E6 73 99 9F 69 FE 64 C1 4D 7E 31 FB BE 10 39 A3 2D 8E 79 6C 88 CC B7 35 D7 7C 29 F3 DA 78 E6 24 AF 64 EE A1 5A 10 DF B6 E0 32 09 98 CB BD 96 D9 53 B3 7A 23 73 3B 1B B3 BF 05 17 70 62 F6 0C 95 F9 A9 E6 B6 6F 65 DE 6F 67 CE F6 4E E6 D1 0E E6 50 0B AE E6 CC DC E8 BD CC 5B 34 A7 FD 20 F3 80 84 CC 4F 2C B8 94 0B F3 D6 8F 32 3B 27 62 EE FF 49 E6 63 9A 4B 87 C9 3C 37 31 73 8C 05 B7 4A C2 7C 3E 5C E6 CC 49 99 E7 46 C8 1C A6 39 C2 82 EB 25 63 3E F2 59 E6 94 C9 99 27 45 CA 1C A2 B9 EE 17 99 97 A7 60 F6 B2 60 7B 4A E6 61 5F 65 BE A7 B9 D2 37 99 E7 A4 62 B6 7F 97 B9 63 6A E6 62 51 32 4F 4C C3 1C 65 C1 4D D3 32 7B FC 90 F9 94 E6 DC 3F 65 1E 9A 8E F9 83 05 D7 4C CF EC 1D 2D 73 D2 0C CC E3 62 64 BE A3 79 67 AC CC 2A 23 F3 E0 5F 32 07 68 2E 1B 27 F3 EA 4C CC F1 16 DC C4 8D B9 67 BC CC 27 34 17 54 25 45 5E 90 99 D9 D3 82 DF 6A 6E 97 40 E6 03 59 98 DD 6D 32 4F C9 CA 1C 6A C1 65 B2 31 1F 70 92 39 A1 3B F3 28 BB CC 37 34 57 71 C8 BC 32 3B B3 8B B3 CC FD 72 30 5F B7 E0 AC 39 99 57 24 94 39 5C 73 37 17 99 8F E4 62 CE 9B 48 E6 C9 B9 99 C3 2D B8 45 1E E6 C3 89 65 76 CE CB 3C 39 89 CC F7 35 EF 49 2A 73 74 3E E6 A1 C9 64 0E CC CF 5C 31 B9 CC 4B 0B 30 DB 53 C8 EC 51 90 39 D0 82 8B 14 62 5E 9A 52 E6 10 CD 1D 53 C9 EC 5D 98 39 57 6A 99 C7 17 61 FE 60 C1 B5 8A 32 7B A7 91 39 7D 31 E6 B1 69 65 BE A2 B9 46 3A 99 D7 14 67 4E 9A 5E E6 1E 25 98 6F 5B 70 A1 92 CC E5 32 C8 BC 50 73 BC 05 B7 2B C5 EC EF 2A B3 7B 69 E6 C5 19 65 8E D4 DC 26 93 CC DB CB 30 BB BB C9 3C AA 2C 73 A3 CC 32 AF 2E C7 7C D0 82 5D CA 33 8F CA 22 F3 43 CD 55 B3 CA BC A0 02 B3 73 36 99 BB 54 64 EE 6F C1 D7 34 97 74 97 79 4A 25 E6 95 16 1C A1 B9 4B 76 99 CF 55 66 0E B0 E0 CC 55 98 E7 E6 90 F9 95 E6 96 39 65 F6 AB CA 9C 29 97 CC FD AA 31 87 58 70 C5 EA CC 75 73 CB BC 5B 73 8A 3C 32 77 AE C1 7C DF 82 8B D6 64 FE 0D 50 4B 03 04 14 03 00 00 08 00 55 8B 41 54 87 46 38 E0 7E 00 00 00 03 01 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 54 4C 47 30 30 30 30 31 2E 58 4D 4C B3 B1 AF C8 CD 51 28 4B 2D 2A CE CC CF B3 55 32 D4 33 50 52 48 CD 4B CE 4F C9 CC 4B B7 55 0A 0D 71 D3 B5 50 B2 B7 E3 B2 09 F1 F4 55 70 B4 55 52 52 70 B1 55 32 51 B2 E3 52 00 02 9B 80 10 3F 88 A0 13 88 70 06 4B 83 08 57 10 E1 06 22 DC 41 84 07 88 F0 04 12 FA 50 7D 2E 3E 61 20 7D 06 06 96 06 08 BD 2E AE 21 BA 86 58 94 18 12 56 62 44 48 89 A1 85 0B 16 25 36 FA 40 5F D9 71 01 00 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 4A 30 CE 23 0F 01 00 00 BD 02 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 54 53 4B 30 30 30 30 30 2E 58 4D 4C 8D 92 51 4F 83 30 10 C7 DF F7 29 2E F7 2C A3 85 22 B0 D0 2D 0C EC 62 9C 66 89 68 7C 23 CB 6C 90 C8 C0 B0 85 F8 F1 BD 32 1F A6 64 19 F7 72 4D EF 77 FF 7F 7B B9 68 F1 BD AF A0 D3 ED A1 6C 6A 89 7C CA 10 74 BD 6B DE CB BA 90 F8 92 29 2B C0 C5 7C 12 BD A9 64 3E 01 8A 28 7B 7E 80 58 22 25 8B 23 2C E9 B4 3D 7C 42 08 F1 57 7B 03 0E 73 38 70 E1 91 CA 9D C4 8D 4A 43 84 95 44 17 61 E3 B8 3C AF 9A A2 20 E1 FC 58 EE 75 5E D6 47 DD 76 DB 8A 5C 19 FB 05 3A FD 51 EE 2A 2D 31 7D 4D 48 FE 64 79 B2 BD 7F 34 B6 C6 C0 62 C2 62 61 C6 C5 CC 13 33 26 A6 A1 EF 99 87 0C 6B 42 4C 39 F3 11 52 89 02 ED 33 B1 34 7E 32 62 EC 5F 90 CA F0 F2 6F E3 3A 33 8D A9 52 AA 87 5D 3E 2C 1B 89 E0 B6 2F 07 FD EF 2F 31 FE 08 26 B8 CE 84 F1 08 66 79 9D 11 EE 08 46 8C 60 BC 11 CC E5 F9 64 EB 95 61 28 31 0A 8E 90 9C 11 91 4D 7B 47 EB 68 F7 FB F8 03 50 4B 03 04 14 03 00 00 08 00 A2 93 89 52 63 5E 45 03 7B 00 00 00 BE 00 00 00 15 00 00 00 54 41 53 4B 44 41 54 41 2F 56 50 4E 30 30 30 30 30 2E 58 4D 4C B3 B1 AF C8 CD 51 28 4B 2D 2A CE CC CF B3 55 32 D4 33 50 52 48 CD 4B CE 4F C9 CC 4B B7 55 0A 0D 71 D3 B5 50 B2 B7 E3 B2 89 70 73 B6 E3 52 00 02 9B B0 00 3F 05 47 5B 25 20 65 A8 A4 E0 64 AB 04 D4 E0 0C 24 F5 0C 0C 0D 10 00 28 E8 62 AB 64 A4 A4 E0 6A AB 94 9D AE 9F 91 A8 A4 8F A1 5D 17 4D BF 81 21 2E FD 4A 0A 01 46 C6 86 F1 29 29 99 B6 4A E6 26 20 A3 6C F4 C1 0E 02 00 50 4B 01 02 3F 03 14 03 00 00 00 00 55 8B 41 54 00 00 00 00 00 00 00 00 00 00 00 00 09 00 00 00 00 00 00 00 00 00 10 80 ED 41 00 00 00 00 54 41 53 4B 44 41 54 41 2F 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 E5 EC 8F 56 5C 00 00 00 61 00 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 27 00 00 00 54 41 53 4B 44 41 54 41 2F 41 46 45 30 30 30 30 30 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 53 89 EC A1 5C 00 00 00 62 00 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 B6 00 00 00 54 41 53 4B 44 41 54 41 2F 43 43 47 30 30 30 30 30 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 F9 D4 87 DD 73 00 00 00 7C 00 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 45 01 00 00 54 41 53 4B 44 41 54 41 2F 43 43 54 30 30 30 30 30 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 9D 09 85 A0 87 00 00 00 F5 00 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 EB 01 00 00 54 41 53 4B 44 41 54 41 2F 43 54 50 30 30 30 30 30 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 59 51 B8 68 56 00 00 00 5B 00 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 A5 02 00 00 54 41 53 4B 44 41 54 41 2F 43 54 52 30 30 30 30 30 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 E9 C5 5D 21 96 01 00 00 00 06 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 2E 03 00 00 54 41 53 4B 44 41 54 41 2F 44 56 43 30 30 30 30 30 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 10 5B 83 00 5F 00 00 00 64 00 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 F7 04 00 00 54 41 53 4B 44 41 54 41 2F 46 52 4D 30 30 30 30 30 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 C7 6A DA A8 73 05 00 00 2B 0D 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 89 05 00 00 54 41 53 4B 44 41 54 41 2F 4C 49 4E 4B 4C 49 53 54 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 60 40 D2 02 93 00 00 00 ED 00 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 2F 0B 00 00 54 41 53 4B 44 41 54 41 2F 50 44 54 30 30 30 30 30 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 7C 77 79 A0 43 08 00 00 98 29 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 F5 0B 00 00 54 41 53 4B 44 41 54 41 2F 50 46 44 30 30 30 30 30 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 1B E0 D3 2F A5 00 00 00 8C 01 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 6B 14 00 00 54 41 53 4B 44 41 54 41 2F 50 46 44 30 30 30 30 31 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 A5 48 7A 1B 6F 00 00 00 74 00 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 43 15 00 00 54 41 53 4B 44 41 54 41 2F 50 47 50 30 30 30 30 30 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 8B D7 7A 28 0D 01 00 00 C1 02 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 E5 15 00 00 54 41 53 4B 44 41 54 41 2F 54 41 53 4B 44 41 54 41 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 67 D5 A5 32 E3 08 00 00 CD 1B 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 25 17 00 00 54 41 53 4B 44 41 54 41 2F 54 4C 47 30 30 30 30 31 2E 42 49 4E 50 4B 01 02 3F 03 14 03 00 00 08 00 55 8B 41 54 87 46 38 E0 7E 00 00 00 03 01 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 3B 20 00 00 54 41 53 4B 44 41 54 41 2F 54 4C 47 30 30 30 30 31 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 4A 30 CE 23 0F 01 00 00 BD 02 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 EC 20 00 00 54 41 53 4B 44 41 54 41 2F 54 53 4B 30 30 30 30 30 2E 58 4D 4C 50 4B 01 02 3F 03 14 03 00 00 08 00 A2 93 89 52 63 5E 45 03 7B 00 00 00 BE 00 00 00 15 00 00 00 00 00 00 00 00 00 20 80 A4 81 2E 22 00 00 54 41 53 4B 44 41 54 41 2F 56 50 4E 30 30 30 30 30 2E 58 4D 4C 50 4B 05 06 00 00 00 00 12 00 12 00 AA 04 00 00 DC 22 00 00 00 00 00''';
