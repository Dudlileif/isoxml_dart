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

class Grid extends Iso11783Element {
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
    _argumentValidator(
      minimumNorthPosition: minimumNorthPosition,
      minimumEastPosition: minimumEastPosition,
      cellNorthSize: cellNorthSize,
      cellEastSize: cellEastSize,
      maximumColumn: maximumColumn,
      maximumRow: maximumRow,
      fileName: fileName,
      type: type,
      byteData: byteData,
      fileLength: fileLength,
      treatmentZoneCode: treatmentZoneCode,
      treatmentZoneCodeGrid: treatmentZoneCodeGrid,
      numberOfProcessDataVariables: numberOfProcessDataVariables,
      processDataValueGrid: processDataValueGrid,
    );

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
    required double minimumNorthPosition,
    required double minimumEastPosition,
    required double cellNorthSize,
    required double cellEastSize,
    required int maximumColumn,
    required int maximumRow,
    required String fileName,
    required GridType type,
    required this.byteData,
    int? fileLength,
    int? treatmentZoneCode,
    this.treatmentZoneCodeGrid,
    this.numberOfProcessDataVariables,
    this.processDataValueGrid,
  }) : super._(elementType: _elementType) {
    this.minimumNorthPosition = minimumNorthPosition;
    this.minimumEastPosition = minimumEastPosition;
    this.cellNorthSize = cellNorthSize;
    this.cellEastSize = cellEastSize;
    this.maximumColumn = maximumColumn;
    this.maximumRow = maximumRow;
    this.fileName = fileName;
    this.type = type;
    this.fileLength = fileLength;
    this.treatmentZoneCode = treatmentZoneCode;
  }

  Grid._fromXmlElement(
    XmlElement element, {
    Uint8List? byteData,
    List<TreatmentZone>? treatmentZones,
  }) : byteData = byteData ?? Uint8List(0),
       super._(elementType: _elementType, xmlElement: element) {
    numberOfProcessDataVariables = switch (type) {
      GridType.two =>
        numberOfProcessDataVariables ??
            switch (treatmentZones) {
              [...] =>
                treatmentZones
                    .firstWhereOrNull((tzn) => tzn.code == treatmentZoneCode)
                    ?.processDataVariables
                    .length,
              _ => null,
            },
      _ => null,
    };

    _argumentValidator(
      minimumNorthPosition: minimumNorthPosition,
      minimumEastPosition: minimumEastPosition,
      cellNorthSize: cellNorthSize,
      cellEastSize: cellEastSize,
      maximumColumn: maximumColumn,
      maximumRow: maximumRow,
      fileName: fileName,
      type: type,
      byteData: byteData,
      fileLength: fileLength,
      treatmentZoneCode: treatmentZoneCode,
      treatmentZoneCodeGrid: treatmentZoneCodeGrid,
      numberOfProcessDataVariables: numberOfProcessDataVariables,
      processDataValueGrid: processDataValueGrid,
    );
  }

  static void _argumentValidator({
    required double minimumNorthPosition,
    required double minimumEastPosition,
    required double cellNorthSize,
    required double cellEastSize,
    required int maximumColumn,
    required int maximumRow,
    required String fileName,
    required GridType type,
    required Uint8List? byteData,
    required int? fileLength,
    required int? treatmentZoneCode,
    required List<List<int>>? treatmentZoneCodeGrid,
    required int? numberOfProcessDataVariables,
    required List<List<List<int>>>? processDataValueGrid,
  }) {
    ArgumentValidation.checkValueInRange(
      value: minimumNorthPosition,
      min: -90,
      max: 90,
      name: 'Grid.minimumNorthPosition',
    );
    ArgumentValidation.checkValueInRange(
      value: minimumEastPosition,
      min: -180,
      max: 180,
      name: 'Grid.minimumEastPosition',
    );
    ArgumentValidation.checkValueInRange(
      value: cellNorthSize,
      min: 0,
      max: 1,
      name: 'Grid.cellNorthSize',
    );
    ArgumentValidation.checkValueInRange(
      value: cellEastSize,
      min: 0,
      max: 1,
      name: 'Grid.cellEastSize',
    );
    ArgumentValidation.checkValueInRange(
      value: maximumColumn,
      min: 0,
      max: 4294967295,
      name: 'Grid.maximumColumn',
    );
    ArgumentValidation.checkValueInRange(
      value: maximumRow,
      min: 0,
      max: 4294967295,
      name: 'Grid.maximumRow',
    );
    ArgumentValidation.checkId(
      id: fileName,
      idRefPattern: fileNamePattern,
      name: 'Grid.fileName',
    );
    if (treatmentZoneCode != null) {
      ArgumentValidation.checkValueInRange(
        value: treatmentZoneCode,
        min: 0,
        max: 254,
        name: 'Grid.treatmentZoneCode',
      );
    }
    if (type == GridType.two) {
      if (treatmentZoneCode == null) {
        throw ArgumentError.value(
          treatmentZoneCode,
          'Grid.treatmentZoneCode',
          "Can't be null when `type==GridType.two`",
        );
      } else if (numberOfProcessDataVariables == null) {
        throw ArgumentError.value(
          numberOfProcessDataVariables,
          'Grid.numberOfProcessDataVariables',
          "Can't be null when `type==GridType.two`",
        );
      }
    }
  }

  static const Iso11783ElementType _elementType = Iso11783ElementType.grid;

  /// Regular expression pattern for the filename of the binary
  /// `GRD-----.bin` file, excluding the `.bin` part
  static const fileNamePattern = 'GRD[0-9]{5}';

  /// Minimum north position of the grid, format: WGS84 latitude
  double get minimumNorthPosition => parseDouble('A');
  set minimumNorthPosition(double value) => setDouble('A', value);

  /// Minimum east position of the grid, format: WGS84 longitude
  double get minimumEastPosition => parseDouble('B');
  set minimumEastPosition(double value) => setDouble('B', value);

  /// North direction grid size, format: WGS84 latitude
  double get cellNorthSize => parseDouble('C');
  set cellNorthSize(double value) => setDouble('C', value);

  /// East direction grid size, format: WGS84 longitude
  double get cellEastSize => parseDouble('D');
  set cellEastSize(double value) => setDouble('D', value);

  /// Number of gridcells in the east direction.
  int get maximumColumn => parseInt('E');
  set maximumColumn(int value) => setInt('E', value);

  /// Number of gridcells in the north direction.
  int get maximumRow => parseInt('F');
  set maximumRow(int value) => setInt('F', value);

  /// The name of the binary `GRD-----.bin` file.
  String get fileName => parseString('G');
  set fileName(String value) => setString('G', value);

  /// The length of the binary `GRD-----.bin` file in bytes.
  int? get fileLength => tryParseInt('H');
  set fileLength(int? value) => setIntNullable('H', value);

  /// Which type of values the grid contains.
  GridType get type => switch (parseInt('I')) {
    1 => GridType.one,
    2 => GridType.two,
    _ => throw ArgumentError.value(
      xmlElement.getAttribute('I'),
      'Grid.type',
      'is not one of the supported values: ${GridType.values.join(', ')}',
    ),
  };

  set type(GridType value) => setInt('I', value.value);

  /// [TreatmentZone] code when using [type] is [GridType.two].
  int? get treatmentZoneCode => tryParseInt('J');
  set treatmentZoneCode(int? value) => setIntNullable('J', value);

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

  /// Parsed list of [ProcessDataVariable].value for the
  /// [ProcessDataVariable]s in the [TreatmentZone] corresponding with
  /// [TreatmentZone.code]==[treatmentZoneCode].
  ///
  /// Access grid value with `processDataValueGrid[y][x][#pdv]`.
  ///
  /// Value is only set if [type] == [GridType.two] and
  /// [treatmentZoneCode] != null and [byteData] is not empty.
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
enum GridType {
  /// A grid type that contains [TreatmentZone] codes.
  one(1, 'Grid Type 1, TreatmentZone codes'),

  /// A grid type that contains [ProcessDataVariable] values.
  two(2, 'Grid Type 2, ProcessDataVariable values');

  const GridType(this.value, this.description);

  /// XML attribute value.
  final int value;

  /// A short description of the value.
  final String description;
}
