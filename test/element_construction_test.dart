// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Allow catching all errors and exceptions
// ignore_for_file: avoid_catches_without_on_clauses

import 'dart:typed_data';

import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('Generate EmptyIso11783Element', () {
    test(
      'from XmlElement with empty name string',
      () => expect(
        Iso11783Element.fromXmlElement(
          XmlElement(XmlName.fromString('')),
        ).runtimeType,
        EmptyIso11783Element,
      ),
    );
    test(
      'from XmlElement with name random string',
      () => expect(
        Iso11783Element.fromXmlElement(
          XmlElement(XmlName.fromString('')),
        ).runtimeType,
        EmptyIso11783Element,
      ),
    );
  });
  test(
    '''Get TypeError from XmlElement with name BSN with no attributes due to null check''',
    () {
      Object? error;
      try {
        Iso11783Element.fromXmlElement(
          XmlElement(XmlName.fromString('BSN')),
        );
      } catch (e) {
        error = e;
      }
      expect(
        error,
        const TypeMatcher<TypeError>(),
      );
    },
  );

  group('AllocationStamp', () {
    test(
      'too many position children',
      () {
        Object? error;
        try {
          AllocationStamp(
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
          );
        } catch (e) {
          error = e;
        }
        expect(
          error,
          isArgumentError,
        );
      },
    );
  });
  group(
    'ColourLegend',
    () => test('empty ranges list', () {
      Object? error;
      try {
        ColourLegend(ranges: const [], id: 'CLD1');
      } catch (e) {
        error = e;
      }
      expect(error, isArgumentError);
    }),
  );
  group(
    'CommentAllocation',
    () => test('too long freeCommentText', () {
      Object? error;
      try {
        CommentAllocation(
          freeCommentText: '''Too long free comment text is here''',
        );
      } catch (e) {
        error = e;
      }
      expect(error, isArgumentError);
    }),
  );

  group('Customer', () {
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
        Object? error;
        try {
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

          Customer.fromXmlElement(element);
        } catch (e) {
          error = e;
        }
        expect(error, isArgumentError);
      });
    }
  });

  group('ExternalFileContents', () {
    test('.fromXmlElement', () {
      Object? error;
      try {
        ExternalFileContents.fromXmlElement(XmlElement(XmlName('XFC')));
      } catch (e) {
        error = e;
      }
      expect(error, null);
    });
    test('.fromXmlElement with invalid base station child element', () {
      Object? error;
      try {
        ExternalFileContents.fromXmlElement(
          XmlElement(XmlName('XFC'), [], [XmlElement(XmlName('BSN'))]),
        );
      } catch (e) {
        error = e;
      }
      expect(error, const TypeMatcher<TypeError>());
    });

    test('.document with base station child element', () {
      expect(
        ExternalFileContents(
          baseStations: [
            BaseStation(
              id: 'BSN1',
              designator: 'BaseStation',
              north: 60,
              east: 10,
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
              XmlAttribute(XmlName('C'), '60.0'),
              XmlAttribute(XmlName('D'), '10.0'),
              XmlAttribute(XmlName('E'), '95'),
            ]),
          ]),
        ]).toXmlString(pretty: true),
      );
    });
  });

  group('ExternalFileReference', () {
    test('with valid filename', () {
      Object? error;
      try {
        ExternalFileReference(filename: 'CTR00001');
      } catch (e) {
        error = e;
      }
      expect(error, null);
    });
    test('with invalid filename', () {
      Object? error;
      try {
        ExternalFileReference(filename: 'CTs001');
      } catch (e) {
        error = e;
      }
      expect(error, isArgumentError);
    });
    test(
      '.fromXmlElement',
      () => expect(
        ExternalFileReference.fromXmlElement(
          XmlElement(XmlName('XFR'), [
            XmlAttribute(XmlName('A'), 'DVC00001'),
          ]),
        ).elementType,
        Iso11783ElementType.device,
      ),
    );
  });

  group('Farm', () {
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
        Object? error;
        try {
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

          Farm.fromXmlElement(element);
        } catch (e) {
          error = e;
        }
        expect(error, isArgumentError);
      });
    }
  });

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

      data.setInt64(
        offset,
        (63.58 * 1e16).round(),
        Endian.little,
      );
      offset += 8;

      data.setInt64(
        offset,
        (11.21 * 1e16).round(),
        Endian.little,
      );
      offset += 8;

      data.setInt32(offset, (96 * 1e3).round(), Endian.little);
      offset += 4;

      data.setUint8(offset, 0x5);
      offset++;

      data.setInt64(
        offset,
        (63.5 * 1e16).round(),
        Endian.little,
      );
      offset += 8;

      data.setInt64(
        offset,
        (11.2 * 1e16).round(),
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

  group(
    'LineString',
    () => test('empty .points', () {
      Object? error;
      try {
        LineString(points: const [], type: LineStringType.samplingRoute);
      } catch (e) {
        error = e;
      }
      expect(error, isArgumentError);
    }),
  );

  group('Grid', () {
    test('.fromXmlElement', () {
      Object? error;
      try {
        Grid.fromXmlElement(
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
              XmlAttribute(XmlName.fromString('I'), '1'),
              XmlAttribute(XmlName.fromString('J'), '101'),
            ],
          ),
        );
      } catch (e) {
        error = e;
      }
      expect(error, null);
    });
  });

  group('GuidanceAllocation', () {
    test('empty allocationStamps', () {
      Object? error;
      try {
        GuidanceAllocation(
          allocationStamps: const [],
          groupIdRef: 'GGP00001',
        );
      } catch (e) {
        error = e;
      }
      expect(error, isArgumentError);
    });
  });

  group('GuidancePattern', () {
    test('empty linestrings', () {
      Object? error;
      try {
        GuidancePattern(
          lineStrings: const [],
          id: 'GPN1',
          type: GuidancePatternType.ab,
        );
      } catch (e) {
        error = e;
      }
      expect(error, isArgumentError);
    });
  });
  group('Link', () {
    test('.fromXmlElement', () {
      Object? error;
      try {
        Link.fromXmlElement(
          XmlElement(
            XmlName.fromString('LNK'),
            [
              XmlAttribute(XmlName.fromString('A'), 'CCG1'),
              XmlAttribute(XmlName.fromString('B'), 'A value'),
              XmlAttribute(XmlName.fromString('C'), 'Some link designator'),
            ],
          ),
        );
      } catch (e) {
        error = e;
      }
      expect(error, null);
    });
  });
  group('LinkGroup', () {
    test('.fromXmlElement', () {
      Object? error;
      try {
        LinkGroup.fromXmlElement(
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
        );
      } catch (e) {
        error = e;
      }
      expect(error, null);
    });
  });

  group('Iso11783LinkList', () {
    test(
      '.fromXmlElement',
      () => expect(
        Iso11783LinkList.fromXmlElement(
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
        ).toXmlDocument().toXmlString(pretty: true),
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
      ),
    );
  });

  group('ProcessDataVariable', () {
    test('.fromXmlElement', () {
      Object? error;
      try {
        ProcessDataVariable.fromXmlElement(
          XmlElement(
            XmlName.fromString('PDV'),
            [
              XmlAttribute(XmlName.fromString('A'), 'FE5A'),
              XmlAttribute(XmlName.fromString('B'), '123'),
              XmlAttribute(XmlName.fromString('C'), 'PDT1'),
              XmlAttribute(XmlName.fromString('D'), 'DET4'),
              XmlAttribute(XmlName.fromString('E'), 'VPN2'),
              XmlAttribute(XmlName.fromString('F'), '-100'),
              XmlAttribute(XmlName.fromString('G'), '100'),
            ],
          ),
        );
      } catch (e) {
        error = e;
      }
      expect(error, null);
    });
  });

  group('Product', () {
    test('.densityVolumePerCount outside range', () {
      Object? error;
      try {
        Product(
          id: 'PDT1',
          designator: 'Sprayer product',
          densityVolumePerCount: -1,
        );
      } catch (e) {
        error = e;
      }
      expect(error, isArgumentError);
    });
  });

  group('ProductAllocation', () {
    test('.productSubTypeIdRef mismatch', () {
      Object? error;
      try {
        ProductAllocation(
          productIdRef: 'PDT1',
          productSubTypeIdRef: 'PDTa',
        );
      } catch (e) {
        error = e;
      }
      expect(error, isArgumentError);
    });
  });

  group('TaskControllerCapabilites', () {
    test('.fromXmlElement', () {
      Object? error;
      try {
        final tcc = TaskControllerCapabilities.fromXmlElement(
          XmlElement(
            XmlName.fromString('TCC'),
            [
              XmlAttribute(XmlName.fromString('A'), 'A0008F000F300DDD'),
              XmlAttribute(XmlName.fromString('B'), 'isoxml_dart'),
              XmlAttribute(XmlName.fromString('C'), '4'),
              XmlAttribute(XmlName.fromString('D'), '63'),
              XmlAttribute(XmlName.fromString('E'), '1'),
              XmlAttribute(XmlName.fromString('F'), '2'),
              XmlAttribute(XmlName.fromString('G'), '3'),
            ],
          ),
        );
        expect(tcc.capabilities, ProvidedCapability.values);
      } catch (e) {
        error = e;
      }
      expect(error, null);
    });
  });
  group('TimeLog', () {
    test('.fromXmlElement', () {
      Object? error;
      try {
        TimeLog.fromXmlElement(
          XmlElement(
            XmlName.fromString('TLG'),
            [
              XmlAttribute(XmlName.fromString('A'), 'TLG00010'),
              XmlAttribute(XmlName.fromString('B'), '123'),
              XmlAttribute(XmlName.fromString('C'), '1'),
            ],
          ),
        );
      } catch (e) {
        error = e;
      }
      expect(error, null);
    });
  });

  group('TreatmentZone', () {
    test('.fromXmlElement', () {
      Object? error;
      try {
        TreatmentZone.fromXmlElement(
          XmlElement(
            XmlName.fromString('TZN'),
            [
              XmlAttribute(XmlName.fromString('A'), '102'),
              XmlAttribute(XmlName.fromString('B'), 'Zone designator'),
              XmlAttribute(XmlName.fromString('C'), '30'),
            ],
          ),
        );
      } catch (e) {
        error = e;
      }
      expect(error, null);
    });
  });

  group('Worker', () {
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
        Object? error;
        try {
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

          Worker.fromXmlElement(element);
        } catch (e) {
          error = e;
        }
        expect(error, isArgumentError);
      });
    }
  });
}
