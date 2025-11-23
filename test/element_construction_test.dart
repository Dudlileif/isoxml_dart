// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Allow catching all errors and exceptions
// ignore_for_file: avoid_catches_without_on_clauses

import 'package:isoxml_dart/isoxml_dart.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
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

  group('BaseStation', () {
    test(
      '''Get FormatException from XmlElement with name BSN with no attributes due to null check''',
      () {
        Object? error;
        try {
          Iso11783Element.fromXmlElement(
            XmlElement(
              XmlName.fromString('BSN'),
            ),
          );
        } catch (e) {
          error = e;
        }
        expect(
          error,
          isA<FormatException>(),
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

          Iso11783Element.fromXmlElement(element);
        } catch (e) {
          error = e;
        }
        expect(error, isArgumentError);
      });
    }
  });

  group('ExternalFileContents', () {
    test('._fromXmlElement', () {
      late final Iso11783Element element;
      Object? error;
      try {
        element = Iso11783Element.fromXmlElement(XmlElement(XmlName('XFC')));
      } catch (e) {
        error = e;
      }
      expect(error, null);
      expect(element, isA<ExternalFileContents>());
    });
    test('._fromXmlElement with invalid base station child element', () {
      Object? error;
      try {
        Iso11783Element.fromXmlElement(
          XmlElement(XmlName('XFC'), [], [
            XmlElement(XmlName('BSN')),
          ]),
        );
      } catch (e) {
        error = e;
      }
      expect(error, isA<FormatException>());
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
      '._fromXmlElement',
      () => expect(
        Iso11783Element.fromXmlElement(
              XmlElement(XmlName('XFR'), [
                XmlAttribute(XmlName('A'), 'DVC00001'),
              ]),
            )
            as ExternalFileReference,
        isA<ExternalFileReference>().having(
          (e) => e.filename,
          'Has correct filename',
          'DVC00001',
        ),
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

          Iso11783Element.fromXmlElement(element);
        } catch (e) {
          error = e;
        }
        expect(error, isArgumentError);
      });
    }
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
    test('._fromXmlElement', () {
      Object? error;
      try {
        Iso11783Element.fromXmlElement(
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
    test('._fromXmlElement', () {
      Object? error;
      try {
        Iso11783Element.fromXmlElement(
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
    test('._fromXmlElement', () {
      Iso11783Element? linkGroup;
      Object? error;
      try {
        linkGroup = Iso11783Element.fromXmlElement(
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
      expect(
        linkGroup,
        isA<LinkGroup>()
            .having(
              (element) => element.id,
              'Correct id',
              equals('LGP1'),
            )
            .having(
              (element) => element.type,
              'Correct type',
              equals(LinkGroupType.uuids),
            )
            .having(
              (element) => element.manufacturerGLN,
              'Correct GLN',
              equals('Some manufacturer GLN'),
            )
            .having(
              (element) => element.namespace,
              'Correct namespace',
              equals('A namespace'),
            )
            .having(
              (element) => element.designator,
              'Correct designator',
              equals('Some designator'),
            ),
      );
    });
  });

  group('Iso11783LinkList', () {
    test(
      '._fromXmlElement',
      () => expect(
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
      ),
    );
  });

  group('ProcessDataVariable', () {
    test('._fromXmlElement', () {
      Object? error;
      try {
        Iso11783Element.fromXmlElement(
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
    test('._fromXmlElement', () {
      Object? error;
      try {
        final tcc = Iso11783Element.fromXmlElement(
          XmlElement(
            XmlName.fromString('TCC'),
            [
              XmlAttribute(XmlName.fromString('A'), 'A0008F000F300DDD'),
              XmlAttribute(XmlName.fromString('B'), 'isoxml_dart'),
              XmlAttribute(XmlName.fromString('C'), '4'),

              // Provided capabilites
              XmlAttribute(XmlName.fromString('D'), '63'),
              XmlAttribute(XmlName.fromString('E'), '1'),
              XmlAttribute(XmlName.fromString('F'), '2'),
              XmlAttribute(XmlName.fromString('G'), '3'),
            ],
          ),
        );
        expect(
          (tcc as TaskControllerCapabilities).providedCapabilities,
          63,
        );
      } catch (e) {
        error = e;
      }
      expect(error, null);
    });
  });
  group('TimeLog', () {
    test('._fromXmlElement', () {
      Object? error;
      try {
        Iso11783Element.fromXmlElement(
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
    test('._fromXmlElement', () {
      Object? error;
      try {
        Iso11783Element.fromXmlElement(
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

          Iso11783Element.fromXmlElement(element);
        } catch (e) {
          error = e;
        }
        expect(error, isArgumentError);
      });
    }
  });
}
