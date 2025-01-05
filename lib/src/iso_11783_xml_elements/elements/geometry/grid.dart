// Copyright 2024 Gaute Hagen. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

part of '../../iso_11783_element.dart';

/// An element that describes the dimensions and position of a set
/// of gridcells.
///
/// There shall be a definition of the minimum north/east position, the size of
/// each gridcell and the number of gridcells in the north/east direction.
/// There can only be a single [Grid] specified per [Task]. The [Grid] is always
/// related to a [Partfield] but the definition of the grid is always task
/// specific. The grid cells of a grid contain a reference to a [TreatmentZone]
/// or a [ProcessDataVariable] value. The grid shall be specified as a complete
/// array of gridcells in ascending order, as gridcells do not contain any
/// ordering information.
///
/// The gridcells needs to be stored in a binary file next to the main
/// [Iso11783TaskData] file.

@CopyWith()
@annotation.XmlRootElement(name: 'GRD')
@annotation.XmlSerializable(createMixin: true)
class Grid extends Iso11783Element with _$GridXmlSerializableMixin {
  /// Default factory for creating a [Grid] with verified arguments.
  factory Grid({
    required double minimumNorthPosition,
    required double minimumEastPosition,
    required double cellNorthSize,
    required double cellEastSize,
    required int maximumColumn,
    required int maximumRow,
    required String fileName,
    required GridType type,
    Uint8List? byteData,
    int? fileLength,
    int? treatmentZoneCode,
    List<List<int>>? treatmentZoneCodeGrid,
    int? numberOfProcessDataVariables,
    List<List<List<int>>>? processDataValueGrid,
  }) {
    ArgumentValidation.checkValueInRange(
      value: minimumNorthPosition,
      min: -90,
      max: 90,
      name: 'minimumNorthPosition',
    );
    ArgumentValidation.checkValueInRange(
      value: minimumEastPosition,
      min: -180,
      max: 180,
      name: 'minimumEastPosition',
    );
    ArgumentValidation.checkValueInRange(
      value: cellNorthSize,
      min: 0,
      max: 1,
      name: 'cellNorthSize',
    );
    ArgumentValidation.checkValueInRange(
      value: cellEastSize,
      min: 0,
      max: 1,
      name: 'cellEastSize',
    );
    ArgumentValidation.checkValueInRange(
      value: maximumColumn,
      min: 0,
      max: 4294967295,
      name: 'maximumColumn',
    );
    ArgumentValidation.checkValueInRange(
      value: maximumRow,
      min: 0,
      max: 4294967295,
      name: 'maximumRow',
    );
    ArgumentValidation.checkId(
      id: fileName,
      idRefPattern: fileNamePattern,
      idName: 'fileName',
    );
    if (treatmentZoneCode != null) {
      ArgumentValidation.checkValueInRange(
        value: treatmentZoneCode,
        min: 0,
        max: 254,
        name: 'treatmentZoneCode',
      );
    }
    if (type == GridType.two && byteData != null) {
      if (treatmentZoneCode == null) {
        throw ArgumentError.value(
          treatmentZoneCode,
          'treatmentZoneCode',
          "Can't be null when `type==GridType.two`",
        );
      } else if (numberOfProcessDataVariables == null) {
        throw ArgumentError.value(
          numberOfProcessDataVariables,
          'numberOfProcessDataVariables',
          "Can't be null when `type==GridType.two`",
        );
      }
    }
    var parsedTreatmentZoneCodes = treatmentZoneCodeGrid;
    var parsedProcessDataValueGrid = processDataValueGrid;
    if (byteData != null) {
      if (type == GridType.one && parsedTreatmentZoneCodes == null) {
        parsedTreatmentZoneCodes = List.generate(
          maximumRow,
          (y) => List.generate(
            maximumColumn,
            (x) => byteData[maximumColumn * y + x],
          ),
        );
      } else if (type == GridType.two && numberOfProcessDataVariables != null) {
        final data = byteData.buffer.asByteData(0, byteData.lengthInBytes);
        var currentOffset = 0;
        parsedProcessDataValueGrid = List.generate(
          maximumRow,
          (y) => List.generate(
            maximumColumn,
            (x) => List.generate(numberOfProcessDataVariables, (z) {
              final value = data.getInt32(currentOffset, Endian.little);
              currentOffset += 4;
              return value;
            }),
          ),
        );
      }
    }

    return Grid._(
      minimumNorthPosition: minimumNorthPosition,
      minimumEastPosition: minimumEastPosition,
      cellNorthSize: cellNorthSize,
      cellEastSize: cellEastSize,
      maximumColumn: maximumColumn,
      maximumRow: maximumRow,
      fileName: fileName,
      type: type,
      byteData: byteData ?? Uint8List(0),
      fileLength: fileLength,
      treatmentZoneCode: treatmentZoneCode,
      treatmentZoneCodeGrid: parsedTreatmentZoneCodes,
      numberOfProcessDataVariables: numberOfProcessDataVariables,
      processDataValueGrid: parsedProcessDataValueGrid,
    );
  }

