// Copyright 2025 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:isoxml_dart/iso_11783_xml_elements.dart';
import 'package:test/test.dart';
import 'package:xml/xml.dart';

void main() {
  group('parseDateTime', () {
    test('Correctly parses DateTime', () {
      final element =
          Iso11783Element.fromXmlElement(
                XmlElement(
                  XmlName(Iso11783ElementType.allocationStamp.xmlTag),
                  [
                    XmlAttribute(XmlName('A'), '2025-12-13'),
                    XmlAttribute(XmlName('D'), '1'),
                  ],
                ),
              )
              as AllocationStamp;
      expect(element.start, DateTime(2025, 12, 13));
    });
    test('Throws when attribute is not a String', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.allocationStamp.xmlTag), [
            XmlAttribute(XmlName('D'), '1'),
          ]),
        ),
        throwsFormatException,
      );
    });
  });

  group('parseDouble', () {
    test('Correctly parses double', () {
      final element =
          Iso11783Element.fromXmlElement(
                XmlElement(XmlName(Iso11783ElementType.baseStation.xmlTag), [
                  XmlAttribute(XmlName('A'), 'BSN1'),
                  XmlAttribute(XmlName('B'), 'test'),
                  XmlAttribute(XmlName('C'), '20.5'),
                  XmlAttribute(XmlName('D'), '60.4'),
                  XmlAttribute(XmlName('E'), '100'),
                ]),
              )
              as BaseStation;
      expect(element.north, 20.5);
    });
    test('Throws when attribute is not a String', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.baseStation.xmlTag), [
            XmlAttribute(XmlName('A'), 'BSN1'),
            XmlAttribute(XmlName('B'), 'test'),
            XmlAttribute(XmlName('D'), '60.4'),
            XmlAttribute(XmlName('E'), '100'),
          ]),
        ),
        throwsFormatException,
      );
    });
  });

  group('parseInt', () {
    test('Correctly parses int', () {
      final element =
          Iso11783Element.fromXmlElement(
                XmlElement(XmlName(Iso11783ElementType.baseStation.xmlTag), [
                  XmlAttribute(XmlName('A'), 'BSN1'),
                  XmlAttribute(XmlName('B'), 'test'),
                  XmlAttribute(XmlName('C'), '20.5'),
                  XmlAttribute(XmlName('D'), '60.4'),
                  XmlAttribute(XmlName('E'), '100'),
                ]),
              )
              as BaseStation;
      expect(element.up, 100);
    });
    test('Throws when attribute is not a String', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.baseStation.xmlTag), [
            XmlAttribute(XmlName('A'), 'BSN1'),
            XmlAttribute(XmlName('B'), 'test'),
            XmlAttribute(XmlName('C'), '20.5'),
            XmlAttribute(XmlName('D'), '60.4'),
          ]),
        ),
        throwsFormatException,
      );
    });
  });

  group('parseString', () {
    test('Correctly parses String', () {
      final element =
          Iso11783Element.fromXmlElement(
                XmlElement(XmlName(Iso11783ElementType.baseStation.xmlTag), [
                  XmlAttribute(XmlName('A'), 'BSN1'),
                  XmlAttribute(XmlName('B'), 'test'),
                  XmlAttribute(XmlName('C'), '20.5'),
                  XmlAttribute(XmlName('D'), '60.4'),
                  XmlAttribute(XmlName('E'), '100'),
                ]),
              )
              as BaseStation;
      expect(element.id, 'BSN1');
    });
    test('Throws when attribute is not a String', () {
      expect(
        () => Iso11783Element.fromXmlElement(
          XmlElement(XmlName(Iso11783ElementType.baseStation.xmlTag), [
            XmlAttribute(XmlName('B'), 'test'),
            XmlAttribute(XmlName('C'), '20.5'),
            XmlAttribute(XmlName('D'), '60.4'),
            XmlAttribute(XmlName('E'), '100'),
          ]),
        ),
        throwsFormatException,
      );
    });
  });

  group('tryParseDateTime', () {
    test('Correctly parses DateTime', () {
      final element =
          Iso11783Element.fromXmlElement(
                XmlElement(
                  XmlName(Iso11783ElementType.allocationStamp.xmlTag),
                  [
                    XmlAttribute(XmlName('A'), '2025-12-12'),
                    XmlAttribute(XmlName('B'), '2025-12-13'),
                    XmlAttribute(XmlName('D'), '1'),
                  ],
                ),
              )
              as AllocationStamp;
      expect(element.stop, DateTime(2025, 12, 13));
    });
    test('Returns null when attribute is not a String', () {
      final element =
          Iso11783Element.fromXmlElement(
                XmlElement(
                  XmlName(Iso11783ElementType.allocationStamp.xmlTag),
                  [
                    XmlAttribute(XmlName('A'), '2025-12-12'),
                    XmlAttribute(XmlName('D'), '1'),
                  ],
                ),
              )
              as AllocationStamp;
      expect(element.stop, isNull);
    });
  });

  group('tryParseDouble', () {
    test('Correctly parses double', () {
      final element =
          Iso11783Element.fromXmlElement(
                XmlElement(
                  XmlName(Iso11783ElementType.position.xmlTag),
                  [
                    XmlAttribute(XmlName('A'), '20.5'),
                    XmlAttribute(XmlName('B'), '50.2'),
                    XmlAttribute(XmlName('D'), '1'),
                    XmlAttribute(XmlName('E'), '0.59'),
                  ],
                ),
              )
              as Position;
      expect(element.pdop, 0.59);
    });
    test('Returns null when attribute is not a String', () {
      final element =
          Iso11783Element.fromXmlElement(
                XmlElement(
                  XmlName(Iso11783ElementType.position.xmlTag),
                  [
                    XmlAttribute(XmlName('A'), '20.5'),
                    XmlAttribute(XmlName('B'), '50.2'),
                    XmlAttribute(XmlName('D'), '1'),
                  ],
                ),
              )
              as Position;
      expect(element.pdop, isNull);
    });
  });

  group('tryParseInt', () {
    test('Correctly parses int', () {
      final element =
          Iso11783Element.fromXmlElement(
                XmlElement(
                  XmlName(Iso11783ElementType.allocationStamp.xmlTag),
                  [
                    XmlAttribute(XmlName('A'), '2025-12-12'),
                    XmlAttribute(XmlName('C'), '20'),
                    XmlAttribute(XmlName('D'), '1'),
                  ],
                ),
              )
              as AllocationStamp;
      expect(element.duration, 20);
    });
    test('Returns null when attribute is not a String', () {
      final element =
          Iso11783Element.fromXmlElement(
                XmlElement(
                  XmlName(Iso11783ElementType.allocationStamp.xmlTag),
                  [
                    XmlAttribute(XmlName('A'), '2025-12-12'),
                    XmlAttribute(XmlName('D'), '1'),
                  ],
                ),
              )
              as AllocationStamp;
      expect(element.duration, isNull);
    });
  });

  group('tryParseString', () {
    test('Correctly parses String', () {
      final element =
          Iso11783Element.fromXmlElement(
                XmlElement(
                  XmlName(Iso11783ElementType.cropType.xmlTag),
                  [
                    XmlAttribute(XmlName('A'), 'CTP1'),
                    XmlAttribute(XmlName('B'), 'Designator'),
                    XmlAttribute(XmlName('C'), 'PGP1'),
                  ],
                ),
              )
              as CropType;
      expect(element.productGroupIdRef, 'PGP1');
    });
    test('Returns null when attribute is not a String', () {
      final element =
          Iso11783Element.fromXmlElement(
                XmlElement(
                  XmlName(Iso11783ElementType.cropType.xmlTag),
                  [
                    XmlAttribute(XmlName('A'), 'CTP1'),
                    XmlAttribute(XmlName('B'), 'Designator'),
                  ],
                ),
              )
              as CropType;
      expect(element.productGroupIdRef, isNull);
    });
  });

  test('setDateTime', () {
    final element = AllocationStamp(
      start: DateTime(2024),
      type: AllocationStampType.planned,
    )..start = DateTime(2025, 12, 13);
    expect(
      element.xmlElement.attributes.first,
      isA<XmlAttribute>()
          .having(
            (attribute) => attribute.name.local,
            'Correct name',
            'A',
          )
          .having(
            (attribute) => attribute.value,
            'Correct value',
            DateTime(2025, 12, 13).toIso8601String(),
          ),
    );
  });

  group('setDateTimeNullable', () {
    test('With DateTime value', () {
      final element = AllocationStamp(
        start: DateTime(2024),
        type: AllocationStampType.planned,
      )..stop = DateTime(2025, 12, 13);
      expect(
        element.xmlElement.attributes[2],
        isA<XmlAttribute>()
            .having(
              (attribute) => attribute.name.local,
              'Correct name',
              'B',
            )
            .having(
              (attribute) => attribute.value,
              'Correct value',
              DateTime(2025, 12, 13).toIso8601String(),
            ),
      );
    });

    test(
      'With null value removes the attribute from the element',
      () {
        final element = AllocationStamp(
          start: DateTime(2024),
          stop: DateTime(2025),
          type: AllocationStampType.planned,
        )..stop = null;
        expect(
          element.xmlElement.attributes.any(
            (attribute) => attribute.name.local == 'B',
          ),
          isFalse,
        );
      },
    );
  });

  test('setDouble', () {
    final element = Position(
      north: 50.5,
      east: 20.5,
      status: PositionStatus.manualInput,
    )..north = 59.3;
    expect(
      element.xmlElement.attributes.first,
      isA<XmlAttribute>()
          .having(
            (attribute) => attribute.name.local,
            'Correct name',
            'A',
          )
          .having(
            (attribute) => attribute.value,
            'Correct value',
            '59.3',
          ),
    );
  });

  group('setDoubleNullable', () {
    test('With double value', () {
      final element = TimeLogHeaderPosition()..north = 59.5;
      expect(
        element.xmlElement.attributes.first,
        isA<XmlAttribute>()
            .having(
              (attribute) => attribute.name.local,
              'Correct name',
              'A',
            )
            .having(
              (attribute) => attribute.value,
              'Correct value',
              '59.5',
            ),
      );
    });

    test(
      'With null value removes the attribute from the element',
      () {
        final element = TimeLogHeaderPosition(
          north: 50.5,
        )..north = null;

        expect(element.xmlElement.attributes, isEmpty);
      },
    );
    test(
      '''With null value and `setNullToEmptyString` sets attribute value to empty string''',
      () {
        final element = TimeLogHeaderPosition(
          north: 50.5,
          binaryHeaderOptions: const PositionBinaryHeaderOptions(
            readNorth: true,
          ),
        )..north = null;
        expect(
          element.xmlElement.attributes.first,
          isA<XmlAttribute>()
              .having(
                (attribute) => attribute.name.local,
                'Correct name',
                'A',
              )
              .having((attribute) => attribute.value, 'Correct value', ''),
        );
      },
    );
  });

  test('setInt', () {
    final element = BaseStation(
      id: 'BSN1',
      designator: 'test',
      north: 50.5,
      east: 20.5,
      up: 500,
    )..up = 1000;
    expect(
      element.xmlElement.attributes[4],
      isA<XmlAttribute>()
          .having(
            (attribute) => attribute.name.local,
            'Correct name',
            'E',
          )
          .having(
            (attribute) => attribute.value,
            'Correct value',
            '1000',
          ),
    );
  });

  group('setIntNullable', () {
    test('With int value', () {
      final element = TimeLogHeaderPosition()..north = 59.2;
      expect(
        element.xmlElement.attributes.first,
        isA<XmlAttribute>()
            .having(
              (attribute) => attribute.name.local,
              'Correct name',
              'A',
            )
            .having(
              (attribute) => attribute.value,
              'Correct value',
              '59.2',
            ),
      );
    });

    test(
      'With null value removes the attribute from the element',
      () {
        final element = TimeLogHeaderPosition(north: 30.5)..north = null;
        expect(element.xmlElement.attributes, isEmpty);
      },
    );
    test(
      '''With null value and `setNullToEmptyString` sets attribute value to empty string''',
      () {
        final element = TimeLogHeaderPosition(
          north: 30.5,
          binaryHeaderOptions: const PositionBinaryHeaderOptions(
            readNorth: true,
          ),
        )..north = null;
        expect(
          element.xmlElement.attributes.first,
          isA<XmlAttribute>()
              .having(
                (attribute) => attribute.name.local,
                'Correct name',
                'A',
              )
              .having((attribute) => attribute.value, 'Correct value', ''),
        );
      },
    );
  });

  test('setString', () {
    final element = BaseStation(
      id: 'BSN1',
      designator: 'test',
      north: 50,
      east: 20,
      up: 100,
    )..id = 'BSN29';
    expect(
      element.xmlElement.attributes.first,
      isA<XmlAttribute>()
          .having(
            (attribute) => attribute.name.local,
            'Correct name',
            'A',
          )
          .having(
            (attribute) => attribute.value,
            'Correct value',
            'BSN29',
          ),
    );
  });

  group('setStringNullable', () {
    test('With String value', () {
      final element = CropType(id: 'CTP1', designator: 'Test')
        ..productGroupIdRef = 'New text';
      expect(
        element.xmlElement.attributes[2],
        isA<XmlAttribute>()
            .having(
              (attribute) => attribute.name.local,
              'Correct name',
              'C',
            )
            .having(
              (attribute) => attribute.value,
              'Correct value',
              'New text',
            ),
      );
    });

    test(
      'With null value removes the attribute from the element',
      () {
        final element = CropType(
          id: 'CTP1',
          designator: 'Test',
          productGroupIdRef: 'PGP1',
        )..productGroupIdRef = null;
        expect(
          element.xmlElement.attributes.any(
            (attribute) => attribute.name.local == 'C',
          ),
          isFalse,
        );
      },
    );
  });
}