  /// Private constructor that is called after having verified all the arguments
  /// in the default factory.
  Grid._({
    required this.minimumNorthPosition,
    required this.minimumEastPosition,
    required this.cellNorthSize,
    required this.cellEastSize,
    required this.maximumColumn,
    required this.maximumRow,
    required this.fileName,
    required this.type,
    required this.byteData,
    this.fileLength,
    this.treatmentZoneCode,
    this.treatmentZoneCodeGrid,
    this.numberOfProcessDataVariables,
    this.processDataValueGrid,
  }) : super(elementType: Iso11783ElementType.grid, description: 'Grid');

  /// Creates a [Grid] from [element];
  factory Grid.fromXmlElement(XmlElement element) =>
      _$GridFromXmlElement(element);

  /// Regular expression pattern for the filename of the binary
  /// `GRD-----.bin` file, excluding the `.bin` part
  static const fileNamePattern = 'GRD[0-9]{5}';

  /// Minimum north position of the grid, format: WGS84 latitude
  @annotation.XmlAttribute(name: 'A')
  double minimumNorthPosition;

  /// Minimum east position of the grid, format: WGS84 longitude
  @annotation.XmlAttribute(name: 'B')
  double minimumEastPosition;

  /// North direction grid size, format: WGS84 latitude
  @annotation.XmlAttribute(name: 'C')
  double cellNorthSize;

  /// East direction grid size, format: WGS84 longitude
  @annotation.XmlAttribute(name: 'D')
  double cellEastSize;

  /// Number of gridcells in the east direction.
  @annotation.XmlAttribute(name: 'E')
  int maximumColumn;

  /// Number of gridcells in the north direction.
  @annotation.XmlAttribute(name: 'F')
  int maximumRow;

  /// The name of the binary `GRD-----.bin` file.
  @annotation.XmlAttribute(name: 'G')
  final String fileName;

  /// The length of the binary `GRD-----.bin` file in bytes.
  @annotation.XmlAttribute(name: 'H')
  int? fileLength;

  /// Which type of values the grid contains.
  @annotation.XmlAttribute(name: 'I')
  final GridType type;

  /// [TreatmentZone] code when using [type] is [GridType.two].
  @annotation.XmlAttribute(name: 'J')
  int? treatmentZoneCode;

  /// Byte data from the file at [fileName].
  ///
  /// Can be empty if the external file is not loaded.
  Uint8List byteData;

  /// Parsed list of [TreatmentZone.code]s for the grid cells.
  ///
  /// Access grid value with `treatmentZoneCodeGrid[y][x]`.
  ///
  /// Value is only set if [type]==[GridType.one] and [byteData] is not empty.
  List<List<int>>? treatmentZoneCodeGrid;

  /// Count of [ProcessDataVariable]s the [TreatmentZone] with
  /// [TreatmentZone.code]==[treatmentZoneCode] has.
  ///
  /// Value is only set if [type]==[GridType.two] and [treatmentZoneCode]!=null.
  int? numberOfProcessDataVariables;

  /// Parsed list of [ProcessDataVariable.value]s for the
  /// [ProcessDataVariable]s in the [TreatmentZone] corresponding with
  /// [TreatmentZone.code]==[treatmentZoneCode].
  ///
  /// Access grid value with `processDataValueGrid[y][x][#pdv]`.
  ///
  /// Value is only set if [type]==[GridType.two] and [treatmentZoneCode]!=null
  /// and [byteData] is not empty.
  List<List<List<int>>>? processDataValueGrid;

  /// Parses [byteData] to fill [treatmentZoneCodeGrid] or
  /// [processDataValueGrid].
  void parseData() {
    if (type == GridType.one && treatmentZoneCodeGrid == null) {
      treatmentZoneCodeGrid = List.generate(
        maximumRow,
        (y) => List.generate(
          maximumColumn,
          (x) => byteData[maximumColumn * y + x],
        ),
      );
    } else if (type == GridType.two && numberOfProcessDataVariables != null) {
      final data = byteData.buffer.asByteData(0, byteData.lengthInBytes);
      var currentOffset = 0;
      processDataValueGrid = List.generate(
        maximumRow,
        (y) => List.generate(
          maximumColumn,
          (x) => List.generate(numberOfProcessDataVariables!, (z) {
            final value = data.getInt32(currentOffset, Endian.little);
            currentOffset += 4;
            return value;
          }),
        ),
      );
    }
  }

  /// Converts [treatmentZoneCodeGrid] or [processDataValueGrid] to bytes
  /// ready to be saved as a `GRD-----.BIN` file.
  Uint8List? gridToBytes() {
    if (type == GridType.one && treatmentZoneCodeGrid != null) {
      return Uint8List.fromList(treatmentZoneCodeGrid!.flattened.toList());
    } else if (type == GridType.two && processDataValueGrid != null) {
      return Int32List.fromList(
        processDataValueGrid!.flattened.flattened.toList(),
      ).buffer.asUint8List();
    }
    return null;
  }
}

/// An enumerator for selecting which type of values the [Grid] binary file
/// is holding.
@annotation.XmlEnum()
enum GridType {
  /// A grid type that contains [TreatmentZone] codes.
  @annotation.XmlValue('1')
  one(1, 'Grid Type 1, TreatmentZone codes'),

  /// A grid type that contains [ProcessDataVariable] values.
  @annotation.XmlValue('2')
  two(2, 'Grid Type 2, ProcessDataVariable values');

  const GridType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
