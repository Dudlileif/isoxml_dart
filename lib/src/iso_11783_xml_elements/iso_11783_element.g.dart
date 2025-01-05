// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iso_11783_element.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AllocationStampCWProxy {
  AllocationStamp start(DateTime start);

  AllocationStamp type(AllocationStampType type);

  AllocationStamp position(List<Position>? position);

  AllocationStamp stop(DateTime? stop);

  AllocationStamp duration(int? duration);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AllocationStamp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AllocationStamp(...).copyWith(id: 12, name: "My name")
  /// ````
  AllocationStamp call({
    DateTime start,
    AllocationStampType type,
    List<Position>? position,
    DateTime? stop,
    int? duration,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAllocationStamp.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAllocationStamp.copyWith.fieldName(...)`
class _$AllocationStampCWProxyImpl implements _$AllocationStampCWProxy {
  const _$AllocationStampCWProxyImpl(this._value);

  final AllocationStamp _value;

  @override
  AllocationStamp start(DateTime start) => this(start: start);

  @override
  AllocationStamp type(AllocationStampType type) => this(type: type);

  @override
  AllocationStamp position(List<Position>? position) =>
      this(position: position);

  @override
  AllocationStamp stop(DateTime? stop) => this(stop: stop);

  @override
  AllocationStamp duration(int? duration) => this(duration: duration);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AllocationStamp(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AllocationStamp(...).copyWith(id: 12, name: "My name")
  /// ````
  AllocationStamp call({
    Object? start = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? position = const $CopyWithPlaceholder(),
    Object? stop = const $CopyWithPlaceholder(),
    Object? duration = const $CopyWithPlaceholder(),
  }) {
    return AllocationStamp(
      start: start == const $CopyWithPlaceholder()
          ? _value.start
          // ignore: cast_nullable_to_non_nullable
          : start as DateTime,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as AllocationStampType,
      position: position == const $CopyWithPlaceholder()
          ? _value.position
          // ignore: cast_nullable_to_non_nullable
          : position as List<Position>?,
      stop: stop == const $CopyWithPlaceholder()
          ? _value.stop
          // ignore: cast_nullable_to_non_nullable
          : stop as DateTime?,
      duration: duration == const $CopyWithPlaceholder()
          ? _value.duration
          // ignore: cast_nullable_to_non_nullable
          : duration as int?,
    );
  }
}

extension $AllocationStampCopyWith on AllocationStamp {
  /// Returns a callable class that can be used as follows: `instanceOfAllocationStamp.copyWith(...)` or like so:`instanceOfAllocationStamp.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AllocationStampCWProxy get copyWith => _$AllocationStampCWProxyImpl(this);
}

abstract class _$BaseStationCWProxy {
  BaseStation id(String id);

  BaseStation designator(String designator);

  BaseStation north(double north);

  BaseStation east(double east);

  BaseStation up(int up);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseStation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseStation(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseStation call({
    String id,
    String designator,
    double north,
    double east,
    int up,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBaseStation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBaseStation.copyWith.fieldName(...)`
class _$BaseStationCWProxyImpl implements _$BaseStationCWProxy {
  const _$BaseStationCWProxyImpl(this._value);

  final BaseStation _value;

  @override
  BaseStation id(String id) => this(id: id);

  @override
  BaseStation designator(String designator) => this(designator: designator);

  @override
  BaseStation north(double north) => this(north: north);

  @override
  BaseStation east(double east) => this(east: east);

  @override
  BaseStation up(int up) => this(up: up);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BaseStation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BaseStation(...).copyWith(id: 12, name: "My name")
  /// ````
  BaseStation call({
    Object? id = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? north = const $CopyWithPlaceholder(),
    Object? east = const $CopyWithPlaceholder(),
    Object? up = const $CopyWithPlaceholder(),
  }) {
    return BaseStation(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String,
      north: north == const $CopyWithPlaceholder()
          ? _value.north
          // ignore: cast_nullable_to_non_nullable
          : north as double,
      east: east == const $CopyWithPlaceholder()
          ? _value.east
          // ignore: cast_nullable_to_non_nullable
          : east as double,
      up: up == const $CopyWithPlaceholder()
          ? _value.up
          // ignore: cast_nullable_to_non_nullable
          : up as int,
    );
  }
}

extension $BaseStationCopyWith on BaseStation {
  /// Returns a callable class that can be used as follows: `instanceOfBaseStation.copyWith(...)` or like so:`instanceOfBaseStation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BaseStationCWProxy get copyWith => _$BaseStationCWProxyImpl(this);
}

abstract class _$CodedCommentCWProxy {
  CodedComment id(String id);

  CodedComment designator(String designator);

  CodedComment scope(CodedCommmentScope scope);

  CodedComment listValues(List<CodedCommentListValue>? listValues);

  CodedComment groupIdRef(String? groupIdRef);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CodedComment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CodedComment(...).copyWith(id: 12, name: "My name")
  /// ````
  CodedComment call({
    String id,
    String designator,
    CodedCommmentScope scope,
    List<CodedCommentListValue>? listValues,
    String? groupIdRef,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCodedComment.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCodedComment.copyWith.fieldName(...)`
class _$CodedCommentCWProxyImpl implements _$CodedCommentCWProxy {
  const _$CodedCommentCWProxyImpl(this._value);

  final CodedComment _value;

  @override
  CodedComment id(String id) => this(id: id);

  @override
  CodedComment designator(String designator) => this(designator: designator);

  @override
  CodedComment scope(CodedCommmentScope scope) => this(scope: scope);

  @override
  CodedComment listValues(List<CodedCommentListValue>? listValues) =>
      this(listValues: listValues);

  @override
  CodedComment groupIdRef(String? groupIdRef) => this(groupIdRef: groupIdRef);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CodedComment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CodedComment(...).copyWith(id: 12, name: "My name")
  /// ````
  CodedComment call({
    Object? id = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? scope = const $CopyWithPlaceholder(),
    Object? listValues = const $CopyWithPlaceholder(),
    Object? groupIdRef = const $CopyWithPlaceholder(),
  }) {
    return CodedComment(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String,
      scope: scope == const $CopyWithPlaceholder()
          ? _value.scope
          // ignore: cast_nullable_to_non_nullable
          : scope as CodedCommmentScope,
      listValues: listValues == const $CopyWithPlaceholder()
          ? _value.listValues
          // ignore: cast_nullable_to_non_nullable
          : listValues as List<CodedCommentListValue>?,
      groupIdRef: groupIdRef == const $CopyWithPlaceholder()
          ? _value.groupIdRef
          // ignore: cast_nullable_to_non_nullable
          : groupIdRef as String?,
    );
  }
}

extension $CodedCommentCopyWith on CodedComment {
  /// Returns a callable class that can be used as follows: `instanceOfCodedComment.copyWith(...)` or like so:`instanceOfCodedComment.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CodedCommentCWProxy get copyWith => _$CodedCommentCWProxyImpl(this);
}

abstract class _$CodedCommentGroupCWProxy {
  CodedCommentGroup id(String id);

  CodedCommentGroup designator(String designator);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CodedCommentGroup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CodedCommentGroup(...).copyWith(id: 12, name: "My name")
  /// ````
  CodedCommentGroup call({
    String id,
    String designator,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCodedCommentGroup.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCodedCommentGroup.copyWith.fieldName(...)`
class _$CodedCommentGroupCWProxyImpl implements _$CodedCommentGroupCWProxy {
  const _$CodedCommentGroupCWProxyImpl(this._value);

  final CodedCommentGroup _value;

  @override
  CodedCommentGroup id(String id) => this(id: id);

  @override
  CodedCommentGroup designator(String designator) =>
      this(designator: designator);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CodedCommentGroup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CodedCommentGroup(...).copyWith(id: 12, name: "My name")
  /// ````
  CodedCommentGroup call({
    Object? id = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
  }) {
    return CodedCommentGroup(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String,
    );
  }
}

extension $CodedCommentGroupCopyWith on CodedCommentGroup {
  /// Returns a callable class that can be used as follows: `instanceOfCodedCommentGroup.copyWith(...)` or like so:`instanceOfCodedCommentGroup.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CodedCommentGroupCWProxy get copyWith =>
      _$CodedCommentGroupCWProxyImpl(this);
}

abstract class _$CodedCommentListValueCWProxy {
  CodedCommentListValue id(String id);

  CodedCommentListValue designator(String designator);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CodedCommentListValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CodedCommentListValue(...).copyWith(id: 12, name: "My name")
  /// ````
  CodedCommentListValue call({
    String id,
    String designator,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCodedCommentListValue.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCodedCommentListValue.copyWith.fieldName(...)`
class _$CodedCommentListValueCWProxyImpl
    implements _$CodedCommentListValueCWProxy {
  const _$CodedCommentListValueCWProxyImpl(this._value);

  final CodedCommentListValue _value;

  @override
  CodedCommentListValue id(String id) => this(id: id);

  @override
  CodedCommentListValue designator(String designator) =>
      this(designator: designator);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CodedCommentListValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CodedCommentListValue(...).copyWith(id: 12, name: "My name")
  /// ````
  CodedCommentListValue call({
    Object? id = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
  }) {
    return CodedCommentListValue(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String,
    );
  }
}

extension $CodedCommentListValueCopyWith on CodedCommentListValue {
  /// Returns a callable class that can be used as follows: `instanceOfCodedCommentListValue.copyWith(...)` or like so:`instanceOfCodedCommentListValue.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CodedCommentListValueCWProxy get copyWith =>
      _$CodedCommentListValueCWProxyImpl(this);
}

abstract class _$CommentAllocationCWProxy {
  CommentAllocation allocationStamp(AllocationStamp? allocationStamp);

  CommentAllocation codedCommentIdRef(String? codedCommentIdRef);

  CommentAllocation codedCommentListValueIdRef(
      String? codedCommentListValueIdRef);

  CommentAllocation freeCommentText(String? freeCommentText);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommentAllocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommentAllocation(...).copyWith(id: 12, name: "My name")
  /// ````
  CommentAllocation call({
    AllocationStamp? allocationStamp,
    String? codedCommentIdRef,
    String? codedCommentListValueIdRef,
    String? freeCommentText,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCommentAllocation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCommentAllocation.copyWith.fieldName(...)`
class _$CommentAllocationCWProxyImpl implements _$CommentAllocationCWProxy {
  const _$CommentAllocationCWProxyImpl(this._value);

  final CommentAllocation _value;

  @override
  CommentAllocation allocationStamp(AllocationStamp? allocationStamp) =>
      this(allocationStamp: allocationStamp);

  @override
  CommentAllocation codedCommentIdRef(String? codedCommentIdRef) =>
      this(codedCommentIdRef: codedCommentIdRef);

  @override
  CommentAllocation codedCommentListValueIdRef(
          String? codedCommentListValueIdRef) =>
      this(codedCommentListValueIdRef: codedCommentListValueIdRef);

  @override
  CommentAllocation freeCommentText(String? freeCommentText) =>
      this(freeCommentText: freeCommentText);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommentAllocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommentAllocation(...).copyWith(id: 12, name: "My name")
  /// ````
  CommentAllocation call({
    Object? allocationStamp = const $CopyWithPlaceholder(),
    Object? codedCommentIdRef = const $CopyWithPlaceholder(),
    Object? codedCommentListValueIdRef = const $CopyWithPlaceholder(),
    Object? freeCommentText = const $CopyWithPlaceholder(),
  }) {
    return CommentAllocation(
      allocationStamp: allocationStamp == const $CopyWithPlaceholder()
          ? _value.allocationStamp
          // ignore: cast_nullable_to_non_nullable
          : allocationStamp as AllocationStamp?,
      codedCommentIdRef: codedCommentIdRef == const $CopyWithPlaceholder()
          ? _value.codedCommentIdRef
          // ignore: cast_nullable_to_non_nullable
          : codedCommentIdRef as String?,
      codedCommentListValueIdRef:
          codedCommentListValueIdRef == const $CopyWithPlaceholder()
              ? _value.codedCommentListValueIdRef
              // ignore: cast_nullable_to_non_nullable
              : codedCommentListValueIdRef as String?,
      freeCommentText: freeCommentText == const $CopyWithPlaceholder()
          ? _value.freeCommentText
          // ignore: cast_nullable_to_non_nullable
          : freeCommentText as String?,
    );
  }
}

extension $CommentAllocationCopyWith on CommentAllocation {
  /// Returns a callable class that can be used as follows: `instanceOfCommentAllocation.copyWith(...)` or like so:`instanceOfCommentAllocation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CommentAllocationCWProxy get copyWith =>
      _$CommentAllocationCWProxyImpl(this);
}

abstract class _$ColourLegendCWProxy {
  ColourLegend ranges(List<ColourRange> ranges);

  ColourLegend id(String id);

  ColourLegend defaultColour(int? defaultColour);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ColourLegend(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ColourLegend(...).copyWith(id: 12, name: "My name")
  /// ````
  ColourLegend call({
    List<ColourRange> ranges,
    String id,
    int? defaultColour,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfColourLegend.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfColourLegend.copyWith.fieldName(...)`
class _$ColourLegendCWProxyImpl implements _$ColourLegendCWProxy {
  const _$ColourLegendCWProxyImpl(this._value);

  final ColourLegend _value;

  @override
  ColourLegend ranges(List<ColourRange> ranges) => this(ranges: ranges);

  @override
  ColourLegend id(String id) => this(id: id);

  @override
  ColourLegend defaultColour(int? defaultColour) =>
      this(defaultColour: defaultColour);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ColourLegend(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ColourLegend(...).copyWith(id: 12, name: "My name")
  /// ````
  ColourLegend call({
    Object? ranges = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? defaultColour = const $CopyWithPlaceholder(),
  }) {
    return ColourLegend(
      ranges: ranges == const $CopyWithPlaceholder()
          ? _value.ranges
          // ignore: cast_nullable_to_non_nullable
          : ranges as List<ColourRange>,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      defaultColour: defaultColour == const $CopyWithPlaceholder()
          ? _value.defaultColour
          // ignore: cast_nullable_to_non_nullable
          : defaultColour as int?,
    );
  }
}

extension $ColourLegendCopyWith on ColourLegend {
  /// Returns a callable class that can be used as follows: `instanceOfColourLegend.copyWith(...)` or like so:`instanceOfColourLegend.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ColourLegendCWProxy get copyWith => _$ColourLegendCWProxyImpl(this);
}

abstract class _$ColourRangeCWProxy {
  ColourRange minimumValue(int minimumValue);

  ColourRange maximumValue(int maximumValue);

  ColourRange colour(int colour);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ColourRange(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ColourRange(...).copyWith(id: 12, name: "My name")
  /// ````
  ColourRange call({
    int minimumValue,
    int maximumValue,
    int colour,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfColourRange.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfColourRange.copyWith.fieldName(...)`
class _$ColourRangeCWProxyImpl implements _$ColourRangeCWProxy {
  const _$ColourRangeCWProxyImpl(this._value);

  final ColourRange _value;

  @override
  ColourRange minimumValue(int minimumValue) =>
      this(minimumValue: minimumValue);

  @override
  ColourRange maximumValue(int maximumValue) =>
      this(maximumValue: maximumValue);

  @override
  ColourRange colour(int colour) => this(colour: colour);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ColourRange(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ColourRange(...).copyWith(id: 12, name: "My name")
  /// ````
  ColourRange call({
    Object? minimumValue = const $CopyWithPlaceholder(),
    Object? maximumValue = const $CopyWithPlaceholder(),
    Object? colour = const $CopyWithPlaceholder(),
  }) {
    return ColourRange(
      minimumValue: minimumValue == const $CopyWithPlaceholder()
          ? _value.minimumValue
          // ignore: cast_nullable_to_non_nullable
          : minimumValue as int,
      maximumValue: maximumValue == const $CopyWithPlaceholder()
          ? _value.maximumValue
          // ignore: cast_nullable_to_non_nullable
          : maximumValue as int,
      colour: colour == const $CopyWithPlaceholder()
          ? _value.colour
          // ignore: cast_nullable_to_non_nullable
          : colour as int,
    );
  }
}

extension $ColourRangeCopyWith on ColourRange {
  /// Returns a callable class that can be used as follows: `instanceOfColourRange.copyWith(...)` or like so:`instanceOfColourRange.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ColourRangeCWProxy get copyWith => _$ColourRangeCWProxyImpl(this);
}

abstract class _$CropTypeCWProxy {
  CropType id(String id);

  CropType designator(String designator);

  CropType varieties(List<CropVariety>? varieties);

  CropType productGroupIdRef(String? productGroupIdRef);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CropType(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CropType(...).copyWith(id: 12, name: "My name")
  /// ````
  CropType call({
    String id,
    String designator,
    List<CropVariety>? varieties,
    String? productGroupIdRef,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCropType.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCropType.copyWith.fieldName(...)`
class _$CropTypeCWProxyImpl implements _$CropTypeCWProxy {
  const _$CropTypeCWProxyImpl(this._value);

  final CropType _value;

  @override
  CropType id(String id) => this(id: id);

  @override
  CropType designator(String designator) => this(designator: designator);

  @override
  CropType varieties(List<CropVariety>? varieties) =>
      this(varieties: varieties);

  @override
  CropType productGroupIdRef(String? productGroupIdRef) =>
      this(productGroupIdRef: productGroupIdRef);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CropType(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CropType(...).copyWith(id: 12, name: "My name")
  /// ````
  CropType call({
    Object? id = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? varieties = const $CopyWithPlaceholder(),
    Object? productGroupIdRef = const $CopyWithPlaceholder(),
  }) {
    return CropType(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String,
      varieties: varieties == const $CopyWithPlaceholder()
          ? _value.varieties
          // ignore: cast_nullable_to_non_nullable
          : varieties as List<CropVariety>?,
      productGroupIdRef: productGroupIdRef == const $CopyWithPlaceholder()
          ? _value.productGroupIdRef
          // ignore: cast_nullable_to_non_nullable
          : productGroupIdRef as String?,
    );
  }
}

extension $CropTypeCopyWith on CropType {
  /// Returns a callable class that can be used as follows: `instanceOfCropType.copyWith(...)` or like so:`instanceOfCropType.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CropTypeCWProxy get copyWith => _$CropTypeCWProxyImpl(this);
}

abstract class _$CropVarietyCWProxy {
  CropVariety id(String id);

  CropVariety designator(String designator);

  CropVariety productIdRef(String? productIdRef);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CropVariety(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CropVariety(...).copyWith(id: 12, name: "My name")
  /// ````
  CropVariety call({
    String id,
    String designator,
    String? productIdRef,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCropVariety.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCropVariety.copyWith.fieldName(...)`
class _$CropVarietyCWProxyImpl implements _$CropVarietyCWProxy {
  const _$CropVarietyCWProxyImpl(this._value);

  final CropVariety _value;

  @override
  CropVariety id(String id) => this(id: id);

  @override
  CropVariety designator(String designator) => this(designator: designator);

  @override
  CropVariety productIdRef(String? productIdRef) =>
      this(productIdRef: productIdRef);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CropVariety(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CropVariety(...).copyWith(id: 12, name: "My name")
  /// ````
  CropVariety call({
    Object? id = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? productIdRef = const $CopyWithPlaceholder(),
  }) {
    return CropVariety(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String,
      productIdRef: productIdRef == const $CopyWithPlaceholder()
          ? _value.productIdRef
          // ignore: cast_nullable_to_non_nullable
          : productIdRef as String?,
    );
  }
}

extension $CropVarietyCopyWith on CropVariety {
  /// Returns a callable class that can be used as follows: `instanceOfCropVariety.copyWith(...)` or like so:`instanceOfCropVariety.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CropVarietyCWProxy get copyWith => _$CropVarietyCWProxyImpl(this);
}

abstract class _$DataLogTriggerCWProxy {
  DataLogTrigger ddi(String ddi);

  DataLogTrigger method(int method);

  DataLogTrigger distanceInterval(int? distanceInterval);

  DataLogTrigger timeInterval(int? timeInterval);

  DataLogTrigger thresholdMinimum(int? thresholdMinimum);

  DataLogTrigger thresholdMaximum(int? thresholdMaximum);

  DataLogTrigger thresholdChange(int? thresholdChange);

  DataLogTrigger deviceElementIdRef(String? deviceElementIdRef);

  DataLogTrigger valuePresentationIdRef(String? valuePresentationIdRef);

  DataLogTrigger pgn(int? pgn);

  DataLogTrigger pgnStartBit(int? pgnStartBit);

  DataLogTrigger pgnStopBit(int? pgnStopBit);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DataLogTrigger(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DataLogTrigger(...).copyWith(id: 12, name: "My name")
  /// ````
  DataLogTrigger call({
    String ddi,
    int method,
    int? distanceInterval,
    int? timeInterval,
    int? thresholdMinimum,
    int? thresholdMaximum,
    int? thresholdChange,
    String? deviceElementIdRef,
    String? valuePresentationIdRef,
    int? pgn,
    int? pgnStartBit,
    int? pgnStopBit,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDataLogTrigger.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDataLogTrigger.copyWith.fieldName(...)`
class _$DataLogTriggerCWProxyImpl implements _$DataLogTriggerCWProxy {
  const _$DataLogTriggerCWProxyImpl(this._value);

  final DataLogTrigger _value;

  @override
  DataLogTrigger ddi(String ddi) => this(ddi: ddi);

  @override
  DataLogTrigger method(int method) => this(method: method);

  @override
  DataLogTrigger distanceInterval(int? distanceInterval) =>
      this(distanceInterval: distanceInterval);

  @override
  DataLogTrigger timeInterval(int? timeInterval) =>
      this(timeInterval: timeInterval);

  @override
  DataLogTrigger thresholdMinimum(int? thresholdMinimum) =>
      this(thresholdMinimum: thresholdMinimum);

  @override
  DataLogTrigger thresholdMaximum(int? thresholdMaximum) =>
      this(thresholdMaximum: thresholdMaximum);

  @override
  DataLogTrigger thresholdChange(int? thresholdChange) =>
      this(thresholdChange: thresholdChange);

  @override
  DataLogTrigger deviceElementIdRef(String? deviceElementIdRef) =>
      this(deviceElementIdRef: deviceElementIdRef);

  @override
  DataLogTrigger valuePresentationIdRef(String? valuePresentationIdRef) =>
      this(valuePresentationIdRef: valuePresentationIdRef);

  @override
  DataLogTrigger pgn(int? pgn) => this(pgn: pgn);

  @override
  DataLogTrigger pgnStartBit(int? pgnStartBit) =>
      this(pgnStartBit: pgnStartBit);

  @override
  DataLogTrigger pgnStopBit(int? pgnStopBit) => this(pgnStopBit: pgnStopBit);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DataLogTrigger(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DataLogTrigger(...).copyWith(id: 12, name: "My name")
  /// ````
  DataLogTrigger call({
    Object? ddi = const $CopyWithPlaceholder(),
    Object? method = const $CopyWithPlaceholder(),
    Object? distanceInterval = const $CopyWithPlaceholder(),
    Object? timeInterval = const $CopyWithPlaceholder(),
    Object? thresholdMinimum = const $CopyWithPlaceholder(),
    Object? thresholdMaximum = const $CopyWithPlaceholder(),
    Object? thresholdChange = const $CopyWithPlaceholder(),
    Object? deviceElementIdRef = const $CopyWithPlaceholder(),
    Object? valuePresentationIdRef = const $CopyWithPlaceholder(),
    Object? pgn = const $CopyWithPlaceholder(),
    Object? pgnStartBit = const $CopyWithPlaceholder(),
    Object? pgnStopBit = const $CopyWithPlaceholder(),
  }) {
    return DataLogTrigger(
      ddi: ddi == const $CopyWithPlaceholder()
          ? _value.ddi
          // ignore: cast_nullable_to_non_nullable
          : ddi as String,
      method: method == const $CopyWithPlaceholder()
          ? _value.method
          // ignore: cast_nullable_to_non_nullable
          : method as int,
      distanceInterval: distanceInterval == const $CopyWithPlaceholder()
          ? _value.distanceInterval
          // ignore: cast_nullable_to_non_nullable
          : distanceInterval as int?,
      timeInterval: timeInterval == const $CopyWithPlaceholder()
          ? _value.timeInterval
          // ignore: cast_nullable_to_non_nullable
          : timeInterval as int?,
      thresholdMinimum: thresholdMinimum == const $CopyWithPlaceholder()
          ? _value.thresholdMinimum
          // ignore: cast_nullable_to_non_nullable
          : thresholdMinimum as int?,
      thresholdMaximum: thresholdMaximum == const $CopyWithPlaceholder()
          ? _value.thresholdMaximum
          // ignore: cast_nullable_to_non_nullable
          : thresholdMaximum as int?,
      thresholdChange: thresholdChange == const $CopyWithPlaceholder()
          ? _value.thresholdChange
          // ignore: cast_nullable_to_non_nullable
          : thresholdChange as int?,
      deviceElementIdRef: deviceElementIdRef == const $CopyWithPlaceholder()
          ? _value.deviceElementIdRef
          // ignore: cast_nullable_to_non_nullable
          : deviceElementIdRef as String?,
      valuePresentationIdRef:
          valuePresentationIdRef == const $CopyWithPlaceholder()
              ? _value.valuePresentationIdRef
              // ignore: cast_nullable_to_non_nullable
              : valuePresentationIdRef as String?,
      pgn: pgn == const $CopyWithPlaceholder()
          ? _value.pgn
          // ignore: cast_nullable_to_non_nullable
          : pgn as int?,
      pgnStartBit: pgnStartBit == const $CopyWithPlaceholder()
          ? _value.pgnStartBit
          // ignore: cast_nullable_to_non_nullable
          : pgnStartBit as int?,
      pgnStopBit: pgnStopBit == const $CopyWithPlaceholder()
          ? _value.pgnStopBit
          // ignore: cast_nullable_to_non_nullable
          : pgnStopBit as int?,
    );
  }
}

extension $DataLogTriggerCopyWith on DataLogTrigger {
  /// Returns a callable class that can be used as follows: `instanceOfDataLogTrigger.copyWith(...)` or like so:`instanceOfDataLogTrigger.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DataLogTriggerCWProxy get copyWith => _$DataLogTriggerCWProxyImpl(this);
}

abstract class _$DataLogValueCWProxy {
  DataLogValue processDataDDI(String processDataDDI);

  DataLogValue processDataValue(int processDataValue);

  DataLogValue deviceElementIdRef(String deviceElementIdRef);

  DataLogValue pgn(int? pgn);

  DataLogValue pgnStartBit(int? pgnStartBit);

  DataLogValue pgnStopBit(int? pgnStopBit);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DataLogValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DataLogValue(...).copyWith(id: 12, name: "My name")
  /// ````
  DataLogValue call({
    String processDataDDI,
    int processDataValue,
    String deviceElementIdRef,
    int? pgn,
    int? pgnStartBit,
    int? pgnStopBit,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDataLogValue.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDataLogValue.copyWith.fieldName(...)`
class _$DataLogValueCWProxyImpl implements _$DataLogValueCWProxy {
  const _$DataLogValueCWProxyImpl(this._value);

  final DataLogValue _value;

  @override
  DataLogValue processDataDDI(String processDataDDI) =>
      this(processDataDDI: processDataDDI);

  @override
  DataLogValue processDataValue(int processDataValue) =>
      this(processDataValue: processDataValue);

  @override
  DataLogValue deviceElementIdRef(String deviceElementIdRef) =>
      this(deviceElementIdRef: deviceElementIdRef);

  @override
  DataLogValue pgn(int? pgn) => this(pgn: pgn);

  @override
  DataLogValue pgnStartBit(int? pgnStartBit) => this(pgnStartBit: pgnStartBit);

  @override
  DataLogValue pgnStopBit(int? pgnStopBit) => this(pgnStopBit: pgnStopBit);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DataLogValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DataLogValue(...).copyWith(id: 12, name: "My name")
  /// ````
  DataLogValue call({
    Object? processDataDDI = const $CopyWithPlaceholder(),
    Object? processDataValue = const $CopyWithPlaceholder(),
    Object? deviceElementIdRef = const $CopyWithPlaceholder(),
    Object? pgn = const $CopyWithPlaceholder(),
    Object? pgnStartBit = const $CopyWithPlaceholder(),
    Object? pgnStopBit = const $CopyWithPlaceholder(),
  }) {
    return DataLogValue(
      processDataDDI: processDataDDI == const $CopyWithPlaceholder()
          ? _value.processDataDDI
          // ignore: cast_nullable_to_non_nullable
          : processDataDDI as String,
      processDataValue: processDataValue == const $CopyWithPlaceholder()
          ? _value.processDataValue
          // ignore: cast_nullable_to_non_nullable
          : processDataValue as int,
      deviceElementIdRef: deviceElementIdRef == const $CopyWithPlaceholder()
          ? _value.deviceElementIdRef
          // ignore: cast_nullable_to_non_nullable
          : deviceElementIdRef as String,
      pgn: pgn == const $CopyWithPlaceholder()
          ? _value.pgn
          // ignore: cast_nullable_to_non_nullable
          : pgn as int?,
      pgnStartBit: pgnStartBit == const $CopyWithPlaceholder()
          ? _value.pgnStartBit
          // ignore: cast_nullable_to_non_nullable
          : pgnStartBit as int?,
      pgnStopBit: pgnStopBit == const $CopyWithPlaceholder()
          ? _value.pgnStopBit
          // ignore: cast_nullable_to_non_nullable
          : pgnStopBit as int?,
    );
  }
}

extension $DataLogValueCopyWith on DataLogValue {
  /// Returns a callable class that can be used as follows: `instanceOfDataLogValue.copyWith(...)` or like so:`instanceOfDataLogValue.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DataLogValueCWProxy get copyWith => _$DataLogValueCWProxyImpl(this);
}

abstract class _$ConnectionCWProxy {
  Connection deviceIdRef_0(String deviceIdRef_0);

  Connection deviceElementIdRef_0(String deviceElementIdRef_0);

  Connection deviceIdRef_1(String deviceIdRef_1);

  Connection deviceElementIdRef_1(String deviceElementIdRef_1);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Connection(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Connection(...).copyWith(id: 12, name: "My name")
  /// ````
  Connection call({
    String deviceIdRef_0,
    String deviceElementIdRef_0,
    String deviceIdRef_1,
    String deviceElementIdRef_1,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfConnection.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfConnection.copyWith.fieldName(...)`
class _$ConnectionCWProxyImpl implements _$ConnectionCWProxy {
  const _$ConnectionCWProxyImpl(this._value);

  final Connection _value;

  @override
  Connection deviceIdRef_0(String deviceIdRef_0) =>
      this(deviceIdRef_0: deviceIdRef_0);

  @override
  Connection deviceElementIdRef_0(String deviceElementIdRef_0) =>
      this(deviceElementIdRef_0: deviceElementIdRef_0);

  @override
  Connection deviceIdRef_1(String deviceIdRef_1) =>
      this(deviceIdRef_1: deviceIdRef_1);

  @override
  Connection deviceElementIdRef_1(String deviceElementIdRef_1) =>
      this(deviceElementIdRef_1: deviceElementIdRef_1);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Connection(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Connection(...).copyWith(id: 12, name: "My name")
  /// ````
  Connection call({
    Object? deviceIdRef_0 = const $CopyWithPlaceholder(),
    Object? deviceElementIdRef_0 = const $CopyWithPlaceholder(),
    Object? deviceIdRef_1 = const $CopyWithPlaceholder(),
    Object? deviceElementIdRef_1 = const $CopyWithPlaceholder(),
  }) {
    return Connection(
      deviceIdRef_0: deviceIdRef_0 == const $CopyWithPlaceholder()
          ? _value.deviceIdRef_0
          // ignore: cast_nullable_to_non_nullable
          : deviceIdRef_0 as String,
      deviceElementIdRef_0: deviceElementIdRef_0 == const $CopyWithPlaceholder()
          ? _value.deviceElementIdRef_0
          // ignore: cast_nullable_to_non_nullable
          : deviceElementIdRef_0 as String,
      deviceIdRef_1: deviceIdRef_1 == const $CopyWithPlaceholder()
          ? _value.deviceIdRef_1
          // ignore: cast_nullable_to_non_nullable
          : deviceIdRef_1 as String,
      deviceElementIdRef_1: deviceElementIdRef_1 == const $CopyWithPlaceholder()
          ? _value.deviceElementIdRef_1
          // ignore: cast_nullable_to_non_nullable
          : deviceElementIdRef_1 as String,
    );
  }
}

extension $ConnectionCopyWith on Connection {
  /// Returns a callable class that can be used as follows: `instanceOfConnection.copyWith(...)` or like so:`instanceOfConnection.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ConnectionCWProxy get copyWith => _$ConnectionCWProxyImpl(this);
}

abstract class _$ControlAssignmentCWProxy {
  ControlAssignment sourceClientNAME(String sourceClientNAME);

  ControlAssignment userClientNAME(String userClientNAME);

  ControlAssignment sourceDeviceStructureLabel(
      String sourceDeviceStructureLabel);

  ControlAssignment userDeviceStructureLabel(String userDeviceStructureLabel);

  ControlAssignment sourceDeviceElementNumber(int sourceDeviceElementNumber);

  ControlAssignment userDeviceElementNumber(int userDeviceElementNumber);

  ControlAssignment processDataDDI(String processDataDDI);

  ControlAssignment allocationStamp(AllocationStamp? allocationStamp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ControlAssignment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ControlAssignment(...).copyWith(id: 12, name: "My name")
  /// ````
  ControlAssignment call({
    String sourceClientNAME,
    String userClientNAME,
    String sourceDeviceStructureLabel,
    String userDeviceStructureLabel,
    int sourceDeviceElementNumber,
    int userDeviceElementNumber,
    String processDataDDI,
    AllocationStamp? allocationStamp,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfControlAssignment.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfControlAssignment.copyWith.fieldName(...)`
class _$ControlAssignmentCWProxyImpl implements _$ControlAssignmentCWProxy {
  const _$ControlAssignmentCWProxyImpl(this._value);

  final ControlAssignment _value;

  @override
  ControlAssignment sourceClientNAME(String sourceClientNAME) =>
      this(sourceClientNAME: sourceClientNAME);

  @override
  ControlAssignment userClientNAME(String userClientNAME) =>
      this(userClientNAME: userClientNAME);

  @override
  ControlAssignment sourceDeviceStructureLabel(
          String sourceDeviceStructureLabel) =>
      this(sourceDeviceStructureLabel: sourceDeviceStructureLabel);

  @override
  ControlAssignment userDeviceStructureLabel(String userDeviceStructureLabel) =>
      this(userDeviceStructureLabel: userDeviceStructureLabel);

  @override
  ControlAssignment sourceDeviceElementNumber(int sourceDeviceElementNumber) =>
      this(sourceDeviceElementNumber: sourceDeviceElementNumber);

  @override
  ControlAssignment userDeviceElementNumber(int userDeviceElementNumber) =>
      this(userDeviceElementNumber: userDeviceElementNumber);

  @override
  ControlAssignment processDataDDI(String processDataDDI) =>
      this(processDataDDI: processDataDDI);

  @override
  ControlAssignment allocationStamp(AllocationStamp? allocationStamp) =>
      this(allocationStamp: allocationStamp);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ControlAssignment(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ControlAssignment(...).copyWith(id: 12, name: "My name")
  /// ````
  ControlAssignment call({
    Object? sourceClientNAME = const $CopyWithPlaceholder(),
    Object? userClientNAME = const $CopyWithPlaceholder(),
    Object? sourceDeviceStructureLabel = const $CopyWithPlaceholder(),
    Object? userDeviceStructureLabel = const $CopyWithPlaceholder(),
    Object? sourceDeviceElementNumber = const $CopyWithPlaceholder(),
    Object? userDeviceElementNumber = const $CopyWithPlaceholder(),
    Object? processDataDDI = const $CopyWithPlaceholder(),
    Object? allocationStamp = const $CopyWithPlaceholder(),
  }) {
    return ControlAssignment(
      sourceClientNAME: sourceClientNAME == const $CopyWithPlaceholder()
          ? _value.sourceClientNAME
          // ignore: cast_nullable_to_non_nullable
          : sourceClientNAME as String,
      userClientNAME: userClientNAME == const $CopyWithPlaceholder()
          ? _value.userClientNAME
          // ignore: cast_nullable_to_non_nullable
          : userClientNAME as String,
      sourceDeviceStructureLabel:
          sourceDeviceStructureLabel == const $CopyWithPlaceholder()
              ? _value.sourceDeviceStructureLabel
              // ignore: cast_nullable_to_non_nullable
              : sourceDeviceStructureLabel as String,
      userDeviceStructureLabel:
          userDeviceStructureLabel == const $CopyWithPlaceholder()
              ? _value.userDeviceStructureLabel
              // ignore: cast_nullable_to_non_nullable
              : userDeviceStructureLabel as String,
      sourceDeviceElementNumber:
          sourceDeviceElementNumber == const $CopyWithPlaceholder()
              ? _value.sourceDeviceElementNumber
              // ignore: cast_nullable_to_non_nullable
              : sourceDeviceElementNumber as int,
      userDeviceElementNumber:
          userDeviceElementNumber == const $CopyWithPlaceholder()
              ? _value.userDeviceElementNumber
              // ignore: cast_nullable_to_non_nullable
              : userDeviceElementNumber as int,
      processDataDDI: processDataDDI == const $CopyWithPlaceholder()
          ? _value.processDataDDI
          // ignore: cast_nullable_to_non_nullable
          : processDataDDI as String,
      allocationStamp: allocationStamp == const $CopyWithPlaceholder()
          ? _value.allocationStamp
          // ignore: cast_nullable_to_non_nullable
          : allocationStamp as AllocationStamp?,
    );
  }
}

extension $ControlAssignmentCopyWith on ControlAssignment {
  /// Returns a callable class that can be used as follows: `instanceOfControlAssignment.copyWith(...)` or like so:`instanceOfControlAssignment.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ControlAssignmentCWProxy get copyWith =>
      _$ControlAssignmentCWProxyImpl(this);
}

abstract class _$DeviceCWProxy {
  Device id(String id);

  Device clientNAME(String clientNAME);

  Device structureLabel(String structureLabel);

  Device localizationLabel(String localizationLabel);

  Device elements(List<DeviceElement>? elements);

  Device properties(List<DeviceProperty>? properties);

  Device processData(List<DeviceProcessData>? processData);

  Device valuePresentations(List<DeviceValuePresentation>? valuePresentations);

  Device designator(String? designator);

  Device softwareVersion(String? softwareVersion);

  Device serialNumber(String? serialNumber);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Device(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Device(...).copyWith(id: 12, name: "My name")
  /// ````
  Device call({
    String id,
    String clientNAME,
    String structureLabel,
    String localizationLabel,
    List<DeviceElement>? elements,
    List<DeviceProperty>? properties,
    List<DeviceProcessData>? processData,
    List<DeviceValuePresentation>? valuePresentations,
    String? designator,
    String? softwareVersion,
    String? serialNumber,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDevice.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDevice.copyWith.fieldName(...)`
class _$DeviceCWProxyImpl implements _$DeviceCWProxy {
  const _$DeviceCWProxyImpl(this._value);

  final Device _value;

  @override
  Device id(String id) => this(id: id);

  @override
  Device clientNAME(String clientNAME) => this(clientNAME: clientNAME);

  @override
  Device structureLabel(String structureLabel) =>
      this(structureLabel: structureLabel);

  @override
  Device localizationLabel(String localizationLabel) =>
      this(localizationLabel: localizationLabel);

  @override
  Device elements(List<DeviceElement>? elements) => this(elements: elements);

  @override
  Device properties(List<DeviceProperty>? properties) =>
      this(properties: properties);

  @override
  Device processData(List<DeviceProcessData>? processData) =>
      this(processData: processData);

  @override
  Device valuePresentations(
          List<DeviceValuePresentation>? valuePresentations) =>
      this(valuePresentations: valuePresentations);

  @override
  Device designator(String? designator) => this(designator: designator);

  @override
  Device softwareVersion(String? softwareVersion) =>
      this(softwareVersion: softwareVersion);

  @override
  Device serialNumber(String? serialNumber) => this(serialNumber: serialNumber);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Device(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Device(...).copyWith(id: 12, name: "My name")
  /// ````
  Device call({
    Object? id = const $CopyWithPlaceholder(),
    Object? clientNAME = const $CopyWithPlaceholder(),
    Object? structureLabel = const $CopyWithPlaceholder(),
    Object? localizationLabel = const $CopyWithPlaceholder(),
    Object? elements = const $CopyWithPlaceholder(),
    Object? properties = const $CopyWithPlaceholder(),
    Object? processData = const $CopyWithPlaceholder(),
    Object? valuePresentations = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? softwareVersion = const $CopyWithPlaceholder(),
    Object? serialNumber = const $CopyWithPlaceholder(),
  }) {
    return Device(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      clientNAME: clientNAME == const $CopyWithPlaceholder()
          ? _value.clientNAME
          // ignore: cast_nullable_to_non_nullable
          : clientNAME as String,
      structureLabel: structureLabel == const $CopyWithPlaceholder()
          ? _value.structureLabel
          // ignore: cast_nullable_to_non_nullable
          : structureLabel as String,
      localizationLabel: localizationLabel == const $CopyWithPlaceholder()
          ? _value.localizationLabel
          // ignore: cast_nullable_to_non_nullable
          : localizationLabel as String,
      elements: elements == const $CopyWithPlaceholder()
          ? _value.elements
          // ignore: cast_nullable_to_non_nullable
          : elements as List<DeviceElement>?,
      properties: properties == const $CopyWithPlaceholder()
          ? _value.properties
          // ignore: cast_nullable_to_non_nullable
          : properties as List<DeviceProperty>?,
      processData: processData == const $CopyWithPlaceholder()
          ? _value.processData
          // ignore: cast_nullable_to_non_nullable
          : processData as List<DeviceProcessData>?,
      valuePresentations: valuePresentations == const $CopyWithPlaceholder()
          ? _value.valuePresentations
          // ignore: cast_nullable_to_non_nullable
          : valuePresentations as List<DeviceValuePresentation>?,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String?,
      softwareVersion: softwareVersion == const $CopyWithPlaceholder()
          ? _value.softwareVersion
          // ignore: cast_nullable_to_non_nullable
          : softwareVersion as String?,
      serialNumber: serialNumber == const $CopyWithPlaceholder()
          ? _value.serialNumber
          // ignore: cast_nullable_to_non_nullable
          : serialNumber as String?,
    );
  }
}

extension $DeviceCopyWith on Device {
  /// Returns a callable class that can be used as follows: `instanceOfDevice.copyWith(...)` or like so:`instanceOfDevice.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeviceCWProxy get copyWith => _$DeviceCWProxyImpl(this);
}

abstract class _$DeviceAllocationCWProxy {
  DeviceAllocation clientNAMEValue(String clientNAMEValue);

  DeviceAllocation clientNAMEMask(String? clientNAMEMask);

  DeviceAllocation deviceIdRef(String? deviceIdRef);

  DeviceAllocation allocationStamp(AllocationStamp? allocationStamp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceAllocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceAllocation(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceAllocation call({
    String clientNAMEValue,
    String? clientNAMEMask,
    String? deviceIdRef,
    AllocationStamp? allocationStamp,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeviceAllocation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeviceAllocation.copyWith.fieldName(...)`
class _$DeviceAllocationCWProxyImpl implements _$DeviceAllocationCWProxy {
  const _$DeviceAllocationCWProxyImpl(this._value);

  final DeviceAllocation _value;

  @override
  DeviceAllocation clientNAMEValue(String clientNAMEValue) =>
      this(clientNAMEValue: clientNAMEValue);

  @override
  DeviceAllocation clientNAMEMask(String? clientNAMEMask) =>
      this(clientNAMEMask: clientNAMEMask);

  @override
  DeviceAllocation deviceIdRef(String? deviceIdRef) =>
      this(deviceIdRef: deviceIdRef);

  @override
  DeviceAllocation allocationStamp(AllocationStamp? allocationStamp) =>
      this(allocationStamp: allocationStamp);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceAllocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceAllocation(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceAllocation call({
    Object? clientNAMEValue = const $CopyWithPlaceholder(),
    Object? clientNAMEMask = const $CopyWithPlaceholder(),
    Object? deviceIdRef = const $CopyWithPlaceholder(),
    Object? allocationStamp = const $CopyWithPlaceholder(),
  }) {
    return DeviceAllocation(
      clientNAMEValue: clientNAMEValue == const $CopyWithPlaceholder()
          ? _value.clientNAMEValue
          // ignore: cast_nullable_to_non_nullable
          : clientNAMEValue as String,
      clientNAMEMask: clientNAMEMask == const $CopyWithPlaceholder()
          ? _value.clientNAMEMask
          // ignore: cast_nullable_to_non_nullable
          : clientNAMEMask as String?,
      deviceIdRef: deviceIdRef == const $CopyWithPlaceholder()
          ? _value.deviceIdRef
          // ignore: cast_nullable_to_non_nullable
          : deviceIdRef as String?,
      allocationStamp: allocationStamp == const $CopyWithPlaceholder()
          ? _value.allocationStamp
          // ignore: cast_nullable_to_non_nullable
          : allocationStamp as AllocationStamp?,
    );
  }
}

extension $DeviceAllocationCopyWith on DeviceAllocation {
  /// Returns a callable class that can be used as follows: `instanceOfDeviceAllocation.copyWith(...)` or like so:`instanceOfDeviceAllocation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeviceAllocationCWProxy get copyWith => _$DeviceAllocationCWProxyImpl(this);
}

abstract class _$DeviceElementCWProxy {
  DeviceElement id(String id);

  DeviceElement objectId(int objectId);

  DeviceElement type(DeviceElementType type);

  DeviceElement number(int number);

  DeviceElement parentObjectId(int parentObjectId);

  DeviceElement objectReferences(List<DeviceObjectReference>? objectReferences);

  DeviceElement designator(String? designator);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceElement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceElement(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceElement call({
    String id,
    int objectId,
    DeviceElementType type,
    int number,
    int parentObjectId,
    List<DeviceObjectReference>? objectReferences,
    String? designator,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeviceElement.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeviceElement.copyWith.fieldName(...)`
class _$DeviceElementCWProxyImpl implements _$DeviceElementCWProxy {
  const _$DeviceElementCWProxyImpl(this._value);

  final DeviceElement _value;

  @override
  DeviceElement id(String id) => this(id: id);

  @override
  DeviceElement objectId(int objectId) => this(objectId: objectId);

  @override
  DeviceElement type(DeviceElementType type) => this(type: type);

  @override
  DeviceElement number(int number) => this(number: number);

  @override
  DeviceElement parentObjectId(int parentObjectId) =>
      this(parentObjectId: parentObjectId);

  @override
  DeviceElement objectReferences(
          List<DeviceObjectReference>? objectReferences) =>
      this(objectReferences: objectReferences);

  @override
  DeviceElement designator(String? designator) => this(designator: designator);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceElement(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceElement(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceElement call({
    Object? id = const $CopyWithPlaceholder(),
    Object? objectId = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? number = const $CopyWithPlaceholder(),
    Object? parentObjectId = const $CopyWithPlaceholder(),
    Object? objectReferences = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
  }) {
    return DeviceElement(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      objectId: objectId == const $CopyWithPlaceholder()
          ? _value.objectId
          // ignore: cast_nullable_to_non_nullable
          : objectId as int,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as DeviceElementType,
      number: number == const $CopyWithPlaceholder()
          ? _value.number
          // ignore: cast_nullable_to_non_nullable
          : number as int,
      parentObjectId: parentObjectId == const $CopyWithPlaceholder()
          ? _value.parentObjectId
          // ignore: cast_nullable_to_non_nullable
          : parentObjectId as int,
      objectReferences: objectReferences == const $CopyWithPlaceholder()
          ? _value.objectReferences
          // ignore: cast_nullable_to_non_nullable
          : objectReferences as List<DeviceObjectReference>?,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String?,
    );
  }
}

extension $DeviceElementCopyWith on DeviceElement {
  /// Returns a callable class that can be used as follows: `instanceOfDeviceElement.copyWith(...)` or like so:`instanceOfDeviceElement.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeviceElementCWProxy get copyWith => _$DeviceElementCWProxyImpl(this);
}

abstract class _$DeviceObjectReferenceCWProxy {
  DeviceObjectReference objectId(int objectId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceObjectReference(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceObjectReference(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceObjectReference call({
    int objectId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeviceObjectReference.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeviceObjectReference.copyWith.fieldName(...)`
class _$DeviceObjectReferenceCWProxyImpl
    implements _$DeviceObjectReferenceCWProxy {
  const _$DeviceObjectReferenceCWProxyImpl(this._value);

  final DeviceObjectReference _value;

  @override
  DeviceObjectReference objectId(int objectId) => this(objectId: objectId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceObjectReference(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceObjectReference(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceObjectReference call({
    Object? objectId = const $CopyWithPlaceholder(),
  }) {
    return DeviceObjectReference(
      objectId: objectId == const $CopyWithPlaceholder()
          ? _value.objectId
          // ignore: cast_nullable_to_non_nullable
          : objectId as int,
    );
  }
}

extension $DeviceObjectReferenceCopyWith on DeviceObjectReference {
  /// Returns a callable class that can be used as follows: `instanceOfDeviceObjectReference.copyWith(...)` or like so:`instanceOfDeviceObjectReference.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeviceObjectReferenceCWProxy get copyWith =>
      _$DeviceObjectReferenceCWProxyImpl(this);
}

abstract class _$DeviceProcessDataCWProxy {
  DeviceProcessData objectId(int objectId);

  DeviceProcessData ddi(String ddi);

  DeviceProcessData property(int property);

  DeviceProcessData triggerMethods(int triggerMethods);

  DeviceProcessData designator(String? designator);

  DeviceProcessData presentationObjectId(int? presentationObjectId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceProcessData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceProcessData(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceProcessData call({
    int objectId,
    String ddi,
    int property,
    int triggerMethods,
    String? designator,
    int? presentationObjectId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeviceProcessData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeviceProcessData.copyWith.fieldName(...)`
class _$DeviceProcessDataCWProxyImpl implements _$DeviceProcessDataCWProxy {
  const _$DeviceProcessDataCWProxyImpl(this._value);

  final DeviceProcessData _value;

  @override
  DeviceProcessData objectId(int objectId) => this(objectId: objectId);

  @override
  DeviceProcessData ddi(String ddi) => this(ddi: ddi);

  @override
  DeviceProcessData property(int property) => this(property: property);

  @override
  DeviceProcessData triggerMethods(int triggerMethods) =>
      this(triggerMethods: triggerMethods);

  @override
  DeviceProcessData designator(String? designator) =>
      this(designator: designator);

  @override
  DeviceProcessData presentationObjectId(int? presentationObjectId) =>
      this(presentationObjectId: presentationObjectId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceProcessData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceProcessData(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceProcessData call({
    Object? objectId = const $CopyWithPlaceholder(),
    Object? ddi = const $CopyWithPlaceholder(),
    Object? property = const $CopyWithPlaceholder(),
    Object? triggerMethods = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? presentationObjectId = const $CopyWithPlaceholder(),
  }) {
    return DeviceProcessData(
      objectId: objectId == const $CopyWithPlaceholder()
          ? _value.objectId
          // ignore: cast_nullable_to_non_nullable
          : objectId as int,
      ddi: ddi == const $CopyWithPlaceholder()
          ? _value.ddi
          // ignore: cast_nullable_to_non_nullable
          : ddi as String,
      property: property == const $CopyWithPlaceholder()
          ? _value.property
          // ignore: cast_nullable_to_non_nullable
          : property as int,
      triggerMethods: triggerMethods == const $CopyWithPlaceholder()
          ? _value.triggerMethods
          // ignore: cast_nullable_to_non_nullable
          : triggerMethods as int,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String?,
      presentationObjectId: presentationObjectId == const $CopyWithPlaceholder()
          ? _value.presentationObjectId
          // ignore: cast_nullable_to_non_nullable
          : presentationObjectId as int?,
    );
  }
}

extension $DeviceProcessDataCopyWith on DeviceProcessData {
  /// Returns a callable class that can be used as follows: `instanceOfDeviceProcessData.copyWith(...)` or like so:`instanceOfDeviceProcessData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeviceProcessDataCWProxy get copyWith =>
      _$DeviceProcessDataCWProxyImpl(this);
}

abstract class _$DevicePropertyCWProxy {
  DeviceProperty objectId(int objectId);

  DeviceProperty ddi(String ddi);

  DeviceProperty value(int value);

  DeviceProperty designator(String? designator);

  DeviceProperty valuePresentationObjectId(int? valuePresentationObjectId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceProperty(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceProperty(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceProperty call({
    int objectId,
    String ddi,
    int value,
    String? designator,
    int? valuePresentationObjectId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeviceProperty.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeviceProperty.copyWith.fieldName(...)`
class _$DevicePropertyCWProxyImpl implements _$DevicePropertyCWProxy {
  const _$DevicePropertyCWProxyImpl(this._value);

  final DeviceProperty _value;

  @override
  DeviceProperty objectId(int objectId) => this(objectId: objectId);

  @override
  DeviceProperty ddi(String ddi) => this(ddi: ddi);

  @override
  DeviceProperty value(int value) => this(value: value);

  @override
  DeviceProperty designator(String? designator) => this(designator: designator);

  @override
  DeviceProperty valuePresentationObjectId(int? valuePresentationObjectId) =>
      this(valuePresentationObjectId: valuePresentationObjectId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceProperty(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceProperty(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceProperty call({
    Object? objectId = const $CopyWithPlaceholder(),
    Object? ddi = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? valuePresentationObjectId = const $CopyWithPlaceholder(),
  }) {
    return DeviceProperty(
      objectId: objectId == const $CopyWithPlaceholder()
          ? _value.objectId
          // ignore: cast_nullable_to_non_nullable
          : objectId as int,
      ddi: ddi == const $CopyWithPlaceholder()
          ? _value.ddi
          // ignore: cast_nullable_to_non_nullable
          : ddi as String,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as int,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String?,
      valuePresentationObjectId:
          valuePresentationObjectId == const $CopyWithPlaceholder()
              ? _value.valuePresentationObjectId
              // ignore: cast_nullable_to_non_nullable
              : valuePresentationObjectId as int?,
    );
  }
}

extension $DevicePropertyCopyWith on DeviceProperty {
  /// Returns a callable class that can be used as follows: `instanceOfDeviceProperty.copyWith(...)` or like so:`instanceOfDeviceProperty.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DevicePropertyCWProxy get copyWith => _$DevicePropertyCWProxyImpl(this);
}

abstract class _$DeviceValuePresentationCWProxy {
  DeviceValuePresentation objectId(int objectId);

  DeviceValuePresentation offset(int offset);

  DeviceValuePresentation scale(double scale);

  DeviceValuePresentation numberOfDecimals(int numberOfDecimals);

  DeviceValuePresentation unitDesignator(String? unitDesignator);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceValuePresentation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceValuePresentation(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceValuePresentation call({
    int objectId,
    int offset,
    double scale,
    int numberOfDecimals,
    String? unitDesignator,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeviceValuePresentation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeviceValuePresentation.copyWith.fieldName(...)`
class _$DeviceValuePresentationCWProxyImpl
    implements _$DeviceValuePresentationCWProxy {
  const _$DeviceValuePresentationCWProxyImpl(this._value);

  final DeviceValuePresentation _value;

  @override
  DeviceValuePresentation objectId(int objectId) => this(objectId: objectId);

  @override
  DeviceValuePresentation offset(int offset) => this(offset: offset);

  @override
  DeviceValuePresentation scale(double scale) => this(scale: scale);

  @override
  DeviceValuePresentation numberOfDecimals(int numberOfDecimals) =>
      this(numberOfDecimals: numberOfDecimals);

  @override
  DeviceValuePresentation unitDesignator(String? unitDesignator) =>
      this(unitDesignator: unitDesignator);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeviceValuePresentation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeviceValuePresentation(...).copyWith(id: 12, name: "My name")
  /// ````
  DeviceValuePresentation call({
    Object? objectId = const $CopyWithPlaceholder(),
    Object? offset = const $CopyWithPlaceholder(),
    Object? scale = const $CopyWithPlaceholder(),
    Object? numberOfDecimals = const $CopyWithPlaceholder(),
    Object? unitDesignator = const $CopyWithPlaceholder(),
  }) {
    return DeviceValuePresentation(
      objectId: objectId == const $CopyWithPlaceholder()
          ? _value.objectId
          // ignore: cast_nullable_to_non_nullable
          : objectId as int,
      offset: offset == const $CopyWithPlaceholder()
          ? _value.offset
          // ignore: cast_nullable_to_non_nullable
          : offset as int,
      scale: scale == const $CopyWithPlaceholder()
          ? _value.scale
          // ignore: cast_nullable_to_non_nullable
          : scale as double,
      numberOfDecimals: numberOfDecimals == const $CopyWithPlaceholder()
          ? _value.numberOfDecimals
          // ignore: cast_nullable_to_non_nullable
          : numberOfDecimals as int,
      unitDesignator: unitDesignator == const $CopyWithPlaceholder()
          ? _value.unitDesignator
          // ignore: cast_nullable_to_non_nullable
          : unitDesignator as String?,
    );
  }
}

extension $DeviceValuePresentationCopyWith on DeviceValuePresentation {
  /// Returns a callable class that can be used as follows: `instanceOfDeviceValuePresentation.copyWith(...)` or like so:`instanceOfDeviceValuePresentation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeviceValuePresentationCWProxy get copyWith =>
      _$DeviceValuePresentationCWProxyImpl(this);
}

abstract class _$AttachedFileCWProxy {
  AttachedFile filenameWithExtension(String filenameWithExtension);

  AttachedFile preserve(Preserve preserve);

  AttachedFile manufacturerGLN(String manufacturerGLN);

  AttachedFile fileType(int fileType);

  AttachedFile fileVersion(String? fileVersion);

  AttachedFile fileLength(int? fileLength);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AttachedFile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AttachedFile(...).copyWith(id: 12, name: "My name")
  /// ````
  AttachedFile call({
    String filenameWithExtension,
    Preserve preserve,
    String manufacturerGLN,
    int fileType,
    String? fileVersion,
    int? fileLength,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAttachedFile.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAttachedFile.copyWith.fieldName(...)`
class _$AttachedFileCWProxyImpl implements _$AttachedFileCWProxy {
  const _$AttachedFileCWProxyImpl(this._value);

  final AttachedFile _value;

  @override
  AttachedFile filenameWithExtension(String filenameWithExtension) =>
      this(filenameWithExtension: filenameWithExtension);

  @override
  AttachedFile preserve(Preserve preserve) => this(preserve: preserve);

  @override
  AttachedFile manufacturerGLN(String manufacturerGLN) =>
      this(manufacturerGLN: manufacturerGLN);

  @override
  AttachedFile fileType(int fileType) => this(fileType: fileType);

  @override
  AttachedFile fileVersion(String? fileVersion) =>
      this(fileVersion: fileVersion);

  @override
  AttachedFile fileLength(int? fileLength) => this(fileLength: fileLength);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AttachedFile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AttachedFile(...).copyWith(id: 12, name: "My name")
  /// ````
  AttachedFile call({
    Object? filenameWithExtension = const $CopyWithPlaceholder(),
    Object? preserve = const $CopyWithPlaceholder(),
    Object? manufacturerGLN = const $CopyWithPlaceholder(),
    Object? fileType = const $CopyWithPlaceholder(),
    Object? fileVersion = const $CopyWithPlaceholder(),
    Object? fileLength = const $CopyWithPlaceholder(),
  }) {
    return AttachedFile(
      filenameWithExtension:
          filenameWithExtension == const $CopyWithPlaceholder()
              ? _value.filenameWithExtension
              // ignore: cast_nullable_to_non_nullable
              : filenameWithExtension as String,
      preserve: preserve == const $CopyWithPlaceholder()
          ? _value.preserve
          // ignore: cast_nullable_to_non_nullable
          : preserve as Preserve,
      manufacturerGLN: manufacturerGLN == const $CopyWithPlaceholder()
          ? _value.manufacturerGLN
          // ignore: cast_nullable_to_non_nullable
          : manufacturerGLN as String,
      fileType: fileType == const $CopyWithPlaceholder()
          ? _value.fileType
          // ignore: cast_nullable_to_non_nullable
          : fileType as int,
      fileVersion: fileVersion == const $CopyWithPlaceholder()
          ? _value.fileVersion
          // ignore: cast_nullable_to_non_nullable
          : fileVersion as String?,
      fileLength: fileLength == const $CopyWithPlaceholder()
          ? _value.fileLength
          // ignore: cast_nullable_to_non_nullable
          : fileLength as int?,
    );
  }
}

extension $AttachedFileCopyWith on AttachedFile {
  /// Returns a callable class that can be used as follows: `instanceOfAttachedFile.copyWith(...)` or like so:`instanceOfAttachedFile.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AttachedFileCWProxy get copyWith => _$AttachedFileCWProxyImpl(this);
}

abstract class _$ExternalFileContentsCWProxy {
  ExternalFileContents attachedFiles(List<AttachedFile>? attachedFiles);

  ExternalFileContents baseStations(List<BaseStation>? baseStations);

  ExternalFileContents codedComments(List<CodedComment>? codedComments);

  ExternalFileContents codedCommentGroups(
      List<CodedCommentGroup>? codedCommentGroups);

  ExternalFileContents colourLegends(List<ColourLegend>? colourLegends);

  ExternalFileContents cropTypes(List<CropType>? cropTypes);

  ExternalFileContents culturalPractices(
      List<CulturalPractice>? culturalPractices);

  ExternalFileContents customers(List<Customer>? customers);

  ExternalFileContents devices(List<Device>? devices);

  ExternalFileContents farms(List<Farm>? farms);

  ExternalFileContents operationTechniques(
      List<OperationTechnique>? operationTechniques);

  ExternalFileContents partfields(List<Partfield>? partfields);

  ExternalFileContents products(List<Product>? products);

  ExternalFileContents productGroups(List<ProductGroup>? productGroups);

  ExternalFileContents tasks(List<Task>? tasks);

  ExternalFileContents valuePresentations(
      List<ValuePresentation>? valuePresentations);

  ExternalFileContents workers(List<Worker>? workers);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExternalFileContents(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExternalFileContents(...).copyWith(id: 12, name: "My name")
  /// ````
  ExternalFileContents call({
    List<AttachedFile>? attachedFiles,
    List<BaseStation>? baseStations,
    List<CodedComment>? codedComments,
    List<CodedCommentGroup>? codedCommentGroups,
    List<ColourLegend>? colourLegends,
    List<CropType>? cropTypes,
    List<CulturalPractice>? culturalPractices,
    List<Customer>? customers,
    List<Device>? devices,
    List<Farm>? farms,
    List<OperationTechnique>? operationTechniques,
    List<Partfield>? partfields,
    List<Product>? products,
    List<ProductGroup>? productGroups,
    List<Task>? tasks,
    List<ValuePresentation>? valuePresentations,
    List<Worker>? workers,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExternalFileContents.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExternalFileContents.copyWith.fieldName(...)`
class _$ExternalFileContentsCWProxyImpl
    implements _$ExternalFileContentsCWProxy {
  const _$ExternalFileContentsCWProxyImpl(this._value);

  final ExternalFileContents _value;

  @override
  ExternalFileContents attachedFiles(List<AttachedFile>? attachedFiles) =>
      this(attachedFiles: attachedFiles);

  @override
  ExternalFileContents baseStations(List<BaseStation>? baseStations) =>
      this(baseStations: baseStations);

  @override
  ExternalFileContents codedComments(List<CodedComment>? codedComments) =>
      this(codedComments: codedComments);

  @override
  ExternalFileContents codedCommentGroups(
          List<CodedCommentGroup>? codedCommentGroups) =>
      this(codedCommentGroups: codedCommentGroups);

  @override
  ExternalFileContents colourLegends(List<ColourLegend>? colourLegends) =>
      this(colourLegends: colourLegends);

  @override
  ExternalFileContents cropTypes(List<CropType>? cropTypes) =>
      this(cropTypes: cropTypes);

  @override
  ExternalFileContents culturalPractices(
          List<CulturalPractice>? culturalPractices) =>
      this(culturalPractices: culturalPractices);

  @override
  ExternalFileContents customers(List<Customer>? customers) =>
      this(customers: customers);

  @override
  ExternalFileContents devices(List<Device>? devices) => this(devices: devices);

  @override
  ExternalFileContents farms(List<Farm>? farms) => this(farms: farms);

  @override
  ExternalFileContents operationTechniques(
          List<OperationTechnique>? operationTechniques) =>
      this(operationTechniques: operationTechniques);

  @override
  ExternalFileContents partfields(List<Partfield>? partfields) =>
      this(partfields: partfields);

  @override
  ExternalFileContents products(List<Product>? products) =>
      this(products: products);

  @override
  ExternalFileContents productGroups(List<ProductGroup>? productGroups) =>
      this(productGroups: productGroups);

  @override
  ExternalFileContents tasks(List<Task>? tasks) => this(tasks: tasks);

  @override
  ExternalFileContents valuePresentations(
          List<ValuePresentation>? valuePresentations) =>
      this(valuePresentations: valuePresentations);

  @override
  ExternalFileContents workers(List<Worker>? workers) => this(workers: workers);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExternalFileContents(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExternalFileContents(...).copyWith(id: 12, name: "My name")
  /// ````
  ExternalFileContents call({
    Object? attachedFiles = const $CopyWithPlaceholder(),
    Object? baseStations = const $CopyWithPlaceholder(),
    Object? codedComments = const $CopyWithPlaceholder(),
    Object? codedCommentGroups = const $CopyWithPlaceholder(),
    Object? colourLegends = const $CopyWithPlaceholder(),
    Object? cropTypes = const $CopyWithPlaceholder(),
    Object? culturalPractices = const $CopyWithPlaceholder(),
    Object? customers = const $CopyWithPlaceholder(),
    Object? devices = const $CopyWithPlaceholder(),
    Object? farms = const $CopyWithPlaceholder(),
    Object? operationTechniques = const $CopyWithPlaceholder(),
    Object? partfields = const $CopyWithPlaceholder(),
    Object? products = const $CopyWithPlaceholder(),
    Object? productGroups = const $CopyWithPlaceholder(),
    Object? tasks = const $CopyWithPlaceholder(),
    Object? valuePresentations = const $CopyWithPlaceholder(),
    Object? workers = const $CopyWithPlaceholder(),
  }) {
    return ExternalFileContents(
      attachedFiles: attachedFiles == const $CopyWithPlaceholder()
          ? _value.attachedFiles
          // ignore: cast_nullable_to_non_nullable
          : attachedFiles as List<AttachedFile>?,
      baseStations: baseStations == const $CopyWithPlaceholder()
          ? _value.baseStations
          // ignore: cast_nullable_to_non_nullable
          : baseStations as List<BaseStation>?,
      codedComments: codedComments == const $CopyWithPlaceholder()
          ? _value.codedComments
          // ignore: cast_nullable_to_non_nullable
          : codedComments as List<CodedComment>?,
      codedCommentGroups: codedCommentGroups == const $CopyWithPlaceholder()
          ? _value.codedCommentGroups
          // ignore: cast_nullable_to_non_nullable
          : codedCommentGroups as List<CodedCommentGroup>?,
      colourLegends: colourLegends == const $CopyWithPlaceholder()
          ? _value.colourLegends
          // ignore: cast_nullable_to_non_nullable
          : colourLegends as List<ColourLegend>?,
      cropTypes: cropTypes == const $CopyWithPlaceholder()
          ? _value.cropTypes
          // ignore: cast_nullable_to_non_nullable
          : cropTypes as List<CropType>?,
      culturalPractices: culturalPractices == const $CopyWithPlaceholder()
          ? _value.culturalPractices
          // ignore: cast_nullable_to_non_nullable
          : culturalPractices as List<CulturalPractice>?,
      customers: customers == const $CopyWithPlaceholder()
          ? _value.customers
          // ignore: cast_nullable_to_non_nullable
          : customers as List<Customer>?,
      devices: devices == const $CopyWithPlaceholder()
          ? _value.devices
          // ignore: cast_nullable_to_non_nullable
          : devices as List<Device>?,
      farms: farms == const $CopyWithPlaceholder()
          ? _value.farms
          // ignore: cast_nullable_to_non_nullable
          : farms as List<Farm>?,
      operationTechniques: operationTechniques == const $CopyWithPlaceholder()
          ? _value.operationTechniques
          // ignore: cast_nullable_to_non_nullable
          : operationTechniques as List<OperationTechnique>?,
      partfields: partfields == const $CopyWithPlaceholder()
          ? _value.partfields
          // ignore: cast_nullable_to_non_nullable
          : partfields as List<Partfield>?,
      products: products == const $CopyWithPlaceholder()
          ? _value.products
          // ignore: cast_nullable_to_non_nullable
          : products as List<Product>?,
      productGroups: productGroups == const $CopyWithPlaceholder()
          ? _value.productGroups
          // ignore: cast_nullable_to_non_nullable
          : productGroups as List<ProductGroup>?,
      tasks: tasks == const $CopyWithPlaceholder()
          ? _value.tasks
          // ignore: cast_nullable_to_non_nullable
          : tasks as List<Task>?,
      valuePresentations: valuePresentations == const $CopyWithPlaceholder()
          ? _value.valuePresentations
          // ignore: cast_nullable_to_non_nullable
          : valuePresentations as List<ValuePresentation>?,
      workers: workers == const $CopyWithPlaceholder()
          ? _value.workers
          // ignore: cast_nullable_to_non_nullable
          : workers as List<Worker>?,
    );
  }
}

extension $ExternalFileContentsCopyWith on ExternalFileContents {
  /// Returns a callable class that can be used as follows: `instanceOfExternalFileContents.copyWith(...)` or like so:`instanceOfExternalFileContents.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExternalFileContentsCWProxy get copyWith =>
      _$ExternalFileContentsCWProxyImpl(this);
}

abstract class _$ExternalFileReferenceCWProxy {
  ExternalFileReference filename(String filename);

  ExternalFileReference filetype(FileType? filetype);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExternalFileReference(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExternalFileReference(...).copyWith(id: 12, name: "My name")
  /// ````
  ExternalFileReference call({
    String filename,
    FileType? filetype,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExternalFileReference.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExternalFileReference.copyWith.fieldName(...)`
class _$ExternalFileReferenceCWProxyImpl
    implements _$ExternalFileReferenceCWProxy {
  const _$ExternalFileReferenceCWProxyImpl(this._value);

  final ExternalFileReference _value;

  @override
  ExternalFileReference filename(String filename) => this(filename: filename);

  @override
  ExternalFileReference filetype(FileType? filetype) =>
      this(filetype: filetype);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExternalFileReference(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExternalFileReference(...).copyWith(id: 12, name: "My name")
  /// ````
  ExternalFileReference call({
    Object? filename = const $CopyWithPlaceholder(),
    Object? filetype = const $CopyWithPlaceholder(),
  }) {
    return ExternalFileReference(
      filename: filename == const $CopyWithPlaceholder()
          ? _value.filename
          // ignore: cast_nullable_to_non_nullable
          : filename as String,
      filetype: filetype == const $CopyWithPlaceholder()
          ? _value.filetype
          // ignore: cast_nullable_to_non_nullable
          : filetype as FileType?,
    );
  }
}

extension $ExternalFileReferenceCopyWith on ExternalFileReference {
  /// Returns a callable class that can be used as follows: `instanceOfExternalFileReference.copyWith(...)` or like so:`instanceOfExternalFileReference.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExternalFileReferenceCWProxy get copyWith =>
      _$ExternalFileReferenceCWProxyImpl(this);
}

abstract class _$GridCWProxy {
  Grid minimumNorthPosition(double minimumNorthPosition);

  Grid minimumEastPosition(double minimumEastPosition);

  Grid cellNorthSize(double cellNorthSize);

  Grid cellEastSize(double cellEastSize);

  Grid maximumColumn(int maximumColumn);

  Grid maximumRow(int maximumRow);

  Grid fileName(String fileName);

  Grid type(GridType type);

  Grid byteData(Uint8List? byteData);

  Grid fileLength(int? fileLength);

  Grid treatmentZoneCode(int? treatmentZoneCode);

  Grid treatmentZoneCodeGrid(List<List<int>>? treatmentZoneCodeGrid);

  Grid numberOfProcessDataVariables(int? numberOfProcessDataVariables);

  Grid processDataValueGrid(List<List<List<int>>>? processDataValueGrid);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Grid(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Grid(...).copyWith(id: 12, name: "My name")
  /// ````
  Grid call({
    double minimumNorthPosition,
    double minimumEastPosition,
    double cellNorthSize,
    double cellEastSize,
    int maximumColumn,
    int maximumRow,
    String fileName,
    GridType type,
    Uint8List? byteData,
    int? fileLength,
    int? treatmentZoneCode,
    List<List<int>>? treatmentZoneCodeGrid,
    int? numberOfProcessDataVariables,
    List<List<List<int>>>? processDataValueGrid,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGrid.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGrid.copyWith.fieldName(...)`
class _$GridCWProxyImpl implements _$GridCWProxy {
  const _$GridCWProxyImpl(this._value);

  final Grid _value;

  @override
  Grid minimumNorthPosition(double minimumNorthPosition) =>
      this(minimumNorthPosition: minimumNorthPosition);

  @override
  Grid minimumEastPosition(double minimumEastPosition) =>
      this(minimumEastPosition: minimumEastPosition);

  @override
  Grid cellNorthSize(double cellNorthSize) =>
      this(cellNorthSize: cellNorthSize);

  @override
  Grid cellEastSize(double cellEastSize) => this(cellEastSize: cellEastSize);

  @override
  Grid maximumColumn(int maximumColumn) => this(maximumColumn: maximumColumn);

  @override
  Grid maximumRow(int maximumRow) => this(maximumRow: maximumRow);

  @override
  Grid fileName(String fileName) => this(fileName: fileName);

  @override
  Grid type(GridType type) => this(type: type);

  @override
  Grid byteData(Uint8List? byteData) => this(byteData: byteData);

  @override
  Grid fileLength(int? fileLength) => this(fileLength: fileLength);

  @override
  Grid treatmentZoneCode(int? treatmentZoneCode) =>
      this(treatmentZoneCode: treatmentZoneCode);

  @override
  Grid treatmentZoneCodeGrid(List<List<int>>? treatmentZoneCodeGrid) =>
      this(treatmentZoneCodeGrid: treatmentZoneCodeGrid);

  @override
  Grid numberOfProcessDataVariables(int? numberOfProcessDataVariables) =>
      this(numberOfProcessDataVariables: numberOfProcessDataVariables);

  @override
  Grid processDataValueGrid(List<List<List<int>>>? processDataValueGrid) =>
      this(processDataValueGrid: processDataValueGrid);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Grid(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Grid(...).copyWith(id: 12, name: "My name")
  /// ````
  Grid call({
    Object? minimumNorthPosition = const $CopyWithPlaceholder(),
    Object? minimumEastPosition = const $CopyWithPlaceholder(),
    Object? cellNorthSize = const $CopyWithPlaceholder(),
    Object? cellEastSize = const $CopyWithPlaceholder(),
    Object? maximumColumn = const $CopyWithPlaceholder(),
    Object? maximumRow = const $CopyWithPlaceholder(),
    Object? fileName = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? byteData = const $CopyWithPlaceholder(),
    Object? fileLength = const $CopyWithPlaceholder(),
    Object? treatmentZoneCode = const $CopyWithPlaceholder(),
    Object? treatmentZoneCodeGrid = const $CopyWithPlaceholder(),
    Object? numberOfProcessDataVariables = const $CopyWithPlaceholder(),
    Object? processDataValueGrid = const $CopyWithPlaceholder(),
  }) {
    return Grid(
      minimumNorthPosition: minimumNorthPosition == const $CopyWithPlaceholder()
          ? _value.minimumNorthPosition
          // ignore: cast_nullable_to_non_nullable
          : minimumNorthPosition as double,
      minimumEastPosition: minimumEastPosition == const $CopyWithPlaceholder()
          ? _value.minimumEastPosition
          // ignore: cast_nullable_to_non_nullable
          : minimumEastPosition as double,
      cellNorthSize: cellNorthSize == const $CopyWithPlaceholder()
          ? _value.cellNorthSize
          // ignore: cast_nullable_to_non_nullable
          : cellNorthSize as double,
      cellEastSize: cellEastSize == const $CopyWithPlaceholder()
          ? _value.cellEastSize
          // ignore: cast_nullable_to_non_nullable
          : cellEastSize as double,
      maximumColumn: maximumColumn == const $CopyWithPlaceholder()
          ? _value.maximumColumn
          // ignore: cast_nullable_to_non_nullable
          : maximumColumn as int,
      maximumRow: maximumRow == const $CopyWithPlaceholder()
          ? _value.maximumRow
          // ignore: cast_nullable_to_non_nullable
          : maximumRow as int,
      fileName: fileName == const $CopyWithPlaceholder()
          ? _value.fileName
          // ignore: cast_nullable_to_non_nullable
          : fileName as String,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as GridType,
      byteData: byteData == const $CopyWithPlaceholder()
          ? _value.byteData
          // ignore: cast_nullable_to_non_nullable
          : byteData as Uint8List?,
      fileLength: fileLength == const $CopyWithPlaceholder()
          ? _value.fileLength
          // ignore: cast_nullable_to_non_nullable
          : fileLength as int?,
      treatmentZoneCode: treatmentZoneCode == const $CopyWithPlaceholder()
          ? _value.treatmentZoneCode
          // ignore: cast_nullable_to_non_nullable
          : treatmentZoneCode as int?,
      treatmentZoneCodeGrid:
          treatmentZoneCodeGrid == const $CopyWithPlaceholder()
              ? _value.treatmentZoneCodeGrid
              // ignore: cast_nullable_to_non_nullable
              : treatmentZoneCodeGrid as List<List<int>>?,
      numberOfProcessDataVariables:
          numberOfProcessDataVariables == const $CopyWithPlaceholder()
              ? _value.numberOfProcessDataVariables
              // ignore: cast_nullable_to_non_nullable
              : numberOfProcessDataVariables as int?,
      processDataValueGrid: processDataValueGrid == const $CopyWithPlaceholder()
          ? _value.processDataValueGrid
          // ignore: cast_nullable_to_non_nullable
          : processDataValueGrid as List<List<List<int>>>?,
    );
  }
}

extension $GridCopyWith on Grid {
  /// Returns a callable class that can be used as follows: `instanceOfGrid.copyWith(...)` or like so:`instanceOfGrid.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GridCWProxy get copyWith => _$GridCWProxyImpl(this);
}

abstract class _$LineStringCWProxy {
  LineString points(List<Point> points);

  LineString type(LineStringType type);

  LineString designator(String? designator);

  LineString width(int? width);

  LineString length(int? length);

  LineString colour(int? colour);

  LineString id(String? id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LineString(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LineString(...).copyWith(id: 12, name: "My name")
  /// ````
  LineString call({
    List<Point> points,
    LineStringType type,
    String? designator,
    int? width,
    int? length,
    int? colour,
    String? id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLineString.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLineString.copyWith.fieldName(...)`
class _$LineStringCWProxyImpl implements _$LineStringCWProxy {
  const _$LineStringCWProxyImpl(this._value);

  final LineString _value;

  @override
  LineString points(List<Point> points) => this(points: points);

  @override
  LineString type(LineStringType type) => this(type: type);

  @override
  LineString designator(String? designator) => this(designator: designator);

  @override
  LineString width(int? width) => this(width: width);

  @override
  LineString length(int? length) => this(length: length);

  @override
  LineString colour(int? colour) => this(colour: colour);

  @override
  LineString id(String? id) => this(id: id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LineString(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LineString(...).copyWith(id: 12, name: "My name")
  /// ````
  LineString call({
    Object? points = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? width = const $CopyWithPlaceholder(),
    Object? length = const $CopyWithPlaceholder(),
    Object? colour = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return LineString(
      points: points == const $CopyWithPlaceholder()
          ? _value.points
          // ignore: cast_nullable_to_non_nullable
          : points as List<Point>,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as LineStringType,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String?,
      width: width == const $CopyWithPlaceholder()
          ? _value.width
          // ignore: cast_nullable_to_non_nullable
          : width as int?,
      length: length == const $CopyWithPlaceholder()
          ? _value.length
          // ignore: cast_nullable_to_non_nullable
          : length as int?,
      colour: colour == const $CopyWithPlaceholder()
          ? _value.colour
          // ignore: cast_nullable_to_non_nullable
          : colour as int?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
    );
  }
}

extension $LineStringCopyWith on LineString {
  /// Returns a callable class that can be used as follows: `instanceOfLineString.copyWith(...)` or like so:`instanceOfLineString.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LineStringCWProxy get copyWith => _$LineStringCWProxyImpl(this);
}

abstract class _$PartfieldCWProxy {
  Partfield id(String id);

  Partfield designator(String designator);

  Partfield area(int area);

  Partfield lineStrings(List<LineString>? lineStrings);

  Partfield polygons(List<Polygon>? polygons);

  Partfield points(List<Point>? points);

  Partfield guidanceGroups(List<GuidanceGroup>? guidanceGroups);

  Partfield code(String? code);

  Partfield customerIdRef(String? customerIdRef);

  Partfield farmIdRef(String? farmIdRef);

  Partfield cropTypeIdRef(String? cropTypeIdRef);

  Partfield cropVarietyIdRef(String? cropVarietyIdRef);

  Partfield fieldIdRef(String? fieldIdRef);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Partfield(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Partfield(...).copyWith(id: 12, name: "My name")
  /// ````
  Partfield call({
    String id,
    String designator,
    int area,
    List<LineString>? lineStrings,
    List<Polygon>? polygons,
    List<Point>? points,
    List<GuidanceGroup>? guidanceGroups,
    String? code,
    String? customerIdRef,
    String? farmIdRef,
    String? cropTypeIdRef,
    String? cropVarietyIdRef,
    String? fieldIdRef,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPartfield.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPartfield.copyWith.fieldName(...)`
class _$PartfieldCWProxyImpl implements _$PartfieldCWProxy {
  const _$PartfieldCWProxyImpl(this._value);

  final Partfield _value;

  @override
  Partfield id(String id) => this(id: id);

  @override
  Partfield designator(String designator) => this(designator: designator);

  @override
  Partfield area(int area) => this(area: area);

  @override
  Partfield lineStrings(List<LineString>? lineStrings) =>
      this(lineStrings: lineStrings);

  @override
  Partfield polygons(List<Polygon>? polygons) => this(polygons: polygons);

  @override
  Partfield points(List<Point>? points) => this(points: points);

  @override
  Partfield guidanceGroups(List<GuidanceGroup>? guidanceGroups) =>
      this(guidanceGroups: guidanceGroups);

  @override
  Partfield code(String? code) => this(code: code);

  @override
  Partfield customerIdRef(String? customerIdRef) =>
      this(customerIdRef: customerIdRef);

  @override
  Partfield farmIdRef(String? farmIdRef) => this(farmIdRef: farmIdRef);

  @override
  Partfield cropTypeIdRef(String? cropTypeIdRef) =>
      this(cropTypeIdRef: cropTypeIdRef);

  @override
  Partfield cropVarietyIdRef(String? cropVarietyIdRef) =>
      this(cropVarietyIdRef: cropVarietyIdRef);

  @override
  Partfield fieldIdRef(String? fieldIdRef) => this(fieldIdRef: fieldIdRef);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Partfield(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Partfield(...).copyWith(id: 12, name: "My name")
  /// ````
  Partfield call({
    Object? id = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? area = const $CopyWithPlaceholder(),
    Object? lineStrings = const $CopyWithPlaceholder(),
    Object? polygons = const $CopyWithPlaceholder(),
    Object? points = const $CopyWithPlaceholder(),
    Object? guidanceGroups = const $CopyWithPlaceholder(),
    Object? code = const $CopyWithPlaceholder(),
    Object? customerIdRef = const $CopyWithPlaceholder(),
    Object? farmIdRef = const $CopyWithPlaceholder(),
    Object? cropTypeIdRef = const $CopyWithPlaceholder(),
    Object? cropVarietyIdRef = const $CopyWithPlaceholder(),
    Object? fieldIdRef = const $CopyWithPlaceholder(),
  }) {
    return Partfield(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String,
      area: area == const $CopyWithPlaceholder()
          ? _value.area
          // ignore: cast_nullable_to_non_nullable
          : area as int,
      lineStrings: lineStrings == const $CopyWithPlaceholder()
          ? _value.lineStrings
          // ignore: cast_nullable_to_non_nullable
          : lineStrings as List<LineString>?,
      polygons: polygons == const $CopyWithPlaceholder()
          ? _value.polygons
          // ignore: cast_nullable_to_non_nullable
          : polygons as List<Polygon>?,
      points: points == const $CopyWithPlaceholder()
          ? _value.points
          // ignore: cast_nullable_to_non_nullable
          : points as List<Point>?,
      guidanceGroups: guidanceGroups == const $CopyWithPlaceholder()
          ? _value.guidanceGroups
          // ignore: cast_nullable_to_non_nullable
          : guidanceGroups as List<GuidanceGroup>?,
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as String?,
      customerIdRef: customerIdRef == const $CopyWithPlaceholder()
          ? _value.customerIdRef
          // ignore: cast_nullable_to_non_nullable
          : customerIdRef as String?,
      farmIdRef: farmIdRef == const $CopyWithPlaceholder()
          ? _value.farmIdRef
          // ignore: cast_nullable_to_non_nullable
          : farmIdRef as String?,
      cropTypeIdRef: cropTypeIdRef == const $CopyWithPlaceholder()
          ? _value.cropTypeIdRef
          // ignore: cast_nullable_to_non_nullable
          : cropTypeIdRef as String?,
      cropVarietyIdRef: cropVarietyIdRef == const $CopyWithPlaceholder()
          ? _value.cropVarietyIdRef
          // ignore: cast_nullable_to_non_nullable
          : cropVarietyIdRef as String?,
      fieldIdRef: fieldIdRef == const $CopyWithPlaceholder()
          ? _value.fieldIdRef
          // ignore: cast_nullable_to_non_nullable
          : fieldIdRef as String?,
    );
  }
}

extension $PartfieldCopyWith on Partfield {
  /// Returns a callable class that can be used as follows: `instanceOfPartfield.copyWith(...)` or like so:`instanceOfPartfield.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PartfieldCWProxy get copyWith => _$PartfieldCWProxyImpl(this);
}

abstract class _$PointCWProxy {
  Point type(PointType? type);

  Point north(double? north);

  Point east(double? east);

  Point up(int? up);

  Point designator(String? designator);

  Point colour(int? colour);

  Point id(String? id);

  Point horizontalAccuracy(double? horizontalAccuracy);

  Point verticalAccuracy(double? verticalAccuracy);

  Point filename(String? filename);

  Point fileLength(int? fileLength);

  Point binaryHeaderOptions(PointBinaryHeaderOptions? binaryHeaderOptions);

  Point byteData(Uint8List? byteData);

  Point binaryPoints(List<Point>? binaryPoints);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Point(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Point(...).copyWith(id: 12, name: "My name")
  /// ````
  Point call({
    PointType? type,
    double? north,
    double? east,
    int? up,
    String? designator,
    int? colour,
    String? id,
    double? horizontalAccuracy,
    double? verticalAccuracy,
    String? filename,
    int? fileLength,
    PointBinaryHeaderOptions? binaryHeaderOptions,
    Uint8List? byteData,
    List<Point>? binaryPoints,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPoint.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPoint.copyWith.fieldName(...)`
class _$PointCWProxyImpl implements _$PointCWProxy {
  const _$PointCWProxyImpl(this._value);

  final Point _value;

  @override
  Point type(PointType? type) => this(type: type);

  @override
  Point north(double? north) => this(north: north);

  @override
  Point east(double? east) => this(east: east);

  @override
  Point up(int? up) => this(up: up);

  @override
  Point designator(String? designator) => this(designator: designator);

  @override
  Point colour(int? colour) => this(colour: colour);

  @override
  Point id(String? id) => this(id: id);

  @override
  Point horizontalAccuracy(double? horizontalAccuracy) =>
      this(horizontalAccuracy: horizontalAccuracy);

  @override
  Point verticalAccuracy(double? verticalAccuracy) =>
      this(verticalAccuracy: verticalAccuracy);

  @override
  Point filename(String? filename) => this(filename: filename);

  @override
  Point fileLength(int? fileLength) => this(fileLength: fileLength);

  @override
  Point binaryHeaderOptions(PointBinaryHeaderOptions? binaryHeaderOptions) =>
      this(binaryHeaderOptions: binaryHeaderOptions);

  @override
  Point byteData(Uint8List? byteData) => this(byteData: byteData);

  @override
  Point binaryPoints(List<Point>? binaryPoints) =>
      this(binaryPoints: binaryPoints);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Point(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Point(...).copyWith(id: 12, name: "My name")
  /// ````
  Point call({
    Object? type = const $CopyWithPlaceholder(),
    Object? north = const $CopyWithPlaceholder(),
    Object? east = const $CopyWithPlaceholder(),
    Object? up = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? colour = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? horizontalAccuracy = const $CopyWithPlaceholder(),
    Object? verticalAccuracy = const $CopyWithPlaceholder(),
    Object? filename = const $CopyWithPlaceholder(),
    Object? fileLength = const $CopyWithPlaceholder(),
    Object? binaryHeaderOptions = const $CopyWithPlaceholder(),
    Object? byteData = const $CopyWithPlaceholder(),
    Object? binaryPoints = const $CopyWithPlaceholder(),
  }) {
    return Point(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as PointType?,
      north: north == const $CopyWithPlaceholder()
          ? _value.north
          // ignore: cast_nullable_to_non_nullable
          : north as double?,
      east: east == const $CopyWithPlaceholder()
          ? _value.east
          // ignore: cast_nullable_to_non_nullable
          : east as double?,
      up: up == const $CopyWithPlaceholder()
          ? _value.up
          // ignore: cast_nullable_to_non_nullable
          : up as int?,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String?,
      colour: colour == const $CopyWithPlaceholder()
          ? _value.colour
          // ignore: cast_nullable_to_non_nullable
          : colour as int?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
      horizontalAccuracy: horizontalAccuracy == const $CopyWithPlaceholder()
          ? _value.horizontalAccuracy
          // ignore: cast_nullable_to_non_nullable
          : horizontalAccuracy as double?,
      verticalAccuracy: verticalAccuracy == const $CopyWithPlaceholder()
          ? _value.verticalAccuracy
          // ignore: cast_nullable_to_non_nullable
          : verticalAccuracy as double?,
      filename: filename == const $CopyWithPlaceholder()
          ? _value.filename
          // ignore: cast_nullable_to_non_nullable
          : filename as String?,
      fileLength: fileLength == const $CopyWithPlaceholder()
          ? _value.fileLength
          // ignore: cast_nullable_to_non_nullable
          : fileLength as int?,
      binaryHeaderOptions: binaryHeaderOptions == const $CopyWithPlaceholder()
          ? _value.binaryHeaderOptions
          // ignore: cast_nullable_to_non_nullable
          : binaryHeaderOptions as PointBinaryHeaderOptions?,
      byteData: byteData == const $CopyWithPlaceholder()
          ? _value.byteData
          // ignore: cast_nullable_to_non_nullable
          : byteData as Uint8List?,
      binaryPoints: binaryPoints == const $CopyWithPlaceholder()
          ? _value.binaryPoints
          // ignore: cast_nullable_to_non_nullable
          : binaryPoints as List<Point>?,
    );
  }
}

extension $PointCopyWith on Point {
  /// Returns a callable class that can be used as follows: `instanceOfPoint.copyWith(...)` or like so:`instanceOfPoint.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PointCWProxy get copyWith => _$PointCWProxyImpl(this);
}

abstract class _$PolygonCWProxy {
  Polygon type(PolygonType type);

  Polygon lineStrings(List<LineString> lineStrings);

  Polygon designator(String? designator);

  Polygon area(int? area);

  Polygon colour(int? colour);

  Polygon id(String? id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Polygon(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Polygon(...).copyWith(id: 12, name: "My name")
  /// ````
  Polygon call({
    PolygonType type,
    List<LineString> lineStrings,
    String? designator,
    int? area,
    int? colour,
    String? id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPolygon.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPolygon.copyWith.fieldName(...)`
class _$PolygonCWProxyImpl implements _$PolygonCWProxy {
  const _$PolygonCWProxyImpl(this._value);

  final Polygon _value;

  @override
  Polygon type(PolygonType type) => this(type: type);

  @override
  Polygon lineStrings(List<LineString> lineStrings) =>
      this(lineStrings: lineStrings);

  @override
  Polygon designator(String? designator) => this(designator: designator);

  @override
  Polygon area(int? area) => this(area: area);

  @override
  Polygon colour(int? colour) => this(colour: colour);

  @override
  Polygon id(String? id) => this(id: id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Polygon(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Polygon(...).copyWith(id: 12, name: "My name")
  /// ````
  Polygon call({
    Object? type = const $CopyWithPlaceholder(),
    Object? lineStrings = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? area = const $CopyWithPlaceholder(),
    Object? colour = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return Polygon(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as PolygonType,
      lineStrings: lineStrings == const $CopyWithPlaceholder()
          ? _value.lineStrings
          // ignore: cast_nullable_to_non_nullable
          : lineStrings as List<LineString>,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String?,
      area: area == const $CopyWithPlaceholder()
          ? _value.area
          // ignore: cast_nullable_to_non_nullable
          : area as int?,
      colour: colour == const $CopyWithPlaceholder()
          ? _value.colour
          // ignore: cast_nullable_to_non_nullable
          : colour as int?,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String?,
    );
  }
}

extension $PolygonCopyWith on Polygon {
  /// Returns a callable class that can be used as follows: `instanceOfPolygon.copyWith(...)` or like so:`instanceOfPolygon.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PolygonCWProxy get copyWith => _$PolygonCWProxyImpl(this);
}

abstract class _$PositionCWProxy {
  Position north(double north);

  Position east(double east);

  Position status(PositionStatus status);

  Position up(int? up);

  Position pdop(double? pdop);

  Position hdop(double? hdop);

  Position numberOfSatellites(int? numberOfSatellites);

  Position gpsUtcTimeMs(int? gpsUtcTimeMs);

  Position gpsUtcDate(int? gpsUtcDate);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Position(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Position(...).copyWith(id: 12, name: "My name")
  /// ````
  Position call({
    double north,
    double east,
    PositionStatus status,
    int? up,
    double? pdop,
    double? hdop,
    int? numberOfSatellites,
    int? gpsUtcTimeMs,
    int? gpsUtcDate,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPosition.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPosition.copyWith.fieldName(...)`
class _$PositionCWProxyImpl implements _$PositionCWProxy {
  const _$PositionCWProxyImpl(this._value);

  final Position _value;

  @override
  Position north(double north) => this(north: north);

  @override
  Position east(double east) => this(east: east);

  @override
  Position status(PositionStatus status) => this(status: status);

  @override
  Position up(int? up) => this(up: up);

  @override
  Position pdop(double? pdop) => this(pdop: pdop);

  @override
  Position hdop(double? hdop) => this(hdop: hdop);

  @override
  Position numberOfSatellites(int? numberOfSatellites) =>
      this(numberOfSatellites: numberOfSatellites);

  @override
  Position gpsUtcTimeMs(int? gpsUtcTimeMs) => this(gpsUtcTimeMs: gpsUtcTimeMs);

  @override
  Position gpsUtcDate(int? gpsUtcDate) => this(gpsUtcDate: gpsUtcDate);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Position(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Position(...).copyWith(id: 12, name: "My name")
  /// ````
  Position call({
    Object? north = const $CopyWithPlaceholder(),
    Object? east = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? up = const $CopyWithPlaceholder(),
    Object? pdop = const $CopyWithPlaceholder(),
    Object? hdop = const $CopyWithPlaceholder(),
    Object? numberOfSatellites = const $CopyWithPlaceholder(),
    Object? gpsUtcTimeMs = const $CopyWithPlaceholder(),
    Object? gpsUtcDate = const $CopyWithPlaceholder(),
  }) {
    return Position(
      north: north == const $CopyWithPlaceholder()
          ? _value.north
          // ignore: cast_nullable_to_non_nullable
          : north as double,
      east: east == const $CopyWithPlaceholder()
          ? _value.east
          // ignore: cast_nullable_to_non_nullable
          : east as double,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as PositionStatus,
      up: up == const $CopyWithPlaceholder()
          ? _value.up
          // ignore: cast_nullable_to_non_nullable
          : up as int?,
      pdop: pdop == const $CopyWithPlaceholder()
          ? _value.pdop
          // ignore: cast_nullable_to_non_nullable
          : pdop as double?,
      hdop: hdop == const $CopyWithPlaceholder()
          ? _value.hdop
          // ignore: cast_nullable_to_non_nullable
          : hdop as double?,
      numberOfSatellites: numberOfSatellites == const $CopyWithPlaceholder()
          ? _value.numberOfSatellites
          // ignore: cast_nullable_to_non_nullable
          : numberOfSatellites as int?,
      gpsUtcTimeMs: gpsUtcTimeMs == const $CopyWithPlaceholder()
          ? _value.gpsUtcTimeMs
          // ignore: cast_nullable_to_non_nullable
          : gpsUtcTimeMs as int?,
      gpsUtcDate: gpsUtcDate == const $CopyWithPlaceholder()
          ? _value.gpsUtcDate
          // ignore: cast_nullable_to_non_nullable
          : gpsUtcDate as int?,
    );
  }
}

extension $PositionCopyWith on Position {
  /// Returns a callable class that can be used as follows: `instanceOfPosition.copyWith(...)` or like so:`instanceOfPosition.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PositionCWProxy get copyWith => _$PositionCWProxyImpl(this);
}

abstract class _$GuidanceAllocationCWProxy {
  GuidanceAllocation allocationStamps(List<AllocationStamp> allocationStamps);

  GuidanceAllocation groupIdRef(String groupIdRef);

  GuidanceAllocation shifts(List<GuidanceShift>? shifts);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GuidanceAllocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GuidanceAllocation(...).copyWith(id: 12, name: "My name")
  /// ````
  GuidanceAllocation call({
    List<AllocationStamp> allocationStamps,
    String groupIdRef,
    List<GuidanceShift>? shifts,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGuidanceAllocation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGuidanceAllocation.copyWith.fieldName(...)`
class _$GuidanceAllocationCWProxyImpl implements _$GuidanceAllocationCWProxy {
  const _$GuidanceAllocationCWProxyImpl(this._value);

  final GuidanceAllocation _value;

  @override
  GuidanceAllocation allocationStamps(List<AllocationStamp> allocationStamps) =>
      this(allocationStamps: allocationStamps);

  @override
  GuidanceAllocation groupIdRef(String groupIdRef) =>
      this(groupIdRef: groupIdRef);

  @override
  GuidanceAllocation shifts(List<GuidanceShift>? shifts) =>
      this(shifts: shifts);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GuidanceAllocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GuidanceAllocation(...).copyWith(id: 12, name: "My name")
  /// ````
  GuidanceAllocation call({
    Object? allocationStamps = const $CopyWithPlaceholder(),
    Object? groupIdRef = const $CopyWithPlaceholder(),
    Object? shifts = const $CopyWithPlaceholder(),
  }) {
    return GuidanceAllocation(
      allocationStamps: allocationStamps == const $CopyWithPlaceholder()
          ? _value.allocationStamps
          // ignore: cast_nullable_to_non_nullable
          : allocationStamps as List<AllocationStamp>,
      groupIdRef: groupIdRef == const $CopyWithPlaceholder()
          ? _value.groupIdRef
          // ignore: cast_nullable_to_non_nullable
          : groupIdRef as String,
      shifts: shifts == const $CopyWithPlaceholder()
          ? _value.shifts
          // ignore: cast_nullable_to_non_nullable
          : shifts as List<GuidanceShift>?,
    );
  }
}

extension $GuidanceAllocationCopyWith on GuidanceAllocation {
  /// Returns a callable class that can be used as follows: `instanceOfGuidanceAllocation.copyWith(...)` or like so:`instanceOfGuidanceAllocation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GuidanceAllocationCWProxy get copyWith =>
      _$GuidanceAllocationCWProxyImpl(this);
}

abstract class _$GuidanceGroupCWProxy {
  GuidanceGroup id(String id);

  GuidanceGroup patterns(List<GuidancePattern>? patterns);

  GuidanceGroup boundaryPolygon(Polygon? boundaryPolygon);

  GuidanceGroup designator(String? designator);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GuidanceGroup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GuidanceGroup(...).copyWith(id: 12, name: "My name")
  /// ````
  GuidanceGroup call({
    String id,
    List<GuidancePattern>? patterns,
    Polygon? boundaryPolygon,
    String? designator,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGuidanceGroup.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGuidanceGroup.copyWith.fieldName(...)`
class _$GuidanceGroupCWProxyImpl implements _$GuidanceGroupCWProxy {
  const _$GuidanceGroupCWProxyImpl(this._value);

  final GuidanceGroup _value;

  @override
  GuidanceGroup id(String id) => this(id: id);

  @override
  GuidanceGroup patterns(List<GuidancePattern>? patterns) =>
      this(patterns: patterns);

  @override
  GuidanceGroup boundaryPolygon(Polygon? boundaryPolygon) =>
      this(boundaryPolygon: boundaryPolygon);

  @override
  GuidanceGroup designator(String? designator) => this(designator: designator);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GuidanceGroup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GuidanceGroup(...).copyWith(id: 12, name: "My name")
  /// ````
  GuidanceGroup call({
    Object? id = const $CopyWithPlaceholder(),
    Object? patterns = const $CopyWithPlaceholder(),
    Object? boundaryPolygon = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
  }) {
    return GuidanceGroup(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      patterns: patterns == const $CopyWithPlaceholder()
          ? _value.patterns
          // ignore: cast_nullable_to_non_nullable
          : patterns as List<GuidancePattern>?,
      boundaryPolygon: boundaryPolygon == const $CopyWithPlaceholder()
          ? _value.boundaryPolygon
          // ignore: cast_nullable_to_non_nullable
          : boundaryPolygon as Polygon?,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String?,
    );
  }
}

extension $GuidanceGroupCopyWith on GuidanceGroup {
  /// Returns a callable class that can be used as follows: `instanceOfGuidanceGroup.copyWith(...)` or like so:`instanceOfGuidanceGroup.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GuidanceGroupCWProxy get copyWith => _$GuidanceGroupCWProxyImpl(this);
}

abstract class _$GuidancePatternCWProxy {
  GuidancePattern lineStrings(List<LineString> lineStrings);

  GuidancePattern id(String id);

  GuidancePattern type(GuidancePatternType type);

  GuidancePattern boundaryPolygon(Polygon? boundaryPolygon);

  GuidancePattern designator(String? designator);

  GuidancePattern options(GuidancePatternOptions? options);

  GuidancePattern propagationDirection(
      GuidancePatternPropagationDirection? propagationDirection);

  GuidancePattern extension(GuidancePatternExtension? extension);

  GuidancePattern heading(double? heading);

  GuidancePattern radius(int? radius);

  GuidancePattern gnssMethod(GuidancePatternGnssMethod? gnssMethod);

  GuidancePattern horizontalAccuracy(double? horizontalAccuracy);

  GuidancePattern verticalAccuracy(double? verticalAccuracy);

  GuidancePattern baseStationIdRef(String? baseStationIdRef);

  GuidancePattern originalSRID(String? originalSRID);

  GuidancePattern numberOfSwathsLeft(int? numberOfSwathsLeft);

  GuidancePattern numberOfSwathsRight(int? numberOfSwathsRight);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GuidancePattern(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GuidancePattern(...).copyWith(id: 12, name: "My name")
  /// ````
  GuidancePattern call({
    List<LineString> lineStrings,
    String id,
    GuidancePatternType type,
    Polygon? boundaryPolygon,
    String? designator,
    GuidancePatternOptions? options,
    GuidancePatternPropagationDirection? propagationDirection,
    GuidancePatternExtension? extension,
    double? heading,
    int? radius,
    GuidancePatternGnssMethod? gnssMethod,
    double? horizontalAccuracy,
    double? verticalAccuracy,
    String? baseStationIdRef,
    String? originalSRID,
    int? numberOfSwathsLeft,
    int? numberOfSwathsRight,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGuidancePattern.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGuidancePattern.copyWith.fieldName(...)`
class _$GuidancePatternCWProxyImpl implements _$GuidancePatternCWProxy {
  const _$GuidancePatternCWProxyImpl(this._value);

  final GuidancePattern _value;

  @override
  GuidancePattern lineStrings(List<LineString> lineStrings) =>
      this(lineStrings: lineStrings);

  @override
  GuidancePattern id(String id) => this(id: id);

  @override
  GuidancePattern type(GuidancePatternType type) => this(type: type);

  @override
  GuidancePattern boundaryPolygon(Polygon? boundaryPolygon) =>
      this(boundaryPolygon: boundaryPolygon);

  @override
  GuidancePattern designator(String? designator) =>
      this(designator: designator);

  @override
  GuidancePattern options(GuidancePatternOptions? options) =>
      this(options: options);

  @override
  GuidancePattern propagationDirection(
          GuidancePatternPropagationDirection? propagationDirection) =>
      this(propagationDirection: propagationDirection);

  @override
  GuidancePattern extension(GuidancePatternExtension? extension) =>
      this(extension: extension);

  @override
  GuidancePattern heading(double? heading) => this(heading: heading);

  @override
  GuidancePattern radius(int? radius) => this(radius: radius);

  @override
  GuidancePattern gnssMethod(GuidancePatternGnssMethod? gnssMethod) =>
      this(gnssMethod: gnssMethod);

  @override
  GuidancePattern horizontalAccuracy(double? horizontalAccuracy) =>
      this(horizontalAccuracy: horizontalAccuracy);

  @override
  GuidancePattern verticalAccuracy(double? verticalAccuracy) =>
      this(verticalAccuracy: verticalAccuracy);

  @override
  GuidancePattern baseStationIdRef(String? baseStationIdRef) =>
      this(baseStationIdRef: baseStationIdRef);

  @override
  GuidancePattern originalSRID(String? originalSRID) =>
      this(originalSRID: originalSRID);

  @override
  GuidancePattern numberOfSwathsLeft(int? numberOfSwathsLeft) =>
      this(numberOfSwathsLeft: numberOfSwathsLeft);

  @override
  GuidancePattern numberOfSwathsRight(int? numberOfSwathsRight) =>
      this(numberOfSwathsRight: numberOfSwathsRight);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GuidancePattern(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GuidancePattern(...).copyWith(id: 12, name: "My name")
  /// ````
  GuidancePattern call({
    Object? lineStrings = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? boundaryPolygon = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? options = const $CopyWithPlaceholder(),
    Object? propagationDirection = const $CopyWithPlaceholder(),
    Object? extension = const $CopyWithPlaceholder(),
    Object? heading = const $CopyWithPlaceholder(),
    Object? radius = const $CopyWithPlaceholder(),
    Object? gnssMethod = const $CopyWithPlaceholder(),
    Object? horizontalAccuracy = const $CopyWithPlaceholder(),
    Object? verticalAccuracy = const $CopyWithPlaceholder(),
    Object? baseStationIdRef = const $CopyWithPlaceholder(),
    Object? originalSRID = const $CopyWithPlaceholder(),
    Object? numberOfSwathsLeft = const $CopyWithPlaceholder(),
    Object? numberOfSwathsRight = const $CopyWithPlaceholder(),
  }) {
    return GuidancePattern(
      lineStrings: lineStrings == const $CopyWithPlaceholder()
          ? _value.lineStrings
          // ignore: cast_nullable_to_non_nullable
          : lineStrings as List<LineString>,
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as GuidancePatternType,
      boundaryPolygon: boundaryPolygon == const $CopyWithPlaceholder()
          ? _value.boundaryPolygon
          // ignore: cast_nullable_to_non_nullable
          : boundaryPolygon as Polygon?,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String?,
      options: options == const $CopyWithPlaceholder()
          ? _value.options
          // ignore: cast_nullable_to_non_nullable
          : options as GuidancePatternOptions?,
      propagationDirection: propagationDirection == const $CopyWithPlaceholder()
          ? _value.propagationDirection
          // ignore: cast_nullable_to_non_nullable
          : propagationDirection as GuidancePatternPropagationDirection?,
      extension: extension == const $CopyWithPlaceholder()
          ? _value.extension
          // ignore: cast_nullable_to_non_nullable
          : extension as GuidancePatternExtension?,
      heading: heading == const $CopyWithPlaceholder()
          ? _value.heading
          // ignore: cast_nullable_to_non_nullable
          : heading as double?,
      radius: radius == const $CopyWithPlaceholder()
          ? _value.radius
          // ignore: cast_nullable_to_non_nullable
          : radius as int?,
      gnssMethod: gnssMethod == const $CopyWithPlaceholder()
          ? _value.gnssMethod
          // ignore: cast_nullable_to_non_nullable
          : gnssMethod as GuidancePatternGnssMethod?,
      horizontalAccuracy: horizontalAccuracy == const $CopyWithPlaceholder()
          ? _value.horizontalAccuracy
          // ignore: cast_nullable_to_non_nullable
          : horizontalAccuracy as double?,
      verticalAccuracy: verticalAccuracy == const $CopyWithPlaceholder()
          ? _value.verticalAccuracy
          // ignore: cast_nullable_to_non_nullable
          : verticalAccuracy as double?,
      baseStationIdRef: baseStationIdRef == const $CopyWithPlaceholder()
          ? _value.baseStationIdRef
          // ignore: cast_nullable_to_non_nullable
          : baseStationIdRef as String?,
      originalSRID: originalSRID == const $CopyWithPlaceholder()
          ? _value.originalSRID
          // ignore: cast_nullable_to_non_nullable
          : originalSRID as String?,
      numberOfSwathsLeft: numberOfSwathsLeft == const $CopyWithPlaceholder()
          ? _value.numberOfSwathsLeft
          // ignore: cast_nullable_to_non_nullable
          : numberOfSwathsLeft as int?,
      numberOfSwathsRight: numberOfSwathsRight == const $CopyWithPlaceholder()
          ? _value.numberOfSwathsRight
          // ignore: cast_nullable_to_non_nullable
          : numberOfSwathsRight as int?,
    );
  }
}

extension $GuidancePatternCopyWith on GuidancePattern {
  /// Returns a callable class that can be used as follows: `instanceOfGuidancePattern.copyWith(...)` or like so:`instanceOfGuidancePattern.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GuidancePatternCWProxy get copyWith => _$GuidancePatternCWProxyImpl(this);
}

abstract class _$GuidanceShiftCWProxy {
  GuidanceShift allocationStamp(AllocationStamp? allocationStamp);

  GuidanceShift groupIdRef(String? groupIdRef);

  GuidanceShift patternIdRef(String? patternIdRef);

  GuidanceShift eastShift(int? eastShift);

  GuidanceShift northShift(int? northShift);

  GuidanceShift propagationOffset(int? propagationOffset);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GuidanceShift(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GuidanceShift(...).copyWith(id: 12, name: "My name")
  /// ````
  GuidanceShift call({
    AllocationStamp? allocationStamp,
    String? groupIdRef,
    String? patternIdRef,
    int? eastShift,
    int? northShift,
    int? propagationOffset,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGuidanceShift.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGuidanceShift.copyWith.fieldName(...)`
class _$GuidanceShiftCWProxyImpl implements _$GuidanceShiftCWProxy {
  const _$GuidanceShiftCWProxyImpl(this._value);

  final GuidanceShift _value;

  @override
  GuidanceShift allocationStamp(AllocationStamp? allocationStamp) =>
      this(allocationStamp: allocationStamp);

  @override
  GuidanceShift groupIdRef(String? groupIdRef) => this(groupIdRef: groupIdRef);

  @override
  GuidanceShift patternIdRef(String? patternIdRef) =>
      this(patternIdRef: patternIdRef);

  @override
  GuidanceShift eastShift(int? eastShift) => this(eastShift: eastShift);

  @override
  GuidanceShift northShift(int? northShift) => this(northShift: northShift);

  @override
  GuidanceShift propagationOffset(int? propagationOffset) =>
      this(propagationOffset: propagationOffset);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GuidanceShift(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GuidanceShift(...).copyWith(id: 12, name: "My name")
  /// ````
  GuidanceShift call({
    Object? allocationStamp = const $CopyWithPlaceholder(),
    Object? groupIdRef = const $CopyWithPlaceholder(),
    Object? patternIdRef = const $CopyWithPlaceholder(),
    Object? eastShift = const $CopyWithPlaceholder(),
    Object? northShift = const $CopyWithPlaceholder(),
    Object? propagationOffset = const $CopyWithPlaceholder(),
  }) {
    return GuidanceShift(
      allocationStamp: allocationStamp == const $CopyWithPlaceholder()
          ? _value.allocationStamp
          // ignore: cast_nullable_to_non_nullable
          : allocationStamp as AllocationStamp?,
      groupIdRef: groupIdRef == const $CopyWithPlaceholder()
          ? _value.groupIdRef
          // ignore: cast_nullable_to_non_nullable
          : groupIdRef as String?,
      patternIdRef: patternIdRef == const $CopyWithPlaceholder()
          ? _value.patternIdRef
          // ignore: cast_nullable_to_non_nullable
          : patternIdRef as String?,
      eastShift: eastShift == const $CopyWithPlaceholder()
          ? _value.eastShift
          // ignore: cast_nullable_to_non_nullable
          : eastShift as int?,
      northShift: northShift == const $CopyWithPlaceholder()
          ? _value.northShift
          // ignore: cast_nullable_to_non_nullable
          : northShift as int?,
      propagationOffset: propagationOffset == const $CopyWithPlaceholder()
          ? _value.propagationOffset
          // ignore: cast_nullable_to_non_nullable
          : propagationOffset as int?,
    );
  }
}

extension $GuidanceShiftCopyWith on GuidanceShift {
  /// Returns a callable class that can be used as follows: `instanceOfGuidanceShift.copyWith(...)` or like so:`instanceOfGuidanceShift.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GuidanceShiftCWProxy get copyWith => _$GuidanceShiftCWProxyImpl(this);
}

abstract class _$Iso11783LinkListCWProxy {
  Iso11783LinkList versionMajor(VersionMajor versionMajor);

  Iso11783LinkList versionMinor(VersionMinor versionMinor);

  Iso11783LinkList managementSoftwareManufacturer(
      String managementSoftwareManufacturer);

  Iso11783LinkList managementSoftwareVersion(String managementSoftwareVersion);

  Iso11783LinkList dataTransferOrigin(DataTransferOrigin dataTransferOrigin);

  Iso11783LinkList linkGroups(List<LinkGroup>? linkGroups);

  Iso11783LinkList taskControllerManufacturer(
      String? taskControllerManufacturer);

  Iso11783LinkList taskControllerVersion(String? taskControllerVersion);

  Iso11783LinkList fileVersion(String? fileVersion);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Iso11783LinkList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Iso11783LinkList(...).copyWith(id: 12, name: "My name")
  /// ````
  Iso11783LinkList call({
    VersionMajor versionMajor,
    VersionMinor versionMinor,
    String managementSoftwareManufacturer,
    String managementSoftwareVersion,
    DataTransferOrigin dataTransferOrigin,
    List<LinkGroup>? linkGroups,
    String? taskControllerManufacturer,
    String? taskControllerVersion,
    String? fileVersion,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfIso11783LinkList.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfIso11783LinkList.copyWith.fieldName(...)`
class _$Iso11783LinkListCWProxyImpl implements _$Iso11783LinkListCWProxy {
  const _$Iso11783LinkListCWProxyImpl(this._value);

  final Iso11783LinkList _value;

  @override
  Iso11783LinkList versionMajor(VersionMajor versionMajor) =>
      this(versionMajor: versionMajor);

  @override
  Iso11783LinkList versionMinor(VersionMinor versionMinor) =>
      this(versionMinor: versionMinor);

  @override
  Iso11783LinkList managementSoftwareManufacturer(
          String managementSoftwareManufacturer) =>
      this(managementSoftwareManufacturer: managementSoftwareManufacturer);

  @override
  Iso11783LinkList managementSoftwareVersion(
          String managementSoftwareVersion) =>
      this(managementSoftwareVersion: managementSoftwareVersion);

  @override
  Iso11783LinkList dataTransferOrigin(DataTransferOrigin dataTransferOrigin) =>
      this(dataTransferOrigin: dataTransferOrigin);

  @override
  Iso11783LinkList linkGroups(List<LinkGroup>? linkGroups) =>
      this(linkGroups: linkGroups);

  @override
  Iso11783LinkList taskControllerManufacturer(
          String? taskControllerManufacturer) =>
      this(taskControllerManufacturer: taskControllerManufacturer);

  @override
  Iso11783LinkList taskControllerVersion(String? taskControllerVersion) =>
      this(taskControllerVersion: taskControllerVersion);

  @override
  Iso11783LinkList fileVersion(String? fileVersion) =>
      this(fileVersion: fileVersion);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Iso11783LinkList(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Iso11783LinkList(...).copyWith(id: 12, name: "My name")
  /// ````
  Iso11783LinkList call({
    Object? versionMajor = const $CopyWithPlaceholder(),
    Object? versionMinor = const $CopyWithPlaceholder(),
    Object? managementSoftwareManufacturer = const $CopyWithPlaceholder(),
    Object? managementSoftwareVersion = const $CopyWithPlaceholder(),
    Object? dataTransferOrigin = const $CopyWithPlaceholder(),
    Object? linkGroups = const $CopyWithPlaceholder(),
    Object? taskControllerManufacturer = const $CopyWithPlaceholder(),
    Object? taskControllerVersion = const $CopyWithPlaceholder(),
    Object? fileVersion = const $CopyWithPlaceholder(),
  }) {
    return Iso11783LinkList(
      versionMajor: versionMajor == const $CopyWithPlaceholder()
          ? _value.versionMajor
          // ignore: cast_nullable_to_non_nullable
          : versionMajor as VersionMajor,
      versionMinor: versionMinor == const $CopyWithPlaceholder()
          ? _value.versionMinor
          // ignore: cast_nullable_to_non_nullable
          : versionMinor as VersionMinor,
      managementSoftwareManufacturer:
          managementSoftwareManufacturer == const $CopyWithPlaceholder()
              ? _value.managementSoftwareManufacturer
              // ignore: cast_nullable_to_non_nullable
              : managementSoftwareManufacturer as String,
      managementSoftwareVersion:
          managementSoftwareVersion == const $CopyWithPlaceholder()
              ? _value.managementSoftwareVersion
              // ignore: cast_nullable_to_non_nullable
              : managementSoftwareVersion as String,
      dataTransferOrigin: dataTransferOrigin == const $CopyWithPlaceholder()
          ? _value.dataTransferOrigin
          // ignore: cast_nullable_to_non_nullable
          : dataTransferOrigin as DataTransferOrigin,
      linkGroups: linkGroups == const $CopyWithPlaceholder()
          ? _value.linkGroups
          // ignore: cast_nullable_to_non_nullable
          : linkGroups as List<LinkGroup>?,
      taskControllerManufacturer:
          taskControllerManufacturer == const $CopyWithPlaceholder()
              ? _value.taskControllerManufacturer
              // ignore: cast_nullable_to_non_nullable
              : taskControllerManufacturer as String?,
      taskControllerVersion:
          taskControllerVersion == const $CopyWithPlaceholder()
              ? _value.taskControllerVersion
              // ignore: cast_nullable_to_non_nullable
              : taskControllerVersion as String?,
      fileVersion: fileVersion == const $CopyWithPlaceholder()
          ? _value.fileVersion
          // ignore: cast_nullable_to_non_nullable
          : fileVersion as String?,
    );
  }
}

extension $Iso11783LinkListCopyWith on Iso11783LinkList {
  /// Returns a callable class that can be used as follows: `instanceOfIso11783LinkList.copyWith(...)` or like so:`instanceOfIso11783LinkList.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$Iso11783LinkListCWProxy get copyWith => _$Iso11783LinkListCWProxyImpl(this);
}

abstract class _$LinkCWProxy {
  Link objectIdRef(String objectIdRef);

  Link value(String value);

  Link designator(String? designator);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Link(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Link(...).copyWith(id: 12, name: "My name")
  /// ````
  Link call({
    String objectIdRef,
    String value,
    String? designator,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLink.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLink.copyWith.fieldName(...)`
class _$LinkCWProxyImpl implements _$LinkCWProxy {
  const _$LinkCWProxyImpl(this._value);

  final Link _value;

  @override
  Link objectIdRef(String objectIdRef) => this(objectIdRef: objectIdRef);

  @override
  Link value(String value) => this(value: value);

  @override
  Link designator(String? designator) => this(designator: designator);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Link(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Link(...).copyWith(id: 12, name: "My name")
  /// ````
  Link call({
    Object? objectIdRef = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
  }) {
    return Link(
      objectIdRef: objectIdRef == const $CopyWithPlaceholder()
          ? _value.objectIdRef
          // ignore: cast_nullable_to_non_nullable
          : objectIdRef as String,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String?,
    );
  }
}

extension $LinkCopyWith on Link {
  /// Returns a callable class that can be used as follows: `instanceOfLink.copyWith(...)` or like so:`instanceOfLink.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LinkCWProxy get copyWith => _$LinkCWProxyImpl(this);
}

abstract class _$LinkGroupCWProxy {
  LinkGroup id(String id);

  LinkGroup type(LinkGroupType type);

  LinkGroup links(List<Link>? links);

  LinkGroup manufacturerGLN(String? manufacturerGLN);

  LinkGroup namespace(String? namespace);

  LinkGroup designator(String? designator);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LinkGroup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LinkGroup(...).copyWith(id: 12, name: "My name")
  /// ````
  LinkGroup call({
    String id,
    LinkGroupType type,
    List<Link>? links,
    String? manufacturerGLN,
    String? namespace,
    String? designator,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLinkGroup.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLinkGroup.copyWith.fieldName(...)`
class _$LinkGroupCWProxyImpl implements _$LinkGroupCWProxy {
  const _$LinkGroupCWProxyImpl(this._value);

  final LinkGroup _value;

  @override
  LinkGroup id(String id) => this(id: id);

  @override
  LinkGroup type(LinkGroupType type) => this(type: type);

  @override
  LinkGroup links(List<Link>? links) => this(links: links);

  @override
  LinkGroup manufacturerGLN(String? manufacturerGLN) =>
      this(manufacturerGLN: manufacturerGLN);

  @override
  LinkGroup namespace(String? namespace) => this(namespace: namespace);

  @override
  LinkGroup designator(String? designator) => this(designator: designator);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LinkGroup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LinkGroup(...).copyWith(id: 12, name: "My name")
  /// ````
  LinkGroup call({
    Object? id = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? links = const $CopyWithPlaceholder(),
    Object? manufacturerGLN = const $CopyWithPlaceholder(),
    Object? namespace = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
  }) {
    return LinkGroup(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as LinkGroupType,
      links: links == const $CopyWithPlaceholder()
          ? _value.links
          // ignore: cast_nullable_to_non_nullable
          : links as List<Link>?,
      manufacturerGLN: manufacturerGLN == const $CopyWithPlaceholder()
          ? _value.manufacturerGLN
          // ignore: cast_nullable_to_non_nullable
          : manufacturerGLN as String?,
      namespace: namespace == const $CopyWithPlaceholder()
          ? _value.namespace
          // ignore: cast_nullable_to_non_nullable
          : namespace as String?,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String?,
    );
  }
}

extension $LinkGroupCopyWith on LinkGroup {
  /// Returns a callable class that can be used as follows: `instanceOfLinkGroup.copyWith(...)` or like so:`instanceOfLinkGroup.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LinkGroupCWProxy get copyWith => _$LinkGroupCWProxyImpl(this);
}

abstract class _$OperationTechniqueCWProxy {
  OperationTechnique id(String id);

  OperationTechnique designator(String designator);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OperationTechnique(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OperationTechnique(...).copyWith(id: 12, name: "My name")
  /// ````
  OperationTechnique call({
    String id,
    String designator,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOperationTechnique.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOperationTechnique.copyWith.fieldName(...)`
class _$OperationTechniqueCWProxyImpl implements _$OperationTechniqueCWProxy {
  const _$OperationTechniqueCWProxyImpl(this._value);

  final OperationTechnique _value;

  @override
  OperationTechnique id(String id) => this(id: id);

  @override
  OperationTechnique designator(String designator) =>
      this(designator: designator);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OperationTechnique(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OperationTechnique(...).copyWith(id: 12, name: "My name")
  /// ````
  OperationTechnique call({
    Object? id = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
  }) {
    return OperationTechnique(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String,
    );
  }
}

extension $OperationTechniqueCopyWith on OperationTechnique {
  /// Returns a callable class that can be used as follows: `instanceOfOperationTechnique.copyWith(...)` or like so:`instanceOfOperationTechnique.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OperationTechniqueCWProxy get copyWith =>
      _$OperationTechniqueCWProxyImpl(this);
}

abstract class _$OperationTechniquePracticeCWProxy {
  OperationTechniquePractice culturalPracticeIdRef(
      String culturalPracticeIdRef);

  OperationTechniquePractice operationTechniqueIdRef(
      String? operationTechniqueIdRef);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OperationTechniquePractice(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OperationTechniquePractice(...).copyWith(id: 12, name: "My name")
  /// ````
  OperationTechniquePractice call({
    String culturalPracticeIdRef,
    String? operationTechniqueIdRef,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOperationTechniquePractice.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOperationTechniquePractice.copyWith.fieldName(...)`
class _$OperationTechniquePracticeCWProxyImpl
    implements _$OperationTechniquePracticeCWProxy {
  const _$OperationTechniquePracticeCWProxyImpl(this._value);

  final OperationTechniquePractice _value;

  @override
  OperationTechniquePractice culturalPracticeIdRef(
          String culturalPracticeIdRef) =>
      this(culturalPracticeIdRef: culturalPracticeIdRef);

  @override
  OperationTechniquePractice operationTechniqueIdRef(
          String? operationTechniqueIdRef) =>
      this(operationTechniqueIdRef: operationTechniqueIdRef);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OperationTechniquePractice(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OperationTechniquePractice(...).copyWith(id: 12, name: "My name")
  /// ````
  OperationTechniquePractice call({
    Object? culturalPracticeIdRef = const $CopyWithPlaceholder(),
    Object? operationTechniqueIdRef = const $CopyWithPlaceholder(),
  }) {
    return OperationTechniquePractice(
      culturalPracticeIdRef:
          culturalPracticeIdRef == const $CopyWithPlaceholder()
              ? _value.culturalPracticeIdRef
              // ignore: cast_nullable_to_non_nullable
              : culturalPracticeIdRef as String,
      operationTechniqueIdRef:
          operationTechniqueIdRef == const $CopyWithPlaceholder()
              ? _value.operationTechniqueIdRef
              // ignore: cast_nullable_to_non_nullable
              : operationTechniqueIdRef as String?,
    );
  }
}

extension $OperationTechniquePracticeCopyWith on OperationTechniquePractice {
  /// Returns a callable class that can be used as follows: `instanceOfOperationTechniquePractice.copyWith(...)` or like so:`instanceOfOperationTechniquePractice.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OperationTechniquePracticeCWProxy get copyWith =>
      _$OperationTechniquePracticeCWProxyImpl(this);
}

abstract class _$OperationTechniqueReferenceCWProxy {
  OperationTechniqueReference operationTechniqueIdRef(
      String operationTechniqueIdRef);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OperationTechniqueReference(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OperationTechniqueReference(...).copyWith(id: 12, name: "My name")
  /// ````
  OperationTechniqueReference call({
    String operationTechniqueIdRef,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfOperationTechniqueReference.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfOperationTechniqueReference.copyWith.fieldName(...)`
class _$OperationTechniqueReferenceCWProxyImpl
    implements _$OperationTechniqueReferenceCWProxy {
  const _$OperationTechniqueReferenceCWProxyImpl(this._value);

  final OperationTechniqueReference _value;

  @override
  OperationTechniqueReference operationTechniqueIdRef(
          String operationTechniqueIdRef) =>
      this(operationTechniqueIdRef: operationTechniqueIdRef);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `OperationTechniqueReference(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// OperationTechniqueReference(...).copyWith(id: 12, name: "My name")
  /// ````
  OperationTechniqueReference call({
    Object? operationTechniqueIdRef = const $CopyWithPlaceholder(),
  }) {
    return OperationTechniqueReference(
      operationTechniqueIdRef:
          operationTechniqueIdRef == const $CopyWithPlaceholder()
              ? _value.operationTechniqueIdRef
              // ignore: cast_nullable_to_non_nullable
              : operationTechniqueIdRef as String,
    );
  }
}

extension $OperationTechniqueReferenceCopyWith on OperationTechniqueReference {
  /// Returns a callable class that can be used as follows: `instanceOfOperationTechniqueReference.copyWith(...)` or like so:`instanceOfOperationTechniqueReference.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$OperationTechniqueReferenceCWProxy get copyWith =>
      _$OperationTechniqueReferenceCWProxyImpl(this);
}

abstract class _$ProductCWProxy {
  Product id(String id);

  Product designator(String designator);

  Product relations(List<ProductRelation>? relations);

  Product groupIdRef(String? groupIdRef);

  Product valuePresentationIdRef(String? valuePresentationIdRef);

  Product quantityDDI(String? quantityDDI);

  Product type(ProductType? type);

  Product mixtureRecipeQuantity(int? mixtureRecipeQuantity);

  Product densityMassPerVolume(int? densityMassPerVolume);

  Product densityMassPerCount(int? densityMassPerCount);

  Product densityVolumePerCount(int? densityVolumePerCount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Product(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Product(...).copyWith(id: 12, name: "My name")
  /// ````
  Product call({
    String id,
    String designator,
    List<ProductRelation>? relations,
    String? groupIdRef,
    String? valuePresentationIdRef,
    String? quantityDDI,
    ProductType? type,
    int? mixtureRecipeQuantity,
    int? densityMassPerVolume,
    int? densityMassPerCount,
    int? densityVolumePerCount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProduct.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProduct.copyWith.fieldName(...)`
class _$ProductCWProxyImpl implements _$ProductCWProxy {
  const _$ProductCWProxyImpl(this._value);

  final Product _value;

  @override
  Product id(String id) => this(id: id);

  @override
  Product designator(String designator) => this(designator: designator);

  @override
  Product relations(List<ProductRelation>? relations) =>
      this(relations: relations);

  @override
  Product groupIdRef(String? groupIdRef) => this(groupIdRef: groupIdRef);

  @override
  Product valuePresentationIdRef(String? valuePresentationIdRef) =>
      this(valuePresentationIdRef: valuePresentationIdRef);

  @override
  Product quantityDDI(String? quantityDDI) => this(quantityDDI: quantityDDI);

  @override
  Product type(ProductType? type) => this(type: type);

  @override
  Product mixtureRecipeQuantity(int? mixtureRecipeQuantity) =>
      this(mixtureRecipeQuantity: mixtureRecipeQuantity);

  @override
  Product densityMassPerVolume(int? densityMassPerVolume) =>
      this(densityMassPerVolume: densityMassPerVolume);

  @override
  Product densityMassPerCount(int? densityMassPerCount) =>
      this(densityMassPerCount: densityMassPerCount);

  @override
  Product densityVolumePerCount(int? densityVolumePerCount) =>
      this(densityVolumePerCount: densityVolumePerCount);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Product(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Product(...).copyWith(id: 12, name: "My name")
  /// ````
  Product call({
    Object? id = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? relations = const $CopyWithPlaceholder(),
    Object? groupIdRef = const $CopyWithPlaceholder(),
    Object? valuePresentationIdRef = const $CopyWithPlaceholder(),
    Object? quantityDDI = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? mixtureRecipeQuantity = const $CopyWithPlaceholder(),
    Object? densityMassPerVolume = const $CopyWithPlaceholder(),
    Object? densityMassPerCount = const $CopyWithPlaceholder(),
    Object? densityVolumePerCount = const $CopyWithPlaceholder(),
  }) {
    return Product(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String,
      relations: relations == const $CopyWithPlaceholder()
          ? _value.relations
          // ignore: cast_nullable_to_non_nullable
          : relations as List<ProductRelation>?,
      groupIdRef: groupIdRef == const $CopyWithPlaceholder()
          ? _value.groupIdRef
          // ignore: cast_nullable_to_non_nullable
          : groupIdRef as String?,
      valuePresentationIdRef:
          valuePresentationIdRef == const $CopyWithPlaceholder()
              ? _value.valuePresentationIdRef
              // ignore: cast_nullable_to_non_nullable
              : valuePresentationIdRef as String?,
      quantityDDI: quantityDDI == const $CopyWithPlaceholder()
          ? _value.quantityDDI
          // ignore: cast_nullable_to_non_nullable
          : quantityDDI as String?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as ProductType?,
      mixtureRecipeQuantity:
          mixtureRecipeQuantity == const $CopyWithPlaceholder()
              ? _value.mixtureRecipeQuantity
              // ignore: cast_nullable_to_non_nullable
              : mixtureRecipeQuantity as int?,
      densityMassPerVolume: densityMassPerVolume == const $CopyWithPlaceholder()
          ? _value.densityMassPerVolume
          // ignore: cast_nullable_to_non_nullable
          : densityMassPerVolume as int?,
      densityMassPerCount: densityMassPerCount == const $CopyWithPlaceholder()
          ? _value.densityMassPerCount
          // ignore: cast_nullable_to_non_nullable
          : densityMassPerCount as int?,
      densityVolumePerCount:
          densityVolumePerCount == const $CopyWithPlaceholder()
              ? _value.densityVolumePerCount
              // ignore: cast_nullable_to_non_nullable
              : densityVolumePerCount as int?,
    );
  }
}

extension $ProductCopyWith on Product {
  /// Returns a callable class that can be used as follows: `instanceOfProduct.copyWith(...)` or like so:`instanceOfProduct.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductCWProxy get copyWith => _$ProductCWProxyImpl(this);
}

abstract class _$ProductAllocationCWProxy {
  ProductAllocation productIdRef(String productIdRef);

  ProductAllocation quantityDDI(String? quantityDDI);

  ProductAllocation quantityValue(int? quantityValue);

  ProductAllocation transferMode(TransferMode? transferMode);

  ProductAllocation deviceElementIdRef(String? deviceElementIdRef);

  ProductAllocation valuePresentationIdRef(String? valuePresentationIdRef);

  ProductAllocation productSubTypeIdRef(String? productSubTypeIdRef);

  ProductAllocation allocationStamp(AllocationStamp? allocationStamp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductAllocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductAllocation(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductAllocation call({
    String productIdRef,
    String? quantityDDI,
    int? quantityValue,
    TransferMode? transferMode,
    String? deviceElementIdRef,
    String? valuePresentationIdRef,
    String? productSubTypeIdRef,
    AllocationStamp? allocationStamp,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductAllocation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductAllocation.copyWith.fieldName(...)`
class _$ProductAllocationCWProxyImpl implements _$ProductAllocationCWProxy {
  const _$ProductAllocationCWProxyImpl(this._value);

  final ProductAllocation _value;

  @override
  ProductAllocation productIdRef(String productIdRef) =>
      this(productIdRef: productIdRef);

  @override
  ProductAllocation quantityDDI(String? quantityDDI) =>
      this(quantityDDI: quantityDDI);

  @override
  ProductAllocation quantityValue(int? quantityValue) =>
      this(quantityValue: quantityValue);

  @override
  ProductAllocation transferMode(TransferMode? transferMode) =>
      this(transferMode: transferMode);

  @override
  ProductAllocation deviceElementIdRef(String? deviceElementIdRef) =>
      this(deviceElementIdRef: deviceElementIdRef);

  @override
  ProductAllocation valuePresentationIdRef(String? valuePresentationIdRef) =>
      this(valuePresentationIdRef: valuePresentationIdRef);

  @override
  ProductAllocation productSubTypeIdRef(String? productSubTypeIdRef) =>
      this(productSubTypeIdRef: productSubTypeIdRef);

  @override
  ProductAllocation allocationStamp(AllocationStamp? allocationStamp) =>
      this(allocationStamp: allocationStamp);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductAllocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductAllocation(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductAllocation call({
    Object? productIdRef = const $CopyWithPlaceholder(),
    Object? quantityDDI = const $CopyWithPlaceholder(),
    Object? quantityValue = const $CopyWithPlaceholder(),
    Object? transferMode = const $CopyWithPlaceholder(),
    Object? deviceElementIdRef = const $CopyWithPlaceholder(),
    Object? valuePresentationIdRef = const $CopyWithPlaceholder(),
    Object? productSubTypeIdRef = const $CopyWithPlaceholder(),
    Object? allocationStamp = const $CopyWithPlaceholder(),
  }) {
    return ProductAllocation(
      productIdRef: productIdRef == const $CopyWithPlaceholder()
          ? _value.productIdRef
          // ignore: cast_nullable_to_non_nullable
          : productIdRef as String,
      quantityDDI: quantityDDI == const $CopyWithPlaceholder()
          ? _value.quantityDDI
          // ignore: cast_nullable_to_non_nullable
          : quantityDDI as String?,
      quantityValue: quantityValue == const $CopyWithPlaceholder()
          ? _value.quantityValue
          // ignore: cast_nullable_to_non_nullable
          : quantityValue as int?,
      transferMode: transferMode == const $CopyWithPlaceholder()
          ? _value.transferMode
          // ignore: cast_nullable_to_non_nullable
          : transferMode as TransferMode?,
      deviceElementIdRef: deviceElementIdRef == const $CopyWithPlaceholder()
          ? _value.deviceElementIdRef
          // ignore: cast_nullable_to_non_nullable
          : deviceElementIdRef as String?,
      valuePresentationIdRef:
          valuePresentationIdRef == const $CopyWithPlaceholder()
              ? _value.valuePresentationIdRef
              // ignore: cast_nullable_to_non_nullable
              : valuePresentationIdRef as String?,
      productSubTypeIdRef: productSubTypeIdRef == const $CopyWithPlaceholder()
          ? _value.productSubTypeIdRef
          // ignore: cast_nullable_to_non_nullable
          : productSubTypeIdRef as String?,
      allocationStamp: allocationStamp == const $CopyWithPlaceholder()
          ? _value.allocationStamp
          // ignore: cast_nullable_to_non_nullable
          : allocationStamp as AllocationStamp?,
    );
  }
}

extension $ProductAllocationCopyWith on ProductAllocation {
  /// Returns a callable class that can be used as follows: `instanceOfProductAllocation.copyWith(...)` or like so:`instanceOfProductAllocation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductAllocationCWProxy get copyWith =>
      _$ProductAllocationCWProxyImpl(this);
}

abstract class _$ProductGroupCWProxy {
  ProductGroup id(String id);

  ProductGroup designator(String designator);

  ProductGroup type(ProductGroupType? type);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductGroup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductGroup(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductGroup call({
    String id,
    String designator,
    ProductGroupType? type,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductGroup.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductGroup.copyWith.fieldName(...)`
class _$ProductGroupCWProxyImpl implements _$ProductGroupCWProxy {
  const _$ProductGroupCWProxyImpl(this._value);

  final ProductGroup _value;

  @override
  ProductGroup id(String id) => this(id: id);

  @override
  ProductGroup designator(String designator) => this(designator: designator);

  @override
  ProductGroup type(ProductGroupType? type) => this(type: type);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductGroup(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductGroup(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductGroup call({
    Object? id = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
  }) {
    return ProductGroup(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as ProductGroupType?,
    );
  }
}

extension $ProductGroupCopyWith on ProductGroup {
  /// Returns a callable class that can be used as follows: `instanceOfProductGroup.copyWith(...)` or like so:`instanceOfProductGroup.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductGroupCWProxy get copyWith => _$ProductGroupCWProxyImpl(this);
}

abstract class _$ProductRelationCWProxy {
  ProductRelation productIdRef(String productIdRef);

  ProductRelation quantityValue(int quantityValue);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductRelation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductRelation(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductRelation call({
    String productIdRef,
    int quantityValue,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductRelation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductRelation.copyWith.fieldName(...)`
class _$ProductRelationCWProxyImpl implements _$ProductRelationCWProxy {
  const _$ProductRelationCWProxyImpl(this._value);

  final ProductRelation _value;

  @override
  ProductRelation productIdRef(String productIdRef) =>
      this(productIdRef: productIdRef);

  @override
  ProductRelation quantityValue(int quantityValue) =>
      this(quantityValue: quantityValue);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductRelation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductRelation(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductRelation call({
    Object? productIdRef = const $CopyWithPlaceholder(),
    Object? quantityValue = const $CopyWithPlaceholder(),
  }) {
    return ProductRelation(
      productIdRef: productIdRef == const $CopyWithPlaceholder()
          ? _value.productIdRef
          // ignore: cast_nullable_to_non_nullable
          : productIdRef as String,
      quantityValue: quantityValue == const $CopyWithPlaceholder()
          ? _value.quantityValue
          // ignore: cast_nullable_to_non_nullable
          : quantityValue as int,
    );
  }
}

extension $ProductRelationCopyWith on ProductRelation {
  /// Returns a callable class that can be used as follows: `instanceOfProductRelation.copyWith(...)` or like so:`instanceOfProductRelation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductRelationCWProxy get copyWith => _$ProductRelationCWProxyImpl(this);
}

abstract class _$CustomerCWProxy {
  Customer id(String id);

  Customer lastName(String lastName);

  Customer firstName(String? firstName);

  Customer street(String? street);

  Customer poBox(String? poBox);

  Customer postalCode(String? postalCode);

  Customer city(String? city);

  Customer state(String? state);

  Customer country(String? country);

  Customer phone(String? phone);

  Customer mobile(String? mobile);

  Customer fax(String? fax);

  Customer email(String? email);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Customer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Customer(...).copyWith(id: 12, name: "My name")
  /// ````
  Customer call({
    String id,
    String lastName,
    String? firstName,
    String? street,
    String? poBox,
    String? postalCode,
    String? city,
    String? state,
    String? country,
    String? phone,
    String? mobile,
    String? fax,
    String? email,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCustomer.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCustomer.copyWith.fieldName(...)`
class _$CustomerCWProxyImpl implements _$CustomerCWProxy {
  const _$CustomerCWProxyImpl(this._value);

  final Customer _value;

  @override
  Customer id(String id) => this(id: id);

  @override
  Customer lastName(String lastName) => this(lastName: lastName);

  @override
  Customer firstName(String? firstName) => this(firstName: firstName);

  @override
  Customer street(String? street) => this(street: street);

  @override
  Customer poBox(String? poBox) => this(poBox: poBox);

  @override
  Customer postalCode(String? postalCode) => this(postalCode: postalCode);

  @override
  Customer city(String? city) => this(city: city);

  @override
  Customer state(String? state) => this(state: state);

  @override
  Customer country(String? country) => this(country: country);

  @override
  Customer phone(String? phone) => this(phone: phone);

  @override
  Customer mobile(String? mobile) => this(mobile: mobile);

  @override
  Customer fax(String? fax) => this(fax: fax);

  @override
  Customer email(String? email) => this(email: email);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Customer(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Customer(...).copyWith(id: 12, name: "My name")
  /// ````
  Customer call({
    Object? id = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? firstName = const $CopyWithPlaceholder(),
    Object? street = const $CopyWithPlaceholder(),
    Object? poBox = const $CopyWithPlaceholder(),
    Object? postalCode = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? mobile = const $CopyWithPlaceholder(),
    Object? fax = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
  }) {
    return Customer(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String,
      firstName: firstName == const $CopyWithPlaceholder()
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String?,
      street: street == const $CopyWithPlaceholder()
          ? _value.street
          // ignore: cast_nullable_to_non_nullable
          : street as String?,
      poBox: poBox == const $CopyWithPlaceholder()
          ? _value.poBox
          // ignore: cast_nullable_to_non_nullable
          : poBox as String?,
      postalCode: postalCode == const $CopyWithPlaceholder()
          ? _value.postalCode
          // ignore: cast_nullable_to_non_nullable
          : postalCode as String?,
      city: city == const $CopyWithPlaceholder()
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String?,
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as String?,
      country: country == const $CopyWithPlaceholder()
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      mobile: mobile == const $CopyWithPlaceholder()
          ? _value.mobile
          // ignore: cast_nullable_to_non_nullable
          : mobile as String?,
      fax: fax == const $CopyWithPlaceholder()
          ? _value.fax
          // ignore: cast_nullable_to_non_nullable
          : fax as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
    );
  }
}

extension $CustomerCopyWith on Customer {
  /// Returns a callable class that can be used as follows: `instanceOfCustomer.copyWith(...)` or like so:`instanceOfCustomer.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CustomerCWProxy get copyWith => _$CustomerCWProxyImpl(this);
}

abstract class _$FarmCWProxy {
  Farm id(String id);

  Farm designator(String designator);

  Farm street(String? street);

  Farm poBox(String? poBox);

  Farm postalCode(String? postalCode);

  Farm city(String? city);

  Farm state(String? state);

  Farm country(String? country);

  Farm customerIdRef(String? customerIdRef);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Farm(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Farm(...).copyWith(id: 12, name: "My name")
  /// ````
  Farm call({
    String id,
    String designator,
    String? street,
    String? poBox,
    String? postalCode,
    String? city,
    String? state,
    String? country,
    String? customerIdRef,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFarm.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFarm.copyWith.fieldName(...)`
class _$FarmCWProxyImpl implements _$FarmCWProxy {
  const _$FarmCWProxyImpl(this._value);

  final Farm _value;

  @override
  Farm id(String id) => this(id: id);

  @override
  Farm designator(String designator) => this(designator: designator);

  @override
  Farm street(String? street) => this(street: street);

  @override
  Farm poBox(String? poBox) => this(poBox: poBox);

  @override
  Farm postalCode(String? postalCode) => this(postalCode: postalCode);

  @override
  Farm city(String? city) => this(city: city);

  @override
  Farm state(String? state) => this(state: state);

  @override
  Farm country(String? country) => this(country: country);

  @override
  Farm customerIdRef(String? customerIdRef) =>
      this(customerIdRef: customerIdRef);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Farm(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Farm(...).copyWith(id: 12, name: "My name")
  /// ````
  Farm call({
    Object? id = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? street = const $CopyWithPlaceholder(),
    Object? poBox = const $CopyWithPlaceholder(),
    Object? postalCode = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
    Object? customerIdRef = const $CopyWithPlaceholder(),
  }) {
    return Farm(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String,
      street: street == const $CopyWithPlaceholder()
          ? _value.street
          // ignore: cast_nullable_to_non_nullable
          : street as String?,
      poBox: poBox == const $CopyWithPlaceholder()
          ? _value.poBox
          // ignore: cast_nullable_to_non_nullable
          : poBox as String?,
      postalCode: postalCode == const $CopyWithPlaceholder()
          ? _value.postalCode
          // ignore: cast_nullable_to_non_nullable
          : postalCode as String?,
      city: city == const $CopyWithPlaceholder()
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String?,
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as String?,
      country: country == const $CopyWithPlaceholder()
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String?,
      customerIdRef: customerIdRef == const $CopyWithPlaceholder()
          ? _value.customerIdRef
          // ignore: cast_nullable_to_non_nullable
          : customerIdRef as String?,
    );
  }
}

extension $FarmCopyWith on Farm {
  /// Returns a callable class that can be used as follows: `instanceOfFarm.copyWith(...)` or like so:`instanceOfFarm.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FarmCWProxy get copyWith => _$FarmCWProxyImpl(this);
}

abstract class _$WorkerCWProxy {
  Worker id(String id);

  Worker lastName(String lastName);

  Worker firstName(String? firstName);

  Worker street(String? street);

  Worker poBox(String? poBox);

  Worker postalCode(String? postalCode);

  Worker city(String? city);

  Worker state(String? state);

  Worker country(String? country);

  Worker phone(String? phone);

  Worker mobile(String? mobile);

  Worker licenseNumber(String? licenseNumber);

  Worker email(String? email);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Worker(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Worker(...).copyWith(id: 12, name: "My name")
  /// ````
  Worker call({
    String id,
    String lastName,
    String? firstName,
    String? street,
    String? poBox,
    String? postalCode,
    String? city,
    String? state,
    String? country,
    String? phone,
    String? mobile,
    String? licenseNumber,
    String? email,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorker.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorker.copyWith.fieldName(...)`
class _$WorkerCWProxyImpl implements _$WorkerCWProxy {
  const _$WorkerCWProxyImpl(this._value);

  final Worker _value;

  @override
  Worker id(String id) => this(id: id);

  @override
  Worker lastName(String lastName) => this(lastName: lastName);

  @override
  Worker firstName(String? firstName) => this(firstName: firstName);

  @override
  Worker street(String? street) => this(street: street);

  @override
  Worker poBox(String? poBox) => this(poBox: poBox);

  @override
  Worker postalCode(String? postalCode) => this(postalCode: postalCode);

  @override
  Worker city(String? city) => this(city: city);

  @override
  Worker state(String? state) => this(state: state);

  @override
  Worker country(String? country) => this(country: country);

  @override
  Worker phone(String? phone) => this(phone: phone);

  @override
  Worker mobile(String? mobile) => this(mobile: mobile);

  @override
  Worker licenseNumber(String? licenseNumber) =>
      this(licenseNumber: licenseNumber);

  @override
  Worker email(String? email) => this(email: email);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Worker(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Worker(...).copyWith(id: 12, name: "My name")
  /// ````
  Worker call({
    Object? id = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? firstName = const $CopyWithPlaceholder(),
    Object? street = const $CopyWithPlaceholder(),
    Object? poBox = const $CopyWithPlaceholder(),
    Object? postalCode = const $CopyWithPlaceholder(),
    Object? city = const $CopyWithPlaceholder(),
    Object? state = const $CopyWithPlaceholder(),
    Object? country = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? mobile = const $CopyWithPlaceholder(),
    Object? licenseNumber = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
  }) {
    return Worker(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String,
      firstName: firstName == const $CopyWithPlaceholder()
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String?,
      street: street == const $CopyWithPlaceholder()
          ? _value.street
          // ignore: cast_nullable_to_non_nullable
          : street as String?,
      poBox: poBox == const $CopyWithPlaceholder()
          ? _value.poBox
          // ignore: cast_nullable_to_non_nullable
          : poBox as String?,
      postalCode: postalCode == const $CopyWithPlaceholder()
          ? _value.postalCode
          // ignore: cast_nullable_to_non_nullable
          : postalCode as String?,
      city: city == const $CopyWithPlaceholder()
          ? _value.city
          // ignore: cast_nullable_to_non_nullable
          : city as String?,
      state: state == const $CopyWithPlaceholder()
          ? _value.state
          // ignore: cast_nullable_to_non_nullable
          : state as String?,
      country: country == const $CopyWithPlaceholder()
          ? _value.country
          // ignore: cast_nullable_to_non_nullable
          : country as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      mobile: mobile == const $CopyWithPlaceholder()
          ? _value.mobile
          // ignore: cast_nullable_to_non_nullable
          : mobile as String?,
      licenseNumber: licenseNumber == const $CopyWithPlaceholder()
          ? _value.licenseNumber
          // ignore: cast_nullable_to_non_nullable
          : licenseNumber as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
    );
  }
}

extension $WorkerCopyWith on Worker {
  /// Returns a callable class that can be used as follows: `instanceOfWorker.copyWith(...)` or like so:`instanceOfWorker.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WorkerCWProxy get copyWith => _$WorkerCWProxyImpl(this);
}

abstract class _$CulturalPracticeCWProxy {
  CulturalPractice id(String id);

  CulturalPractice designator(String designator);

  CulturalPractice operationTechniqueReferences(
      List<OperationTechniqueReference>? operationTechniqueReferences);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CulturalPractice(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CulturalPractice(...).copyWith(id: 12, name: "My name")
  /// ````
  CulturalPractice call({
    String id,
    String designator,
    List<OperationTechniqueReference>? operationTechniqueReferences,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCulturalPractice.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCulturalPractice.copyWith.fieldName(...)`
class _$CulturalPracticeCWProxyImpl implements _$CulturalPracticeCWProxy {
  const _$CulturalPracticeCWProxyImpl(this._value);

  final CulturalPractice _value;

  @override
  CulturalPractice id(String id) => this(id: id);

  @override
  CulturalPractice designator(String designator) =>
      this(designator: designator);

  @override
  CulturalPractice operationTechniqueReferences(
          List<OperationTechniqueReference>? operationTechniqueReferences) =>
      this(operationTechniqueReferences: operationTechniqueReferences);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CulturalPractice(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CulturalPractice(...).copyWith(id: 12, name: "My name")
  /// ````
  CulturalPractice call({
    Object? id = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? operationTechniqueReferences = const $CopyWithPlaceholder(),
  }) {
    return CulturalPractice(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String,
      operationTechniqueReferences: operationTechniqueReferences ==
              const $CopyWithPlaceholder()
          ? _value.operationTechniqueReferences
          // ignore: cast_nullable_to_non_nullable
          : operationTechniqueReferences as List<OperationTechniqueReference>?,
    );
  }
}

extension $CulturalPracticeCopyWith on CulturalPractice {
  /// Returns a callable class that can be used as follows: `instanceOfCulturalPractice.copyWith(...)` or like so:`instanceOfCulturalPractice.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CulturalPracticeCWProxy get copyWith => _$CulturalPracticeCWProxyImpl(this);
}

abstract class _$TaskCWProxy {
  Task id(String id);

  Task status(TaskStatus status);

  Task treatmentZones(List<TreatmentZone>? treatmentZones);

  Task times(List<Time>? times);

  Task operationTechniquePractice(
      OperationTechniquePractice? operationTechniquePractice);

  Task workerAllocations(List<WorkerAllocation>? workerAllocations);

  Task deviceAllocations(List<DeviceAllocation>? deviceAllocations);

  Task connections(List<Connection>? connections);

  Task productAllocations(List<ProductAllocation>? productAllocations);

  Task dataLogTriggers(List<DataLogTrigger>? dataLogTriggers);

  Task commentAllocations(List<CommentAllocation>? commentAllocations);

  Task timeLogs(List<TimeLog>? timeLogs);

  Task grid(Grid? grid);

  Task controlAssignments(List<ControlAssignment>? controlAssignments);

  Task guidanceAllocations(List<GuidanceAllocation>? guidanceAllocations);

  Task designator(String? designator);

  Task customerIdRef(String? customerIdRef);

  Task farmIdRef(String? farmIdRef);

  Task partfieldIdRef(String? partfieldIdRef);

  Task responsibleWorkerIdRef(String? responsibleWorkerIdRef);

  Task defaultTreatmentZoneCode(int? defaultTreatmentZoneCode);

  Task positionLostTreatmentZoneCode(int? positionLostTreatmentZoneCode);

  Task outOfFieldTreatmentZoneCode(int? outOfFieldTreatmentZoneCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Task(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Task(...).copyWith(id: 12, name: "My name")
  /// ````
  Task call({
    String id,
    TaskStatus status,
    List<TreatmentZone>? treatmentZones,
    List<Time>? times,
    OperationTechniquePractice? operationTechniquePractice,
    List<WorkerAllocation>? workerAllocations,
    List<DeviceAllocation>? deviceAllocations,
    List<Connection>? connections,
    List<ProductAllocation>? productAllocations,
    List<DataLogTrigger>? dataLogTriggers,
    List<CommentAllocation>? commentAllocations,
    List<TimeLog>? timeLogs,
    Grid? grid,
    List<ControlAssignment>? controlAssignments,
    List<GuidanceAllocation>? guidanceAllocations,
    String? designator,
    String? customerIdRef,
    String? farmIdRef,
    String? partfieldIdRef,
    String? responsibleWorkerIdRef,
    int? defaultTreatmentZoneCode,
    int? positionLostTreatmentZoneCode,
    int? outOfFieldTreatmentZoneCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTask.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTask.copyWith.fieldName(...)`
class _$TaskCWProxyImpl implements _$TaskCWProxy {
  const _$TaskCWProxyImpl(this._value);

  final Task _value;

  @override
  Task id(String id) => this(id: id);

  @override
  Task status(TaskStatus status) => this(status: status);

  @override
  Task treatmentZones(List<TreatmentZone>? treatmentZones) =>
      this(treatmentZones: treatmentZones);

  @override
  Task times(List<Time>? times) => this(times: times);

  @override
  Task operationTechniquePractice(
          OperationTechniquePractice? operationTechniquePractice) =>
      this(operationTechniquePractice: operationTechniquePractice);

  @override
  Task workerAllocations(List<WorkerAllocation>? workerAllocations) =>
      this(workerAllocations: workerAllocations);

  @override
  Task deviceAllocations(List<DeviceAllocation>? deviceAllocations) =>
      this(deviceAllocations: deviceAllocations);

  @override
  Task connections(List<Connection>? connections) =>
      this(connections: connections);

  @override
  Task productAllocations(List<ProductAllocation>? productAllocations) =>
      this(productAllocations: productAllocations);

  @override
  Task dataLogTriggers(List<DataLogTrigger>? dataLogTriggers) =>
      this(dataLogTriggers: dataLogTriggers);

  @override
  Task commentAllocations(List<CommentAllocation>? commentAllocations) =>
      this(commentAllocations: commentAllocations);

  @override
  Task timeLogs(List<TimeLog>? timeLogs) => this(timeLogs: timeLogs);

  @override
  Task grid(Grid? grid) => this(grid: grid);

  @override
  Task controlAssignments(List<ControlAssignment>? controlAssignments) =>
      this(controlAssignments: controlAssignments);

  @override
  Task guidanceAllocations(List<GuidanceAllocation>? guidanceAllocations) =>
      this(guidanceAllocations: guidanceAllocations);

  @override
  Task designator(String? designator) => this(designator: designator);

  @override
  Task customerIdRef(String? customerIdRef) =>
      this(customerIdRef: customerIdRef);

  @override
  Task farmIdRef(String? farmIdRef) => this(farmIdRef: farmIdRef);

  @override
  Task partfieldIdRef(String? partfieldIdRef) =>
      this(partfieldIdRef: partfieldIdRef);

  @override
  Task responsibleWorkerIdRef(String? responsibleWorkerIdRef) =>
      this(responsibleWorkerIdRef: responsibleWorkerIdRef);

  @override
  Task defaultTreatmentZoneCode(int? defaultTreatmentZoneCode) =>
      this(defaultTreatmentZoneCode: defaultTreatmentZoneCode);

  @override
  Task positionLostTreatmentZoneCode(int? positionLostTreatmentZoneCode) =>
      this(positionLostTreatmentZoneCode: positionLostTreatmentZoneCode);

  @override
  Task outOfFieldTreatmentZoneCode(int? outOfFieldTreatmentZoneCode) =>
      this(outOfFieldTreatmentZoneCode: outOfFieldTreatmentZoneCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Task(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Task(...).copyWith(id: 12, name: "My name")
  /// ````
  Task call({
    Object? id = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? treatmentZones = const $CopyWithPlaceholder(),
    Object? times = const $CopyWithPlaceholder(),
    Object? operationTechniquePractice = const $CopyWithPlaceholder(),
    Object? workerAllocations = const $CopyWithPlaceholder(),
    Object? deviceAllocations = const $CopyWithPlaceholder(),
    Object? connections = const $CopyWithPlaceholder(),
    Object? productAllocations = const $CopyWithPlaceholder(),
    Object? dataLogTriggers = const $CopyWithPlaceholder(),
    Object? commentAllocations = const $CopyWithPlaceholder(),
    Object? timeLogs = const $CopyWithPlaceholder(),
    Object? grid = const $CopyWithPlaceholder(),
    Object? controlAssignments = const $CopyWithPlaceholder(),
    Object? guidanceAllocations = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? customerIdRef = const $CopyWithPlaceholder(),
    Object? farmIdRef = const $CopyWithPlaceholder(),
    Object? partfieldIdRef = const $CopyWithPlaceholder(),
    Object? responsibleWorkerIdRef = const $CopyWithPlaceholder(),
    Object? defaultTreatmentZoneCode = const $CopyWithPlaceholder(),
    Object? positionLostTreatmentZoneCode = const $CopyWithPlaceholder(),
    Object? outOfFieldTreatmentZoneCode = const $CopyWithPlaceholder(),
  }) {
    return Task(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as TaskStatus,
      treatmentZones: treatmentZones == const $CopyWithPlaceholder()
          ? _value.treatmentZones
          // ignore: cast_nullable_to_non_nullable
          : treatmentZones as List<TreatmentZone>?,
      times: times == const $CopyWithPlaceholder()
          ? _value.times
          // ignore: cast_nullable_to_non_nullable
          : times as List<Time>?,
      operationTechniquePractice:
          operationTechniquePractice == const $CopyWithPlaceholder()
              ? _value.operationTechniquePractice
              // ignore: cast_nullable_to_non_nullable
              : operationTechniquePractice as OperationTechniquePractice?,
      workerAllocations: workerAllocations == const $CopyWithPlaceholder()
          ? _value.workerAllocations
          // ignore: cast_nullable_to_non_nullable
          : workerAllocations as List<WorkerAllocation>?,
      deviceAllocations: deviceAllocations == const $CopyWithPlaceholder()
          ? _value.deviceAllocations
          // ignore: cast_nullable_to_non_nullable
          : deviceAllocations as List<DeviceAllocation>?,
      connections: connections == const $CopyWithPlaceholder()
          ? _value.connections
          // ignore: cast_nullable_to_non_nullable
          : connections as List<Connection>?,
      productAllocations: productAllocations == const $CopyWithPlaceholder()
          ? _value.productAllocations
          // ignore: cast_nullable_to_non_nullable
          : productAllocations as List<ProductAllocation>?,
      dataLogTriggers: dataLogTriggers == const $CopyWithPlaceholder()
          ? _value.dataLogTriggers
          // ignore: cast_nullable_to_non_nullable
          : dataLogTriggers as List<DataLogTrigger>?,
      commentAllocations: commentAllocations == const $CopyWithPlaceholder()
          ? _value.commentAllocations
          // ignore: cast_nullable_to_non_nullable
          : commentAllocations as List<CommentAllocation>?,
      timeLogs: timeLogs == const $CopyWithPlaceholder()
          ? _value.timeLogs
          // ignore: cast_nullable_to_non_nullable
          : timeLogs as List<TimeLog>?,
      grid: grid == const $CopyWithPlaceholder()
          ? _value.grid
          // ignore: cast_nullable_to_non_nullable
          : grid as Grid?,
      controlAssignments: controlAssignments == const $CopyWithPlaceholder()
          ? _value.controlAssignments
          // ignore: cast_nullable_to_non_nullable
          : controlAssignments as List<ControlAssignment>?,
      guidanceAllocations: guidanceAllocations == const $CopyWithPlaceholder()
          ? _value.guidanceAllocations
          // ignore: cast_nullable_to_non_nullable
          : guidanceAllocations as List<GuidanceAllocation>?,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String?,
      customerIdRef: customerIdRef == const $CopyWithPlaceholder()
          ? _value.customerIdRef
          // ignore: cast_nullable_to_non_nullable
          : customerIdRef as String?,
      farmIdRef: farmIdRef == const $CopyWithPlaceholder()
          ? _value.farmIdRef
          // ignore: cast_nullable_to_non_nullable
          : farmIdRef as String?,
      partfieldIdRef: partfieldIdRef == const $CopyWithPlaceholder()
          ? _value.partfieldIdRef
          // ignore: cast_nullable_to_non_nullable
          : partfieldIdRef as String?,
      responsibleWorkerIdRef:
          responsibleWorkerIdRef == const $CopyWithPlaceholder()
              ? _value.responsibleWorkerIdRef
              // ignore: cast_nullable_to_non_nullable
              : responsibleWorkerIdRef as String?,
      defaultTreatmentZoneCode:
          defaultTreatmentZoneCode == const $CopyWithPlaceholder()
              ? _value.defaultTreatmentZoneCode
              // ignore: cast_nullable_to_non_nullable
              : defaultTreatmentZoneCode as int?,
      positionLostTreatmentZoneCode:
          positionLostTreatmentZoneCode == const $CopyWithPlaceholder()
              ? _value.positionLostTreatmentZoneCode
              // ignore: cast_nullable_to_non_nullable
              : positionLostTreatmentZoneCode as int?,
      outOfFieldTreatmentZoneCode:
          outOfFieldTreatmentZoneCode == const $CopyWithPlaceholder()
              ? _value.outOfFieldTreatmentZoneCode
              // ignore: cast_nullable_to_non_nullable
              : outOfFieldTreatmentZoneCode as int?,
    );
  }
}

extension $TaskCopyWith on Task {
  /// Returns a callable class that can be used as follows: `instanceOfTask.copyWith(...)` or like so:`instanceOfTask.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TaskCWProxy get copyWith => _$TaskCWProxyImpl(this);
}

abstract class _$TaskControllerCapabilitiesCWProxy {
  TaskControllerCapabilities functionNAME(String functionNAME);

  TaskControllerCapabilities designator(String designator);

  TaskControllerCapabilities versionNumber(VersionNumber versionNumber);

  TaskControllerCapabilities providedCapabilities(int providedCapabilities);

  TaskControllerCapabilities numberOfBoomsSectionControl(
      int numberOfBoomsSectionControl);

  TaskControllerCapabilities numberOfSectionsSectionControl(
      int numberOfSectionsSectionControl);

  TaskControllerCapabilities numberOfControlChannels(
      int numberOfControlChannels);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaskControllerCapabilities(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaskControllerCapabilities(...).copyWith(id: 12, name: "My name")
  /// ````
  TaskControllerCapabilities call({
    String functionNAME,
    String designator,
    VersionNumber versionNumber,
    int providedCapabilities,
    int numberOfBoomsSectionControl,
    int numberOfSectionsSectionControl,
    int numberOfControlChannels,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTaskControllerCapabilities.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTaskControllerCapabilities.copyWith.fieldName(...)`
class _$TaskControllerCapabilitiesCWProxyImpl
    implements _$TaskControllerCapabilitiesCWProxy {
  const _$TaskControllerCapabilitiesCWProxyImpl(this._value);

  final TaskControllerCapabilities _value;

  @override
  TaskControllerCapabilities functionNAME(String functionNAME) =>
      this(functionNAME: functionNAME);

  @override
  TaskControllerCapabilities designator(String designator) =>
      this(designator: designator);

  @override
  TaskControllerCapabilities versionNumber(VersionNumber versionNumber) =>
      this(versionNumber: versionNumber);

  @override
  TaskControllerCapabilities providedCapabilities(int providedCapabilities) =>
      this(providedCapabilities: providedCapabilities);

  @override
  TaskControllerCapabilities numberOfBoomsSectionControl(
          int numberOfBoomsSectionControl) =>
      this(numberOfBoomsSectionControl: numberOfBoomsSectionControl);

  @override
  TaskControllerCapabilities numberOfSectionsSectionControl(
          int numberOfSectionsSectionControl) =>
      this(numberOfSectionsSectionControl: numberOfSectionsSectionControl);

  @override
  TaskControllerCapabilities numberOfControlChannels(
          int numberOfControlChannels) =>
      this(numberOfControlChannels: numberOfControlChannels);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TaskControllerCapabilities(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TaskControllerCapabilities(...).copyWith(id: 12, name: "My name")
  /// ````
  TaskControllerCapabilities call({
    Object? functionNAME = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? versionNumber = const $CopyWithPlaceholder(),
    Object? providedCapabilities = const $CopyWithPlaceholder(),
    Object? numberOfBoomsSectionControl = const $CopyWithPlaceholder(),
    Object? numberOfSectionsSectionControl = const $CopyWithPlaceholder(),
    Object? numberOfControlChannels = const $CopyWithPlaceholder(),
  }) {
    return TaskControllerCapabilities(
      functionNAME: functionNAME == const $CopyWithPlaceholder()
          ? _value.functionNAME
          // ignore: cast_nullable_to_non_nullable
          : functionNAME as String,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String,
      versionNumber: versionNumber == const $CopyWithPlaceholder()
          ? _value.versionNumber
          // ignore: cast_nullable_to_non_nullable
          : versionNumber as VersionNumber,
      providedCapabilities: providedCapabilities == const $CopyWithPlaceholder()
          ? _value.providedCapabilities
          // ignore: cast_nullable_to_non_nullable
          : providedCapabilities as int,
      numberOfBoomsSectionControl:
          numberOfBoomsSectionControl == const $CopyWithPlaceholder()
              ? _value.numberOfBoomsSectionControl
              // ignore: cast_nullable_to_non_nullable
              : numberOfBoomsSectionControl as int,
      numberOfSectionsSectionControl:
          numberOfSectionsSectionControl == const $CopyWithPlaceholder()
              ? _value.numberOfSectionsSectionControl
              // ignore: cast_nullable_to_non_nullable
              : numberOfSectionsSectionControl as int,
      numberOfControlChannels:
          numberOfControlChannels == const $CopyWithPlaceholder()
              ? _value.numberOfControlChannels
              // ignore: cast_nullable_to_non_nullable
              : numberOfControlChannels as int,
    );
  }
}

extension $TaskControllerCapabilitiesCopyWith on TaskControllerCapabilities {
  /// Returns a callable class that can be used as follows: `instanceOfTaskControllerCapabilities.copyWith(...)` or like so:`instanceOfTaskControllerCapabilities.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TaskControllerCapabilitiesCWProxy get copyWith =>
      _$TaskControllerCapabilitiesCWProxyImpl(this);
}

abstract class _$Iso11783TaskDataCWProxy {
  Iso11783TaskData versionMajor(VersionMajor versionMajor);

  Iso11783TaskData versionMinor(VersionMinor versionMinor);

  Iso11783TaskData managementSoftwareManufacturer(
      String managementSoftwareManufacturer);

  Iso11783TaskData managementSoftwareVersion(String managementSoftwareVersion);

  Iso11783TaskData dataTransferOrigin(DataTransferOrigin dataTransferOrigin);

  Iso11783TaskData attachedFiles(List<AttachedFile>? attachedFiles);

  Iso11783TaskData baseStations(List<BaseStation>? baseStations);

  Iso11783TaskData codedComments(List<CodedComment>? codedComments);

  Iso11783TaskData codedCommentGroups(
      List<CodedCommentGroup>? codedCommentGroups);

  Iso11783TaskData colourLegends(List<ColourLegend>? colourLegends);

  Iso11783TaskData cropTypes(List<CropType>? cropTypes);

  Iso11783TaskData culturalPractices(List<CulturalPractice>? culturalPractices);

  Iso11783TaskData customers(List<Customer>? customers);

  Iso11783TaskData devices(List<Device>? devices);

  Iso11783TaskData farms(List<Farm>? farms);

  Iso11783TaskData operationTechniques(
      List<OperationTechnique>? operationTechniques);

  Iso11783TaskData partfields(List<Partfield>? partfields);

  Iso11783TaskData products(List<Product>? products);

  Iso11783TaskData productGroups(List<ProductGroup>? productGroups);

  Iso11783TaskData tasks(List<Task>? tasks);

  Iso11783TaskData taskControllerCapabilities(
      List<TaskControllerCapabilities>? taskControllerCapabilities);

  Iso11783TaskData valuePresentations(
      List<ValuePresentation>? valuePresentations);

  Iso11783TaskData workers(List<Worker>? workers);

  Iso11783TaskData externalFileReferences(
      List<ExternalFileReference>? externalFileReferences);

  Iso11783TaskData linkList(Iso11783LinkList? linkList);

  Iso11783TaskData taskControllerManufacturer(
      String? taskControllerManufacturer);

  Iso11783TaskData taskControllerVersion(String? taskControllerVersion);

  Iso11783TaskData language(String? language);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Iso11783TaskData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Iso11783TaskData(...).copyWith(id: 12, name: "My name")
  /// ````
  Iso11783TaskData call({
    VersionMajor versionMajor,
    VersionMinor versionMinor,
    String managementSoftwareManufacturer,
    String managementSoftwareVersion,
    DataTransferOrigin dataTransferOrigin,
    List<AttachedFile>? attachedFiles,
    List<BaseStation>? baseStations,
    List<CodedComment>? codedComments,
    List<CodedCommentGroup>? codedCommentGroups,
    List<ColourLegend>? colourLegends,
    List<CropType>? cropTypes,
    List<CulturalPractice>? culturalPractices,
    List<Customer>? customers,
    List<Device>? devices,
    List<Farm>? farms,
    List<OperationTechnique>? operationTechniques,
    List<Partfield>? partfields,
    List<Product>? products,
    List<ProductGroup>? productGroups,
    List<Task>? tasks,
    List<TaskControllerCapabilities>? taskControllerCapabilities,
    List<ValuePresentation>? valuePresentations,
    List<Worker>? workers,
    List<ExternalFileReference>? externalFileReferences,
    Iso11783LinkList? linkList,
    String? taskControllerManufacturer,
    String? taskControllerVersion,
    String? language,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfIso11783TaskData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfIso11783TaskData.copyWith.fieldName(...)`
class _$Iso11783TaskDataCWProxyImpl implements _$Iso11783TaskDataCWProxy {
  const _$Iso11783TaskDataCWProxyImpl(this._value);

  final Iso11783TaskData _value;

  @override
  Iso11783TaskData versionMajor(VersionMajor versionMajor) =>
      this(versionMajor: versionMajor);

  @override
  Iso11783TaskData versionMinor(VersionMinor versionMinor) =>
      this(versionMinor: versionMinor);

  @override
  Iso11783TaskData managementSoftwareManufacturer(
          String managementSoftwareManufacturer) =>
      this(managementSoftwareManufacturer: managementSoftwareManufacturer);

  @override
  Iso11783TaskData managementSoftwareVersion(
          String managementSoftwareVersion) =>
      this(managementSoftwareVersion: managementSoftwareVersion);

  @override
  Iso11783TaskData dataTransferOrigin(DataTransferOrigin dataTransferOrigin) =>
      this(dataTransferOrigin: dataTransferOrigin);

  @override
  Iso11783TaskData attachedFiles(List<AttachedFile>? attachedFiles) =>
      this(attachedFiles: attachedFiles);

  @override
  Iso11783TaskData baseStations(List<BaseStation>? baseStations) =>
      this(baseStations: baseStations);

  @override
  Iso11783TaskData codedComments(List<CodedComment>? codedComments) =>
      this(codedComments: codedComments);

  @override
  Iso11783TaskData codedCommentGroups(
          List<CodedCommentGroup>? codedCommentGroups) =>
      this(codedCommentGroups: codedCommentGroups);

  @override
  Iso11783TaskData colourLegends(List<ColourLegend>? colourLegends) =>
      this(colourLegends: colourLegends);

  @override
  Iso11783TaskData cropTypes(List<CropType>? cropTypes) =>
      this(cropTypes: cropTypes);

  @override
  Iso11783TaskData culturalPractices(
          List<CulturalPractice>? culturalPractices) =>
      this(culturalPractices: culturalPractices);

  @override
  Iso11783TaskData customers(List<Customer>? customers) =>
      this(customers: customers);

  @override
  Iso11783TaskData devices(List<Device>? devices) => this(devices: devices);

  @override
  Iso11783TaskData farms(List<Farm>? farms) => this(farms: farms);

  @override
  Iso11783TaskData operationTechniques(
          List<OperationTechnique>? operationTechniques) =>
      this(operationTechniques: operationTechniques);

  @override
  Iso11783TaskData partfields(List<Partfield>? partfields) =>
      this(partfields: partfields);

  @override
  Iso11783TaskData products(List<Product>? products) =>
      this(products: products);

  @override
  Iso11783TaskData productGroups(List<ProductGroup>? productGroups) =>
      this(productGroups: productGroups);

  @override
  Iso11783TaskData tasks(List<Task>? tasks) => this(tasks: tasks);

  @override
  Iso11783TaskData taskControllerCapabilities(
          List<TaskControllerCapabilities>? taskControllerCapabilities) =>
      this(taskControllerCapabilities: taskControllerCapabilities);

  @override
  Iso11783TaskData valuePresentations(
          List<ValuePresentation>? valuePresentations) =>
      this(valuePresentations: valuePresentations);

  @override
  Iso11783TaskData workers(List<Worker>? workers) => this(workers: workers);

  @override
  Iso11783TaskData externalFileReferences(
          List<ExternalFileReference>? externalFileReferences) =>
      this(externalFileReferences: externalFileReferences);

  @override
  Iso11783TaskData linkList(Iso11783LinkList? linkList) =>
      this(linkList: linkList);

  @override
  Iso11783TaskData taskControllerManufacturer(
          String? taskControllerManufacturer) =>
      this(taskControllerManufacturer: taskControllerManufacturer);

  @override
  Iso11783TaskData taskControllerVersion(String? taskControllerVersion) =>
      this(taskControllerVersion: taskControllerVersion);

  @override
  Iso11783TaskData language(String? language) => this(language: language);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Iso11783TaskData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Iso11783TaskData(...).copyWith(id: 12, name: "My name")
  /// ````
  Iso11783TaskData call({
    Object? versionMajor = const $CopyWithPlaceholder(),
    Object? versionMinor = const $CopyWithPlaceholder(),
    Object? managementSoftwareManufacturer = const $CopyWithPlaceholder(),
    Object? managementSoftwareVersion = const $CopyWithPlaceholder(),
    Object? dataTransferOrigin = const $CopyWithPlaceholder(),
    Object? attachedFiles = const $CopyWithPlaceholder(),
    Object? baseStations = const $CopyWithPlaceholder(),
    Object? codedComments = const $CopyWithPlaceholder(),
    Object? codedCommentGroups = const $CopyWithPlaceholder(),
    Object? colourLegends = const $CopyWithPlaceholder(),
    Object? cropTypes = const $CopyWithPlaceholder(),
    Object? culturalPractices = const $CopyWithPlaceholder(),
    Object? customers = const $CopyWithPlaceholder(),
    Object? devices = const $CopyWithPlaceholder(),
    Object? farms = const $CopyWithPlaceholder(),
    Object? operationTechniques = const $CopyWithPlaceholder(),
    Object? partfields = const $CopyWithPlaceholder(),
    Object? products = const $CopyWithPlaceholder(),
    Object? productGroups = const $CopyWithPlaceholder(),
    Object? tasks = const $CopyWithPlaceholder(),
    Object? taskControllerCapabilities = const $CopyWithPlaceholder(),
    Object? valuePresentations = const $CopyWithPlaceholder(),
    Object? workers = const $CopyWithPlaceholder(),
    Object? externalFileReferences = const $CopyWithPlaceholder(),
    Object? linkList = const $CopyWithPlaceholder(),
    Object? taskControllerManufacturer = const $CopyWithPlaceholder(),
    Object? taskControllerVersion = const $CopyWithPlaceholder(),
    Object? language = const $CopyWithPlaceholder(),
  }) {
    return Iso11783TaskData(
      versionMajor: versionMajor == const $CopyWithPlaceholder()
          ? _value.versionMajor
          // ignore: cast_nullable_to_non_nullable
          : versionMajor as VersionMajor,
      versionMinor: versionMinor == const $CopyWithPlaceholder()
          ? _value.versionMinor
          // ignore: cast_nullable_to_non_nullable
          : versionMinor as VersionMinor,
      managementSoftwareManufacturer:
          managementSoftwareManufacturer == const $CopyWithPlaceholder()
              ? _value.managementSoftwareManufacturer
              // ignore: cast_nullable_to_non_nullable
              : managementSoftwareManufacturer as String,
      managementSoftwareVersion:
          managementSoftwareVersion == const $CopyWithPlaceholder()
              ? _value.managementSoftwareVersion
              // ignore: cast_nullable_to_non_nullable
              : managementSoftwareVersion as String,
      dataTransferOrigin: dataTransferOrigin == const $CopyWithPlaceholder()
          ? _value.dataTransferOrigin
          // ignore: cast_nullable_to_non_nullable
          : dataTransferOrigin as DataTransferOrigin,
      attachedFiles: attachedFiles == const $CopyWithPlaceholder()
          ? _value.attachedFiles
          // ignore: cast_nullable_to_non_nullable
          : attachedFiles as List<AttachedFile>?,
      baseStations: baseStations == const $CopyWithPlaceholder()
          ? _value.baseStations
          // ignore: cast_nullable_to_non_nullable
          : baseStations as List<BaseStation>?,
      codedComments: codedComments == const $CopyWithPlaceholder()
          ? _value.codedComments
          // ignore: cast_nullable_to_non_nullable
          : codedComments as List<CodedComment>?,
      codedCommentGroups: codedCommentGroups == const $CopyWithPlaceholder()
          ? _value.codedCommentGroups
          // ignore: cast_nullable_to_non_nullable
          : codedCommentGroups as List<CodedCommentGroup>?,
      colourLegends: colourLegends == const $CopyWithPlaceholder()
          ? _value.colourLegends
          // ignore: cast_nullable_to_non_nullable
          : colourLegends as List<ColourLegend>?,
      cropTypes: cropTypes == const $CopyWithPlaceholder()
          ? _value.cropTypes
          // ignore: cast_nullable_to_non_nullable
          : cropTypes as List<CropType>?,
      culturalPractices: culturalPractices == const $CopyWithPlaceholder()
          ? _value.culturalPractices
          // ignore: cast_nullable_to_non_nullable
          : culturalPractices as List<CulturalPractice>?,
      customers: customers == const $CopyWithPlaceholder()
          ? _value.customers
          // ignore: cast_nullable_to_non_nullable
          : customers as List<Customer>?,
      devices: devices == const $CopyWithPlaceholder()
          ? _value.devices
          // ignore: cast_nullable_to_non_nullable
          : devices as List<Device>?,
      farms: farms == const $CopyWithPlaceholder()
          ? _value.farms
          // ignore: cast_nullable_to_non_nullable
          : farms as List<Farm>?,
      operationTechniques: operationTechniques == const $CopyWithPlaceholder()
          ? _value.operationTechniques
          // ignore: cast_nullable_to_non_nullable
          : operationTechniques as List<OperationTechnique>?,
      partfields: partfields == const $CopyWithPlaceholder()
          ? _value.partfields
          // ignore: cast_nullable_to_non_nullable
          : partfields as List<Partfield>?,
      products: products == const $CopyWithPlaceholder()
          ? _value.products
          // ignore: cast_nullable_to_non_nullable
          : products as List<Product>?,
      productGroups: productGroups == const $CopyWithPlaceholder()
          ? _value.productGroups
          // ignore: cast_nullable_to_non_nullable
          : productGroups as List<ProductGroup>?,
      tasks: tasks == const $CopyWithPlaceholder()
          ? _value.tasks
          // ignore: cast_nullable_to_non_nullable
          : tasks as List<Task>?,
      taskControllerCapabilities:
          taskControllerCapabilities == const $CopyWithPlaceholder()
              ? _value.taskControllerCapabilities
              // ignore: cast_nullable_to_non_nullable
              : taskControllerCapabilities as List<TaskControllerCapabilities>?,
      valuePresentations: valuePresentations == const $CopyWithPlaceholder()
          ? _value.valuePresentations
          // ignore: cast_nullable_to_non_nullable
          : valuePresentations as List<ValuePresentation>?,
      workers: workers == const $CopyWithPlaceholder()
          ? _value.workers
          // ignore: cast_nullable_to_non_nullable
          : workers as List<Worker>?,
      externalFileReferences:
          externalFileReferences == const $CopyWithPlaceholder()
              ? _value.externalFileReferences
              // ignore: cast_nullable_to_non_nullable
              : externalFileReferences as List<ExternalFileReference>?,
      linkList: linkList == const $CopyWithPlaceholder()
          ? _value.linkList
          // ignore: cast_nullable_to_non_nullable
          : linkList as Iso11783LinkList?,
      taskControllerManufacturer:
          taskControllerManufacturer == const $CopyWithPlaceholder()
              ? _value.taskControllerManufacturer
              // ignore: cast_nullable_to_non_nullable
              : taskControllerManufacturer as String?,
      taskControllerVersion:
          taskControllerVersion == const $CopyWithPlaceholder()
              ? _value.taskControllerVersion
              // ignore: cast_nullable_to_non_nullable
              : taskControllerVersion as String?,
      language: language == const $CopyWithPlaceholder()
          ? _value.language
          // ignore: cast_nullable_to_non_nullable
          : language as String?,
    );
  }
}

extension $Iso11783TaskDataCopyWith on Iso11783TaskData {
  /// Returns a callable class that can be used as follows: `instanceOfIso11783TaskData.copyWith(...)` or like so:`instanceOfIso11783TaskData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$Iso11783TaskDataCWProxy get copyWith => _$Iso11783TaskDataCWProxyImpl(this);
}

abstract class _$WorkerAllocationCWProxy {
  WorkerAllocation workerIdRef(String workerIdRef);

  WorkerAllocation allocationStamp(AllocationStamp? allocationStamp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkerAllocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkerAllocation(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkerAllocation call({
    String workerIdRef,
    AllocationStamp? allocationStamp,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWorkerAllocation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWorkerAllocation.copyWith.fieldName(...)`
class _$WorkerAllocationCWProxyImpl implements _$WorkerAllocationCWProxy {
  const _$WorkerAllocationCWProxyImpl(this._value);

  final WorkerAllocation _value;

  @override
  WorkerAllocation workerIdRef(String workerIdRef) =>
      this(workerIdRef: workerIdRef);

  @override
  WorkerAllocation allocationStamp(AllocationStamp? allocationStamp) =>
      this(allocationStamp: allocationStamp);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WorkerAllocation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WorkerAllocation(...).copyWith(id: 12, name: "My name")
  /// ````
  WorkerAllocation call({
    Object? workerIdRef = const $CopyWithPlaceholder(),
    Object? allocationStamp = const $CopyWithPlaceholder(),
  }) {
    return WorkerAllocation(
      workerIdRef: workerIdRef == const $CopyWithPlaceholder()
          ? _value.workerIdRef
          // ignore: cast_nullable_to_non_nullable
          : workerIdRef as String,
      allocationStamp: allocationStamp == const $CopyWithPlaceholder()
          ? _value.allocationStamp
          // ignore: cast_nullable_to_non_nullable
          : allocationStamp as AllocationStamp?,
    );
  }
}

extension $WorkerAllocationCopyWith on WorkerAllocation {
  /// Returns a callable class that can be used as follows: `instanceOfWorkerAllocation.copyWith(...)` or like so:`instanceOfWorkerAllocation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WorkerAllocationCWProxy get copyWith => _$WorkerAllocationCWProxyImpl(this);
}

abstract class _$TimeCWProxy {
  Time start(DateTime start);

  Time type(TimeType type);

  Time positions(List<Position>? positions);

  Time dataLogValues(List<DataLogValue>? dataLogValues);

  Time stop(DateTime? stop);

  Time duration(int? duration);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Time(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Time(...).copyWith(id: 12, name: "My name")
  /// ````
  Time call({
    DateTime start,
    TimeType type,
    List<Position>? positions,
    List<DataLogValue>? dataLogValues,
    DateTime? stop,
    int? duration,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTime.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTime.copyWith.fieldName(...)`
class _$TimeCWProxyImpl implements _$TimeCWProxy {
  const _$TimeCWProxyImpl(this._value);

  final Time _value;

  @override
  Time start(DateTime start) => this(start: start);

  @override
  Time type(TimeType type) => this(type: type);

  @override
  Time positions(List<Position>? positions) => this(positions: positions);

  @override
  Time dataLogValues(List<DataLogValue>? dataLogValues) =>
      this(dataLogValues: dataLogValues);

  @override
  Time stop(DateTime? stop) => this(stop: stop);

  @override
  Time duration(int? duration) => this(duration: duration);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Time(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Time(...).copyWith(id: 12, name: "My name")
  /// ````
  Time call({
    Object? start = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? positions = const $CopyWithPlaceholder(),
    Object? dataLogValues = const $CopyWithPlaceholder(),
    Object? stop = const $CopyWithPlaceholder(),
    Object? duration = const $CopyWithPlaceholder(),
  }) {
    return Time(
      start: start == const $CopyWithPlaceholder()
          ? _value.start
          // ignore: cast_nullable_to_non_nullable
          : start as DateTime,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as TimeType,
      positions: positions == const $CopyWithPlaceholder()
          ? _value.positions
          // ignore: cast_nullable_to_non_nullable
          : positions as List<Position>?,
      dataLogValues: dataLogValues == const $CopyWithPlaceholder()
          ? _value.dataLogValues
          // ignore: cast_nullable_to_non_nullable
          : dataLogValues as List<DataLogValue>?,
      stop: stop == const $CopyWithPlaceholder()
          ? _value.stop
          // ignore: cast_nullable_to_non_nullable
          : stop as DateTime?,
      duration: duration == const $CopyWithPlaceholder()
          ? _value.duration
          // ignore: cast_nullable_to_non_nullable
          : duration as int?,
    );
  }
}

extension $TimeCopyWith on Time {
  /// Returns a callable class that can be used as follows: `instanceOfTime.copyWith(...)` or like so:`instanceOfTime.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TimeCWProxy get copyWith => _$TimeCWProxyImpl(this);
}

abstract class _$TimeLogCWProxy {
  TimeLog filename(String filename);

  TimeLog fileLength(int? fileLength);

  TimeLog type(TimeLogType type);

  TimeLog byteData(Uint8List? byteData);

  TimeLog header(TimeLogHeader? header);

  TimeLog records(List<Time>? records);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimeLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimeLog(...).copyWith(id: 12, name: "My name")
  /// ````
  TimeLog call({
    String filename,
    int? fileLength,
    TimeLogType type,
    Uint8List? byteData,
    TimeLogHeader? header,
    List<Time>? records,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTimeLog.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTimeLog.copyWith.fieldName(...)`
class _$TimeLogCWProxyImpl implements _$TimeLogCWProxy {
  const _$TimeLogCWProxyImpl(this._value);

  final TimeLog _value;

  @override
  TimeLog filename(String filename) => this(filename: filename);

  @override
  TimeLog fileLength(int? fileLength) => this(fileLength: fileLength);

  @override
  TimeLog type(TimeLogType type) => this(type: type);

  @override
  TimeLog byteData(Uint8List? byteData) => this(byteData: byteData);

  @override
  TimeLog header(TimeLogHeader? header) => this(header: header);

  @override
  TimeLog records(List<Time>? records) => this(records: records);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimeLog(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimeLog(...).copyWith(id: 12, name: "My name")
  /// ````
  TimeLog call({
    Object? filename = const $CopyWithPlaceholder(),
    Object? fileLength = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? byteData = const $CopyWithPlaceholder(),
    Object? header = const $CopyWithPlaceholder(),
    Object? records = const $CopyWithPlaceholder(),
  }) {
    return TimeLog(
      filename: filename == const $CopyWithPlaceholder()
          ? _value.filename
          // ignore: cast_nullable_to_non_nullable
          : filename as String,
      fileLength: fileLength == const $CopyWithPlaceholder()
          ? _value.fileLength
          // ignore: cast_nullable_to_non_nullable
          : fileLength as int?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as TimeLogType,
      byteData: byteData == const $CopyWithPlaceholder()
          ? _value.byteData
          // ignore: cast_nullable_to_non_nullable
          : byteData as Uint8List?,
      header: header == const $CopyWithPlaceholder()
          ? _value.header
          // ignore: cast_nullable_to_non_nullable
          : header as TimeLogHeader?,
      records: records == const $CopyWithPlaceholder()
          ? _value.records
          // ignore: cast_nullable_to_non_nullable
          : records as List<Time>?,
    );
  }
}

extension $TimeLogCopyWith on TimeLog {
  /// Returns a callable class that can be used as follows: `instanceOfTimeLog.copyWith(...)` or like so:`instanceOfTimeLog.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TimeLogCWProxy get copyWith => _$TimeLogCWProxyImpl(this);
}

abstract class _$TimeLogHeaderCWProxy {
  TimeLogHeader type(TimeType type);

  TimeLogHeader start(DateTime? start);

  TimeLogHeader position(TimeLogHeaderPosition? position);

  TimeLogHeader dataLogValues(List<TimeLogHeaderDataLogValue>? dataLogValues);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimeLogHeader(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimeLogHeader(...).copyWith(id: 12, name: "My name")
  /// ````
  TimeLogHeader call({
    TimeType type,
    DateTime? start,
    TimeLogHeaderPosition? position,
    List<TimeLogHeaderDataLogValue>? dataLogValues,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTimeLogHeader.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTimeLogHeader.copyWith.fieldName(...)`
class _$TimeLogHeaderCWProxyImpl implements _$TimeLogHeaderCWProxy {
  const _$TimeLogHeaderCWProxyImpl(this._value);

  final TimeLogHeader _value;

  @override
  TimeLogHeader type(TimeType type) => this(type: type);

  @override
  TimeLogHeader start(DateTime? start) => this(start: start);

  @override
  TimeLogHeader position(TimeLogHeaderPosition? position) =>
      this(position: position);

  @override
  TimeLogHeader dataLogValues(List<TimeLogHeaderDataLogValue>? dataLogValues) =>
      this(dataLogValues: dataLogValues);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimeLogHeader(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimeLogHeader(...).copyWith(id: 12, name: "My name")
  /// ````
  TimeLogHeader call({
    Object? type = const $CopyWithPlaceholder(),
    Object? start = const $CopyWithPlaceholder(),
    Object? position = const $CopyWithPlaceholder(),
    Object? dataLogValues = const $CopyWithPlaceholder(),
  }) {
    return TimeLogHeader(
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as TimeType,
      start: start == const $CopyWithPlaceholder()
          ? _value.start
          // ignore: cast_nullable_to_non_nullable
          : start as DateTime?,
      position: position == const $CopyWithPlaceholder()
          ? _value.position
          // ignore: cast_nullable_to_non_nullable
          : position as TimeLogHeaderPosition?,
      dataLogValues: dataLogValues == const $CopyWithPlaceholder()
          ? _value.dataLogValues
          // ignore: cast_nullable_to_non_nullable
          : dataLogValues as List<TimeLogHeaderDataLogValue>?,
    );
  }
}

extension $TimeLogHeaderCopyWith on TimeLogHeader {
  /// Returns a callable class that can be used as follows: `instanceOfTimeLogHeader.copyWith(...)` or like so:`instanceOfTimeLogHeader.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TimeLogHeaderCWProxy get copyWith => _$TimeLogHeaderCWProxyImpl(this);
}

abstract class _$TimeLogHeaderPositionCWProxy {
  TimeLogHeaderPosition readNorth(bool readNorth);

  TimeLogHeaderPosition readEast(bool readEast);

  TimeLogHeaderPosition readUp(bool readUp);

  TimeLogHeaderPosition readStatus(bool readStatus);

  TimeLogHeaderPosition readPdop(bool readPdop);

  TimeLogHeaderPosition readHdop(bool readHdop);

  TimeLogHeaderPosition readNumberOfSatellites(bool readNumberOfSatellites);

  TimeLogHeaderPosition readgpsUtcTimeMs(bool readgpsUtcTimeMs);

  TimeLogHeaderPosition readGpsUtcDate(bool readGpsUtcDate);

  TimeLogHeaderPosition north(double? north);

  TimeLogHeaderPosition east(double? east);

  TimeLogHeaderPosition status(PositionStatus? status);

  TimeLogHeaderPosition up(int? up);

  TimeLogHeaderPosition pdop(double? pdop);

  TimeLogHeaderPosition hdop(double? hdop);

  TimeLogHeaderPosition numberOfSatellites(int? numberOfSatellites);

  TimeLogHeaderPosition gpsUtcTimeMs(int? gpsUtcTimeMs);

  TimeLogHeaderPosition gpsUtcDate(int? gpsUtcDate);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimeLogHeaderPosition(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimeLogHeaderPosition(...).copyWith(id: 12, name: "My name")
  /// ````
  TimeLogHeaderPosition call({
    bool readNorth,
    bool readEast,
    bool readUp,
    bool readStatus,
    bool readPdop,
    bool readHdop,
    bool readNumberOfSatellites,
    bool readgpsUtcTimeMs,
    bool readGpsUtcDate,
    double? north,
    double? east,
    PositionStatus? status,
    int? up,
    double? pdop,
    double? hdop,
    int? numberOfSatellites,
    int? gpsUtcTimeMs,
    int? gpsUtcDate,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTimeLogHeaderPosition.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTimeLogHeaderPosition.copyWith.fieldName(...)`
class _$TimeLogHeaderPositionCWProxyImpl
    implements _$TimeLogHeaderPositionCWProxy {
  const _$TimeLogHeaderPositionCWProxyImpl(this._value);

  final TimeLogHeaderPosition _value;

  @override
  TimeLogHeaderPosition readNorth(bool readNorth) => this(readNorth: readNorth);

  @override
  TimeLogHeaderPosition readEast(bool readEast) => this(readEast: readEast);

  @override
  TimeLogHeaderPosition readUp(bool readUp) => this(readUp: readUp);

  @override
  TimeLogHeaderPosition readStatus(bool readStatus) =>
      this(readStatus: readStatus);

  @override
  TimeLogHeaderPosition readPdop(bool readPdop) => this(readPdop: readPdop);

  @override
  TimeLogHeaderPosition readHdop(bool readHdop) => this(readHdop: readHdop);

  @override
  TimeLogHeaderPosition readNumberOfSatellites(bool readNumberOfSatellites) =>
      this(readNumberOfSatellites: readNumberOfSatellites);

  @override
  TimeLogHeaderPosition readgpsUtcTimeMs(bool readgpsUtcTimeMs) =>
      this(readgpsUtcTimeMs: readgpsUtcTimeMs);

  @override
  TimeLogHeaderPosition readGpsUtcDate(bool readGpsUtcDate) =>
      this(readGpsUtcDate: readGpsUtcDate);

  @override
  TimeLogHeaderPosition north(double? north) => this(north: north);

  @override
  TimeLogHeaderPosition east(double? east) => this(east: east);

  @override
  TimeLogHeaderPosition status(PositionStatus? status) => this(status: status);

  @override
  TimeLogHeaderPosition up(int? up) => this(up: up);

  @override
  TimeLogHeaderPosition pdop(double? pdop) => this(pdop: pdop);

  @override
  TimeLogHeaderPosition hdop(double? hdop) => this(hdop: hdop);

  @override
  TimeLogHeaderPosition numberOfSatellites(int? numberOfSatellites) =>
      this(numberOfSatellites: numberOfSatellites);

  @override
  TimeLogHeaderPosition gpsUtcTimeMs(int? gpsUtcTimeMs) =>
      this(gpsUtcTimeMs: gpsUtcTimeMs);

  @override
  TimeLogHeaderPosition gpsUtcDate(int? gpsUtcDate) =>
      this(gpsUtcDate: gpsUtcDate);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimeLogHeaderPosition(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimeLogHeaderPosition(...).copyWith(id: 12, name: "My name")
  /// ````
  TimeLogHeaderPosition call({
    Object? readNorth = const $CopyWithPlaceholder(),
    Object? readEast = const $CopyWithPlaceholder(),
    Object? readUp = const $CopyWithPlaceholder(),
    Object? readStatus = const $CopyWithPlaceholder(),
    Object? readPdop = const $CopyWithPlaceholder(),
    Object? readHdop = const $CopyWithPlaceholder(),
    Object? readNumberOfSatellites = const $CopyWithPlaceholder(),
    Object? readgpsUtcTimeMs = const $CopyWithPlaceholder(),
    Object? readGpsUtcDate = const $CopyWithPlaceholder(),
    Object? north = const $CopyWithPlaceholder(),
    Object? east = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? up = const $CopyWithPlaceholder(),
    Object? pdop = const $CopyWithPlaceholder(),
    Object? hdop = const $CopyWithPlaceholder(),
    Object? numberOfSatellites = const $CopyWithPlaceholder(),
    Object? gpsUtcTimeMs = const $CopyWithPlaceholder(),
    Object? gpsUtcDate = const $CopyWithPlaceholder(),
  }) {
    return TimeLogHeaderPosition(
      readNorth: readNorth == const $CopyWithPlaceholder()
          ? _value.readNorth
          // ignore: cast_nullable_to_non_nullable
          : readNorth as bool,
      readEast: readEast == const $CopyWithPlaceholder()
          ? _value.readEast
          // ignore: cast_nullable_to_non_nullable
          : readEast as bool,
      readUp: readUp == const $CopyWithPlaceholder()
          ? _value.readUp
          // ignore: cast_nullable_to_non_nullable
          : readUp as bool,
      readStatus: readStatus == const $CopyWithPlaceholder()
          ? _value.readStatus
          // ignore: cast_nullable_to_non_nullable
          : readStatus as bool,
      readPdop: readPdop == const $CopyWithPlaceholder()
          ? _value.readPdop
          // ignore: cast_nullable_to_non_nullable
          : readPdop as bool,
      readHdop: readHdop == const $CopyWithPlaceholder()
          ? _value.readHdop
          // ignore: cast_nullable_to_non_nullable
          : readHdop as bool,
      readNumberOfSatellites:
          readNumberOfSatellites == const $CopyWithPlaceholder()
              ? _value.readNumberOfSatellites
              // ignore: cast_nullable_to_non_nullable
              : readNumberOfSatellites as bool,
      readgpsUtcTimeMs: readgpsUtcTimeMs == const $CopyWithPlaceholder()
          ? _value.readgpsUtcTimeMs
          // ignore: cast_nullable_to_non_nullable
          : readgpsUtcTimeMs as bool,
      readGpsUtcDate: readGpsUtcDate == const $CopyWithPlaceholder()
          ? _value.readGpsUtcDate
          // ignore: cast_nullable_to_non_nullable
          : readGpsUtcDate as bool,
      north: north == const $CopyWithPlaceholder()
          ? _value.north
          // ignore: cast_nullable_to_non_nullable
          : north as double?,
      east: east == const $CopyWithPlaceholder()
          ? _value.east
          // ignore: cast_nullable_to_non_nullable
          : east as double?,
      status: status == const $CopyWithPlaceholder()
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as PositionStatus?,
      up: up == const $CopyWithPlaceholder()
          ? _value.up
          // ignore: cast_nullable_to_non_nullable
          : up as int?,
      pdop: pdop == const $CopyWithPlaceholder()
          ? _value.pdop
          // ignore: cast_nullable_to_non_nullable
          : pdop as double?,
      hdop: hdop == const $CopyWithPlaceholder()
          ? _value.hdop
          // ignore: cast_nullable_to_non_nullable
          : hdop as double?,
      numberOfSatellites: numberOfSatellites == const $CopyWithPlaceholder()
          ? _value.numberOfSatellites
          // ignore: cast_nullable_to_non_nullable
          : numberOfSatellites as int?,
      gpsUtcTimeMs: gpsUtcTimeMs == const $CopyWithPlaceholder()
          ? _value.gpsUtcTimeMs
          // ignore: cast_nullable_to_non_nullable
          : gpsUtcTimeMs as int?,
      gpsUtcDate: gpsUtcDate == const $CopyWithPlaceholder()
          ? _value.gpsUtcDate
          // ignore: cast_nullable_to_non_nullable
          : gpsUtcDate as int?,
    );
  }
}

extension $TimeLogHeaderPositionCopyWith on TimeLogHeaderPosition {
  /// Returns a callable class that can be used as follows: `instanceOfTimeLogHeaderPosition.copyWith(...)` or like so:`instanceOfTimeLogHeaderPosition.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TimeLogHeaderPositionCWProxy get copyWith =>
      _$TimeLogHeaderPositionCWProxyImpl(this);
}

abstract class _$TimeLogHeaderDataLogValueCWProxy {
  TimeLogHeaderDataLogValue processDataDDI(String processDataDDI);

  TimeLogHeaderDataLogValue deviceElementIdRef(String deviceElementIdRef);

  TimeLogHeaderDataLogValue readProcessDataValue(bool readProcessDataValue);

  TimeLogHeaderDataLogValue processDataValue(int? processDataValue);

  TimeLogHeaderDataLogValue pgn(int? pgn);

  TimeLogHeaderDataLogValue pgnStartBit(int? pgnStartBit);

  TimeLogHeaderDataLogValue pgnStopBit(int? pgnStopBit);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimeLogHeaderDataLogValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimeLogHeaderDataLogValue(...).copyWith(id: 12, name: "My name")
  /// ````
  TimeLogHeaderDataLogValue call({
    String processDataDDI,
    String deviceElementIdRef,
    bool readProcessDataValue,
    int? processDataValue,
    int? pgn,
    int? pgnStartBit,
    int? pgnStopBit,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTimeLogHeaderDataLogValue.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTimeLogHeaderDataLogValue.copyWith.fieldName(...)`
class _$TimeLogHeaderDataLogValueCWProxyImpl
    implements _$TimeLogHeaderDataLogValueCWProxy {
  const _$TimeLogHeaderDataLogValueCWProxyImpl(this._value);

  final TimeLogHeaderDataLogValue _value;

  @override
  TimeLogHeaderDataLogValue processDataDDI(String processDataDDI) =>
      this(processDataDDI: processDataDDI);

  @override
  TimeLogHeaderDataLogValue deviceElementIdRef(String deviceElementIdRef) =>
      this(deviceElementIdRef: deviceElementIdRef);

  @override
  TimeLogHeaderDataLogValue readProcessDataValue(bool readProcessDataValue) =>
      this(readProcessDataValue: readProcessDataValue);

  @override
  TimeLogHeaderDataLogValue processDataValue(int? processDataValue) =>
      this(processDataValue: processDataValue);

  @override
  TimeLogHeaderDataLogValue pgn(int? pgn) => this(pgn: pgn);

  @override
  TimeLogHeaderDataLogValue pgnStartBit(int? pgnStartBit) =>
      this(pgnStartBit: pgnStartBit);

  @override
  TimeLogHeaderDataLogValue pgnStopBit(int? pgnStopBit) =>
      this(pgnStopBit: pgnStopBit);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TimeLogHeaderDataLogValue(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TimeLogHeaderDataLogValue(...).copyWith(id: 12, name: "My name")
  /// ````
  TimeLogHeaderDataLogValue call({
    Object? processDataDDI = const $CopyWithPlaceholder(),
    Object? deviceElementIdRef = const $CopyWithPlaceholder(),
    Object? readProcessDataValue = const $CopyWithPlaceholder(),
    Object? processDataValue = const $CopyWithPlaceholder(),
    Object? pgn = const $CopyWithPlaceholder(),
    Object? pgnStartBit = const $CopyWithPlaceholder(),
    Object? pgnStopBit = const $CopyWithPlaceholder(),
  }) {
    return TimeLogHeaderDataLogValue(
      processDataDDI: processDataDDI == const $CopyWithPlaceholder()
          ? _value.processDataDDI
          // ignore: cast_nullable_to_non_nullable
          : processDataDDI as String,
      deviceElementIdRef: deviceElementIdRef == const $CopyWithPlaceholder()
          ? _value.deviceElementIdRef
          // ignore: cast_nullable_to_non_nullable
          : deviceElementIdRef as String,
      readProcessDataValue: readProcessDataValue == const $CopyWithPlaceholder()
          ? _value.readProcessDataValue
          // ignore: cast_nullable_to_non_nullable
          : readProcessDataValue as bool,
      processDataValue: processDataValue == const $CopyWithPlaceholder()
          ? _value.processDataValue
          // ignore: cast_nullable_to_non_nullable
          : processDataValue as int?,
      pgn: pgn == const $CopyWithPlaceholder()
          ? _value.pgn
          // ignore: cast_nullable_to_non_nullable
          : pgn as int?,
      pgnStartBit: pgnStartBit == const $CopyWithPlaceholder()
          ? _value.pgnStartBit
          // ignore: cast_nullable_to_non_nullable
          : pgnStartBit as int?,
      pgnStopBit: pgnStopBit == const $CopyWithPlaceholder()
          ? _value.pgnStopBit
          // ignore: cast_nullable_to_non_nullable
          : pgnStopBit as int?,
    );
  }
}

extension $TimeLogHeaderDataLogValueCopyWith on TimeLogHeaderDataLogValue {
  /// Returns a callable class that can be used as follows: `instanceOfTimeLogHeaderDataLogValue.copyWith(...)` or like so:`instanceOfTimeLogHeaderDataLogValue.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TimeLogHeaderDataLogValueCWProxy get copyWith =>
      _$TimeLogHeaderDataLogValueCWProxyImpl(this);
}

abstract class _$ProcessDataVariableCWProxy {
  ProcessDataVariable ddi(String ddi);

  ProcessDataVariable value(int value);

  ProcessDataVariable processDataVariables(
      List<ProcessDataVariable>? processDataVariables);

  ProcessDataVariable productIdRef(String? productIdRef);

  ProcessDataVariable deviceElementIdRef(String? deviceElementIdRef);

  ProcessDataVariable valuePresentationIdRef(String? valuePresentationIdRef);

  ProcessDataVariable actualCulturalPracticeValue(
      int? actualCulturalPracticeValue);

  ProcessDataVariable elementTypeInstanceValue(int? elementTypeInstanceValue);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProcessDataVariable(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProcessDataVariable(...).copyWith(id: 12, name: "My name")
  /// ````
  ProcessDataVariable call({
    String ddi,
    int value,
    List<ProcessDataVariable>? processDataVariables,
    String? productIdRef,
    String? deviceElementIdRef,
    String? valuePresentationIdRef,
    int? actualCulturalPracticeValue,
    int? elementTypeInstanceValue,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProcessDataVariable.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProcessDataVariable.copyWith.fieldName(...)`
class _$ProcessDataVariableCWProxyImpl implements _$ProcessDataVariableCWProxy {
  const _$ProcessDataVariableCWProxyImpl(this._value);

  final ProcessDataVariable _value;

  @override
  ProcessDataVariable ddi(String ddi) => this(ddi: ddi);

  @override
  ProcessDataVariable value(int value) => this(value: value);

  @override
  ProcessDataVariable processDataVariables(
          List<ProcessDataVariable>? processDataVariables) =>
      this(processDataVariables: processDataVariables);

  @override
  ProcessDataVariable productIdRef(String? productIdRef) =>
      this(productIdRef: productIdRef);

  @override
  ProcessDataVariable deviceElementIdRef(String? deviceElementIdRef) =>
      this(deviceElementIdRef: deviceElementIdRef);

  @override
  ProcessDataVariable valuePresentationIdRef(String? valuePresentationIdRef) =>
      this(valuePresentationIdRef: valuePresentationIdRef);

  @override
  ProcessDataVariable actualCulturalPracticeValue(
          int? actualCulturalPracticeValue) =>
      this(actualCulturalPracticeValue: actualCulturalPracticeValue);

  @override
  ProcessDataVariable elementTypeInstanceValue(int? elementTypeInstanceValue) =>
      this(elementTypeInstanceValue: elementTypeInstanceValue);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProcessDataVariable(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProcessDataVariable(...).copyWith(id: 12, name: "My name")
  /// ````
  ProcessDataVariable call({
    Object? ddi = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
    Object? processDataVariables = const $CopyWithPlaceholder(),
    Object? productIdRef = const $CopyWithPlaceholder(),
    Object? deviceElementIdRef = const $CopyWithPlaceholder(),
    Object? valuePresentationIdRef = const $CopyWithPlaceholder(),
    Object? actualCulturalPracticeValue = const $CopyWithPlaceholder(),
    Object? elementTypeInstanceValue = const $CopyWithPlaceholder(),
  }) {
    return ProcessDataVariable(
      ddi: ddi == const $CopyWithPlaceholder()
          ? _value.ddi
          // ignore: cast_nullable_to_non_nullable
          : ddi as String,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as int,
      processDataVariables: processDataVariables == const $CopyWithPlaceholder()
          ? _value.processDataVariables
          // ignore: cast_nullable_to_non_nullable
          : processDataVariables as List<ProcessDataVariable>?,
      productIdRef: productIdRef == const $CopyWithPlaceholder()
          ? _value.productIdRef
          // ignore: cast_nullable_to_non_nullable
          : productIdRef as String?,
      deviceElementIdRef: deviceElementIdRef == const $CopyWithPlaceholder()
          ? _value.deviceElementIdRef
          // ignore: cast_nullable_to_non_nullable
          : deviceElementIdRef as String?,
      valuePresentationIdRef:
          valuePresentationIdRef == const $CopyWithPlaceholder()
              ? _value.valuePresentationIdRef
              // ignore: cast_nullable_to_non_nullable
              : valuePresentationIdRef as String?,
      actualCulturalPracticeValue:
          actualCulturalPracticeValue == const $CopyWithPlaceholder()
              ? _value.actualCulturalPracticeValue
              // ignore: cast_nullable_to_non_nullable
              : actualCulturalPracticeValue as int?,
      elementTypeInstanceValue:
          elementTypeInstanceValue == const $CopyWithPlaceholder()
              ? _value.elementTypeInstanceValue
              // ignore: cast_nullable_to_non_nullable
              : elementTypeInstanceValue as int?,
    );
  }
}

extension $ProcessDataVariableCopyWith on ProcessDataVariable {
  /// Returns a callable class that can be used as follows: `instanceOfProcessDataVariable.copyWith(...)` or like so:`instanceOfProcessDataVariable.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProcessDataVariableCWProxy get copyWith =>
      _$ProcessDataVariableCWProxyImpl(this);
}

abstract class _$TreatmentZoneCWProxy {
  TreatmentZone code(int code);

  TreatmentZone polygons(List<Polygon>? polygons);

  TreatmentZone processDataVariables(
      List<ProcessDataVariable>? processDataVariables);

  TreatmentZone designator(String? designator);

  TreatmentZone colour(int? colour);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TreatmentZone(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TreatmentZone(...).copyWith(id: 12, name: "My name")
  /// ````
  TreatmentZone call({
    int code,
    List<Polygon>? polygons,
    List<ProcessDataVariable>? processDataVariables,
    String? designator,
    int? colour,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTreatmentZone.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTreatmentZone.copyWith.fieldName(...)`
class _$TreatmentZoneCWProxyImpl implements _$TreatmentZoneCWProxy {
  const _$TreatmentZoneCWProxyImpl(this._value);

  final TreatmentZone _value;

  @override
  TreatmentZone code(int code) => this(code: code);

  @override
  TreatmentZone polygons(List<Polygon>? polygons) => this(polygons: polygons);

  @override
  TreatmentZone processDataVariables(
          List<ProcessDataVariable>? processDataVariables) =>
      this(processDataVariables: processDataVariables);

  @override
  TreatmentZone designator(String? designator) => this(designator: designator);

  @override
  TreatmentZone colour(int? colour) => this(colour: colour);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TreatmentZone(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TreatmentZone(...).copyWith(id: 12, name: "My name")
  /// ````
  TreatmentZone call({
    Object? code = const $CopyWithPlaceholder(),
    Object? polygons = const $CopyWithPlaceholder(),
    Object? processDataVariables = const $CopyWithPlaceholder(),
    Object? designator = const $CopyWithPlaceholder(),
    Object? colour = const $CopyWithPlaceholder(),
  }) {
    return TreatmentZone(
      code: code == const $CopyWithPlaceholder()
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as int,
      polygons: polygons == const $CopyWithPlaceholder()
          ? _value.polygons
          // ignore: cast_nullable_to_non_nullable
          : polygons as List<Polygon>?,
      processDataVariables: processDataVariables == const $CopyWithPlaceholder()
          ? _value.processDataVariables
          // ignore: cast_nullable_to_non_nullable
          : processDataVariables as List<ProcessDataVariable>?,
      designator: designator == const $CopyWithPlaceholder()
          ? _value.designator
          // ignore: cast_nullable_to_non_nullable
          : designator as String?,
      colour: colour == const $CopyWithPlaceholder()
          ? _value.colour
          // ignore: cast_nullable_to_non_nullable
          : colour as int?,
    );
  }
}

extension $TreatmentZoneCopyWith on TreatmentZone {
  /// Returns a callable class that can be used as follows: `instanceOfTreatmentZone.copyWith(...)` or like so:`instanceOfTreatmentZone.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TreatmentZoneCWProxy get copyWith => _$TreatmentZoneCWProxyImpl(this);
}

abstract class _$ValuePresentationCWProxy {
  ValuePresentation id(String id);

  ValuePresentation offset(int offset);

  ValuePresentation scale(double scale);

  ValuePresentation numberOfDecimals(int numberOfDecimals);

  ValuePresentation unitDesignator(String? unitDesignator);

  ValuePresentation colourLegendIdRef(String? colourLegendIdRef);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ValuePresentation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ValuePresentation(...).copyWith(id: 12, name: "My name")
  /// ````
  ValuePresentation call({
    String id,
    int offset,
    double scale,
    int numberOfDecimals,
    String? unitDesignator,
    String? colourLegendIdRef,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfValuePresentation.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfValuePresentation.copyWith.fieldName(...)`
class _$ValuePresentationCWProxyImpl implements _$ValuePresentationCWProxy {
  const _$ValuePresentationCWProxyImpl(this._value);

  final ValuePresentation _value;

  @override
  ValuePresentation id(String id) => this(id: id);

  @override
  ValuePresentation offset(int offset) => this(offset: offset);

  @override
  ValuePresentation scale(double scale) => this(scale: scale);

  @override
  ValuePresentation numberOfDecimals(int numberOfDecimals) =>
      this(numberOfDecimals: numberOfDecimals);

  @override
  ValuePresentation unitDesignator(String? unitDesignator) =>
      this(unitDesignator: unitDesignator);

  @override
  ValuePresentation colourLegendIdRef(String? colourLegendIdRef) =>
      this(colourLegendIdRef: colourLegendIdRef);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ValuePresentation(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ValuePresentation(...).copyWith(id: 12, name: "My name")
  /// ````
  ValuePresentation call({
    Object? id = const $CopyWithPlaceholder(),
    Object? offset = const $CopyWithPlaceholder(),
    Object? scale = const $CopyWithPlaceholder(),
    Object? numberOfDecimals = const $CopyWithPlaceholder(),
    Object? unitDesignator = const $CopyWithPlaceholder(),
    Object? colourLegendIdRef = const $CopyWithPlaceholder(),
  }) {
    return ValuePresentation(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      offset: offset == const $CopyWithPlaceholder()
          ? _value.offset
          // ignore: cast_nullable_to_non_nullable
          : offset as int,
      scale: scale == const $CopyWithPlaceholder()
          ? _value.scale
          // ignore: cast_nullable_to_non_nullable
          : scale as double,
      numberOfDecimals: numberOfDecimals == const $CopyWithPlaceholder()
          ? _value.numberOfDecimals
          // ignore: cast_nullable_to_non_nullable
          : numberOfDecimals as int,
      unitDesignator: unitDesignator == const $CopyWithPlaceholder()
          ? _value.unitDesignator
          // ignore: cast_nullable_to_non_nullable
          : unitDesignator as String?,
      colourLegendIdRef: colourLegendIdRef == const $CopyWithPlaceholder()
          ? _value.colourLegendIdRef
          // ignore: cast_nullable_to_non_nullable
          : colourLegendIdRef as String?,
    );
  }
}

extension $ValuePresentationCopyWith on ValuePresentation {
  /// Returns a callable class that can be used as follows: `instanceOfValuePresentation.copyWith(...)` or like so:`instanceOfValuePresentation.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ValuePresentationCWProxy get copyWith =>
      _$ValuePresentationCWProxyImpl(this);
}

// **************************************************************************
// XmlEnumGenerator
// **************************************************************************

const $AllocationStampTypeEnumMap = {
  AllocationStampType.planned: '1',
  AllocationStampType.effective: '4'
};

const $CodedCommmentScopeEnumMap = {
  CodedCommmentScope.point: '1',
  CodedCommmentScope.global: '2',
  CodedCommmentScope.continuous: '3'
};

const $DeviceElementTypeEnumMap = {
  DeviceElementType.device: '1',
  DeviceElementType.function: '2',
  DeviceElementType.bin: '3',
  DeviceElementType.section: '4',
  DeviceElementType.unit: '5',
  DeviceElementType.connector: '6',
  DeviceElementType.navigation: '7'
};

const $PreserveEnumMap = {Preserve.doNotPreserve: '1', Preserve.preserve: '2'};

const $FileTypeEnumMap = {FileType.xml: '1'};

const $GridTypeEnumMap = {GridType.one: '1', GridType.two: '2'};

const $LineStringTypeEnumMap = {
  LineStringType.polygonExterior: '1',
  LineStringType.polygonInterior: '2',
  LineStringType.tramline: '3',
  LineStringType.samplingRoute: '4',
  LineStringType.guidancePattern: '5',
  LineStringType.drainage: '6',
  LineStringType.fence: '7',
  LineStringType.flag: '8',
  LineStringType.obstacle: '9'
};

const $PointTypeEnumMap = {
  PointType.flag: '1',
  PointType.other: '2',
  PointType.fieldAccess: '3',
  PointType.storage: '4',
  PointType.obstacle: '5',
  PointType.guidanceReferenceA: '6',
  PointType.guidanceReferenceB: '7',
  PointType.guidanceReferenceCenter: '8',
  PointType.guidancePoint: '9',
  PointType.partfieldReferencePoint: '10',
  PointType.homebase: '11'
};

const $PolygonTypeEnumMap = {
  PolygonType.partfieldBoundary: '1',
  PolygonType.treatmentZone: '2',
  PolygonType.waterSurface: '3',
  PolygonType.building: '4',
  PolygonType.road: '5',
  PolygonType.obstacle: '6',
  PolygonType.flag: '7',
  PolygonType.other: '8',
  PolygonType.mainfield: '9',
  PolygonType.headland: '10',
  PolygonType.bufferZone: '11',
  PolygonType.windbreak: '12'
};

const $PositionStatusEnumMap = {
  PositionStatus.noGnssFix: '0',
  PositionStatus.gnssFix: '1',
  PositionStatus.dgnssFix: '2',
  PositionStatus.preciseGnss: '3',
  PositionStatus.rtkFixedInteger: '4',
  PositionStatus.rtkFloat: '5',
  PositionStatus.estimatedDRmode: '6',
  PositionStatus.manualInput: '7',
  PositionStatus.simulationMode: '8',
  PositionStatus.reserved: '9',
  PositionStatus.reserved10: '10',
  PositionStatus.reserved11: '11',
  PositionStatus.reserved12: '12',
  PositionStatus.reserved13: '13',
  PositionStatus.error: '14',
  PositionStatus.notAvailable: '15'
};

const $GuidancePatternTypeEnumMap = {
  GuidancePatternType.ab: '1',
  GuidancePatternType.aPlus: '2',
  GuidancePatternType.curve: '3',
  GuidancePatternType.pivot: '4',
  GuidancePatternType.spiral: '5'
};

const $GuidancePatternOptionsEnumMap = {
  GuidancePatternOptions.clockwise: '1',
  GuidancePatternOptions.counterClockwise: '2',
  GuidancePatternOptions.fullCircle: '3'
};

const $GuidancePatternPropagationDirectionEnumMap = {
  GuidancePatternPropagationDirection.both: '1',
  GuidancePatternPropagationDirection.leftOnly: '2',
  GuidancePatternPropagationDirection.rightOnly: '3',
  GuidancePatternPropagationDirection.noPropagation: '4'
};

const $GuidancePatternExtensionEnumMap = {
  GuidancePatternExtension.fromBoth: '1',
  GuidancePatternExtension.fromAOnly: '2',
  GuidancePatternExtension.fromBOnly: '3',
  GuidancePatternExtension.noExtensions: '4'
};

const $GuidancePatternGnssMethodEnumMap = {
  GuidancePatternGnssMethod.noGnssFix: '0',
  GuidancePatternGnssMethod.gnssFix: '1',
  GuidancePatternGnssMethod.dgnssFix: '2',
  GuidancePatternGnssMethod.preciseGnss: '3',
  GuidancePatternGnssMethod.rtkFixedInteger: '4',
  GuidancePatternGnssMethod.rtkFloat: '5',
  GuidancePatternGnssMethod.estimatedDRmode: '6',
  GuidancePatternGnssMethod.manualInput: '7',
  GuidancePatternGnssMethod.simulationMode: '8',
  GuidancePatternGnssMethod.desktopGeneratedData: '16',
  GuidancePatternGnssMethod.other: '17'
};

const $LinkGroupTypeEnumMap = {
  LinkGroupType.uuids: '1',
  LinkGroupType.manufacturerProprietary: '2',
  LinkGroupType.uniqueResolvableUris: '3',
  LinkGroupType.informationalResolvableUris: '4'
};

const $ProductTypeEnumMap = {
  ProductType.single: '1',
  ProductType.mixture: '2',
  ProductType.temporaryMixture: '3'
};

const $TransferModeEnumMap = {
  TransferMode.filling: '1',
  TransferMode.emptying: '2',
  TransferMode.remainder: '3'
};

const $ProductGroupTypeEnumMap = {
  ProductGroupType.productGroupDefault: '1',
  ProductGroupType.cropType: '2'
};

const $TaskStatusEnumMap = {
  TaskStatus.planned: '1',
  TaskStatus.running: '2',
  TaskStatus.paused: '3',
  TaskStatus.completed: '4',
  TaskStatus.template: '5',
  TaskStatus.cancelled: '6'
};

const $VersionNumberEnumMap = {
  VersionNumber.dis1: '0',
  VersionNumber.fdis1: '1',
  VersionNumber.fdis2: '2',
  VersionNumber.e2dis: '3',
  VersionNumber.e2fdis: '4'
};

const $TimeTypeEnumMap = {
  TimeType.planned: '1',
  TimeType.preliminary: '2',
  TimeType.effective: '4',
  TimeType.ineffective: '5',
  TimeType.repair: '6',
  TimeType.clearing: '7',
  TimeType.poweredDown: '8'
};

const $TimeLogTypeEnumMap = {TimeLogType.binaryTimeLogFileType1: '1'};

// **************************************************************************
// XmlSerializableGenerator
// **************************************************************************

void _$AllocationStampBuildXmlChildren(
    AllocationStamp instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final position = instance.position;
  final positionSerialized = position;
  for (final value in positionSerialized) {
    builder.element('PTN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final start = instance.start;
  final startSerialized = start.toIso8601String();
  builder.attribute('A', startSerialized);
  final stop = instance.stop;
  final stopSerialized = stop?.toIso8601String();
  if (stopSerialized != null) {
    builder.attribute('B', stopSerialized);
  }
  final duration = instance.duration;
  final durationSerialized = duration?.toString();
  if (durationSerialized != null) {
    builder.attribute('C', durationSerialized);
  }
  final type = instance.type;
  final typeSerialized = $AllocationStampTypeEnumMap[type]!;
  builder.attribute('D', typeSerialized);
}

void _$AllocationStampBuildXmlElement(
    AllocationStamp instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('ASP', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

AllocationStamp _$AllocationStampFromXmlElement(XmlElement element) {
  final position = element.getElements('PTN')!;
  final start = element.getAttribute('A')!;
  final stop = element.getAttribute('B');
  final duration = element.getAttribute('C');
  final type = element.getAttribute('D')!;
  return AllocationStamp(
      position: position.map((e) => Position.fromXmlElement(e)).toList(),
      start: DateTime.parse(start),
      stop: stop != null ? DateTime.parse(stop) : null,
      duration: duration != null ? int.parse(duration) : null,
      type: $AllocationStampTypeEnumMap.entries
          .singleWhere(
              (allocationStampTypeEnumMapEntry) =>
                  allocationStampTypeEnumMapEntry.value == type,
              orElse: () => throw ArgumentError(
                  '`$type` is not one of the supported values: ${$AllocationStampTypeEnumMap.values.join(', ')}'))
          .key);
}

List<XmlAttribute> _$AllocationStampToXmlAttributes(AllocationStamp instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final start = instance.start;
  final startSerialized = start.toIso8601String();
  final startConstructed = XmlAttribute(XmlName('A'), startSerialized);
  attributes.add(startConstructed);
  final stop = instance.stop;
  final stopSerialized = stop?.toIso8601String();
  final stopConstructed = stopSerialized != null
      ? XmlAttribute(XmlName('B'), stopSerialized)
      : null;
  if (stopConstructed != null) {
    attributes.add(stopConstructed);
  }
  final duration = instance.duration;
  final durationSerialized = duration?.toString();
  final durationConstructed = durationSerialized != null
      ? XmlAttribute(XmlName('C'), durationSerialized)
      : null;
  if (durationConstructed != null) {
    attributes.add(durationConstructed);
  }
  final type = instance.type;
  final typeSerialized = $AllocationStampTypeEnumMap[type]!;
  final typeConstructed = XmlAttribute(XmlName('D'), typeSerialized);
  attributes.add(typeConstructed);
  return attributes;
}

List<XmlNode> _$AllocationStampToXmlChildren(AllocationStamp instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final position = instance.position;
  final positionSerialized = position;
  final positionConstructed = positionSerialized.map((e) => XmlElement(
      XmlName('PTN'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(positionConstructed);
  return children;
}

XmlElement _$AllocationStampToXmlElement(AllocationStamp instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('ASP'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$AllocationStampXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$AllocationStampBuildXmlChildren(this as AllocationStamp, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$AllocationStampBuildXmlElement(this as AllocationStamp, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$AllocationStampToXmlAttributes(this as AllocationStamp,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$AllocationStampToXmlChildren(this as AllocationStamp,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$AllocationStampToXmlElement(this as AllocationStamp,
          namespaces: namespaces);
}

void _$BaseStationBuildXmlChildren(BaseStation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  builder.attribute('B', designatorSerialized);
  final north = instance.north;
  final northSerialized = north.toString();
  builder.attribute('C', northSerialized);
  final east = instance.east;
  final eastSerialized = east.toString();
  builder.attribute('D', eastSerialized);
  final up = instance.up;
  final upSerialized = up.toString();
  builder.attribute('E', upSerialized);
}

void _$BaseStationBuildXmlElement(BaseStation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('BSN', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

BaseStation _$BaseStationFromXmlElement(XmlElement element) {
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B')!;
  final north = element.getAttribute('C')!;
  final east = element.getAttribute('D')!;
  final up = element.getAttribute('E')!;
  return BaseStation(
      id: id,
      designator: designator,
      north: double.parse(north),
      east: double.parse(east),
      up: int.parse(up));
}

List<XmlAttribute> _$BaseStationToXmlAttributes(BaseStation instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed =
      XmlAttribute(XmlName('B'), designatorSerialized);
  attributes.add(designatorConstructed);
  final north = instance.north;
  final northSerialized = north.toString();
  final northConstructed = XmlAttribute(XmlName('C'), northSerialized);
  attributes.add(northConstructed);
  final east = instance.east;
  final eastSerialized = east.toString();
  final eastConstructed = XmlAttribute(XmlName('D'), eastSerialized);
  attributes.add(eastConstructed);
  final up = instance.up;
  final upSerialized = up.toString();
  final upConstructed = XmlAttribute(XmlName('E'), upSerialized);
  attributes.add(upConstructed);
  return attributes;
}

List<XmlNode> _$BaseStationToXmlChildren(BaseStation instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$BaseStationToXmlElement(BaseStation instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('BSN'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$BaseStationXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$BaseStationBuildXmlChildren(this as BaseStation, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$BaseStationBuildXmlElement(this as BaseStation, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$BaseStationToXmlAttributes(this as BaseStation, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$BaseStationToXmlChildren(this as BaseStation, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$BaseStationToXmlElement(this as BaseStation, namespaces: namespaces);
}

void _$CodedCommentBuildXmlChildren(CodedComment instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final listValues = instance.listValues;
  final listValuesSerialized = listValues;
  for (final value in listValuesSerialized) {
    builder.element('CCL', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  builder.attribute('B', designatorSerialized);
  final scope = instance.scope;
  final scopeSerialized = $CodedCommmentScopeEnumMap[scope]!;
  builder.attribute('C', scopeSerialized);
  final groupIdRef = instance.groupIdRef;
  final groupIdRefSerialized = groupIdRef;
  if (groupIdRefSerialized != null) {
    builder.attribute('D', groupIdRefSerialized);
  }
}

void _$CodedCommentBuildXmlElement(CodedComment instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('CCT', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

CodedComment _$CodedCommentFromXmlElement(XmlElement element) {
  final listValues = element.getElements('CCL')!;
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B')!;
  final scope = element.getAttribute('C')!;
  final groupIdRef = element.getAttribute('D');
  return CodedComment(
      listValues: listValues
          .map((e) => CodedCommentListValue.fromXmlElement(e))
          .toList(),
      id: id,
      designator: designator,
      scope: $CodedCommmentScopeEnumMap.entries
          .singleWhere(
              (codedCommmentScopeEnumMapEntry) =>
                  codedCommmentScopeEnumMapEntry.value == scope,
              orElse: () => throw ArgumentError(
                  '`$scope` is not one of the supported values: ${$CodedCommmentScopeEnumMap.values.join(', ')}'))
          .key,
      groupIdRef: groupIdRef);
}

List<XmlAttribute> _$CodedCommentToXmlAttributes(CodedComment instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed =
      XmlAttribute(XmlName('B'), designatorSerialized);
  attributes.add(designatorConstructed);
  final scope = instance.scope;
  final scopeSerialized = $CodedCommmentScopeEnumMap[scope]!;
  final scopeConstructed = XmlAttribute(XmlName('C'), scopeSerialized);
  attributes.add(scopeConstructed);
  final groupIdRef = instance.groupIdRef;
  final groupIdRefSerialized = groupIdRef;
  final groupIdRefConstructed = groupIdRefSerialized != null
      ? XmlAttribute(XmlName('D'), groupIdRefSerialized)
      : null;
  if (groupIdRefConstructed != null) {
    attributes.add(groupIdRefConstructed);
  }
  return attributes;
}

List<XmlNode> _$CodedCommentToXmlChildren(CodedComment instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final listValues = instance.listValues;
  final listValuesSerialized = listValues;
  final listValuesConstructed = listValuesSerialized.map((e) => XmlElement(
      XmlName('CCL'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(listValuesConstructed);
  return children;
}

XmlElement _$CodedCommentToXmlElement(CodedComment instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('CCT'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$CodedCommentXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CodedCommentBuildXmlChildren(this as CodedComment, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CodedCommentBuildXmlElement(this as CodedComment, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$CodedCommentToXmlAttributes(this as CodedComment,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$CodedCommentToXmlChildren(this as CodedComment, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$CodedCommentToXmlElement(this as CodedComment, namespaces: namespaces);
}

void _$CodedCommentGroupBuildXmlChildren(
    CodedCommentGroup instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  builder.attribute('B', designatorSerialized);
}

void _$CodedCommentGroupBuildXmlElement(
    CodedCommentGroup instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('CCG', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

CodedCommentGroup _$CodedCommentGroupFromXmlElement(XmlElement element) {
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B')!;
  return CodedCommentGroup(id: id, designator: designator);
}

List<XmlAttribute> _$CodedCommentGroupToXmlAttributes(
    CodedCommentGroup instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed =
      XmlAttribute(XmlName('B'), designatorSerialized);
  attributes.add(designatorConstructed);
  return attributes;
}

List<XmlNode> _$CodedCommentGroupToXmlChildren(CodedCommentGroup instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$CodedCommentGroupToXmlElement(CodedCommentGroup instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('CCG'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$CodedCommentGroupXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CodedCommentGroupBuildXmlChildren(this as CodedCommentGroup, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CodedCommentGroupBuildXmlElement(this as CodedCommentGroup, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$CodedCommentGroupToXmlAttributes(this as CodedCommentGroup,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$CodedCommentGroupToXmlChildren(this as CodedCommentGroup,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$CodedCommentGroupToXmlElement(this as CodedCommentGroup,
          namespaces: namespaces);
}

void _$CodedCommentListValueBuildXmlChildren(
    CodedCommentListValue instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  builder.attribute('B', designatorSerialized);
}

void _$CodedCommentListValueBuildXmlElement(
    CodedCommentListValue instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('CCL', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

CodedCommentListValue _$CodedCommentListValueFromXmlElement(
    XmlElement element) {
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B')!;
  return CodedCommentListValue(id: id, designator: designator);
}

List<XmlAttribute> _$CodedCommentListValueToXmlAttributes(
    CodedCommentListValue instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed =
      XmlAttribute(XmlName('B'), designatorSerialized);
  attributes.add(designatorConstructed);
  return attributes;
}

List<XmlNode> _$CodedCommentListValueToXmlChildren(
    CodedCommentListValue instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$CodedCommentListValueToXmlElement(CodedCommentListValue instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('CCL'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$CodedCommentListValueXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CodedCommentListValueBuildXmlChildren(
          this as CodedCommentListValue, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CodedCommentListValueBuildXmlElement(
          this as CodedCommentListValue, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$CodedCommentListValueToXmlAttributes(this as CodedCommentListValue,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$CodedCommentListValueToXmlChildren(this as CodedCommentListValue,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$CodedCommentListValueToXmlElement(this as CodedCommentListValue,
          namespaces: namespaces);
}

void _$CommentAllocationBuildXmlChildren(
    CommentAllocation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final allocationStamp = instance.allocationStamp;
  final allocationStampSerialized = allocationStamp;
  if (allocationStampSerialized != null) {
    builder.element('ASP', nest: () {
      allocationStampSerialized.buildXmlChildren(builder,
          namespaces: namespaces);
    });
  }
  final codedCommentIdRef = instance.codedCommentIdRef;
  final codedCommentIdRefSerialized = codedCommentIdRef;
  if (codedCommentIdRefSerialized != null) {
    builder.attribute('A', codedCommentIdRefSerialized);
  }
  final codedCommentListValueIdRef = instance.codedCommentListValueIdRef;
  final codedCommentListValueIdRefSerialized = codedCommentListValueIdRef;
  if (codedCommentListValueIdRefSerialized != null) {
    builder.attribute('B', codedCommentListValueIdRefSerialized);
  }
  final freeCommentText = instance.freeCommentText;
  final freeCommentTextSerialized = freeCommentText;
  if (freeCommentTextSerialized != null) {
    builder.attribute('C', freeCommentTextSerialized);
  }
}

void _$CommentAllocationBuildXmlElement(
    CommentAllocation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('CAN', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

CommentAllocation _$CommentAllocationFromXmlElement(XmlElement element) {
  final allocationStamp = element.getElement('ASP');
  final codedCommentIdRef = element.getAttribute('A');
  final codedCommentListValueIdRef = element.getAttribute('B');
  final freeCommentText = element.getAttribute('C');
  return CommentAllocation(
      allocationStamp: allocationStamp != null
          ? AllocationStamp.fromXmlElement(allocationStamp)
          : null,
      codedCommentIdRef: codedCommentIdRef,
      codedCommentListValueIdRef: codedCommentListValueIdRef,
      freeCommentText: freeCommentText);
}

List<XmlAttribute> _$CommentAllocationToXmlAttributes(
    CommentAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final codedCommentIdRef = instance.codedCommentIdRef;
  final codedCommentIdRefSerialized = codedCommentIdRef;
  final codedCommentIdRefConstructed = codedCommentIdRefSerialized != null
      ? XmlAttribute(XmlName('A'), codedCommentIdRefSerialized)
      : null;
  if (codedCommentIdRefConstructed != null) {
    attributes.add(codedCommentIdRefConstructed);
  }
  final codedCommentListValueIdRef = instance.codedCommentListValueIdRef;
  final codedCommentListValueIdRefSerialized = codedCommentListValueIdRef;
  final codedCommentListValueIdRefConstructed =
      codedCommentListValueIdRefSerialized != null
          ? XmlAttribute(XmlName('B'), codedCommentListValueIdRefSerialized)
          : null;
  if (codedCommentListValueIdRefConstructed != null) {
    attributes.add(codedCommentListValueIdRefConstructed);
  }
  final freeCommentText = instance.freeCommentText;
  final freeCommentTextSerialized = freeCommentText;
  final freeCommentTextConstructed = freeCommentTextSerialized != null
      ? XmlAttribute(XmlName('C'), freeCommentTextSerialized)
      : null;
  if (freeCommentTextConstructed != null) {
    attributes.add(freeCommentTextConstructed);
  }
  return attributes;
}

List<XmlNode> _$CommentAllocationToXmlChildren(CommentAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final allocationStamp = instance.allocationStamp;
  final allocationStampSerialized = allocationStamp;
  final allocationStampConstructed = allocationStampSerialized != null
      ? XmlElement(
          XmlName('ASP'),
          allocationStampSerialized.toXmlAttributes(namespaces: namespaces),
          allocationStampSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (allocationStampConstructed != null) {
    children.add(allocationStampConstructed);
  }
  return children;
}

XmlElement _$CommentAllocationToXmlElement(CommentAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('CAN'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$CommentAllocationXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CommentAllocationBuildXmlChildren(this as CommentAllocation, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CommentAllocationBuildXmlElement(this as CommentAllocation, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$CommentAllocationToXmlAttributes(this as CommentAllocation,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$CommentAllocationToXmlChildren(this as CommentAllocation,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$CommentAllocationToXmlElement(this as CommentAllocation,
          namespaces: namespaces);
}

void _$ColourLegendBuildXmlChildren(ColourLegend instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final ranges = instance.ranges;
  final rangesSerialized = ranges;
  for (final value in rangesSerialized) {
    builder.element('CRG', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final defaultColour = instance.defaultColour;
  final defaultColourSerialized = defaultColour?.toString();
  if (defaultColourSerialized != null) {
    builder.attribute('B', defaultColourSerialized);
  }
}

void _$ColourLegendBuildXmlElement(ColourLegend instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('CLD', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ColourLegend _$ColourLegendFromXmlElement(XmlElement element) {
  final ranges = element.getElements('CRG')!;
  final id = element.getAttribute('A')!;
  final defaultColour = element.getAttribute('B');
  return ColourLegend(
      ranges: ranges.map((e) => ColourRange.fromXmlElement(e)).toList(),
      id: id,
      defaultColour: defaultColour != null ? int.parse(defaultColour) : null);
}

List<XmlAttribute> _$ColourLegendToXmlAttributes(ColourLegend instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final defaultColour = instance.defaultColour;
  final defaultColourSerialized = defaultColour?.toString();
  final defaultColourConstructed = defaultColourSerialized != null
      ? XmlAttribute(XmlName('B'), defaultColourSerialized)
      : null;
  if (defaultColourConstructed != null) {
    attributes.add(defaultColourConstructed);
  }
  return attributes;
}

List<XmlNode> _$ColourLegendToXmlChildren(ColourLegend instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final ranges = instance.ranges;
  final rangesSerialized = ranges;
  final rangesConstructed = rangesSerialized.map((e) => XmlElement(
      XmlName('CRG'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(rangesConstructed);
  return children;
}

XmlElement _$ColourLegendToXmlElement(ColourLegend instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('CLD'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$ColourLegendXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ColourLegendBuildXmlChildren(this as ColourLegend, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ColourLegendBuildXmlElement(this as ColourLegend, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$ColourLegendToXmlAttributes(this as ColourLegend,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$ColourLegendToXmlChildren(this as ColourLegend, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$ColourLegendToXmlElement(this as ColourLegend, namespaces: namespaces);
}

void _$ColourRangeBuildXmlChildren(ColourRange instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final minimumValue = instance.minimumValue;
  final minimumValueSerialized = minimumValue.toString();
  builder.attribute('A', minimumValueSerialized);
  final maximumValue = instance.maximumValue;
  final maximumValueSerialized = maximumValue.toString();
  builder.attribute('B', maximumValueSerialized);
  final colour = instance.colour;
  final colourSerialized = colour.toString();
  builder.attribute('C', colourSerialized);
}

void _$ColourRangeBuildXmlElement(ColourRange instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('CRG', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ColourRange _$ColourRangeFromXmlElement(XmlElement element) {
  final minimumValue = element.getAttribute('A')!;
  final maximumValue = element.getAttribute('B')!;
  final colour = element.getAttribute('C')!;
  return ColourRange(
      minimumValue: int.parse(minimumValue),
      maximumValue: int.parse(maximumValue),
      colour: int.parse(colour));
}

List<XmlAttribute> _$ColourRangeToXmlAttributes(ColourRange instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final minimumValue = instance.minimumValue;
  final minimumValueSerialized = minimumValue.toString();
  final minimumValueConstructed =
      XmlAttribute(XmlName('A'), minimumValueSerialized);
  attributes.add(minimumValueConstructed);
  final maximumValue = instance.maximumValue;
  final maximumValueSerialized = maximumValue.toString();
  final maximumValueConstructed =
      XmlAttribute(XmlName('B'), maximumValueSerialized);
  attributes.add(maximumValueConstructed);
  final colour = instance.colour;
  final colourSerialized = colour.toString();
  final colourConstructed = XmlAttribute(XmlName('C'), colourSerialized);
  attributes.add(colourConstructed);
  return attributes;
}

List<XmlNode> _$ColourRangeToXmlChildren(ColourRange instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$ColourRangeToXmlElement(ColourRange instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('CRG'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$ColourRangeXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ColourRangeBuildXmlChildren(this as ColourRange, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ColourRangeBuildXmlElement(this as ColourRange, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$ColourRangeToXmlAttributes(this as ColourRange, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$ColourRangeToXmlChildren(this as ColourRange, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$ColourRangeToXmlElement(this as ColourRange, namespaces: namespaces);
}

void _$CropTypeBuildXmlChildren(CropType instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final varieties = instance.varieties;
  final varietiesSerialized = varieties;
  for (final value in varietiesSerialized) {
    builder.element('CVT', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  builder.attribute('B', designatorSerialized);
  final productGroupIdRef = instance.productGroupIdRef;
  final productGroupIdRefSerialized = productGroupIdRef;
  if (productGroupIdRefSerialized != null) {
    builder.attribute('C', productGroupIdRefSerialized);
  }
}

void _$CropTypeBuildXmlElement(CropType instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('CTP', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

CropType _$CropTypeFromXmlElement(XmlElement element) {
  final varieties = element.getElements('CVT')!;
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B')!;
  final productGroupIdRef = element.getAttribute('C');
  return CropType(
      varieties: varieties.map((e) => CropVariety.fromXmlElement(e)).toList(),
      id: id,
      designator: designator,
      productGroupIdRef: productGroupIdRef);
}

List<XmlAttribute> _$CropTypeToXmlAttributes(CropType instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed =
      XmlAttribute(XmlName('B'), designatorSerialized);
  attributes.add(designatorConstructed);
  final productGroupIdRef = instance.productGroupIdRef;
  final productGroupIdRefSerialized = productGroupIdRef;
  final productGroupIdRefConstructed = productGroupIdRefSerialized != null
      ? XmlAttribute(XmlName('C'), productGroupIdRefSerialized)
      : null;
  if (productGroupIdRefConstructed != null) {
    attributes.add(productGroupIdRefConstructed);
  }
  return attributes;
}

List<XmlNode> _$CropTypeToXmlChildren(CropType instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final varieties = instance.varieties;
  final varietiesSerialized = varieties;
  final varietiesConstructed = varietiesSerialized.map((e) => XmlElement(
      XmlName('CVT'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(varietiesConstructed);
  return children;
}

XmlElement _$CropTypeToXmlElement(CropType instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('CTP'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$CropTypeXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CropTypeBuildXmlChildren(this as CropType, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CropTypeBuildXmlElement(this as CropType, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$CropTypeToXmlAttributes(this as CropType, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$CropTypeToXmlChildren(this as CropType, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$CropTypeToXmlElement(this as CropType, namespaces: namespaces);
}

void _$CropVarietyBuildXmlChildren(CropVariety instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  builder.attribute('B', designatorSerialized);
  final productIdRef = instance.productIdRef;
  final productIdRefSerialized = productIdRef;
  if (productIdRefSerialized != null) {
    builder.attribute('C', productIdRefSerialized);
  }
}

void _$CropVarietyBuildXmlElement(CropVariety instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('CVT', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

CropVariety _$CropVarietyFromXmlElement(XmlElement element) {
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B')!;
  final productIdRef = element.getAttribute('C');
  return CropVariety(
      id: id, designator: designator, productIdRef: productIdRef);
}

List<XmlAttribute> _$CropVarietyToXmlAttributes(CropVariety instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed =
      XmlAttribute(XmlName('B'), designatorSerialized);
  attributes.add(designatorConstructed);
  final productIdRef = instance.productIdRef;
  final productIdRefSerialized = productIdRef;
  final productIdRefConstructed = productIdRefSerialized != null
      ? XmlAttribute(XmlName('C'), productIdRefSerialized)
      : null;
  if (productIdRefConstructed != null) {
    attributes.add(productIdRefConstructed);
  }
  return attributes;
}

List<XmlNode> _$CropVarietyToXmlChildren(CropVariety instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$CropVarietyToXmlElement(CropVariety instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('CVT'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$CropVarietyXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CropVarietyBuildXmlChildren(this as CropVariety, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CropVarietyBuildXmlElement(this as CropVariety, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$CropVarietyToXmlAttributes(this as CropVariety, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$CropVarietyToXmlChildren(this as CropVariety, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$CropVarietyToXmlElement(this as CropVariety, namespaces: namespaces);
}

void _$DataLogTriggerBuildXmlChildren(
    DataLogTrigger instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final ddi = instance.ddi;
  final ddiSerialized = ddi;
  builder.attribute('A', ddiSerialized);
  final method = instance.method;
  final methodSerialized = method.toString();
  builder.attribute('B', methodSerialized);
  final distanceInterval = instance.distanceInterval;
  final distanceIntervalSerialized = distanceInterval?.toString();
  if (distanceIntervalSerialized != null) {
    builder.attribute('C', distanceIntervalSerialized);
  }
  final timeInterval = instance.timeInterval;
  final timeIntervalSerialized = timeInterval?.toString();
  if (timeIntervalSerialized != null) {
    builder.attribute('D', timeIntervalSerialized);
  }
  final thresholdMinimum = instance.thresholdMinimum;
  final thresholdMinimumSerialized = thresholdMinimum?.toString();
  if (thresholdMinimumSerialized != null) {
    builder.attribute('E', thresholdMinimumSerialized);
  }
  final thresholdMaximum = instance.thresholdMaximum;
  final thresholdMaximumSerialized = thresholdMaximum?.toString();
  if (thresholdMaximumSerialized != null) {
    builder.attribute('F', thresholdMaximumSerialized);
  }
  final thresholdChange = instance.thresholdChange;
  final thresholdChangeSerialized = thresholdChange?.toString();
  if (thresholdChangeSerialized != null) {
    builder.attribute('G', thresholdChangeSerialized);
  }
  final deviceElementIdRef = instance.deviceElementIdRef;
  final deviceElementIdRefSerialized = deviceElementIdRef;
  if (deviceElementIdRefSerialized != null) {
    builder.attribute('H', deviceElementIdRefSerialized);
  }
  final valuePresentationIdRef = instance.valuePresentationIdRef;
  final valuePresentationIdRefSerialized = valuePresentationIdRef;
  if (valuePresentationIdRefSerialized != null) {
    builder.attribute('I', valuePresentationIdRefSerialized);
  }
  final pgn = instance.pgn;
  final pgnSerialized = pgn?.toString();
  if (pgnSerialized != null) {
    builder.attribute('J', pgnSerialized);
  }
  final pgnStartBit = instance.pgnStartBit;
  final pgnStartBitSerialized = pgnStartBit?.toString();
  if (pgnStartBitSerialized != null) {
    builder.attribute('K', pgnStartBitSerialized);
  }
  final pgnStopBit = instance.pgnStopBit;
  final pgnStopBitSerialized = pgnStopBit?.toString();
  if (pgnStopBitSerialized != null) {
    builder.attribute('L', pgnStopBitSerialized);
  }
}

void _$DataLogTriggerBuildXmlElement(
    DataLogTrigger instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('DLT', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

DataLogTrigger _$DataLogTriggerFromXmlElement(XmlElement element) {
  final ddi = element.getAttribute('A')!;
  final method = element.getAttribute('B')!;
  final distanceInterval = element.getAttribute('C');
  final timeInterval = element.getAttribute('D');
  final thresholdMinimum = element.getAttribute('E');
  final thresholdMaximum = element.getAttribute('F');
  final thresholdChange = element.getAttribute('G');
  final deviceElementIdRef = element.getAttribute('H');
  final valuePresentationIdRef = element.getAttribute('I');
  final pgn = element.getAttribute('J');
  final pgnStartBit = element.getAttribute('K');
  final pgnStopBit = element.getAttribute('L');
  return DataLogTrigger(
      ddi: ddi,
      method: int.parse(method),
      distanceInterval:
          distanceInterval != null ? int.parse(distanceInterval) : null,
      timeInterval: timeInterval != null ? int.parse(timeInterval) : null,
      thresholdMinimum:
          thresholdMinimum != null ? int.parse(thresholdMinimum) : null,
      thresholdMaximum:
          thresholdMaximum != null ? int.parse(thresholdMaximum) : null,
      thresholdChange:
          thresholdChange != null ? int.parse(thresholdChange) : null,
      deviceElementIdRef: deviceElementIdRef,
      valuePresentationIdRef: valuePresentationIdRef,
      pgn: pgn != null ? int.parse(pgn) : null,
      pgnStartBit: pgnStartBit != null ? int.parse(pgnStartBit) : null,
      pgnStopBit: pgnStopBit != null ? int.parse(pgnStopBit) : null);
}

List<XmlAttribute> _$DataLogTriggerToXmlAttributes(DataLogTrigger instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final ddi = instance.ddi;
  final ddiSerialized = ddi;
  final ddiConstructed = XmlAttribute(XmlName('A'), ddiSerialized);
  attributes.add(ddiConstructed);
  final method = instance.method;
  final methodSerialized = method.toString();
  final methodConstructed = XmlAttribute(XmlName('B'), methodSerialized);
  attributes.add(methodConstructed);
  final distanceInterval = instance.distanceInterval;
  final distanceIntervalSerialized = distanceInterval?.toString();
  final distanceIntervalConstructed = distanceIntervalSerialized != null
      ? XmlAttribute(XmlName('C'), distanceIntervalSerialized)
      : null;
  if (distanceIntervalConstructed != null) {
    attributes.add(distanceIntervalConstructed);
  }
  final timeInterval = instance.timeInterval;
  final timeIntervalSerialized = timeInterval?.toString();
  final timeIntervalConstructed = timeIntervalSerialized != null
      ? XmlAttribute(XmlName('D'), timeIntervalSerialized)
      : null;
  if (timeIntervalConstructed != null) {
    attributes.add(timeIntervalConstructed);
  }
  final thresholdMinimum = instance.thresholdMinimum;
  final thresholdMinimumSerialized = thresholdMinimum?.toString();
  final thresholdMinimumConstructed = thresholdMinimumSerialized != null
      ? XmlAttribute(XmlName('E'), thresholdMinimumSerialized)
      : null;
  if (thresholdMinimumConstructed != null) {
    attributes.add(thresholdMinimumConstructed);
  }
  final thresholdMaximum = instance.thresholdMaximum;
  final thresholdMaximumSerialized = thresholdMaximum?.toString();
  final thresholdMaximumConstructed = thresholdMaximumSerialized != null
      ? XmlAttribute(XmlName('F'), thresholdMaximumSerialized)
      : null;
  if (thresholdMaximumConstructed != null) {
    attributes.add(thresholdMaximumConstructed);
  }
  final thresholdChange = instance.thresholdChange;
  final thresholdChangeSerialized = thresholdChange?.toString();
  final thresholdChangeConstructed = thresholdChangeSerialized != null
      ? XmlAttribute(XmlName('G'), thresholdChangeSerialized)
      : null;
  if (thresholdChangeConstructed != null) {
    attributes.add(thresholdChangeConstructed);
  }
  final deviceElementIdRef = instance.deviceElementIdRef;
  final deviceElementIdRefSerialized = deviceElementIdRef;
  final deviceElementIdRefConstructed = deviceElementIdRefSerialized != null
      ? XmlAttribute(XmlName('H'), deviceElementIdRefSerialized)
      : null;
  if (deviceElementIdRefConstructed != null) {
    attributes.add(deviceElementIdRefConstructed);
  }
  final valuePresentationIdRef = instance.valuePresentationIdRef;
  final valuePresentationIdRefSerialized = valuePresentationIdRef;
  final valuePresentationIdRefConstructed =
      valuePresentationIdRefSerialized != null
          ? XmlAttribute(XmlName('I'), valuePresentationIdRefSerialized)
          : null;
  if (valuePresentationIdRefConstructed != null) {
    attributes.add(valuePresentationIdRefConstructed);
  }
  final pgn = instance.pgn;
  final pgnSerialized = pgn?.toString();
  final pgnConstructed =
      pgnSerialized != null ? XmlAttribute(XmlName('J'), pgnSerialized) : null;
  if (pgnConstructed != null) {
    attributes.add(pgnConstructed);
  }
  final pgnStartBit = instance.pgnStartBit;
  final pgnStartBitSerialized = pgnStartBit?.toString();
  final pgnStartBitConstructed = pgnStartBitSerialized != null
      ? XmlAttribute(XmlName('K'), pgnStartBitSerialized)
      : null;
  if (pgnStartBitConstructed != null) {
    attributes.add(pgnStartBitConstructed);
  }
  final pgnStopBit = instance.pgnStopBit;
  final pgnStopBitSerialized = pgnStopBit?.toString();
  final pgnStopBitConstructed = pgnStopBitSerialized != null
      ? XmlAttribute(XmlName('L'), pgnStopBitSerialized)
      : null;
  if (pgnStopBitConstructed != null) {
    attributes.add(pgnStopBitConstructed);
  }
  return attributes;
}

List<XmlNode> _$DataLogTriggerToXmlChildren(DataLogTrigger instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$DataLogTriggerToXmlElement(DataLogTrigger instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('DLT'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$DataLogTriggerXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DataLogTriggerBuildXmlChildren(this as DataLogTrigger, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DataLogTriggerBuildXmlElement(this as DataLogTrigger, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$DataLogTriggerToXmlAttributes(this as DataLogTrigger,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$DataLogTriggerToXmlChildren(this as DataLogTrigger,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$DataLogTriggerToXmlElement(this as DataLogTrigger,
          namespaces: namespaces);
}

void _$DataLogValueBuildXmlChildren(DataLogValue instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final processDataDDI = instance.processDataDDI;
  final processDataDDISerialized = processDataDDI;
  builder.attribute('A', processDataDDISerialized);
  final processDataValue = instance.processDataValue;
  final processDataValueSerialized = processDataValue.toString();
  builder.attribute('B', processDataValueSerialized);
  final deviceElementIdRef = instance.deviceElementIdRef;
  final deviceElementIdRefSerialized = deviceElementIdRef;
  builder.attribute('C', deviceElementIdRefSerialized);
  final pgn = instance.pgn;
  final pgnSerialized = pgn?.toString();
  if (pgnSerialized != null) {
    builder.attribute('D', pgnSerialized);
  }
  final pgnStartBit = instance.pgnStartBit;
  final pgnStartBitSerialized = pgnStartBit?.toString();
  if (pgnStartBitSerialized != null) {
    builder.attribute('E', pgnStartBitSerialized);
  }
  final pgnStopBit = instance.pgnStopBit;
  final pgnStopBitSerialized = pgnStopBit?.toString();
  if (pgnStopBitSerialized != null) {
    builder.attribute('F', pgnStopBitSerialized);
  }
}

void _$DataLogValueBuildXmlElement(DataLogValue instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('DLV', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

DataLogValue _$DataLogValueFromXmlElement(XmlElement element) {
  final processDataDDI = element.getAttribute('A')!;
  final processDataValue = element.getAttribute('B')!;
  final deviceElementIdRef = element.getAttribute('C')!;
  final pgn = element.getAttribute('D');
  final pgnStartBit = element.getAttribute('E');
  final pgnStopBit = element.getAttribute('F');
  return DataLogValue(
      processDataDDI: processDataDDI,
      processDataValue: int.parse(processDataValue),
      deviceElementIdRef: deviceElementIdRef,
      pgn: pgn != null ? int.parse(pgn) : null,
      pgnStartBit: pgnStartBit != null ? int.parse(pgnStartBit) : null,
      pgnStopBit: pgnStopBit != null ? int.parse(pgnStopBit) : null);
}

List<XmlAttribute> _$DataLogValueToXmlAttributes(DataLogValue instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final processDataDDI = instance.processDataDDI;
  final processDataDDISerialized = processDataDDI;
  final processDataDDIConstructed =
      XmlAttribute(XmlName('A'), processDataDDISerialized);
  attributes.add(processDataDDIConstructed);
  final processDataValue = instance.processDataValue;
  final processDataValueSerialized = processDataValue.toString();
  final processDataValueConstructed =
      XmlAttribute(XmlName('B'), processDataValueSerialized);
  attributes.add(processDataValueConstructed);
  final deviceElementIdRef = instance.deviceElementIdRef;
  final deviceElementIdRefSerialized = deviceElementIdRef;
  final deviceElementIdRefConstructed =
      XmlAttribute(XmlName('C'), deviceElementIdRefSerialized);
  attributes.add(deviceElementIdRefConstructed);
  final pgn = instance.pgn;
  final pgnSerialized = pgn?.toString();
  final pgnConstructed =
      pgnSerialized != null ? XmlAttribute(XmlName('D'), pgnSerialized) : null;
  if (pgnConstructed != null) {
    attributes.add(pgnConstructed);
  }
  final pgnStartBit = instance.pgnStartBit;
  final pgnStartBitSerialized = pgnStartBit?.toString();
  final pgnStartBitConstructed = pgnStartBitSerialized != null
      ? XmlAttribute(XmlName('E'), pgnStartBitSerialized)
      : null;
  if (pgnStartBitConstructed != null) {
    attributes.add(pgnStartBitConstructed);
  }
  final pgnStopBit = instance.pgnStopBit;
  final pgnStopBitSerialized = pgnStopBit?.toString();
  final pgnStopBitConstructed = pgnStopBitSerialized != null
      ? XmlAttribute(XmlName('F'), pgnStopBitSerialized)
      : null;
  if (pgnStopBitConstructed != null) {
    attributes.add(pgnStopBitConstructed);
  }
  return attributes;
}

List<XmlNode> _$DataLogValueToXmlChildren(DataLogValue instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$DataLogValueToXmlElement(DataLogValue instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('DLV'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$DataLogValueXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DataLogValueBuildXmlChildren(this as DataLogValue, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DataLogValueBuildXmlElement(this as DataLogValue, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$DataLogValueToXmlAttributes(this as DataLogValue,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$DataLogValueToXmlChildren(this as DataLogValue, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$DataLogValueToXmlElement(this as DataLogValue, namespaces: namespaces);
}

void _$ConnectionBuildXmlChildren(Connection instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final deviceIdRef_0 = instance.deviceIdRef_0;
  final deviceIdRef_0Serialized = deviceIdRef_0;
  builder.attribute('A', deviceIdRef_0Serialized);
  final deviceElementIdRef_0 = instance.deviceElementIdRef_0;
  final deviceElementIdRef_0Serialized = deviceElementIdRef_0;
  builder.attribute('B', deviceElementIdRef_0Serialized);
  final deviceIdRef_1 = instance.deviceIdRef_1;
  final deviceIdRef_1Serialized = deviceIdRef_1;
  builder.attribute('C', deviceIdRef_1Serialized);
  final deviceElementIdRef_1 = instance.deviceElementIdRef_1;
  final deviceElementIdRef_1Serialized = deviceElementIdRef_1;
  builder.attribute('D', deviceElementIdRef_1Serialized);
}

void _$ConnectionBuildXmlElement(Connection instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('CNN', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Connection _$ConnectionFromXmlElement(XmlElement element) {
  final deviceIdRef_0 = element.getAttribute('A')!;
  final deviceElementIdRef_0 = element.getAttribute('B')!;
  final deviceIdRef_1 = element.getAttribute('C')!;
  final deviceElementIdRef_1 = element.getAttribute('D')!;
  return Connection(
      deviceIdRef_0: deviceIdRef_0,
      deviceElementIdRef_0: deviceElementIdRef_0,
      deviceIdRef_1: deviceIdRef_1,
      deviceElementIdRef_1: deviceElementIdRef_1);
}

List<XmlAttribute> _$ConnectionToXmlAttributes(Connection instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final deviceIdRef_0 = instance.deviceIdRef_0;
  final deviceIdRef_0Serialized = deviceIdRef_0;
  final deviceIdRef_0Constructed =
      XmlAttribute(XmlName('A'), deviceIdRef_0Serialized);
  attributes.add(deviceIdRef_0Constructed);
  final deviceElementIdRef_0 = instance.deviceElementIdRef_0;
  final deviceElementIdRef_0Serialized = deviceElementIdRef_0;
  final deviceElementIdRef_0Constructed =
      XmlAttribute(XmlName('B'), deviceElementIdRef_0Serialized);
  attributes.add(deviceElementIdRef_0Constructed);
  final deviceIdRef_1 = instance.deviceIdRef_1;
  final deviceIdRef_1Serialized = deviceIdRef_1;
  final deviceIdRef_1Constructed =
      XmlAttribute(XmlName('C'), deviceIdRef_1Serialized);
  attributes.add(deviceIdRef_1Constructed);
  final deviceElementIdRef_1 = instance.deviceElementIdRef_1;
  final deviceElementIdRef_1Serialized = deviceElementIdRef_1;
  final deviceElementIdRef_1Constructed =
      XmlAttribute(XmlName('D'), deviceElementIdRef_1Serialized);
  attributes.add(deviceElementIdRef_1Constructed);
  return attributes;
}

List<XmlNode> _$ConnectionToXmlChildren(Connection instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$ConnectionToXmlElement(Connection instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('CNN'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$ConnectionXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ConnectionBuildXmlChildren(this as Connection, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ConnectionBuildXmlElement(this as Connection, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$ConnectionToXmlAttributes(this as Connection, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$ConnectionToXmlChildren(this as Connection, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$ConnectionToXmlElement(this as Connection, namespaces: namespaces);
}

void _$ControlAssignmentBuildXmlChildren(
    ControlAssignment instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final allocationStamp = instance.allocationStamp;
  final allocationStampSerialized = allocationStamp;
  if (allocationStampSerialized != null) {
    builder.element('ASP', nest: () {
      allocationStampSerialized.buildXmlChildren(builder,
          namespaces: namespaces);
    });
  }
  final sourceClientNAME = instance.sourceClientNAME;
  final sourceClientNAMESerialized = sourceClientNAME;
  builder.attribute('A', sourceClientNAMESerialized);
  final userClientNAME = instance.userClientNAME;
  final userClientNAMESerialized = userClientNAME;
  builder.attribute('B', userClientNAMESerialized);
  final sourceDeviceStructureLabel = instance.sourceDeviceStructureLabel;
  final sourceDeviceStructureLabelSerialized = sourceDeviceStructureLabel;
  builder.attribute('C', sourceDeviceStructureLabelSerialized);
  final userDeviceStructureLabel = instance.userDeviceStructureLabel;
  final userDeviceStructureLabelSerialized = userDeviceStructureLabel;
  builder.attribute('D', userDeviceStructureLabelSerialized);
  final sourceDeviceElementNumber = instance.sourceDeviceElementNumber;
  final sourceDeviceElementNumberSerialized =
      sourceDeviceElementNumber.toString();
  builder.attribute('E', sourceDeviceElementNumberSerialized);
  final userDeviceElementNumber = instance.userDeviceElementNumber;
  final userDeviceElementNumberSerialized = userDeviceElementNumber.toString();
  builder.attribute('F', userDeviceElementNumberSerialized);
  final processDataDDI = instance.processDataDDI;
  final processDataDDISerialized = processDataDDI;
  builder.attribute('G', processDataDDISerialized);
}

void _$ControlAssignmentBuildXmlElement(
    ControlAssignment instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('CAT', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ControlAssignment _$ControlAssignmentFromXmlElement(XmlElement element) {
  final allocationStamp = element.getElement('ASP');
  final sourceClientNAME = element.getAttribute('A')!;
  final userClientNAME = element.getAttribute('B')!;
  final sourceDeviceStructureLabel = element.getAttribute('C')!;
  final userDeviceStructureLabel = element.getAttribute('D')!;
  final sourceDeviceElementNumber = element.getAttribute('E')!;
  final userDeviceElementNumber = element.getAttribute('F')!;
  final processDataDDI = element.getAttribute('G')!;
  return ControlAssignment(
      allocationStamp: allocationStamp != null
          ? AllocationStamp.fromXmlElement(allocationStamp)
          : null,
      sourceClientNAME: sourceClientNAME,
      userClientNAME: userClientNAME,
      sourceDeviceStructureLabel: sourceDeviceStructureLabel,
      userDeviceStructureLabel: userDeviceStructureLabel,
      sourceDeviceElementNumber: int.parse(sourceDeviceElementNumber),
      userDeviceElementNumber: int.parse(userDeviceElementNumber),
      processDataDDI: processDataDDI);
}

List<XmlAttribute> _$ControlAssignmentToXmlAttributes(
    ControlAssignment instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final sourceClientNAME = instance.sourceClientNAME;
  final sourceClientNAMESerialized = sourceClientNAME;
  final sourceClientNAMEConstructed =
      XmlAttribute(XmlName('A'), sourceClientNAMESerialized);
  attributes.add(sourceClientNAMEConstructed);
  final userClientNAME = instance.userClientNAME;
  final userClientNAMESerialized = userClientNAME;
  final userClientNAMEConstructed =
      XmlAttribute(XmlName('B'), userClientNAMESerialized);
  attributes.add(userClientNAMEConstructed);
  final sourceDeviceStructureLabel = instance.sourceDeviceStructureLabel;
  final sourceDeviceStructureLabelSerialized = sourceDeviceStructureLabel;
  final sourceDeviceStructureLabelConstructed =
      XmlAttribute(XmlName('C'), sourceDeviceStructureLabelSerialized);
  attributes.add(sourceDeviceStructureLabelConstructed);
  final userDeviceStructureLabel = instance.userDeviceStructureLabel;
  final userDeviceStructureLabelSerialized = userDeviceStructureLabel;
  final userDeviceStructureLabelConstructed =
      XmlAttribute(XmlName('D'), userDeviceStructureLabelSerialized);
  attributes.add(userDeviceStructureLabelConstructed);
  final sourceDeviceElementNumber = instance.sourceDeviceElementNumber;
  final sourceDeviceElementNumberSerialized =
      sourceDeviceElementNumber.toString();
  final sourceDeviceElementNumberConstructed =
      XmlAttribute(XmlName('E'), sourceDeviceElementNumberSerialized);
  attributes.add(sourceDeviceElementNumberConstructed);
  final userDeviceElementNumber = instance.userDeviceElementNumber;
  final userDeviceElementNumberSerialized = userDeviceElementNumber.toString();
  final userDeviceElementNumberConstructed =
      XmlAttribute(XmlName('F'), userDeviceElementNumberSerialized);
  attributes.add(userDeviceElementNumberConstructed);
  final processDataDDI = instance.processDataDDI;
  final processDataDDISerialized = processDataDDI;
  final processDataDDIConstructed =
      XmlAttribute(XmlName('G'), processDataDDISerialized);
  attributes.add(processDataDDIConstructed);
  return attributes;
}

List<XmlNode> _$ControlAssignmentToXmlChildren(ControlAssignment instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final allocationStamp = instance.allocationStamp;
  final allocationStampSerialized = allocationStamp;
  final allocationStampConstructed = allocationStampSerialized != null
      ? XmlElement(
          XmlName('ASP'),
          allocationStampSerialized.toXmlAttributes(namespaces: namespaces),
          allocationStampSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (allocationStampConstructed != null) {
    children.add(allocationStampConstructed);
  }
  return children;
}

XmlElement _$ControlAssignmentToXmlElement(ControlAssignment instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('CAT'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$ControlAssignmentXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ControlAssignmentBuildXmlChildren(this as ControlAssignment, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ControlAssignmentBuildXmlElement(this as ControlAssignment, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$ControlAssignmentToXmlAttributes(this as ControlAssignment,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$ControlAssignmentToXmlChildren(this as ControlAssignment,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$ControlAssignmentToXmlElement(this as ControlAssignment,
          namespaces: namespaces);
}

void _$DeviceBuildXmlChildren(Device instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final elements = instance.elements;
  final elementsSerialized = elements;
  for (final value in elementsSerialized) {
    builder.element('DET', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final processData = instance.processData;
  final processDataSerialized = processData;
  for (final value in processDataSerialized) {
    builder.element('DPD', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final properties = instance.properties;
  final propertiesSerialized = properties;
  for (final value in propertiesSerialized) {
    builder.element('DPT', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final valuePresentations = instance.valuePresentations;
  final valuePresentationsSerialized = valuePresentations;
  for (final value in valuePresentationsSerialized) {
    builder.element('DVP', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  if (designatorSerialized != null) {
    builder.attribute('B', designatorSerialized);
  }
  final softwareVersion = instance.softwareVersion;
  final softwareVersionSerialized = softwareVersion;
  if (softwareVersionSerialized != null) {
    builder.attribute('C', softwareVersionSerialized);
  }
  final clientNAME = instance.clientNAME;
  final clientNAMESerialized = clientNAME;
  builder.attribute('D', clientNAMESerialized);
  final serialNumber = instance.serialNumber;
  final serialNumberSerialized = serialNumber;
  if (serialNumberSerialized != null) {
    builder.attribute('E', serialNumberSerialized);
  }
  final structureLabel = instance.structureLabel;
  final structureLabelSerialized = structureLabel;
  builder.attribute('F', structureLabelSerialized);
  final localizationLabel = instance.localizationLabel;
  final localizationLabelSerialized = localizationLabel;
  builder.attribute('G', localizationLabelSerialized);
}

void _$DeviceBuildXmlElement(Device instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('DVC', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Device _$DeviceFromXmlElement(XmlElement element) {
  final elements = element.getElements('DET')!;
  final processData = element.getElements('DPD')!;
  final properties = element.getElements('DPT')!;
  final valuePresentations = element.getElements('DVP')!;
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B');
  final softwareVersion = element.getAttribute('C');
  final clientNAME = element.getAttribute('D')!;
  final serialNumber = element.getAttribute('E');
  final structureLabel = element.getAttribute('F')!;
  final localizationLabel = element.getAttribute('G')!;
  return Device(
      elements: elements.map((e) => DeviceElement.fromXmlElement(e)).toList(),
      processData:
          processData.map((e) => DeviceProcessData.fromXmlElement(e)).toList(),
      properties:
          properties.map((e) => DeviceProperty.fromXmlElement(e)).toList(),
      valuePresentations: valuePresentations
          .map((e) => DeviceValuePresentation.fromXmlElement(e))
          .toList(),
      id: id,
      designator: designator,
      softwareVersion: softwareVersion,
      clientNAME: clientNAME,
      serialNumber: serialNumber,
      structureLabel: structureLabel,
      localizationLabel: localizationLabel);
}

List<XmlAttribute> _$DeviceToXmlAttributes(Device instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed = designatorSerialized != null
      ? XmlAttribute(XmlName('B'), designatorSerialized)
      : null;
  if (designatorConstructed != null) {
    attributes.add(designatorConstructed);
  }
  final softwareVersion = instance.softwareVersion;
  final softwareVersionSerialized = softwareVersion;
  final softwareVersionConstructed = softwareVersionSerialized != null
      ? XmlAttribute(XmlName('C'), softwareVersionSerialized)
      : null;
  if (softwareVersionConstructed != null) {
    attributes.add(softwareVersionConstructed);
  }
  final clientNAME = instance.clientNAME;
  final clientNAMESerialized = clientNAME;
  final clientNAMEConstructed =
      XmlAttribute(XmlName('D'), clientNAMESerialized);
  attributes.add(clientNAMEConstructed);
  final serialNumber = instance.serialNumber;
  final serialNumberSerialized = serialNumber;
  final serialNumberConstructed = serialNumberSerialized != null
      ? XmlAttribute(XmlName('E'), serialNumberSerialized)
      : null;
  if (serialNumberConstructed != null) {
    attributes.add(serialNumberConstructed);
  }
  final structureLabel = instance.structureLabel;
  final structureLabelSerialized = structureLabel;
  final structureLabelConstructed =
      XmlAttribute(XmlName('F'), structureLabelSerialized);
  attributes.add(structureLabelConstructed);
  final localizationLabel = instance.localizationLabel;
  final localizationLabelSerialized = localizationLabel;
  final localizationLabelConstructed =
      XmlAttribute(XmlName('G'), localizationLabelSerialized);
  attributes.add(localizationLabelConstructed);
  return attributes;
}

List<XmlNode> _$DeviceToXmlChildren(Device instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final elements = instance.elements;
  final elementsSerialized = elements;
  final elementsConstructed = elementsSerialized.map((e) => XmlElement(
      XmlName('DET'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(elementsConstructed);
  final processData = instance.processData;
  final processDataSerialized = processData;
  final processDataConstructed = processDataSerialized.map((e) => XmlElement(
      XmlName('DPD'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(processDataConstructed);
  final properties = instance.properties;
  final propertiesSerialized = properties;
  final propertiesConstructed = propertiesSerialized.map((e) => XmlElement(
      XmlName('DPT'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(propertiesConstructed);
  final valuePresentations = instance.valuePresentations;
  final valuePresentationsSerialized = valuePresentations;
  final valuePresentationsConstructed = valuePresentationsSerialized.map((e) =>
      XmlElement(XmlName('DVP'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(valuePresentationsConstructed);
  return children;
}

XmlElement _$DeviceToXmlElement(Device instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('DVC'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$DeviceXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DeviceBuildXmlChildren(this as Device, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DeviceBuildXmlElement(this as Device, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$DeviceToXmlAttributes(this as Device, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$DeviceToXmlChildren(this as Device, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$DeviceToXmlElement(this as Device, namespaces: namespaces);
}

void _$DeviceAllocationBuildXmlChildren(
    DeviceAllocation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final allocationStamp = instance.allocationStamp;
  final allocationStampSerialized = allocationStamp;
  if (allocationStampSerialized != null) {
    builder.element('ASP', nest: () {
      allocationStampSerialized.buildXmlChildren(builder,
          namespaces: namespaces);
    });
  }
  final clientNAMEValue = instance.clientNAMEValue;
  final clientNAMEValueSerialized = clientNAMEValue;
  builder.attribute('A', clientNAMEValueSerialized);
  final clientNAMEMask = instance.clientNAMEMask;
  final clientNAMEMaskSerialized = clientNAMEMask;
  if (clientNAMEMaskSerialized != null) {
    builder.attribute('B', clientNAMEMaskSerialized);
  }
  final deviceIdRef = instance.deviceIdRef;
  final deviceIdRefSerialized = deviceIdRef;
  if (deviceIdRefSerialized != null) {
    builder.attribute('C', deviceIdRefSerialized);
  }
}

void _$DeviceAllocationBuildXmlElement(
    DeviceAllocation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('DAN', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

DeviceAllocation _$DeviceAllocationFromXmlElement(XmlElement element) {
  final allocationStamp = element.getElement('ASP');
  final clientNAMEValue = element.getAttribute('A')!;
  final clientNAMEMask = element.getAttribute('B');
  final deviceIdRef = element.getAttribute('C');
  return DeviceAllocation(
      allocationStamp: allocationStamp != null
          ? AllocationStamp.fromXmlElement(allocationStamp)
          : null,
      clientNAMEValue: clientNAMEValue,
      clientNAMEMask: clientNAMEMask,
      deviceIdRef: deviceIdRef);
}

List<XmlAttribute> _$DeviceAllocationToXmlAttributes(DeviceAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final clientNAMEValue = instance.clientNAMEValue;
  final clientNAMEValueSerialized = clientNAMEValue;
  final clientNAMEValueConstructed =
      XmlAttribute(XmlName('A'), clientNAMEValueSerialized);
  attributes.add(clientNAMEValueConstructed);
  final clientNAMEMask = instance.clientNAMEMask;
  final clientNAMEMaskSerialized = clientNAMEMask;
  final clientNAMEMaskConstructed = clientNAMEMaskSerialized != null
      ? XmlAttribute(XmlName('B'), clientNAMEMaskSerialized)
      : null;
  if (clientNAMEMaskConstructed != null) {
    attributes.add(clientNAMEMaskConstructed);
  }
  final deviceIdRef = instance.deviceIdRef;
  final deviceIdRefSerialized = deviceIdRef;
  final deviceIdRefConstructed = deviceIdRefSerialized != null
      ? XmlAttribute(XmlName('C'), deviceIdRefSerialized)
      : null;
  if (deviceIdRefConstructed != null) {
    attributes.add(deviceIdRefConstructed);
  }
  return attributes;
}

List<XmlNode> _$DeviceAllocationToXmlChildren(DeviceAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final allocationStamp = instance.allocationStamp;
  final allocationStampSerialized = allocationStamp;
  final allocationStampConstructed = allocationStampSerialized != null
      ? XmlElement(
          XmlName('ASP'),
          allocationStampSerialized.toXmlAttributes(namespaces: namespaces),
          allocationStampSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (allocationStampConstructed != null) {
    children.add(allocationStampConstructed);
  }
  return children;
}

XmlElement _$DeviceAllocationToXmlElement(DeviceAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('DAN'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$DeviceAllocationXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DeviceAllocationBuildXmlChildren(this as DeviceAllocation, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DeviceAllocationBuildXmlElement(this as DeviceAllocation, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$DeviceAllocationToXmlAttributes(this as DeviceAllocation,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$DeviceAllocationToXmlChildren(this as DeviceAllocation,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$DeviceAllocationToXmlElement(this as DeviceAllocation,
          namespaces: namespaces);
}

void _$DeviceElementBuildXmlChildren(DeviceElement instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final objectReferences = instance.objectReferences;
  final objectReferencesSerialized = objectReferences;
  for (final value in objectReferencesSerialized) {
    builder.element('DOR', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final objectId = instance.objectId;
  final objectIdSerialized = objectId.toString();
  builder.attribute('B', objectIdSerialized);
  final type = instance.type;
  final typeSerialized = $DeviceElementTypeEnumMap[type]!;
  builder.attribute('C', typeSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  if (designatorSerialized != null) {
    builder.attribute('D', designatorSerialized);
  }
  final number = instance.number;
  final numberSerialized = number.toString();
  builder.attribute('E', numberSerialized);
  final parentObjectId = instance.parentObjectId;
  final parentObjectIdSerialized = parentObjectId.toString();
  builder.attribute('F', parentObjectIdSerialized);
}

void _$DeviceElementBuildXmlElement(DeviceElement instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('DET', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

DeviceElement _$DeviceElementFromXmlElement(XmlElement element) {
  final objectReferences = element.getElements('DOR')!;
  final id = element.getAttribute('A')!;
  final objectId = element.getAttribute('B')!;
  final type = element.getAttribute('C')!;
  final designator = element.getAttribute('D');
  final number = element.getAttribute('E')!;
  final parentObjectId = element.getAttribute('F')!;
  return DeviceElement(
      objectReferences: objectReferences
          .map((e) => DeviceObjectReference.fromXmlElement(e))
          .toList(),
      id: id,
      objectId: int.parse(objectId),
      type: $DeviceElementTypeEnumMap.entries
          .singleWhere(
              (deviceElementTypeEnumMapEntry) =>
                  deviceElementTypeEnumMapEntry.value == type,
              orElse: () => throw ArgumentError(
                  '`$type` is not one of the supported values: ${$DeviceElementTypeEnumMap.values.join(', ')}'))
          .key,
      designator: designator,
      number: int.parse(number),
      parentObjectId: int.parse(parentObjectId));
}

List<XmlAttribute> _$DeviceElementToXmlAttributes(DeviceElement instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final objectId = instance.objectId;
  final objectIdSerialized = objectId.toString();
  final objectIdConstructed = XmlAttribute(XmlName('B'), objectIdSerialized);
  attributes.add(objectIdConstructed);
  final type = instance.type;
  final typeSerialized = $DeviceElementTypeEnumMap[type]!;
  final typeConstructed = XmlAttribute(XmlName('C'), typeSerialized);
  attributes.add(typeConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed = designatorSerialized != null
      ? XmlAttribute(XmlName('D'), designatorSerialized)
      : null;
  if (designatorConstructed != null) {
    attributes.add(designatorConstructed);
  }
  final number = instance.number;
  final numberSerialized = number.toString();
  final numberConstructed = XmlAttribute(XmlName('E'), numberSerialized);
  attributes.add(numberConstructed);
  final parentObjectId = instance.parentObjectId;
  final parentObjectIdSerialized = parentObjectId.toString();
  final parentObjectIdConstructed =
      XmlAttribute(XmlName('F'), parentObjectIdSerialized);
  attributes.add(parentObjectIdConstructed);
  return attributes;
}

List<XmlNode> _$DeviceElementToXmlChildren(DeviceElement instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final objectReferences = instance.objectReferences;
  final objectReferencesSerialized = objectReferences;
  final objectReferencesConstructed = objectReferencesSerialized.map((e) =>
      XmlElement(XmlName('DOR'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(objectReferencesConstructed);
  return children;
}

XmlElement _$DeviceElementToXmlElement(DeviceElement instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('DET'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$DeviceElementXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DeviceElementBuildXmlChildren(this as DeviceElement, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DeviceElementBuildXmlElement(this as DeviceElement, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$DeviceElementToXmlAttributes(this as DeviceElement,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$DeviceElementToXmlChildren(this as DeviceElement,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$DeviceElementToXmlElement(this as DeviceElement,
          namespaces: namespaces);
}

void _$DeviceObjectReferenceBuildXmlChildren(
    DeviceObjectReference instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final objectId = instance.objectId;
  final objectIdSerialized = objectId.toString();
  builder.attribute('A', objectIdSerialized);
}

void _$DeviceObjectReferenceBuildXmlElement(
    DeviceObjectReference instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('DOR', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

DeviceObjectReference _$DeviceObjectReferenceFromXmlElement(
    XmlElement element) {
  final objectId = element.getAttribute('A')!;
  return DeviceObjectReference(objectId: int.parse(objectId));
}

List<XmlAttribute> _$DeviceObjectReferenceToXmlAttributes(
    DeviceObjectReference instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final objectId = instance.objectId;
  final objectIdSerialized = objectId.toString();
  final objectIdConstructed = XmlAttribute(XmlName('A'), objectIdSerialized);
  attributes.add(objectIdConstructed);
  return attributes;
}

List<XmlNode> _$DeviceObjectReferenceToXmlChildren(
    DeviceObjectReference instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$DeviceObjectReferenceToXmlElement(DeviceObjectReference instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('DOR'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$DeviceObjectReferenceXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DeviceObjectReferenceBuildXmlChildren(
          this as DeviceObjectReference, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DeviceObjectReferenceBuildXmlElement(
          this as DeviceObjectReference, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$DeviceObjectReferenceToXmlAttributes(this as DeviceObjectReference,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$DeviceObjectReferenceToXmlChildren(this as DeviceObjectReference,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$DeviceObjectReferenceToXmlElement(this as DeviceObjectReference,
          namespaces: namespaces);
}

void _$DeviceProcessDataBuildXmlChildren(
    DeviceProcessData instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final objectId = instance.objectId;
  final objectIdSerialized = objectId.toString();
  builder.attribute('A', objectIdSerialized);
  final ddi = instance.ddi;
  final ddiSerialized = ddi;
  builder.attribute('B', ddiSerialized);
  final property = instance.property;
  final propertySerialized = property.toString();
  builder.attribute('C', propertySerialized);
  final triggerMethods = instance.triggerMethods;
  final triggerMethodsSerialized = triggerMethods.toString();
  builder.attribute('D', triggerMethodsSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  if (designatorSerialized != null) {
    builder.attribute('E', designatorSerialized);
  }
  final presentationObjectId = instance.presentationObjectId;
  final presentationObjectIdSerialized = presentationObjectId?.toString();
  if (presentationObjectIdSerialized != null) {
    builder.attribute('F', presentationObjectIdSerialized);
  }
}

void _$DeviceProcessDataBuildXmlElement(
    DeviceProcessData instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('DPD', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

DeviceProcessData _$DeviceProcessDataFromXmlElement(XmlElement element) {
  final objectId = element.getAttribute('A')!;
  final ddi = element.getAttribute('B')!;
  final property = element.getAttribute('C')!;
  final triggerMethods = element.getAttribute('D')!;
  final designator = element.getAttribute('E');
  final presentationObjectId = element.getAttribute('F');
  return DeviceProcessData(
      objectId: int.parse(objectId),
      ddi: ddi,
      property: int.parse(property),
      triggerMethods: int.parse(triggerMethods),
      designator: designator,
      presentationObjectId: presentationObjectId != null
          ? int.parse(presentationObjectId)
          : null);
}

List<XmlAttribute> _$DeviceProcessDataToXmlAttributes(
    DeviceProcessData instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final objectId = instance.objectId;
  final objectIdSerialized = objectId.toString();
  final objectIdConstructed = XmlAttribute(XmlName('A'), objectIdSerialized);
  attributes.add(objectIdConstructed);
  final ddi = instance.ddi;
  final ddiSerialized = ddi;
  final ddiConstructed = XmlAttribute(XmlName('B'), ddiSerialized);
  attributes.add(ddiConstructed);
  final property = instance.property;
  final propertySerialized = property.toString();
  final propertyConstructed = XmlAttribute(XmlName('C'), propertySerialized);
  attributes.add(propertyConstructed);
  final triggerMethods = instance.triggerMethods;
  final triggerMethodsSerialized = triggerMethods.toString();
  final triggerMethodsConstructed =
      XmlAttribute(XmlName('D'), triggerMethodsSerialized);
  attributes.add(triggerMethodsConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed = designatorSerialized != null
      ? XmlAttribute(XmlName('E'), designatorSerialized)
      : null;
  if (designatorConstructed != null) {
    attributes.add(designatorConstructed);
  }
  final presentationObjectId = instance.presentationObjectId;
  final presentationObjectIdSerialized = presentationObjectId?.toString();
  final presentationObjectIdConstructed = presentationObjectIdSerialized != null
      ? XmlAttribute(XmlName('F'), presentationObjectIdSerialized)
      : null;
  if (presentationObjectIdConstructed != null) {
    attributes.add(presentationObjectIdConstructed);
  }
  return attributes;
}

List<XmlNode> _$DeviceProcessDataToXmlChildren(DeviceProcessData instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$DeviceProcessDataToXmlElement(DeviceProcessData instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('DPD'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$DeviceProcessDataXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DeviceProcessDataBuildXmlChildren(this as DeviceProcessData, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DeviceProcessDataBuildXmlElement(this as DeviceProcessData, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$DeviceProcessDataToXmlAttributes(this as DeviceProcessData,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$DeviceProcessDataToXmlChildren(this as DeviceProcessData,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$DeviceProcessDataToXmlElement(this as DeviceProcessData,
          namespaces: namespaces);
}

void _$DevicePropertyBuildXmlChildren(
    DeviceProperty instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final objectId = instance.objectId;
  final objectIdSerialized = objectId.toString();
  builder.attribute('A', objectIdSerialized);
  final ddi = instance.ddi;
  final ddiSerialized = ddi;
  builder.attribute('B', ddiSerialized);
  final value = instance.value;
  final valueSerialized = value.toString();
  builder.attribute('C', valueSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  if (designatorSerialized != null) {
    builder.attribute('D', designatorSerialized);
  }
  final valuePresentationObjectId = instance.valuePresentationObjectId;
  final valuePresentationObjectIdSerialized =
      valuePresentationObjectId?.toString();
  if (valuePresentationObjectIdSerialized != null) {
    builder.attribute('E', valuePresentationObjectIdSerialized);
  }
}

void _$DevicePropertyBuildXmlElement(
    DeviceProperty instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('DPT', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

DeviceProperty _$DevicePropertyFromXmlElement(XmlElement element) {
  final objectId = element.getAttribute('A')!;
  final ddi = element.getAttribute('B')!;
  final value = element.getAttribute('C')!;
  final designator = element.getAttribute('D');
  final valuePresentationObjectId = element.getAttribute('E');
  return DeviceProperty(
      objectId: int.parse(objectId),
      ddi: ddi,
      value: int.parse(value),
      designator: designator,
      valuePresentationObjectId: valuePresentationObjectId != null
          ? int.parse(valuePresentationObjectId)
          : null);
}

List<XmlAttribute> _$DevicePropertyToXmlAttributes(DeviceProperty instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final objectId = instance.objectId;
  final objectIdSerialized = objectId.toString();
  final objectIdConstructed = XmlAttribute(XmlName('A'), objectIdSerialized);
  attributes.add(objectIdConstructed);
  final ddi = instance.ddi;
  final ddiSerialized = ddi;
  final ddiConstructed = XmlAttribute(XmlName('B'), ddiSerialized);
  attributes.add(ddiConstructed);
  final value = instance.value;
  final valueSerialized = value.toString();
  final valueConstructed = XmlAttribute(XmlName('C'), valueSerialized);
  attributes.add(valueConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed = designatorSerialized != null
      ? XmlAttribute(XmlName('D'), designatorSerialized)
      : null;
  if (designatorConstructed != null) {
    attributes.add(designatorConstructed);
  }
  final valuePresentationObjectId = instance.valuePresentationObjectId;
  final valuePresentationObjectIdSerialized =
      valuePresentationObjectId?.toString();
  final valuePresentationObjectIdConstructed =
      valuePresentationObjectIdSerialized != null
          ? XmlAttribute(XmlName('E'), valuePresentationObjectIdSerialized)
          : null;
  if (valuePresentationObjectIdConstructed != null) {
    attributes.add(valuePresentationObjectIdConstructed);
  }
  return attributes;
}

List<XmlNode> _$DevicePropertyToXmlChildren(DeviceProperty instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$DevicePropertyToXmlElement(DeviceProperty instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('DPT'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$DevicePropertyXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DevicePropertyBuildXmlChildren(this as DeviceProperty, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DevicePropertyBuildXmlElement(this as DeviceProperty, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$DevicePropertyToXmlAttributes(this as DeviceProperty,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$DevicePropertyToXmlChildren(this as DeviceProperty,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$DevicePropertyToXmlElement(this as DeviceProperty,
          namespaces: namespaces);
}

void _$DeviceValuePresentationBuildXmlChildren(
    DeviceValuePresentation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final objectId = instance.objectId;
  final objectIdSerialized = objectId.toString();
  builder.attribute('A', objectIdSerialized);
  final offset = instance.offset;
  final offsetSerialized = offset.toString();
  builder.attribute('B', offsetSerialized);
  final scale = instance.scale;
  final scaleSerialized = scale.toString();
  builder.attribute('C', scaleSerialized);
  final numberOfDecimals = instance.numberOfDecimals;
  final numberOfDecimalsSerialized = numberOfDecimals.toString();
  builder.attribute('D', numberOfDecimalsSerialized);
  final unitDesignator = instance.unitDesignator;
  final unitDesignatorSerialized = unitDesignator;
  if (unitDesignatorSerialized != null) {
    builder.attribute('E', unitDesignatorSerialized);
  }
}

void _$DeviceValuePresentationBuildXmlElement(
    DeviceValuePresentation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('DVP', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

DeviceValuePresentation _$DeviceValuePresentationFromXmlElement(
    XmlElement element) {
  final objectId = element.getAttribute('A')!;
  final offset = element.getAttribute('B')!;
  final scale = element.getAttribute('C')!;
  final numberOfDecimals = element.getAttribute('D')!;
  final unitDesignator = element.getAttribute('E');
  return DeviceValuePresentation(
      objectId: int.parse(objectId),
      offset: int.parse(offset),
      scale: double.parse(scale),
      numberOfDecimals: int.parse(numberOfDecimals),
      unitDesignator: unitDesignator);
}

List<XmlAttribute> _$DeviceValuePresentationToXmlAttributes(
    DeviceValuePresentation instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final objectId = instance.objectId;
  final objectIdSerialized = objectId.toString();
  final objectIdConstructed = XmlAttribute(XmlName('A'), objectIdSerialized);
  attributes.add(objectIdConstructed);
  final offset = instance.offset;
  final offsetSerialized = offset.toString();
  final offsetConstructed = XmlAttribute(XmlName('B'), offsetSerialized);
  attributes.add(offsetConstructed);
  final scale = instance.scale;
  final scaleSerialized = scale.toString();
  final scaleConstructed = XmlAttribute(XmlName('C'), scaleSerialized);
  attributes.add(scaleConstructed);
  final numberOfDecimals = instance.numberOfDecimals;
  final numberOfDecimalsSerialized = numberOfDecimals.toString();
  final numberOfDecimalsConstructed =
      XmlAttribute(XmlName('D'), numberOfDecimalsSerialized);
  attributes.add(numberOfDecimalsConstructed);
  final unitDesignator = instance.unitDesignator;
  final unitDesignatorSerialized = unitDesignator;
  final unitDesignatorConstructed = unitDesignatorSerialized != null
      ? XmlAttribute(XmlName('E'), unitDesignatorSerialized)
      : null;
  if (unitDesignatorConstructed != null) {
    attributes.add(unitDesignatorConstructed);
  }
  return attributes;
}

List<XmlNode> _$DeviceValuePresentationToXmlChildren(
    DeviceValuePresentation instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$DeviceValuePresentationToXmlElement(
    DeviceValuePresentation instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('DVP'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$DeviceValuePresentationXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DeviceValuePresentationBuildXmlChildren(
          this as DeviceValuePresentation, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$DeviceValuePresentationBuildXmlElement(
          this as DeviceValuePresentation, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$DeviceValuePresentationToXmlAttributes(this as DeviceValuePresentation,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$DeviceValuePresentationToXmlChildren(this as DeviceValuePresentation,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$DeviceValuePresentationToXmlElement(this as DeviceValuePresentation,
          namespaces: namespaces);
}

void _$AttachedFileBuildXmlChildren(AttachedFile instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final filenameWithExtension = instance.filenameWithExtension;
  final filenameWithExtensionSerialized = filenameWithExtension;
  builder.attribute('A', filenameWithExtensionSerialized);
  final preserve = instance.preserve;
  final preserveSerialized = $PreserveEnumMap[preserve]!;
  builder.attribute('B', preserveSerialized);
  final manufacturerGLN = instance.manufacturerGLN;
  final manufacturerGLNSerialized = manufacturerGLN;
  builder.attribute('C', manufacturerGLNSerialized);
  final fileType = instance.fileType;
  final fileTypeSerialized = fileType.toString();
  builder.attribute('D', fileTypeSerialized);
  final fileVersion = instance.fileVersion;
  final fileVersionSerialized = fileVersion;
  if (fileVersionSerialized != null) {
    builder.attribute('E', fileVersionSerialized);
  }
  final fileLength = instance.fileLength;
  final fileLengthSerialized = fileLength?.toString();
  if (fileLengthSerialized != null) {
    builder.attribute('F', fileLengthSerialized);
  }
}

void _$AttachedFileBuildXmlElement(AttachedFile instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('AFE', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

AttachedFile _$AttachedFileFromXmlElement(XmlElement element) {
  final filenameWithExtension = element.getAttribute('A')!;
  final preserve = element.getAttribute('B')!;
  final manufacturerGLN = element.getAttribute('C')!;
  final fileType = element.getAttribute('D')!;
  final fileVersion = element.getAttribute('E');
  final fileLength = element.getAttribute('F');
  return AttachedFile(
      filenameWithExtension: filenameWithExtension,
      preserve: $PreserveEnumMap.entries
          .singleWhere(
              (preserveEnumMapEntry) => preserveEnumMapEntry.value == preserve,
              orElse: () => throw ArgumentError(
                  '`$preserve` is not one of the supported values: ${$PreserveEnumMap.values.join(', ')}'))
          .key,
      manufacturerGLN: manufacturerGLN,
      fileType: int.parse(fileType),
      fileVersion: fileVersion,
      fileLength: fileLength != null ? int.parse(fileLength) : null);
}

List<XmlAttribute> _$AttachedFileToXmlAttributes(AttachedFile instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final filenameWithExtension = instance.filenameWithExtension;
  final filenameWithExtensionSerialized = filenameWithExtension;
  final filenameWithExtensionConstructed =
      XmlAttribute(XmlName('A'), filenameWithExtensionSerialized);
  attributes.add(filenameWithExtensionConstructed);
  final preserve = instance.preserve;
  final preserveSerialized = $PreserveEnumMap[preserve]!;
  final preserveConstructed = XmlAttribute(XmlName('B'), preserveSerialized);
  attributes.add(preserveConstructed);
  final manufacturerGLN = instance.manufacturerGLN;
  final manufacturerGLNSerialized = manufacturerGLN;
  final manufacturerGLNConstructed =
      XmlAttribute(XmlName('C'), manufacturerGLNSerialized);
  attributes.add(manufacturerGLNConstructed);
  final fileType = instance.fileType;
  final fileTypeSerialized = fileType.toString();
  final fileTypeConstructed = XmlAttribute(XmlName('D'), fileTypeSerialized);
  attributes.add(fileTypeConstructed);
  final fileVersion = instance.fileVersion;
  final fileVersionSerialized = fileVersion;
  final fileVersionConstructed = fileVersionSerialized != null
      ? XmlAttribute(XmlName('E'), fileVersionSerialized)
      : null;
  if (fileVersionConstructed != null) {
    attributes.add(fileVersionConstructed);
  }
  final fileLength = instance.fileLength;
  final fileLengthSerialized = fileLength?.toString();
  final fileLengthConstructed = fileLengthSerialized != null
      ? XmlAttribute(XmlName('F'), fileLengthSerialized)
      : null;
  if (fileLengthConstructed != null) {
    attributes.add(fileLengthConstructed);
  }
  return attributes;
}

List<XmlNode> _$AttachedFileToXmlChildren(AttachedFile instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$AttachedFileToXmlElement(AttachedFile instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('AFE'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$AttachedFileXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$AttachedFileBuildXmlChildren(this as AttachedFile, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$AttachedFileBuildXmlElement(this as AttachedFile, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$AttachedFileToXmlAttributes(this as AttachedFile,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$AttachedFileToXmlChildren(this as AttachedFile, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$AttachedFileToXmlElement(this as AttachedFile, namespaces: namespaces);
}

void _$ExternalFileContentsBuildXmlChildren(
    ExternalFileContents instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final attachedFiles = instance.attachedFiles;
  final attachedFilesSerialized = attachedFiles;
  for (final value in attachedFilesSerialized) {
    builder.element('AFE', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final baseStations = instance.baseStations;
  final baseStationsSerialized = baseStations;
  for (final value in baseStationsSerialized) {
    builder.element('BSN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final codedComments = instance.codedComments;
  final codedCommentsSerialized = codedComments;
  for (final value in codedCommentsSerialized) {
    builder.element('CCT', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final codedCommentGroups = instance.codedCommentGroups;
  final codedCommentGroupsSerialized = codedCommentGroups;
  for (final value in codedCommentGroupsSerialized) {
    builder.element('CCG', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final colourLegends = instance.colourLegends;
  final colourLegendsSerialized = colourLegends;
  for (final value in colourLegendsSerialized) {
    builder.element('CLD', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final cropTypes = instance.cropTypes;
  final cropTypesSerialized = cropTypes;
  for (final value in cropTypesSerialized) {
    builder.element('CTP', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final culturalPractices = instance.culturalPractices;
  final culturalPracticesSerialized = culturalPractices;
  for (final value in culturalPracticesSerialized) {
    builder.element('CPC', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final customers = instance.customers;
  final customersSerialized = customers;
  for (final value in customersSerialized) {
    builder.element('CTR', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final devices = instance.devices;
  final devicesSerialized = devices;
  for (final value in devicesSerialized) {
    builder.element('DVC', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final farms = instance.farms;
  final farmsSerialized = farms;
  for (final value in farmsSerialized) {
    builder.element('FRM', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final operationTechniques = instance.operationTechniques;
  final operationTechniquesSerialized = operationTechniques;
  for (final value in operationTechniquesSerialized) {
    builder.element('OTQ', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final partfields = instance.partfields;
  final partfieldsSerialized = partfields;
  for (final value in partfieldsSerialized) {
    builder.element('PFD', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final products = instance.products;
  final productsSerialized = products;
  for (final value in productsSerialized) {
    builder.element('PDT', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final productGroups = instance.productGroups;
  final productGroupsSerialized = productGroups;
  for (final value in productGroupsSerialized) {
    builder.element('PGP', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final tasks = instance.tasks;
  final tasksSerialized = tasks;
  for (final value in tasksSerialized) {
    builder.element('TSK', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final valuePresentations = instance.valuePresentations;
  final valuePresentationsSerialized = valuePresentations;
  for (final value in valuePresentationsSerialized) {
    builder.element('VPN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final workers = instance.workers;
  final workersSerialized = workers;
  for (final value in workersSerialized) {
    builder.element('WKR', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
}

void _$ExternalFileContentsBuildXmlElement(
    ExternalFileContents instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('XFC', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ExternalFileContents _$ExternalFileContentsFromXmlElement(XmlElement element) {
  final attachedFiles = element.getElements('AFE')!;
  final baseStations = element.getElements('BSN')!;
  final codedComments = element.getElements('CCT')!;
  final codedCommentGroups = element.getElements('CCG')!;
  final colourLegends = element.getElements('CLD')!;
  final cropTypes = element.getElements('CTP')!;
  final culturalPractices = element.getElements('CPC')!;
  final customers = element.getElements('CTR')!;
  final devices = element.getElements('DVC')!;
  final farms = element.getElements('FRM')!;
  final operationTechniques = element.getElements('OTQ')!;
  final partfields = element.getElements('PFD')!;
  final products = element.getElements('PDT')!;
  final productGroups = element.getElements('PGP')!;
  final tasks = element.getElements('TSK')!;
  final valuePresentations = element.getElements('VPN')!;
  final workers = element.getElements('WKR')!;
  return ExternalFileContents(
      attachedFiles:
          attachedFiles.map((e) => AttachedFile.fromXmlElement(e)).toList(),
      baseStations:
          baseStations.map((e) => BaseStation.fromXmlElement(e)).toList(),
      codedComments:
          codedComments.map((e) => CodedComment.fromXmlElement(e)).toList(),
      codedCommentGroups: codedCommentGroups
          .map((e) => CodedCommentGroup.fromXmlElement(e))
          .toList(),
      colourLegends:
          colourLegends.map((e) => ColourLegend.fromXmlElement(e)).toList(),
      cropTypes: cropTypes.map((e) => CropType.fromXmlElement(e)).toList(),
      culturalPractices: culturalPractices
          .map((e) => CulturalPractice.fromXmlElement(e))
          .toList(),
      customers: customers.map((e) => Customer.fromXmlElement(e)).toList(),
      devices: devices.map((e) => Device.fromXmlElement(e)).toList(),
      farms: farms.map((e) => Farm.fromXmlElement(e)).toList(),
      operationTechniques: operationTechniques
          .map((e) => OperationTechnique.fromXmlElement(e))
          .toList(),
      partfields: partfields.map((e) => Partfield.fromXmlElement(e)).toList(),
      products: products.map((e) => Product.fromXmlElement(e)).toList(),
      productGroups:
          productGroups.map((e) => ProductGroup.fromXmlElement(e)).toList(),
      tasks: tasks.map((e) => Task.fromXmlElement(e)).toList(),
      valuePresentations: valuePresentations
          .map((e) => ValuePresentation.fromXmlElement(e))
          .toList(),
      workers: workers.map((e) => Worker.fromXmlElement(e)).toList());
}

List<XmlAttribute> _$ExternalFileContentsToXmlAttributes(
    ExternalFileContents instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  return attributes;
}

List<XmlNode> _$ExternalFileContentsToXmlChildren(ExternalFileContents instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final attachedFiles = instance.attachedFiles;
  final attachedFilesSerialized = attachedFiles;
  final attachedFilesConstructed = attachedFilesSerialized.map((e) =>
      XmlElement(XmlName('AFE'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(attachedFilesConstructed);
  final baseStations = instance.baseStations;
  final baseStationsSerialized = baseStations;
  final baseStationsConstructed = baseStationsSerialized.map((e) => XmlElement(
      XmlName('BSN'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(baseStationsConstructed);
  final codedComments = instance.codedComments;
  final codedCommentsSerialized = codedComments;
  final codedCommentsConstructed = codedCommentsSerialized.map((e) =>
      XmlElement(XmlName('CCT'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(codedCommentsConstructed);
  final codedCommentGroups = instance.codedCommentGroups;
  final codedCommentGroupsSerialized = codedCommentGroups;
  final codedCommentGroupsConstructed = codedCommentGroupsSerialized.map((e) =>
      XmlElement(XmlName('CCG'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(codedCommentGroupsConstructed);
  final colourLegends = instance.colourLegends;
  final colourLegendsSerialized = colourLegends;
  final colourLegendsConstructed = colourLegendsSerialized.map((e) =>
      XmlElement(XmlName('CLD'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(colourLegendsConstructed);
  final cropTypes = instance.cropTypes;
  final cropTypesSerialized = cropTypes;
  final cropTypesConstructed = cropTypesSerialized.map((e) => XmlElement(
      XmlName('CTP'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(cropTypesConstructed);
  final culturalPractices = instance.culturalPractices;
  final culturalPracticesSerialized = culturalPractices;
  final culturalPracticesConstructed = culturalPracticesSerialized.map((e) =>
      XmlElement(XmlName('CPC'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(culturalPracticesConstructed);
  final customers = instance.customers;
  final customersSerialized = customers;
  final customersConstructed = customersSerialized.map((e) => XmlElement(
      XmlName('CTR'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(customersConstructed);
  final devices = instance.devices;
  final devicesSerialized = devices;
  final devicesConstructed = devicesSerialized.map((e) => XmlElement(
      XmlName('DVC'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(devicesConstructed);
  final farms = instance.farms;
  final farmsSerialized = farms;
  final farmsConstructed = farmsSerialized.map((e) => XmlElement(
      XmlName('FRM'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(farmsConstructed);
  final operationTechniques = instance.operationTechniques;
  final operationTechniquesSerialized = operationTechniques;
  final operationTechniquesConstructed = operationTechniquesSerialized.map(
      (e) => XmlElement(
          XmlName('OTQ'),
          e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(operationTechniquesConstructed);
  final partfields = instance.partfields;
  final partfieldsSerialized = partfields;
  final partfieldsConstructed = partfieldsSerialized.map((e) => XmlElement(
      XmlName('PFD'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(partfieldsConstructed);
  final products = instance.products;
  final productsSerialized = products;
  final productsConstructed = productsSerialized.map((e) => XmlElement(
      XmlName('PDT'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(productsConstructed);
  final productGroups = instance.productGroups;
  final productGroupsSerialized = productGroups;
  final productGroupsConstructed = productGroupsSerialized.map((e) =>
      XmlElement(XmlName('PGP'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(productGroupsConstructed);
  final tasks = instance.tasks;
  final tasksSerialized = tasks;
  final tasksConstructed = tasksSerialized.map((e) => XmlElement(
      XmlName('TSK'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(tasksConstructed);
  final valuePresentations = instance.valuePresentations;
  final valuePresentationsSerialized = valuePresentations;
  final valuePresentationsConstructed = valuePresentationsSerialized.map((e) =>
      XmlElement(XmlName('VPN'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(valuePresentationsConstructed);
  final workers = instance.workers;
  final workersSerialized = workers;
  final workersConstructed = workersSerialized.map((e) => XmlElement(
      XmlName('WKR'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(workersConstructed);
  return children;
}

XmlElement _$ExternalFileContentsToXmlElement(ExternalFileContents instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('XFC'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$ExternalFileContentsXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ExternalFileContentsBuildXmlChildren(
          this as ExternalFileContents, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ExternalFileContentsBuildXmlElement(
          this as ExternalFileContents, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$ExternalFileContentsToXmlAttributes(this as ExternalFileContents,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$ExternalFileContentsToXmlChildren(this as ExternalFileContents,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$ExternalFileContentsToXmlElement(this as ExternalFileContents,
          namespaces: namespaces);
}

void _$ExternalFileReferenceBuildXmlChildren(
    ExternalFileReference instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final filename = instance.filename;
  final filenameSerialized = filename;
  builder.attribute('A', filenameSerialized);
  final filetype = instance.filetype;
  final filetypeSerialized =
      filetype != null ? $FileTypeEnumMap[filetype]! : null;
  if (filetypeSerialized != null) {
    builder.attribute('B', filetypeSerialized);
  }
}

void _$ExternalFileReferenceBuildXmlElement(
    ExternalFileReference instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('XFR', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ExternalFileReference _$ExternalFileReferenceFromXmlElement(
    XmlElement element) {
  final filename = element.getAttribute('A')!;
  final filetype = element.getAttribute('B');
  return ExternalFileReference(
      filename: filename,
      filetype: filetype != null
          ? $FileTypeEnumMap.entries
              .singleWhere(
                  (fileTypeEnumMapEntry) =>
                      fileTypeEnumMapEntry.value == filetype,
                  orElse: () => throw ArgumentError(
                      '`$filetype` is not one of the supported values: ${$FileTypeEnumMap.values.join(', ')}'))
              .key
          : null);
}

List<XmlAttribute> _$ExternalFileReferenceToXmlAttributes(
    ExternalFileReference instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final filename = instance.filename;
  final filenameSerialized = filename;
  final filenameConstructed = XmlAttribute(XmlName('A'), filenameSerialized);
  attributes.add(filenameConstructed);
  final filetype = instance.filetype;
  final filetypeSerialized =
      filetype != null ? $FileTypeEnumMap[filetype]! : null;
  final filetypeConstructed = filetypeSerialized != null
      ? XmlAttribute(XmlName('B'), filetypeSerialized)
      : null;
  if (filetypeConstructed != null) {
    attributes.add(filetypeConstructed);
  }
  return attributes;
}

List<XmlNode> _$ExternalFileReferenceToXmlChildren(
    ExternalFileReference instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$ExternalFileReferenceToXmlElement(ExternalFileReference instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('XFR'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$ExternalFileReferenceXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ExternalFileReferenceBuildXmlChildren(
          this as ExternalFileReference, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ExternalFileReferenceBuildXmlElement(
          this as ExternalFileReference, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$ExternalFileReferenceToXmlAttributes(this as ExternalFileReference,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$ExternalFileReferenceToXmlChildren(this as ExternalFileReference,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$ExternalFileReferenceToXmlElement(this as ExternalFileReference,
          namespaces: namespaces);
}

void _$GridBuildXmlChildren(Grid instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final minimumNorthPosition = instance.minimumNorthPosition;
  final minimumNorthPositionSerialized = minimumNorthPosition.toString();
  builder.attribute('A', minimumNorthPositionSerialized);
  final minimumEastPosition = instance.minimumEastPosition;
  final minimumEastPositionSerialized = minimumEastPosition.toString();
  builder.attribute('B', minimumEastPositionSerialized);
  final cellNorthSize = instance.cellNorthSize;
  final cellNorthSizeSerialized = cellNorthSize.toString();
  builder.attribute('C', cellNorthSizeSerialized);
  final cellEastSize = instance.cellEastSize;
  final cellEastSizeSerialized = cellEastSize.toString();
  builder.attribute('D', cellEastSizeSerialized);
  final maximumColumn = instance.maximumColumn;
  final maximumColumnSerialized = maximumColumn.toString();
  builder.attribute('E', maximumColumnSerialized);
  final maximumRow = instance.maximumRow;
  final maximumRowSerialized = maximumRow.toString();
  builder.attribute('F', maximumRowSerialized);
  final fileName = instance.fileName;
  final fileNameSerialized = fileName;
  builder.attribute('G', fileNameSerialized);
  final fileLength = instance.fileLength;
  final fileLengthSerialized = fileLength?.toString();
  if (fileLengthSerialized != null) {
    builder.attribute('H', fileLengthSerialized);
  }
  final type = instance.type;
  final typeSerialized = $GridTypeEnumMap[type]!;
  builder.attribute('I', typeSerialized);
  final treatmentZoneCode = instance.treatmentZoneCode;
  final treatmentZoneCodeSerialized = treatmentZoneCode?.toString();
  if (treatmentZoneCodeSerialized != null) {
    builder.attribute('J', treatmentZoneCodeSerialized);
  }
}

void _$GridBuildXmlElement(Grid instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('GRD', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Grid _$GridFromXmlElement(XmlElement element) {
  final minimumNorthPosition = element.getAttribute('A')!;
  final minimumEastPosition = element.getAttribute('B')!;
  final cellNorthSize = element.getAttribute('C')!;
  final cellEastSize = element.getAttribute('D')!;
  final maximumColumn = element.getAttribute('E')!;
  final maximumRow = element.getAttribute('F')!;
  final fileName = element.getAttribute('G')!;
  final fileLength = element.getAttribute('H');
  final type = element.getAttribute('I')!;
  final treatmentZoneCode = element.getAttribute('J');
  return Grid(
      minimumNorthPosition: double.parse(minimumNorthPosition),
      minimumEastPosition: double.parse(minimumEastPosition),
      cellNorthSize: double.parse(cellNorthSize),
      cellEastSize: double.parse(cellEastSize),
      maximumColumn: int.parse(maximumColumn),
      maximumRow: int.parse(maximumRow),
      fileName: fileName,
      fileLength: fileLength != null ? int.parse(fileLength) : null,
      type: $GridTypeEnumMap.entries
          .singleWhere(
              (gridTypeEnumMapEntry) => gridTypeEnumMapEntry.value == type,
              orElse: () => throw ArgumentError(
                  '`$type` is not one of the supported values: ${$GridTypeEnumMap.values.join(', ')}'))
          .key,
      treatmentZoneCode:
          treatmentZoneCode != null ? int.parse(treatmentZoneCode) : null);
}

List<XmlAttribute> _$GridToXmlAttributes(Grid instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final minimumNorthPosition = instance.minimumNorthPosition;
  final minimumNorthPositionSerialized = minimumNorthPosition.toString();
  final minimumNorthPositionConstructed =
      XmlAttribute(XmlName('A'), minimumNorthPositionSerialized);
  attributes.add(minimumNorthPositionConstructed);
  final minimumEastPosition = instance.minimumEastPosition;
  final minimumEastPositionSerialized = minimumEastPosition.toString();
  final minimumEastPositionConstructed =
      XmlAttribute(XmlName('B'), minimumEastPositionSerialized);
  attributes.add(minimumEastPositionConstructed);
  final cellNorthSize = instance.cellNorthSize;
  final cellNorthSizeSerialized = cellNorthSize.toString();
  final cellNorthSizeConstructed =
      XmlAttribute(XmlName('C'), cellNorthSizeSerialized);
  attributes.add(cellNorthSizeConstructed);
  final cellEastSize = instance.cellEastSize;
  final cellEastSizeSerialized = cellEastSize.toString();
  final cellEastSizeConstructed =
      XmlAttribute(XmlName('D'), cellEastSizeSerialized);
  attributes.add(cellEastSizeConstructed);
  final maximumColumn = instance.maximumColumn;
  final maximumColumnSerialized = maximumColumn.toString();
  final maximumColumnConstructed =
      XmlAttribute(XmlName('E'), maximumColumnSerialized);
  attributes.add(maximumColumnConstructed);
  final maximumRow = instance.maximumRow;
  final maximumRowSerialized = maximumRow.toString();
  final maximumRowConstructed =
      XmlAttribute(XmlName('F'), maximumRowSerialized);
  attributes.add(maximumRowConstructed);
  final fileName = instance.fileName;
  final fileNameSerialized = fileName;
  final fileNameConstructed = XmlAttribute(XmlName('G'), fileNameSerialized);
  attributes.add(fileNameConstructed);
  final fileLength = instance.fileLength;
  final fileLengthSerialized = fileLength?.toString();
  final fileLengthConstructed = fileLengthSerialized != null
      ? XmlAttribute(XmlName('H'), fileLengthSerialized)
      : null;
  if (fileLengthConstructed != null) {
    attributes.add(fileLengthConstructed);
  }
  final type = instance.type;
  final typeSerialized = $GridTypeEnumMap[type]!;
  final typeConstructed = XmlAttribute(XmlName('I'), typeSerialized);
  attributes.add(typeConstructed);
  final treatmentZoneCode = instance.treatmentZoneCode;
  final treatmentZoneCodeSerialized = treatmentZoneCode?.toString();
  final treatmentZoneCodeConstructed = treatmentZoneCodeSerialized != null
      ? XmlAttribute(XmlName('J'), treatmentZoneCodeSerialized)
      : null;
  if (treatmentZoneCodeConstructed != null) {
    attributes.add(treatmentZoneCodeConstructed);
  }
  return attributes;
}

List<XmlNode> _$GridToXmlChildren(Grid instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$GridToXmlElement(Grid instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('GRD'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$GridXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$GridBuildXmlChildren(this as Grid, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$GridBuildXmlElement(this as Grid, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$GridToXmlAttributes(this as Grid, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$GridToXmlChildren(this as Grid, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$GridToXmlElement(this as Grid, namespaces: namespaces);
}

void _$LineStringBuildXmlChildren(LineString instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final points = instance.points;
  final pointsSerialized = points;
  for (final value in pointsSerialized) {
    builder.element('PNT', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final type = instance.type;
  final typeSerialized = $LineStringTypeEnumMap[type]!;
  builder.attribute('A', typeSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  if (designatorSerialized != null) {
    builder.attribute('B', designatorSerialized);
  }
  final width = instance.width;
  final widthSerialized = width?.toString();
  if (widthSerialized != null) {
    builder.attribute('C', widthSerialized);
  }
  final length = instance.length;
  final lengthSerialized = length?.toString();
  if (lengthSerialized != null) {
    builder.attribute('D', lengthSerialized);
  }
  final colour = instance.colour;
  final colourSerialized = colour?.toString();
  if (colourSerialized != null) {
    builder.attribute('E', colourSerialized);
  }
  final id = instance.id;
  final idSerialized = id;
  if (idSerialized != null) {
    builder.attribute('F', idSerialized);
  }
}

void _$LineStringBuildXmlElement(LineString instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('LSG', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

LineString _$LineStringFromXmlElement(XmlElement element) {
  final points = element.getElements('PNT')!;
  final type = element.getAttribute('A')!;
  final designator = element.getAttribute('B');
  final width = element.getAttribute('C');
  final length = element.getAttribute('D');
  final colour = element.getAttribute('E');
  final id = element.getAttribute('F');
  return LineString(
      points: points.map((e) => Point.fromXmlElement(e)).toList(),
      type: $LineStringTypeEnumMap.entries
          .singleWhere(
              (lineStringTypeEnumMapEntry) =>
                  lineStringTypeEnumMapEntry.value == type,
              orElse: () => throw ArgumentError(
                  '`$type` is not one of the supported values: ${$LineStringTypeEnumMap.values.join(', ')}'))
          .key,
      designator: designator,
      width: width != null ? int.parse(width) : null,
      length: length != null ? int.parse(length) : null,
      colour: colour != null ? int.parse(colour) : null,
      id: id);
}

List<XmlAttribute> _$LineStringToXmlAttributes(LineString instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final type = instance.type;
  final typeSerialized = $LineStringTypeEnumMap[type]!;
  final typeConstructed = XmlAttribute(XmlName('A'), typeSerialized);
  attributes.add(typeConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed = designatorSerialized != null
      ? XmlAttribute(XmlName('B'), designatorSerialized)
      : null;
  if (designatorConstructed != null) {
    attributes.add(designatorConstructed);
  }
  final width = instance.width;
  final widthSerialized = width?.toString();
  final widthConstructed = widthSerialized != null
      ? XmlAttribute(XmlName('C'), widthSerialized)
      : null;
  if (widthConstructed != null) {
    attributes.add(widthConstructed);
  }
  final length = instance.length;
  final lengthSerialized = length?.toString();
  final lengthConstructed = lengthSerialized != null
      ? XmlAttribute(XmlName('D'), lengthSerialized)
      : null;
  if (lengthConstructed != null) {
    attributes.add(lengthConstructed);
  }
  final colour = instance.colour;
  final colourSerialized = colour?.toString();
  final colourConstructed = colourSerialized != null
      ? XmlAttribute(XmlName('E'), colourSerialized)
      : null;
  if (colourConstructed != null) {
    attributes.add(colourConstructed);
  }
  final id = instance.id;
  final idSerialized = id;
  final idConstructed =
      idSerialized != null ? XmlAttribute(XmlName('F'), idSerialized) : null;
  if (idConstructed != null) {
    attributes.add(idConstructed);
  }
  return attributes;
}

List<XmlNode> _$LineStringToXmlChildren(LineString instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final points = instance.points;
  final pointsSerialized = points;
  final pointsConstructed = pointsSerialized.map((e) => XmlElement(
      XmlName('PNT'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(pointsConstructed);
  return children;
}

XmlElement _$LineStringToXmlElement(LineString instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('LSG'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$LineStringXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$LineStringBuildXmlChildren(this as LineString, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$LineStringBuildXmlElement(this as LineString, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$LineStringToXmlAttributes(this as LineString, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$LineStringToXmlChildren(this as LineString, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$LineStringToXmlElement(this as LineString, namespaces: namespaces);
}

void _$PartfieldBuildXmlChildren(Partfield instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final polygons = instance.polygons;
  final polygonsSerialized = polygons;
  for (final value in polygonsSerialized) {
    builder.element('PLN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final points = instance.points;
  final pointsSerialized = points;
  for (final value in pointsSerialized) {
    builder.element('PNT', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final lineStrings = instance.lineStrings;
  final lineStringsSerialized = lineStrings;
  for (final value in lineStringsSerialized) {
    builder.element('LSG', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final guidanceGroups = instance.guidanceGroups;
  final guidanceGroupsSerialized = guidanceGroups;
  for (final value in guidanceGroupsSerialized) {
    builder.element('GGP', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final code = instance.code;
  final codeSerialized = code;
  if (codeSerialized != null) {
    builder.attribute('B', codeSerialized);
  }
  final designator = instance.designator;
  final designatorSerialized = designator;
  builder.attribute('C', designatorSerialized);
  final area = instance.area;
  final areaSerialized = area.toString();
  builder.attribute('D', areaSerialized);
  final customerIdRef = instance.customerIdRef;
  final customerIdRefSerialized = customerIdRef;
  if (customerIdRefSerialized != null) {
    builder.attribute('E', customerIdRefSerialized);
  }
  final farmIdRef = instance.farmIdRef;
  final farmIdRefSerialized = farmIdRef;
  if (farmIdRefSerialized != null) {
    builder.attribute('F', farmIdRefSerialized);
  }
  final cropTypeIdRef = instance.cropTypeIdRef;
  final cropTypeIdRefSerialized = cropTypeIdRef;
  if (cropTypeIdRefSerialized != null) {
    builder.attribute('G', cropTypeIdRefSerialized);
  }
  final cropVarietyIdRef = instance.cropVarietyIdRef;
  final cropVarietyIdRefSerialized = cropVarietyIdRef;
  if (cropVarietyIdRefSerialized != null) {
    builder.attribute('H', cropVarietyIdRefSerialized);
  }
  final fieldIdRef = instance.fieldIdRef;
  final fieldIdRefSerialized = fieldIdRef;
  if (fieldIdRefSerialized != null) {
    builder.attribute('I', fieldIdRefSerialized);
  }
}

void _$PartfieldBuildXmlElement(Partfield instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('PFD', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Partfield _$PartfieldFromXmlElement(XmlElement element) {
  final polygons = element.getElements('PLN')!;
  final points = element.getElements('PNT')!;
  final lineStrings = element.getElements('LSG')!;
  final guidanceGroups = element.getElements('GGP')!;
  final id = element.getAttribute('A')!;
  final code = element.getAttribute('B');
  final designator = element.getAttribute('C')!;
  final area = element.getAttribute('D')!;
  final customerIdRef = element.getAttribute('E');
  final farmIdRef = element.getAttribute('F');
  final cropTypeIdRef = element.getAttribute('G');
  final cropVarietyIdRef = element.getAttribute('H');
  final fieldIdRef = element.getAttribute('I');
  return Partfield(
      polygons: polygons.map((e) => Polygon.fromXmlElement(e)).toList(),
      points: points.map((e) => Point.fromXmlElement(e)).toList(),
      lineStrings:
          lineStrings.map((e) => LineString.fromXmlElement(e)).toList(),
      guidanceGroups:
          guidanceGroups.map((e) => GuidanceGroup.fromXmlElement(e)).toList(),
      id: id,
      code: code,
      designator: designator,
      area: int.parse(area),
      customerIdRef: customerIdRef,
      farmIdRef: farmIdRef,
      cropTypeIdRef: cropTypeIdRef,
      cropVarietyIdRef: cropVarietyIdRef,
      fieldIdRef: fieldIdRef);
}

List<XmlAttribute> _$PartfieldToXmlAttributes(Partfield instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final code = instance.code;
  final codeSerialized = code;
  final codeConstructed = codeSerialized != null
      ? XmlAttribute(XmlName('B'), codeSerialized)
      : null;
  if (codeConstructed != null) {
    attributes.add(codeConstructed);
  }
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed =
      XmlAttribute(XmlName('C'), designatorSerialized);
  attributes.add(designatorConstructed);
  final area = instance.area;
  final areaSerialized = area.toString();
  final areaConstructed = XmlAttribute(XmlName('D'), areaSerialized);
  attributes.add(areaConstructed);
  final customerIdRef = instance.customerIdRef;
  final customerIdRefSerialized = customerIdRef;
  final customerIdRefConstructed = customerIdRefSerialized != null
      ? XmlAttribute(XmlName('E'), customerIdRefSerialized)
      : null;
  if (customerIdRefConstructed != null) {
    attributes.add(customerIdRefConstructed);
  }
  final farmIdRef = instance.farmIdRef;
  final farmIdRefSerialized = farmIdRef;
  final farmIdRefConstructed = farmIdRefSerialized != null
      ? XmlAttribute(XmlName('F'), farmIdRefSerialized)
      : null;
  if (farmIdRefConstructed != null) {
    attributes.add(farmIdRefConstructed);
  }
  final cropTypeIdRef = instance.cropTypeIdRef;
  final cropTypeIdRefSerialized = cropTypeIdRef;
  final cropTypeIdRefConstructed = cropTypeIdRefSerialized != null
      ? XmlAttribute(XmlName('G'), cropTypeIdRefSerialized)
      : null;
  if (cropTypeIdRefConstructed != null) {
    attributes.add(cropTypeIdRefConstructed);
  }
  final cropVarietyIdRef = instance.cropVarietyIdRef;
  final cropVarietyIdRefSerialized = cropVarietyIdRef;
  final cropVarietyIdRefConstructed = cropVarietyIdRefSerialized != null
      ? XmlAttribute(XmlName('H'), cropVarietyIdRefSerialized)
      : null;
  if (cropVarietyIdRefConstructed != null) {
    attributes.add(cropVarietyIdRefConstructed);
  }
  final fieldIdRef = instance.fieldIdRef;
  final fieldIdRefSerialized = fieldIdRef;
  final fieldIdRefConstructed = fieldIdRefSerialized != null
      ? XmlAttribute(XmlName('I'), fieldIdRefSerialized)
      : null;
  if (fieldIdRefConstructed != null) {
    attributes.add(fieldIdRefConstructed);
  }
  return attributes;
}

List<XmlNode> _$PartfieldToXmlChildren(Partfield instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final polygons = instance.polygons;
  final polygonsSerialized = polygons;
  final polygonsConstructed = polygonsSerialized.map((e) => XmlElement(
      XmlName('PLN'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(polygonsConstructed);
  final points = instance.points;
  final pointsSerialized = points;
  final pointsConstructed = pointsSerialized.map((e) => XmlElement(
      XmlName('PNT'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(pointsConstructed);
  final lineStrings = instance.lineStrings;
  final lineStringsSerialized = lineStrings;
  final lineStringsConstructed = lineStringsSerialized.map((e) => XmlElement(
      XmlName('LSG'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(lineStringsConstructed);
  final guidanceGroups = instance.guidanceGroups;
  final guidanceGroupsSerialized = guidanceGroups;
  final guidanceGroupsConstructed = guidanceGroupsSerialized.map((e) =>
      XmlElement(XmlName('GGP'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(guidanceGroupsConstructed);
  return children;
}

XmlElement _$PartfieldToXmlElement(Partfield instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('PFD'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$PartfieldXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$PartfieldBuildXmlChildren(this as Partfield, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$PartfieldBuildXmlElement(this as Partfield, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$PartfieldToXmlAttributes(this as Partfield, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$PartfieldToXmlChildren(this as Partfield, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$PartfieldToXmlElement(this as Partfield, namespaces: namespaces);
}

void _$PointBuildXmlChildren(Point instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final type = instance.type;
  final typeSerialized = type != null ? $PointTypeEnumMap[type]! : null;
  if (typeSerialized != null) {
    builder.attribute('A', typeSerialized);
  }
  final designator = instance.designator;
  final designatorSerialized = designator;
  if (designatorSerialized != null) {
    builder.attribute('B', designatorSerialized);
  }
  final north = instance.north;
  final northSerialized = north?.toString();
  if (northSerialized != null) {
    builder.attribute('C', northSerialized);
  }
  final east = instance.east;
  final eastSerialized = east?.toString();
  if (eastSerialized != null) {
    builder.attribute('D', eastSerialized);
  }
  final up = instance.up;
  final upSerialized = up?.toString();
  if (upSerialized != null) {
    builder.attribute('E', upSerialized);
  }
  final colour = instance.colour;
  final colourSerialized = colour?.toString();
  if (colourSerialized != null) {
    builder.attribute('F', colourSerialized);
  }
  final id = instance.id;
  final idSerialized = id;
  if (idSerialized != null) {
    builder.attribute('G', idSerialized);
  }
  final horizontalAccuracy = instance.horizontalAccuracy;
  final horizontalAccuracySerialized = horizontalAccuracy?.toString();
  if (horizontalAccuracySerialized != null) {
    builder.attribute('H', horizontalAccuracySerialized);
  }
  final verticalAccuracy = instance.verticalAccuracy;
  final verticalAccuracySerialized = verticalAccuracy?.toString();
  if (verticalAccuracySerialized != null) {
    builder.attribute('I', verticalAccuracySerialized);
  }
  final filename = instance.filename;
  final filenameSerialized = filename;
  if (filenameSerialized != null) {
    builder.attribute('J', filenameSerialized);
  }
  final fileLength = instance.fileLength;
  final fileLengthSerialized = fileLength?.toString();
  if (fileLengthSerialized != null) {
    builder.attribute('K', fileLengthSerialized);
  }
}

void _$PointBuildXmlElement(Point instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('PNT', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Point _$PointFromXmlElement(XmlElement element) {
  final type = element.getAttribute('A');
  final designator = element.getAttribute('B');
  final north = element.getAttribute('C');
  final east = element.getAttribute('D');
  final up = element.getAttribute('E');
  final colour = element.getAttribute('F');
  final id = element.getAttribute('G');
  final horizontalAccuracy = element.getAttribute('H');
  final verticalAccuracy = element.getAttribute('I');
  final filename = element.getAttribute('J');
  final fileLength = element.getAttribute('K');
  return Point(
      type: type != null
          ? $PointTypeEnumMap.entries
              .singleWhere(
                  (pointTypeEnumMapEntry) =>
                      pointTypeEnumMapEntry.value == type,
                  orElse: () => throw ArgumentError(
                      '`$type` is not one of the supported values: ${$PointTypeEnumMap.values.join(', ')}'))
              .key
          : null,
      designator: designator,
      north: north != null ? double.parse(north) : null,
      east: east != null ? double.parse(east) : null,
      up: up != null ? int.parse(up) : null,
      colour: colour != null ? int.parse(colour) : null,
      id: id,
      horizontalAccuracy:
          horizontalAccuracy != null ? double.parse(horizontalAccuracy) : null,
      verticalAccuracy:
          verticalAccuracy != null ? double.parse(verticalAccuracy) : null,
      filename: filename,
      fileLength: fileLength != null ? int.parse(fileLength) : null);
}

List<XmlAttribute> _$PointToXmlAttributes(Point instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final type = instance.type;
  final typeSerialized = type != null ? $PointTypeEnumMap[type]! : null;
  final typeConstructed = typeSerialized != null
      ? XmlAttribute(XmlName('A'), typeSerialized)
      : null;
  if (typeConstructed != null) {
    attributes.add(typeConstructed);
  }
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed = designatorSerialized != null
      ? XmlAttribute(XmlName('B'), designatorSerialized)
      : null;
  if (designatorConstructed != null) {
    attributes.add(designatorConstructed);
  }
  final north = instance.north;
  final northSerialized = north?.toString();
  final northConstructed = northSerialized != null
      ? XmlAttribute(XmlName('C'), northSerialized)
      : null;
  if (northConstructed != null) {
    attributes.add(northConstructed);
  }
  final east = instance.east;
  final eastSerialized = east?.toString();
  final eastConstructed = eastSerialized != null
      ? XmlAttribute(XmlName('D'), eastSerialized)
      : null;
  if (eastConstructed != null) {
    attributes.add(eastConstructed);
  }
  final up = instance.up;
  final upSerialized = up?.toString();
  final upConstructed =
      upSerialized != null ? XmlAttribute(XmlName('E'), upSerialized) : null;
  if (upConstructed != null) {
    attributes.add(upConstructed);
  }
  final colour = instance.colour;
  final colourSerialized = colour?.toString();
  final colourConstructed = colourSerialized != null
      ? XmlAttribute(XmlName('F'), colourSerialized)
      : null;
  if (colourConstructed != null) {
    attributes.add(colourConstructed);
  }
  final id = instance.id;
  final idSerialized = id;
  final idConstructed =
      idSerialized != null ? XmlAttribute(XmlName('G'), idSerialized) : null;
  if (idConstructed != null) {
    attributes.add(idConstructed);
  }
  final horizontalAccuracy = instance.horizontalAccuracy;
  final horizontalAccuracySerialized = horizontalAccuracy?.toString();
  final horizontalAccuracyConstructed = horizontalAccuracySerialized != null
      ? XmlAttribute(XmlName('H'), horizontalAccuracySerialized)
      : null;
  if (horizontalAccuracyConstructed != null) {
    attributes.add(horizontalAccuracyConstructed);
  }
  final verticalAccuracy = instance.verticalAccuracy;
  final verticalAccuracySerialized = verticalAccuracy?.toString();
  final verticalAccuracyConstructed = verticalAccuracySerialized != null
      ? XmlAttribute(XmlName('I'), verticalAccuracySerialized)
      : null;
  if (verticalAccuracyConstructed != null) {
    attributes.add(verticalAccuracyConstructed);
  }
  final filename = instance.filename;
  final filenameSerialized = filename;
  final filenameConstructed = filenameSerialized != null
      ? XmlAttribute(XmlName('J'), filenameSerialized)
      : null;
  if (filenameConstructed != null) {
    attributes.add(filenameConstructed);
  }
  final fileLength = instance.fileLength;
  final fileLengthSerialized = fileLength?.toString();
  final fileLengthConstructed = fileLengthSerialized != null
      ? XmlAttribute(XmlName('K'), fileLengthSerialized)
      : null;
  if (fileLengthConstructed != null) {
    attributes.add(fileLengthConstructed);
  }
  return attributes;
}

List<XmlNode> _$PointToXmlChildren(Point instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$PointToXmlElement(Point instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('PNT'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

void _$PolygonBuildXmlChildren(Polygon instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final lineStrings = instance.lineStrings;
  final lineStringsSerialized = lineStrings;
  for (final value in lineStringsSerialized) {
    builder.element('LSG', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final type = instance.type;
  final typeSerialized = $PolygonTypeEnumMap[type]!;
  builder.attribute('A', typeSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  if (designatorSerialized != null) {
    builder.attribute('B', designatorSerialized);
  }
  final area = instance.area;
  final areaSerialized = area?.toString();
  if (areaSerialized != null) {
    builder.attribute('C', areaSerialized);
  }
  final colour = instance.colour;
  final colourSerialized = colour?.toString();
  if (colourSerialized != null) {
    builder.attribute('D', colourSerialized);
  }
  final id = instance.id;
  final idSerialized = id;
  if (idSerialized != null) {
    builder.attribute('E', idSerialized);
  }
}

void _$PolygonBuildXmlElement(Polygon instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('PLN', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Polygon _$PolygonFromXmlElement(XmlElement element) {
  final lineStrings = element.getElements('LSG')!;
  final type = element.getAttribute('A')!;
  final designator = element.getAttribute('B');
  final area = element.getAttribute('C');
  final colour = element.getAttribute('D');
  final id = element.getAttribute('E');
  return Polygon(
      lineStrings:
          lineStrings.map((e) => LineString.fromXmlElement(e)).toList(),
      type: $PolygonTypeEnumMap.entries
          .singleWhere(
              (polygonTypeEnumMapEntry) =>
                  polygonTypeEnumMapEntry.value == type,
              orElse: () => throw ArgumentError(
                  '`$type` is not one of the supported values: ${$PolygonTypeEnumMap.values.join(', ')}'))
          .key,
      designator: designator,
      area: area != null ? int.parse(area) : null,
      colour: colour != null ? int.parse(colour) : null,
      id: id);
}

List<XmlAttribute> _$PolygonToXmlAttributes(Polygon instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final type = instance.type;
  final typeSerialized = $PolygonTypeEnumMap[type]!;
  final typeConstructed = XmlAttribute(XmlName('A'), typeSerialized);
  attributes.add(typeConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed = designatorSerialized != null
      ? XmlAttribute(XmlName('B'), designatorSerialized)
      : null;
  if (designatorConstructed != null) {
    attributes.add(designatorConstructed);
  }
  final area = instance.area;
  final areaSerialized = area?.toString();
  final areaConstructed = areaSerialized != null
      ? XmlAttribute(XmlName('C'), areaSerialized)
      : null;
  if (areaConstructed != null) {
    attributes.add(areaConstructed);
  }
  final colour = instance.colour;
  final colourSerialized = colour?.toString();
  final colourConstructed = colourSerialized != null
      ? XmlAttribute(XmlName('D'), colourSerialized)
      : null;
  if (colourConstructed != null) {
    attributes.add(colourConstructed);
  }
  final id = instance.id;
  final idSerialized = id;
  final idConstructed =
      idSerialized != null ? XmlAttribute(XmlName('E'), idSerialized) : null;
  if (idConstructed != null) {
    attributes.add(idConstructed);
  }
  return attributes;
}

List<XmlNode> _$PolygonToXmlChildren(Polygon instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final lineStrings = instance.lineStrings;
  final lineStringsSerialized = lineStrings;
  final lineStringsConstructed = lineStringsSerialized.map((e) => XmlElement(
      XmlName('LSG'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(lineStringsConstructed);
  return children;
}

XmlElement _$PolygonToXmlElement(Polygon instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('PLN'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$PolygonXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$PolygonBuildXmlChildren(this as Polygon, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$PolygonBuildXmlElement(this as Polygon, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$PolygonToXmlAttributes(this as Polygon, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$PolygonToXmlChildren(this as Polygon, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$PolygonToXmlElement(this as Polygon, namespaces: namespaces);
}

void _$PositionBuildXmlChildren(Position instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final north = instance.north;
  final northSerialized = north.toString();
  builder.attribute('A', northSerialized);
  final east = instance.east;
  final eastSerialized = east.toString();
  builder.attribute('B', eastSerialized);
  final up = instance.up;
  final upSerialized = up?.toString();
  if (upSerialized != null) {
    builder.attribute('C', upSerialized);
  }
  final status = instance.status;
  final statusSerialized = $PositionStatusEnumMap[status]!;
  builder.attribute('D', statusSerialized);
  final pdop = instance.pdop;
  final pdopSerialized = pdop?.toString();
  if (pdopSerialized != null) {
    builder.attribute('E', pdopSerialized);
  }
  final hdop = instance.hdop;
  final hdopSerialized = hdop?.toString();
  if (hdopSerialized != null) {
    builder.attribute('F', hdopSerialized);
  }
  final numberOfSatellites = instance.numberOfSatellites;
  final numberOfSatellitesSerialized = numberOfSatellites?.toString();
  if (numberOfSatellitesSerialized != null) {
    builder.attribute('G', numberOfSatellitesSerialized);
  }
  final gpsUtcTimeMs = instance.gpsUtcTimeMs;
  final gpsUtcTimeMsSerialized = gpsUtcTimeMs?.toString();
  if (gpsUtcTimeMsSerialized != null) {
    builder.attribute('H', gpsUtcTimeMsSerialized);
  }
  final gpsUtcDate = instance.gpsUtcDate;
  final gpsUtcDateSerialized = gpsUtcDate?.toString();
  if (gpsUtcDateSerialized != null) {
    builder.attribute('I', gpsUtcDateSerialized);
  }
}

void _$PositionBuildXmlElement(Position instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('PTN', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Position _$PositionFromXmlElement(XmlElement element) {
  final north = element.getAttribute('A')!;
  final east = element.getAttribute('B')!;
  final up = element.getAttribute('C');
  final status = element.getAttribute('D')!;
  final pdop = element.getAttribute('E');
  final hdop = element.getAttribute('F');
  final numberOfSatellites = element.getAttribute('G');
  final gpsUtcTimeMs = element.getAttribute('H');
  final gpsUtcDate = element.getAttribute('I');
  return Position(
      north: double.parse(north),
      east: double.parse(east),
      up: up != null ? int.parse(up) : null,
      status: $PositionStatusEnumMap.entries
          .singleWhere(
              (positionStatusEnumMapEntry) =>
                  positionStatusEnumMapEntry.value == status,
              orElse: () => throw ArgumentError(
                  '`$status` is not one of the supported values: ${$PositionStatusEnumMap.values.join(', ')}'))
          .key,
      pdop: pdop != null ? double.parse(pdop) : null,
      hdop: hdop != null ? double.parse(hdop) : null,
      numberOfSatellites:
          numberOfSatellites != null ? int.parse(numberOfSatellites) : null,
      gpsUtcTimeMs: gpsUtcTimeMs != null ? int.parse(gpsUtcTimeMs) : null,
      gpsUtcDate: gpsUtcDate != null ? int.parse(gpsUtcDate) : null);
}

List<XmlAttribute> _$PositionToXmlAttributes(Position instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final north = instance.north;
  final northSerialized = north.toString();
  final northConstructed = XmlAttribute(XmlName('A'), northSerialized);
  attributes.add(northConstructed);
  final east = instance.east;
  final eastSerialized = east.toString();
  final eastConstructed = XmlAttribute(XmlName('B'), eastSerialized);
  attributes.add(eastConstructed);
  final up = instance.up;
  final upSerialized = up?.toString();
  final upConstructed =
      upSerialized != null ? XmlAttribute(XmlName('C'), upSerialized) : null;
  if (upConstructed != null) {
    attributes.add(upConstructed);
  }
  final status = instance.status;
  final statusSerialized = $PositionStatusEnumMap[status]!;
  final statusConstructed = XmlAttribute(XmlName('D'), statusSerialized);
  attributes.add(statusConstructed);
  final pdop = instance.pdop;
  final pdopSerialized = pdop?.toString();
  final pdopConstructed = pdopSerialized != null
      ? XmlAttribute(XmlName('E'), pdopSerialized)
      : null;
  if (pdopConstructed != null) {
    attributes.add(pdopConstructed);
  }
  final hdop = instance.hdop;
  final hdopSerialized = hdop?.toString();
  final hdopConstructed = hdopSerialized != null
      ? XmlAttribute(XmlName('F'), hdopSerialized)
      : null;
  if (hdopConstructed != null) {
    attributes.add(hdopConstructed);
  }
  final numberOfSatellites = instance.numberOfSatellites;
  final numberOfSatellitesSerialized = numberOfSatellites?.toString();
  final numberOfSatellitesConstructed = numberOfSatellitesSerialized != null
      ? XmlAttribute(XmlName('G'), numberOfSatellitesSerialized)
      : null;
  if (numberOfSatellitesConstructed != null) {
    attributes.add(numberOfSatellitesConstructed);
  }
  final gpsUtcTimeMs = instance.gpsUtcTimeMs;
  final gpsUtcTimeMsSerialized = gpsUtcTimeMs?.toString();
  final gpsUtcTimeMsConstructed = gpsUtcTimeMsSerialized != null
      ? XmlAttribute(XmlName('H'), gpsUtcTimeMsSerialized)
      : null;
  if (gpsUtcTimeMsConstructed != null) {
    attributes.add(gpsUtcTimeMsConstructed);
  }
  final gpsUtcDate = instance.gpsUtcDate;
  final gpsUtcDateSerialized = gpsUtcDate?.toString();
  final gpsUtcDateConstructed = gpsUtcDateSerialized != null
      ? XmlAttribute(XmlName('I'), gpsUtcDateSerialized)
      : null;
  if (gpsUtcDateConstructed != null) {
    attributes.add(gpsUtcDateConstructed);
  }
  return attributes;
}

List<XmlNode> _$PositionToXmlChildren(Position instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$PositionToXmlElement(Position instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('PTN'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$PositionXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$PositionBuildXmlChildren(this as Position, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$PositionBuildXmlElement(this as Position, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$PositionToXmlAttributes(this as Position, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$PositionToXmlChildren(this as Position, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$PositionToXmlElement(this as Position, namespaces: namespaces);
}

void _$GuidanceAllocationBuildXmlChildren(
    GuidanceAllocation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final allocationStamps = instance.allocationStamps;
  final allocationStampsSerialized = allocationStamps;
  for (final value in allocationStampsSerialized) {
    builder.element('ASP', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final shifts = instance.shifts;
  final shiftsSerialized = shifts;
  for (final value in shiftsSerialized) {
    builder.element('GST', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final groupIdRef = instance.groupIdRef;
  final groupIdRefSerialized = groupIdRef;
  builder.attribute('A', groupIdRefSerialized);
}

void _$GuidanceAllocationBuildXmlElement(
    GuidanceAllocation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('GAN', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

GuidanceAllocation _$GuidanceAllocationFromXmlElement(XmlElement element) {
  final allocationStamps = element.getElements('ASP')!;
  final shifts = element.getElements('GST')!;
  final groupIdRef = element.getAttribute('A')!;
  return GuidanceAllocation(
      allocationStamps: allocationStamps
          .map((e) => AllocationStamp.fromXmlElement(e))
          .toList(),
      shifts: shifts.map((e) => GuidanceShift.fromXmlElement(e)).toList(),
      groupIdRef: groupIdRef);
}

List<XmlAttribute> _$GuidanceAllocationToXmlAttributes(
    GuidanceAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final groupIdRef = instance.groupIdRef;
  final groupIdRefSerialized = groupIdRef;
  final groupIdRefConstructed =
      XmlAttribute(XmlName('A'), groupIdRefSerialized);
  attributes.add(groupIdRefConstructed);
  return attributes;
}

List<XmlNode> _$GuidanceAllocationToXmlChildren(GuidanceAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final allocationStamps = instance.allocationStamps;
  final allocationStampsSerialized = allocationStamps;
  final allocationStampsConstructed = allocationStampsSerialized.map((e) =>
      XmlElement(XmlName('ASP'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(allocationStampsConstructed);
  final shifts = instance.shifts;
  final shiftsSerialized = shifts;
  final shiftsConstructed = shiftsSerialized.map((e) => XmlElement(
      XmlName('GST'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(shiftsConstructed);
  return children;
}

XmlElement _$GuidanceAllocationToXmlElement(GuidanceAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('GAN'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$GuidanceAllocationXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$GuidanceAllocationBuildXmlChildren(this as GuidanceAllocation, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$GuidanceAllocationBuildXmlElement(this as GuidanceAllocation, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$GuidanceAllocationToXmlAttributes(this as GuidanceAllocation,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$GuidanceAllocationToXmlChildren(this as GuidanceAllocation,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$GuidanceAllocationToXmlElement(this as GuidanceAllocation,
          namespaces: namespaces);
}

void _$GuidanceGroupBuildXmlChildren(GuidanceGroup instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final patterns = instance.patterns;
  final patternsSerialized = patterns;
  for (final value in patternsSerialized) {
    builder.element('GPN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final boundaryPolygon = instance.boundaryPolygon;
  final boundaryPolygonSerialized = boundaryPolygon;
  if (boundaryPolygonSerialized != null) {
    builder.element('PLN', nest: () {
      boundaryPolygonSerialized.buildXmlChildren(builder,
          namespaces: namespaces);
    });
  }
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  if (designatorSerialized != null) {
    builder.attribute('B', designatorSerialized);
  }
}

void _$GuidanceGroupBuildXmlElement(GuidanceGroup instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('GGP', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

GuidanceGroup _$GuidanceGroupFromXmlElement(XmlElement element) {
  final patterns = element.getElements('GPN')!;
  final boundaryPolygon = element.getElement('PLN');
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B');
  return GuidanceGroup(
      patterns: patterns.map((e) => GuidancePattern.fromXmlElement(e)).toList(),
      boundaryPolygon: boundaryPolygon != null
          ? Polygon.fromXmlElement(boundaryPolygon)
          : null,
      id: id,
      designator: designator);
}

List<XmlAttribute> _$GuidanceGroupToXmlAttributes(GuidanceGroup instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed = designatorSerialized != null
      ? XmlAttribute(XmlName('B'), designatorSerialized)
      : null;
  if (designatorConstructed != null) {
    attributes.add(designatorConstructed);
  }
  return attributes;
}

List<XmlNode> _$GuidanceGroupToXmlChildren(GuidanceGroup instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final patterns = instance.patterns;
  final patternsSerialized = patterns;
  final patternsConstructed = patternsSerialized.map((e) => XmlElement(
      XmlName('GPN'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(patternsConstructed);
  final boundaryPolygon = instance.boundaryPolygon;
  final boundaryPolygonSerialized = boundaryPolygon;
  final boundaryPolygonConstructed = boundaryPolygonSerialized != null
      ? XmlElement(
          XmlName('PLN'),
          boundaryPolygonSerialized.toXmlAttributes(namespaces: namespaces),
          boundaryPolygonSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (boundaryPolygonConstructed != null) {
    children.add(boundaryPolygonConstructed);
  }
  return children;
}

XmlElement _$GuidanceGroupToXmlElement(GuidanceGroup instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('GGP'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$GuidanceGroupXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$GuidanceGroupBuildXmlChildren(this as GuidanceGroup, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$GuidanceGroupBuildXmlElement(this as GuidanceGroup, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$GuidanceGroupToXmlAttributes(this as GuidanceGroup,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$GuidanceGroupToXmlChildren(this as GuidanceGroup,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$GuidanceGroupToXmlElement(this as GuidanceGroup,
          namespaces: namespaces);
}

void _$GuidancePatternBuildXmlChildren(
    GuidancePattern instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final boundaryPolygon = instance.boundaryPolygon;
  final boundaryPolygonSerialized = boundaryPolygon;
  if (boundaryPolygonSerialized != null) {
    builder.element('PLN', nest: () {
      boundaryPolygonSerialized.buildXmlChildren(builder,
          namespaces: namespaces);
    });
  }
  final lineStrings = instance.lineStrings;
  final lineStringsSerialized = lineStrings;
  for (final value in lineStringsSerialized) {
    builder.element('LSG', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  if (designatorSerialized != null) {
    builder.attribute('B', designatorSerialized);
  }
  final type = instance.type;
  final typeSerialized = $GuidancePatternTypeEnumMap[type]!;
  builder.attribute('C', typeSerialized);
  final options = instance.options;
  final optionsSerialized =
      options != null ? $GuidancePatternOptionsEnumMap[options]! : null;
  if (optionsSerialized != null) {
    builder.attribute('D', optionsSerialized);
  }
  final propagationDirection = instance.propagationDirection;
  final propagationDirectionSerialized = propagationDirection != null
      ? $GuidancePatternPropagationDirectionEnumMap[propagationDirection]!
      : null;
  if (propagationDirectionSerialized != null) {
    builder.attribute('E', propagationDirectionSerialized);
  }
  final extension = instance.extension;
  final extensionSerialized =
      extension != null ? $GuidancePatternExtensionEnumMap[extension]! : null;
  if (extensionSerialized != null) {
    builder.attribute('F', extensionSerialized);
  }
  final heading = instance.heading;
  final headingSerialized = heading?.toString();
  if (headingSerialized != null) {
    builder.attribute('G', headingSerialized);
  }
  final radius = instance.radius;
  final radiusSerialized = radius?.toString();
  if (radiusSerialized != null) {
    builder.attribute('H', radiusSerialized);
  }
  final gnssMethod = instance.gnssMethod;
  final gnssMethodSerialized = gnssMethod != null
      ? $GuidancePatternGnssMethodEnumMap[gnssMethod]!
      : null;
  if (gnssMethodSerialized != null) {
    builder.attribute('I', gnssMethodSerialized);
  }
  final horizontalAccuracy = instance.horizontalAccuracy;
  final horizontalAccuracySerialized = horizontalAccuracy?.toString();
  if (horizontalAccuracySerialized != null) {
    builder.attribute('J', horizontalAccuracySerialized);
  }
  final verticalAccuracy = instance.verticalAccuracy;
  final verticalAccuracySerialized = verticalAccuracy?.toString();
  if (verticalAccuracySerialized != null) {
    builder.attribute('K', verticalAccuracySerialized);
  }
  final baseStationIdRef = instance.baseStationIdRef;
  final baseStationIdRefSerialized = baseStationIdRef;
  if (baseStationIdRefSerialized != null) {
    builder.attribute('L', baseStationIdRefSerialized);
  }
  final originalSRID = instance.originalSRID;
  final originalSRIDSerialized = originalSRID;
  if (originalSRIDSerialized != null) {
    builder.attribute('M', originalSRIDSerialized);
  }
  final numberOfSwathsLeft = instance.numberOfSwathsLeft;
  final numberOfSwathsLeftSerialized = numberOfSwathsLeft?.toString();
  if (numberOfSwathsLeftSerialized != null) {
    builder.attribute('N', numberOfSwathsLeftSerialized);
  }
  final numberOfSwathsRight = instance.numberOfSwathsRight;
  final numberOfSwathsRightSerialized = numberOfSwathsRight?.toString();
  if (numberOfSwathsRightSerialized != null) {
    builder.attribute('O', numberOfSwathsRightSerialized);
  }
}

void _$GuidancePatternBuildXmlElement(
    GuidancePattern instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('GPN', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

GuidancePattern _$GuidancePatternFromXmlElement(XmlElement element) {
  final boundaryPolygon = element.getElement('PLN');
  final lineStrings = element.getElements('LSG')!;
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B');
  final type = element.getAttribute('C')!;
  final options = element.getAttribute('D');
  final propagationDirection = element.getAttribute('E');
  final extension = element.getAttribute('F');
  final heading = element.getAttribute('G');
  final radius = element.getAttribute('H');
  final gnssMethod = element.getAttribute('I');
  final horizontalAccuracy = element.getAttribute('J');
  final verticalAccuracy = element.getAttribute('K');
  final baseStationIdRef = element.getAttribute('L');
  final originalSRID = element.getAttribute('M');
  final numberOfSwathsLeft = element.getAttribute('N');
  final numberOfSwathsRight = element.getAttribute('O');
  return GuidancePattern(
      boundaryPolygon: boundaryPolygon != null
          ? Polygon.fromXmlElement(boundaryPolygon)
          : null,
      lineStrings:
          lineStrings.map((e) => LineString.fromXmlElement(e)).toList(),
      id: id,
      designator: designator,
      type: $GuidancePatternTypeEnumMap.entries
          .singleWhere((guidancePatternTypeEnumMapEntry) => guidancePatternTypeEnumMapEntry.value == type,
              orElse: () => throw ArgumentError(
                  '`$type` is not one of the supported values: ${$GuidancePatternTypeEnumMap.values.join(', ')}'))
          .key,
      options: options != null
          ? $GuidancePatternOptionsEnumMap.entries
              .singleWhere((guidancePatternOptionsEnumMapEntry) => guidancePatternOptionsEnumMapEntry.value == options,
                  orElse: () => throw ArgumentError(
                      '`$options` is not one of the supported values: ${$GuidancePatternOptionsEnumMap.values.join(', ')}'))
              .key
          : null,
      propagationDirection: propagationDirection != null
          ? $GuidancePatternPropagationDirectionEnumMap.entries
              .singleWhere((guidancePatternPropagationDirectionEnumMapEntry) => guidancePatternPropagationDirectionEnumMapEntry.value == propagationDirection,
                  orElse: () => throw ArgumentError(
                      '`$propagationDirection` is not one of the supported values: ${$GuidancePatternPropagationDirectionEnumMap.values.join(', ')}'))
              .key
          : null,
      extension: extension != null
          ? $GuidancePatternExtensionEnumMap.entries
              .singleWhere((guidancePatternExtensionEnumMapEntry) => guidancePatternExtensionEnumMapEntry.value == extension,
                  orElse: () =>
                      throw ArgumentError('`$extension` is not one of the supported values: ${$GuidancePatternExtensionEnumMap.values.join(', ')}'))
              .key
          : null,
      heading: heading != null ? double.parse(heading) : null,
      radius: radius != null ? int.parse(radius) : null,
      gnssMethod: gnssMethod != null ? $GuidancePatternGnssMethodEnumMap.entries.singleWhere((guidancePatternGnssMethodEnumMapEntry) => guidancePatternGnssMethodEnumMapEntry.value == gnssMethod, orElse: () => throw ArgumentError('`$gnssMethod` is not one of the supported values: ${$GuidancePatternGnssMethodEnumMap.values.join(', ')}')).key : null,
      horizontalAccuracy: horizontalAccuracy != null ? double.parse(horizontalAccuracy) : null,
      verticalAccuracy: verticalAccuracy != null ? double.parse(verticalAccuracy) : null,
      baseStationIdRef: baseStationIdRef,
      originalSRID: originalSRID,
      numberOfSwathsLeft: numberOfSwathsLeft != null ? int.parse(numberOfSwathsLeft) : null,
      numberOfSwathsRight: numberOfSwathsRight != null ? int.parse(numberOfSwathsRight) : null);
}

List<XmlAttribute> _$GuidancePatternToXmlAttributes(GuidancePattern instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed = designatorSerialized != null
      ? XmlAttribute(XmlName('B'), designatorSerialized)
      : null;
  if (designatorConstructed != null) {
    attributes.add(designatorConstructed);
  }
  final type = instance.type;
  final typeSerialized = $GuidancePatternTypeEnumMap[type]!;
  final typeConstructed = XmlAttribute(XmlName('C'), typeSerialized);
  attributes.add(typeConstructed);
  final options = instance.options;
  final optionsSerialized =
      options != null ? $GuidancePatternOptionsEnumMap[options]! : null;
  final optionsConstructed = optionsSerialized != null
      ? XmlAttribute(XmlName('D'), optionsSerialized)
      : null;
  if (optionsConstructed != null) {
    attributes.add(optionsConstructed);
  }
  final propagationDirection = instance.propagationDirection;
  final propagationDirectionSerialized = propagationDirection != null
      ? $GuidancePatternPropagationDirectionEnumMap[propagationDirection]!
      : null;
  final propagationDirectionConstructed = propagationDirectionSerialized != null
      ? XmlAttribute(XmlName('E'), propagationDirectionSerialized)
      : null;
  if (propagationDirectionConstructed != null) {
    attributes.add(propagationDirectionConstructed);
  }
  final extension = instance.extension;
  final extensionSerialized =
      extension != null ? $GuidancePatternExtensionEnumMap[extension]! : null;
  final extensionConstructed = extensionSerialized != null
      ? XmlAttribute(XmlName('F'), extensionSerialized)
      : null;
  if (extensionConstructed != null) {
    attributes.add(extensionConstructed);
  }
  final heading = instance.heading;
  final headingSerialized = heading?.toString();
  final headingConstructed = headingSerialized != null
      ? XmlAttribute(XmlName('G'), headingSerialized)
      : null;
  if (headingConstructed != null) {
    attributes.add(headingConstructed);
  }
  final radius = instance.radius;
  final radiusSerialized = radius?.toString();
  final radiusConstructed = radiusSerialized != null
      ? XmlAttribute(XmlName('H'), radiusSerialized)
      : null;
  if (radiusConstructed != null) {
    attributes.add(radiusConstructed);
  }
  final gnssMethod = instance.gnssMethod;
  final gnssMethodSerialized = gnssMethod != null
      ? $GuidancePatternGnssMethodEnumMap[gnssMethod]!
      : null;
  final gnssMethodConstructed = gnssMethodSerialized != null
      ? XmlAttribute(XmlName('I'), gnssMethodSerialized)
      : null;
  if (gnssMethodConstructed != null) {
    attributes.add(gnssMethodConstructed);
  }
  final horizontalAccuracy = instance.horizontalAccuracy;
  final horizontalAccuracySerialized = horizontalAccuracy?.toString();
  final horizontalAccuracyConstructed = horizontalAccuracySerialized != null
      ? XmlAttribute(XmlName('J'), horizontalAccuracySerialized)
      : null;
  if (horizontalAccuracyConstructed != null) {
    attributes.add(horizontalAccuracyConstructed);
  }
  final verticalAccuracy = instance.verticalAccuracy;
  final verticalAccuracySerialized = verticalAccuracy?.toString();
  final verticalAccuracyConstructed = verticalAccuracySerialized != null
      ? XmlAttribute(XmlName('K'), verticalAccuracySerialized)
      : null;
  if (verticalAccuracyConstructed != null) {
    attributes.add(verticalAccuracyConstructed);
  }
  final baseStationIdRef = instance.baseStationIdRef;
  final baseStationIdRefSerialized = baseStationIdRef;
  final baseStationIdRefConstructed = baseStationIdRefSerialized != null
      ? XmlAttribute(XmlName('L'), baseStationIdRefSerialized)
      : null;
  if (baseStationIdRefConstructed != null) {
    attributes.add(baseStationIdRefConstructed);
  }
  final originalSRID = instance.originalSRID;
  final originalSRIDSerialized = originalSRID;
  final originalSRIDConstructed = originalSRIDSerialized != null
      ? XmlAttribute(XmlName('M'), originalSRIDSerialized)
      : null;
  if (originalSRIDConstructed != null) {
    attributes.add(originalSRIDConstructed);
  }
  final numberOfSwathsLeft = instance.numberOfSwathsLeft;
  final numberOfSwathsLeftSerialized = numberOfSwathsLeft?.toString();
  final numberOfSwathsLeftConstructed = numberOfSwathsLeftSerialized != null
      ? XmlAttribute(XmlName('N'), numberOfSwathsLeftSerialized)
      : null;
  if (numberOfSwathsLeftConstructed != null) {
    attributes.add(numberOfSwathsLeftConstructed);
  }
  final numberOfSwathsRight = instance.numberOfSwathsRight;
  final numberOfSwathsRightSerialized = numberOfSwathsRight?.toString();
  final numberOfSwathsRightConstructed = numberOfSwathsRightSerialized != null
      ? XmlAttribute(XmlName('O'), numberOfSwathsRightSerialized)
      : null;
  if (numberOfSwathsRightConstructed != null) {
    attributes.add(numberOfSwathsRightConstructed);
  }
  return attributes;
}

List<XmlNode> _$GuidancePatternToXmlChildren(GuidancePattern instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final boundaryPolygon = instance.boundaryPolygon;
  final boundaryPolygonSerialized = boundaryPolygon;
  final boundaryPolygonConstructed = boundaryPolygonSerialized != null
      ? XmlElement(
          XmlName('PLN'),
          boundaryPolygonSerialized.toXmlAttributes(namespaces: namespaces),
          boundaryPolygonSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (boundaryPolygonConstructed != null) {
    children.add(boundaryPolygonConstructed);
  }
  final lineStrings = instance.lineStrings;
  final lineStringsSerialized = lineStrings;
  final lineStringsConstructed = lineStringsSerialized.map((e) => XmlElement(
      XmlName('LSG'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(lineStringsConstructed);
  return children;
}

XmlElement _$GuidancePatternToXmlElement(GuidancePattern instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('GPN'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$GuidancePatternXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$GuidancePatternBuildXmlChildren(this as GuidancePattern, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$GuidancePatternBuildXmlElement(this as GuidancePattern, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$GuidancePatternToXmlAttributes(this as GuidancePattern,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$GuidancePatternToXmlChildren(this as GuidancePattern,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$GuidancePatternToXmlElement(this as GuidancePattern,
          namespaces: namespaces);
}

void _$GuidanceShiftBuildXmlChildren(GuidanceShift instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final allocationStamp = instance.allocationStamp;
  final allocationStampSerialized = allocationStamp;
  if (allocationStampSerialized != null) {
    builder.element('ASP', nest: () {
      allocationStampSerialized.buildXmlChildren(builder,
          namespaces: namespaces);
    });
  }
  final groupIdRef = instance.groupIdRef;
  final groupIdRefSerialized = groupIdRef;
  if (groupIdRefSerialized != null) {
    builder.attribute('A', groupIdRefSerialized);
  }
  final patternIdRef = instance.patternIdRef;
  final patternIdRefSerialized = patternIdRef;
  if (patternIdRefSerialized != null) {
    builder.attribute('B', patternIdRefSerialized);
  }
  final eastShift = instance.eastShift;
  final eastShiftSerialized = eastShift?.toString();
  if (eastShiftSerialized != null) {
    builder.attribute('C', eastShiftSerialized);
  }
  final northShift = instance.northShift;
  final northShiftSerialized = northShift?.toString();
  if (northShiftSerialized != null) {
    builder.attribute('D', northShiftSerialized);
  }
  final propagationOffset = instance.propagationOffset;
  final propagationOffsetSerialized = propagationOffset?.toString();
  if (propagationOffsetSerialized != null) {
    builder.attribute('E', propagationOffsetSerialized);
  }
}

void _$GuidanceShiftBuildXmlElement(GuidanceShift instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('GST', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

GuidanceShift _$GuidanceShiftFromXmlElement(XmlElement element) {
  final allocationStamp = element.getElement('ASP');
  final groupIdRef = element.getAttribute('A');
  final patternIdRef = element.getAttribute('B');
  final eastShift = element.getAttribute('C');
  final northShift = element.getAttribute('D');
  final propagationOffset = element.getAttribute('E');
  return GuidanceShift(
      allocationStamp: allocationStamp != null
          ? AllocationStamp.fromXmlElement(allocationStamp)
          : null,
      groupIdRef: groupIdRef,
      patternIdRef: patternIdRef,
      eastShift: eastShift != null ? int.parse(eastShift) : null,
      northShift: northShift != null ? int.parse(northShift) : null,
      propagationOffset:
          propagationOffset != null ? int.parse(propagationOffset) : null);
}

List<XmlAttribute> _$GuidanceShiftToXmlAttributes(GuidanceShift instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final groupIdRef = instance.groupIdRef;
  final groupIdRefSerialized = groupIdRef;
  final groupIdRefConstructed = groupIdRefSerialized != null
      ? XmlAttribute(XmlName('A'), groupIdRefSerialized)
      : null;
  if (groupIdRefConstructed != null) {
    attributes.add(groupIdRefConstructed);
  }
  final patternIdRef = instance.patternIdRef;
  final patternIdRefSerialized = patternIdRef;
  final patternIdRefConstructed = patternIdRefSerialized != null
      ? XmlAttribute(XmlName('B'), patternIdRefSerialized)
      : null;
  if (patternIdRefConstructed != null) {
    attributes.add(patternIdRefConstructed);
  }
  final eastShift = instance.eastShift;
  final eastShiftSerialized = eastShift?.toString();
  final eastShiftConstructed = eastShiftSerialized != null
      ? XmlAttribute(XmlName('C'), eastShiftSerialized)
      : null;
  if (eastShiftConstructed != null) {
    attributes.add(eastShiftConstructed);
  }
  final northShift = instance.northShift;
  final northShiftSerialized = northShift?.toString();
  final northShiftConstructed = northShiftSerialized != null
      ? XmlAttribute(XmlName('D'), northShiftSerialized)
      : null;
  if (northShiftConstructed != null) {
    attributes.add(northShiftConstructed);
  }
  final propagationOffset = instance.propagationOffset;
  final propagationOffsetSerialized = propagationOffset?.toString();
  final propagationOffsetConstructed = propagationOffsetSerialized != null
      ? XmlAttribute(XmlName('E'), propagationOffsetSerialized)
      : null;
  if (propagationOffsetConstructed != null) {
    attributes.add(propagationOffsetConstructed);
  }
  return attributes;
}

List<XmlNode> _$GuidanceShiftToXmlChildren(GuidanceShift instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final allocationStamp = instance.allocationStamp;
  final allocationStampSerialized = allocationStamp;
  final allocationStampConstructed = allocationStampSerialized != null
      ? XmlElement(
          XmlName('ASP'),
          allocationStampSerialized.toXmlAttributes(namespaces: namespaces),
          allocationStampSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (allocationStampConstructed != null) {
    children.add(allocationStampConstructed);
  }
  return children;
}

XmlElement _$GuidanceShiftToXmlElement(GuidanceShift instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('GST'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$GuidanceShiftXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$GuidanceShiftBuildXmlChildren(this as GuidanceShift, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$GuidanceShiftBuildXmlElement(this as GuidanceShift, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$GuidanceShiftToXmlAttributes(this as GuidanceShift,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$GuidanceShiftToXmlChildren(this as GuidanceShift,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$GuidanceShiftToXmlElement(this as GuidanceShift,
          namespaces: namespaces);
}

void _$Iso11783LinkListBuildXmlChildren(
    Iso11783LinkList instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final linkGroups = instance.linkGroups;
  final linkGroupsSerialized = linkGroups;
  for (final value in linkGroupsSerialized) {
    builder.element('LGP', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final versionMajor = instance.versionMajor;
  final versionMajorSerialized = $VersionMajorEnumMap[versionMajor]!;
  builder.attribute('VersionMajor', versionMajorSerialized);
  final versionMinor = instance.versionMinor;
  final versionMinorSerialized = $VersionMinorEnumMap[versionMinor]!;
  builder.attribute('VersionMinor', versionMinorSerialized);
  final managementSoftwareManufacturer =
      instance.managementSoftwareManufacturer;
  final managementSoftwareManufacturerSerialized =
      managementSoftwareManufacturer;
  builder.attribute('ManagementSoftwareManufacturer',
      managementSoftwareManufacturerSerialized);
  final managementSoftwareVersion = instance.managementSoftwareVersion;
  final managementSoftwareVersionSerialized = managementSoftwareVersion;
  builder.attribute(
      'ManagementSoftwareVersion', managementSoftwareVersionSerialized);
  final taskControllerManufacturer = instance.taskControllerManufacturer;
  final taskControllerManufacturerSerialized = taskControllerManufacturer;
  if (taskControllerManufacturerSerialized != null) {
    builder.attribute(
        'TaskControllerManufacturer', taskControllerManufacturerSerialized);
  }
  final taskControllerVersion = instance.taskControllerVersion;
  final taskControllerVersionSerialized = taskControllerVersion;
  if (taskControllerVersionSerialized != null) {
    builder.attribute('TaskControllerVersion', taskControllerVersionSerialized);
  }
  final fileVersion = instance.fileVersion;
  final fileVersionSerialized = fileVersion;
  if (fileVersionSerialized != null) {
    builder.attribute('FileVersion', fileVersionSerialized);
  }
  final dataTransferOrigin = instance.dataTransferOrigin;
  final dataTransferOriginSerialized =
      $DataTransferOriginEnumMap[dataTransferOrigin]!;
  builder.attribute('DataTransferOrigin', dataTransferOriginSerialized);
}

void _$Iso11783LinkListBuildXmlElement(
    Iso11783LinkList instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('ISO11783LinkList', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Iso11783LinkList _$Iso11783LinkListFromXmlElement(XmlElement element) {
  final linkGroups = element.getElements('LGP')!;
  final versionMajor = element.getAttribute('VersionMajor')!;
  final versionMinor = element.getAttribute('VersionMinor')!;
  final managementSoftwareManufacturer =
      element.getAttribute('ManagementSoftwareManufacturer')!;
  final managementSoftwareVersion =
      element.getAttribute('ManagementSoftwareVersion')!;
  final taskControllerManufacturer =
      element.getAttribute('TaskControllerManufacturer');
  final taskControllerVersion = element.getAttribute('TaskControllerVersion');
  final fileVersion = element.getAttribute('FileVersion');
  final dataTransferOrigin = element.getAttribute('DataTransferOrigin')!;
  return Iso11783LinkList(
      linkGroups: linkGroups.map((e) => LinkGroup.fromXmlElement(e)).toList(),
      versionMajor: $VersionMajorEnumMap.entries
          .singleWhere(
              (versionMajorEnumMapEntry) =>
                  versionMajorEnumMapEntry.value == versionMajor,
              orElse: () => throw ArgumentError(
                  '`$versionMajor` is not one of the supported values: ${$VersionMajorEnumMap.values.join(', ')}'))
          .key,
      versionMinor: $VersionMinorEnumMap.entries
          .singleWhere(
              (versionMinorEnumMapEntry) =>
                  versionMinorEnumMapEntry.value == versionMinor,
              orElse: () => throw ArgumentError(
                  '`$versionMinor` is not one of the supported values: ${$VersionMinorEnumMap.values.join(', ')}'))
          .key,
      managementSoftwareManufacturer: managementSoftwareManufacturer,
      managementSoftwareVersion: managementSoftwareVersion,
      taskControllerManufacturer: taskControllerManufacturer,
      taskControllerVersion: taskControllerVersion,
      fileVersion: fileVersion,
      dataTransferOrigin: $DataTransferOriginEnumMap.entries
          .singleWhere(
              (dataTransferOriginEnumMapEntry) =>
                  dataTransferOriginEnumMapEntry.value == dataTransferOrigin,
              orElse: () => throw ArgumentError(
                  '`$dataTransferOrigin` is not one of the supported values: ${$DataTransferOriginEnumMap.values.join(', ')}'))
          .key);
}

List<XmlAttribute> _$Iso11783LinkListToXmlAttributes(Iso11783LinkList instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final versionMajor = instance.versionMajor;
  final versionMajorSerialized = $VersionMajorEnumMap[versionMajor]!;
  final versionMajorConstructed =
      XmlAttribute(XmlName('VersionMajor'), versionMajorSerialized);
  attributes.add(versionMajorConstructed);
  final versionMinor = instance.versionMinor;
  final versionMinorSerialized = $VersionMinorEnumMap[versionMinor]!;
  final versionMinorConstructed =
      XmlAttribute(XmlName('VersionMinor'), versionMinorSerialized);
  attributes.add(versionMinorConstructed);
  final managementSoftwareManufacturer =
      instance.managementSoftwareManufacturer;
  final managementSoftwareManufacturerSerialized =
      managementSoftwareManufacturer;
  final managementSoftwareManufacturerConstructed = XmlAttribute(
      XmlName('ManagementSoftwareManufacturer'),
      managementSoftwareManufacturerSerialized);
  attributes.add(managementSoftwareManufacturerConstructed);
  final managementSoftwareVersion = instance.managementSoftwareVersion;
  final managementSoftwareVersionSerialized = managementSoftwareVersion;
  final managementSoftwareVersionConstructed = XmlAttribute(
      XmlName('ManagementSoftwareVersion'),
      managementSoftwareVersionSerialized);
  attributes.add(managementSoftwareVersionConstructed);
  final taskControllerManufacturer = instance.taskControllerManufacturer;
  final taskControllerManufacturerSerialized = taskControllerManufacturer;
  final taskControllerManufacturerConstructed =
      taskControllerManufacturerSerialized != null
          ? XmlAttribute(XmlName('TaskControllerManufacturer'),
              taskControllerManufacturerSerialized)
          : null;
  if (taskControllerManufacturerConstructed != null) {
    attributes.add(taskControllerManufacturerConstructed);
  }
  final taskControllerVersion = instance.taskControllerVersion;
  final taskControllerVersionSerialized = taskControllerVersion;
  final taskControllerVersionConstructed =
      taskControllerVersionSerialized != null
          ? XmlAttribute(
              XmlName('TaskControllerVersion'), taskControllerVersionSerialized)
          : null;
  if (taskControllerVersionConstructed != null) {
    attributes.add(taskControllerVersionConstructed);
  }
  final fileVersion = instance.fileVersion;
  final fileVersionSerialized = fileVersion;
  final fileVersionConstructed = fileVersionSerialized != null
      ? XmlAttribute(XmlName('FileVersion'), fileVersionSerialized)
      : null;
  if (fileVersionConstructed != null) {
    attributes.add(fileVersionConstructed);
  }
  final dataTransferOrigin = instance.dataTransferOrigin;
  final dataTransferOriginSerialized =
      $DataTransferOriginEnumMap[dataTransferOrigin]!;
  final dataTransferOriginConstructed =
      XmlAttribute(XmlName('DataTransferOrigin'), dataTransferOriginSerialized);
  attributes.add(dataTransferOriginConstructed);
  return attributes;
}

List<XmlNode> _$Iso11783LinkListToXmlChildren(Iso11783LinkList instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final linkGroups = instance.linkGroups;
  final linkGroupsSerialized = linkGroups;
  final linkGroupsConstructed = linkGroupsSerialized.map((e) => XmlElement(
      XmlName('LGP'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(linkGroupsConstructed);
  return children;
}

XmlElement _$Iso11783LinkListToXmlElement(Iso11783LinkList instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('ISO11783LinkList'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$Iso11783LinkListXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$Iso11783LinkListBuildXmlChildren(this as Iso11783LinkList, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$Iso11783LinkListBuildXmlElement(this as Iso11783LinkList, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$Iso11783LinkListToXmlAttributes(this as Iso11783LinkList,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$Iso11783LinkListToXmlChildren(this as Iso11783LinkList,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$Iso11783LinkListToXmlElement(this as Iso11783LinkList,
          namespaces: namespaces);
}

void _$LinkBuildXmlChildren(Link instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final objectIdRef = instance.objectIdRef;
  final objectIdRefSerialized = objectIdRef;
  builder.attribute('A', objectIdRefSerialized);
  final value = instance.value;
  final valueSerialized = value;
  builder.attribute('B', valueSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  if (designatorSerialized != null) {
    builder.attribute('C', designatorSerialized);
  }
}

void _$LinkBuildXmlElement(Link instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('LNK', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Link _$LinkFromXmlElement(XmlElement element) {
  final objectIdRef = element.getAttribute('A')!;
  final value = element.getAttribute('B')!;
  final designator = element.getAttribute('C');
  return Link(objectIdRef: objectIdRef, value: value, designator: designator);
}

List<XmlAttribute> _$LinkToXmlAttributes(Link instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final objectIdRef = instance.objectIdRef;
  final objectIdRefSerialized = objectIdRef;
  final objectIdRefConstructed =
      XmlAttribute(XmlName('A'), objectIdRefSerialized);
  attributes.add(objectIdRefConstructed);
  final value = instance.value;
  final valueSerialized = value;
  final valueConstructed = XmlAttribute(XmlName('B'), valueSerialized);
  attributes.add(valueConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed = designatorSerialized != null
      ? XmlAttribute(XmlName('C'), designatorSerialized)
      : null;
  if (designatorConstructed != null) {
    attributes.add(designatorConstructed);
  }
  return attributes;
}

List<XmlNode> _$LinkToXmlChildren(Link instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$LinkToXmlElement(Link instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('LNK'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$LinkXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$LinkBuildXmlChildren(this as Link, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$LinkBuildXmlElement(this as Link, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$LinkToXmlAttributes(this as Link, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$LinkToXmlChildren(this as Link, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$LinkToXmlElement(this as Link, namespaces: namespaces);
}

void _$LinkGroupBuildXmlChildren(LinkGroup instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final links = instance.links;
  final linksSerialized = links;
  for (final value in linksSerialized) {
    builder.element('LNK', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final type = instance.type;
  final typeSerialized = $LinkGroupTypeEnumMap[type]!;
  builder.attribute('B', typeSerialized);
  final manufacturerGLN = instance.manufacturerGLN;
  final manufacturerGLNSerialized = manufacturerGLN;
  if (manufacturerGLNSerialized != null) {
    builder.attribute('C', manufacturerGLNSerialized);
  }
  final namespace = instance.namespace;
  final namespaceSerialized = namespace;
  if (namespaceSerialized != null) {
    builder.attribute('D', namespaceSerialized);
  }
  final designator = instance.designator;
  final designatorSerialized = designator;
  if (designatorSerialized != null) {
    builder.attribute('E', designatorSerialized);
  }
}

void _$LinkGroupBuildXmlElement(LinkGroup instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('GP', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

LinkGroup _$LinkGroupFromXmlElement(XmlElement element) {
  final links = element.getElements('LNK')!;
  final id = element.getAttribute('A')!;
  final type = element.getAttribute('B')!;
  final manufacturerGLN = element.getAttribute('C');
  final namespace = element.getAttribute('D');
  final designator = element.getAttribute('E');
  return LinkGroup(
      links: links.map((e) => Link.fromXmlElement(e)).toList(),
      id: id,
      type: $LinkGroupTypeEnumMap.entries
          .singleWhere(
              (linkGroupTypeEnumMapEntry) =>
                  linkGroupTypeEnumMapEntry.value == type,
              orElse: () => throw ArgumentError(
                  '`$type` is not one of the supported values: ${$LinkGroupTypeEnumMap.values.join(', ')}'))
          .key,
      manufacturerGLN: manufacturerGLN,
      namespace: namespace,
      designator: designator);
}

List<XmlAttribute> _$LinkGroupToXmlAttributes(LinkGroup instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final type = instance.type;
  final typeSerialized = $LinkGroupTypeEnumMap[type]!;
  final typeConstructed = XmlAttribute(XmlName('B'), typeSerialized);
  attributes.add(typeConstructed);
  final manufacturerGLN = instance.manufacturerGLN;
  final manufacturerGLNSerialized = manufacturerGLN;
  final manufacturerGLNConstructed = manufacturerGLNSerialized != null
      ? XmlAttribute(XmlName('C'), manufacturerGLNSerialized)
      : null;
  if (manufacturerGLNConstructed != null) {
    attributes.add(manufacturerGLNConstructed);
  }
  final namespace = instance.namespace;
  final namespaceSerialized = namespace;
  final namespaceConstructed = namespaceSerialized != null
      ? XmlAttribute(XmlName('D'), namespaceSerialized)
      : null;
  if (namespaceConstructed != null) {
    attributes.add(namespaceConstructed);
  }
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed = designatorSerialized != null
      ? XmlAttribute(XmlName('E'), designatorSerialized)
      : null;
  if (designatorConstructed != null) {
    attributes.add(designatorConstructed);
  }
  return attributes;
}

List<XmlNode> _$LinkGroupToXmlChildren(LinkGroup instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final links = instance.links;
  final linksSerialized = links;
  final linksConstructed = linksSerialized.map((e) => XmlElement(
      XmlName('LNK'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(linksConstructed);
  return children;
}

XmlElement _$LinkGroupToXmlElement(LinkGroup instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('GP'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$LinkGroupXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$LinkGroupBuildXmlChildren(this as LinkGroup, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$LinkGroupBuildXmlElement(this as LinkGroup, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$LinkGroupToXmlAttributes(this as LinkGroup, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$LinkGroupToXmlChildren(this as LinkGroup, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$LinkGroupToXmlElement(this as LinkGroup, namespaces: namespaces);
}

void _$OperationTechniqueBuildXmlChildren(
    OperationTechnique instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  builder.attribute('B', designatorSerialized);
}

void _$OperationTechniqueBuildXmlElement(
    OperationTechnique instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('OTQ', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

OperationTechnique _$OperationTechniqueFromXmlElement(XmlElement element) {
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B')!;
  return OperationTechnique(id: id, designator: designator);
}

List<XmlAttribute> _$OperationTechniqueToXmlAttributes(
    OperationTechnique instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed =
      XmlAttribute(XmlName('B'), designatorSerialized);
  attributes.add(designatorConstructed);
  return attributes;
}

List<XmlNode> _$OperationTechniqueToXmlChildren(OperationTechnique instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$OperationTechniqueToXmlElement(OperationTechnique instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('OTQ'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$OperationTechniqueXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$OperationTechniqueBuildXmlChildren(this as OperationTechnique, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$OperationTechniqueBuildXmlElement(this as OperationTechnique, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$OperationTechniqueToXmlAttributes(this as OperationTechnique,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$OperationTechniqueToXmlChildren(this as OperationTechnique,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$OperationTechniqueToXmlElement(this as OperationTechnique,
          namespaces: namespaces);
}

void _$OperationTechniquePracticeBuildXmlChildren(
    OperationTechniquePractice instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final culturalPracticeIdRef = instance.culturalPracticeIdRef;
  final culturalPracticeIdRefSerialized = culturalPracticeIdRef;
  builder.attribute('A', culturalPracticeIdRefSerialized);
  final operationTechniqueIdRef = instance.operationTechniqueIdRef;
  final operationTechniqueIdRefSerialized = operationTechniqueIdRef;
  if (operationTechniqueIdRefSerialized != null) {
    builder.attribute('B', operationTechniqueIdRefSerialized);
  }
}

void _$OperationTechniquePracticeBuildXmlElement(
    OperationTechniquePractice instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('OTP', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

OperationTechniquePractice _$OperationTechniquePracticeFromXmlElement(
    XmlElement element) {
  final culturalPracticeIdRef = element.getAttribute('A')!;
  final operationTechniqueIdRef = element.getAttribute('B');
  return OperationTechniquePractice(
      culturalPracticeIdRef: culturalPracticeIdRef,
      operationTechniqueIdRef: operationTechniqueIdRef);
}

List<XmlAttribute> _$OperationTechniquePracticeToXmlAttributes(
    OperationTechniquePractice instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final culturalPracticeIdRef = instance.culturalPracticeIdRef;
  final culturalPracticeIdRefSerialized = culturalPracticeIdRef;
  final culturalPracticeIdRefConstructed =
      XmlAttribute(XmlName('A'), culturalPracticeIdRefSerialized);
  attributes.add(culturalPracticeIdRefConstructed);
  final operationTechniqueIdRef = instance.operationTechniqueIdRef;
  final operationTechniqueIdRefSerialized = operationTechniqueIdRef;
  final operationTechniqueIdRefConstructed =
      operationTechniqueIdRefSerialized != null
          ? XmlAttribute(XmlName('B'), operationTechniqueIdRefSerialized)
          : null;
  if (operationTechniqueIdRefConstructed != null) {
    attributes.add(operationTechniqueIdRefConstructed);
  }
  return attributes;
}

List<XmlNode> _$OperationTechniquePracticeToXmlChildren(
    OperationTechniquePractice instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$OperationTechniquePracticeToXmlElement(
    OperationTechniquePractice instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('OTP'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$OperationTechniquePracticeXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$OperationTechniquePracticeBuildXmlChildren(
          this as OperationTechniquePractice, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$OperationTechniquePracticeBuildXmlElement(
          this as OperationTechniquePractice, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$OperationTechniquePracticeToXmlAttributes(
          this as OperationTechniquePractice,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$OperationTechniquePracticeToXmlChildren(
          this as OperationTechniquePractice,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$OperationTechniquePracticeToXmlElement(
          this as OperationTechniquePractice,
          namespaces: namespaces);
}

void _$OperationTechniqueReferenceBuildXmlChildren(
    OperationTechniqueReference instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final operationTechniqueIdRef = instance.operationTechniqueIdRef;
  final operationTechniqueIdRefSerialized = operationTechniqueIdRef;
  builder.attribute('A', operationTechniqueIdRefSerialized);
}

void _$OperationTechniqueReferenceBuildXmlElement(
    OperationTechniqueReference instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('OTR', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

OperationTechniqueReference _$OperationTechniqueReferenceFromXmlElement(
    XmlElement element) {
  final operationTechniqueIdRef = element.getAttribute('A')!;
  return OperationTechniqueReference(
      operationTechniqueIdRef: operationTechniqueIdRef);
}

List<XmlAttribute> _$OperationTechniqueReferenceToXmlAttributes(
    OperationTechniqueReference instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final operationTechniqueIdRef = instance.operationTechniqueIdRef;
  final operationTechniqueIdRefSerialized = operationTechniqueIdRef;
  final operationTechniqueIdRefConstructed =
      XmlAttribute(XmlName('A'), operationTechniqueIdRefSerialized);
  attributes.add(operationTechniqueIdRefConstructed);
  return attributes;
}

List<XmlNode> _$OperationTechniqueReferenceToXmlChildren(
    OperationTechniqueReference instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$OperationTechniqueReferenceToXmlElement(
    OperationTechniqueReference instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('OTR'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$OperationTechniqueReferenceXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$OperationTechniqueReferenceBuildXmlChildren(
          this as OperationTechniqueReference, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$OperationTechniqueReferenceBuildXmlElement(
          this as OperationTechniqueReference, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$OperationTechniqueReferenceToXmlAttributes(
          this as OperationTechniqueReference,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$OperationTechniqueReferenceToXmlChildren(
          this as OperationTechniqueReference,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$OperationTechniqueReferenceToXmlElement(
          this as OperationTechniqueReference,
          namespaces: namespaces);
}

void _$ProductBuildXmlChildren(Product instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final relations = instance.relations;
  final relationsSerialized = relations;
  for (final value in relationsSerialized) {
    builder.element('PRN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  builder.attribute('B', designatorSerialized);
  final groupIdRef = instance.groupIdRef;
  final groupIdRefSerialized = groupIdRef;
  if (groupIdRefSerialized != null) {
    builder.attribute('C', groupIdRefSerialized);
  }
  final valuePresentationIdRef = instance.valuePresentationIdRef;
  final valuePresentationIdRefSerialized = valuePresentationIdRef;
  if (valuePresentationIdRefSerialized != null) {
    builder.attribute('D', valuePresentationIdRefSerialized);
  }
  final quantityDDI = instance.quantityDDI;
  final quantityDDISerialized = quantityDDI;
  if (quantityDDISerialized != null) {
    builder.attribute('E', quantityDDISerialized);
  }
  final type = instance.type;
  final typeSerialized = type != null ? $ProductTypeEnumMap[type]! : null;
  if (typeSerialized != null) {
    builder.attribute('F', typeSerialized);
  }
  final mixtureRecipeQuantity = instance.mixtureRecipeQuantity;
  final mixtureRecipeQuantitySerialized = mixtureRecipeQuantity?.toString();
  if (mixtureRecipeQuantitySerialized != null) {
    builder.attribute('G', mixtureRecipeQuantitySerialized);
  }
  final densityMassPerVolume = instance.densityMassPerVolume;
  final densityMassPerVolumeSerialized = densityMassPerVolume?.toString();
  if (densityMassPerVolumeSerialized != null) {
    builder.attribute('H', densityMassPerVolumeSerialized);
  }
  final densityMassPerCount = instance.densityMassPerCount;
  final densityMassPerCountSerialized = densityMassPerCount?.toString();
  if (densityMassPerCountSerialized != null) {
    builder.attribute('I', densityMassPerCountSerialized);
  }
  final densityVolumePerCount = instance.densityVolumePerCount;
  final densityVolumePerCountSerialized = densityVolumePerCount?.toString();
  if (densityVolumePerCountSerialized != null) {
    builder.attribute('J', densityVolumePerCountSerialized);
  }
}

void _$ProductBuildXmlElement(Product instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('PDT', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Product _$ProductFromXmlElement(XmlElement element) {
  final relations = element.getElements('PRN')!;
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B')!;
  final groupIdRef = element.getAttribute('C');
  final valuePresentationIdRef = element.getAttribute('D');
  final quantityDDI = element.getAttribute('E');
  final type = element.getAttribute('F');
  final mixtureRecipeQuantity = element.getAttribute('G');
  final densityMassPerVolume = element.getAttribute('H');
  final densityMassPerCount = element.getAttribute('I');
  final densityVolumePerCount = element.getAttribute('J');
  return Product(
      relations:
          relations.map((e) => ProductRelation.fromXmlElement(e)).toList(),
      id: id,
      designator: designator,
      groupIdRef: groupIdRef,
      valuePresentationIdRef: valuePresentationIdRef,
      quantityDDI: quantityDDI,
      type: type != null
          ? $ProductTypeEnumMap.entries
              .singleWhere(
                  (productTypeEnumMapEntry) =>
                      productTypeEnumMapEntry.value == type,
                  orElse: () => throw ArgumentError(
                      '`$type` is not one of the supported values: ${$ProductTypeEnumMap.values.join(', ')}'))
              .key
          : null,
      mixtureRecipeQuantity: mixtureRecipeQuantity != null
          ? int.parse(mixtureRecipeQuantity)
          : null,
      densityMassPerVolume:
          densityMassPerVolume != null ? int.parse(densityMassPerVolume) : null,
      densityMassPerCount:
          densityMassPerCount != null ? int.parse(densityMassPerCount) : null,
      densityVolumePerCount: densityVolumePerCount != null
          ? int.parse(densityVolumePerCount)
          : null);
}

List<XmlAttribute> _$ProductToXmlAttributes(Product instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed =
      XmlAttribute(XmlName('B'), designatorSerialized);
  attributes.add(designatorConstructed);
  final groupIdRef = instance.groupIdRef;
  final groupIdRefSerialized = groupIdRef;
  final groupIdRefConstructed = groupIdRefSerialized != null
      ? XmlAttribute(XmlName('C'), groupIdRefSerialized)
      : null;
  if (groupIdRefConstructed != null) {
    attributes.add(groupIdRefConstructed);
  }
  final valuePresentationIdRef = instance.valuePresentationIdRef;
  final valuePresentationIdRefSerialized = valuePresentationIdRef;
  final valuePresentationIdRefConstructed =
      valuePresentationIdRefSerialized != null
          ? XmlAttribute(XmlName('D'), valuePresentationIdRefSerialized)
          : null;
  if (valuePresentationIdRefConstructed != null) {
    attributes.add(valuePresentationIdRefConstructed);
  }
  final quantityDDI = instance.quantityDDI;
  final quantityDDISerialized = quantityDDI;
  final quantityDDIConstructed = quantityDDISerialized != null
      ? XmlAttribute(XmlName('E'), quantityDDISerialized)
      : null;
  if (quantityDDIConstructed != null) {
    attributes.add(quantityDDIConstructed);
  }
  final type = instance.type;
  final typeSerialized = type != null ? $ProductTypeEnumMap[type]! : null;
  final typeConstructed = typeSerialized != null
      ? XmlAttribute(XmlName('F'), typeSerialized)
      : null;
  if (typeConstructed != null) {
    attributes.add(typeConstructed);
  }
  final mixtureRecipeQuantity = instance.mixtureRecipeQuantity;
  final mixtureRecipeQuantitySerialized = mixtureRecipeQuantity?.toString();
  final mixtureRecipeQuantityConstructed =
      mixtureRecipeQuantitySerialized != null
          ? XmlAttribute(XmlName('G'), mixtureRecipeQuantitySerialized)
          : null;
  if (mixtureRecipeQuantityConstructed != null) {
    attributes.add(mixtureRecipeQuantityConstructed);
  }
  final densityMassPerVolume = instance.densityMassPerVolume;
  final densityMassPerVolumeSerialized = densityMassPerVolume?.toString();
  final densityMassPerVolumeConstructed = densityMassPerVolumeSerialized != null
      ? XmlAttribute(XmlName('H'), densityMassPerVolumeSerialized)
      : null;
  if (densityMassPerVolumeConstructed != null) {
    attributes.add(densityMassPerVolumeConstructed);
  }
  final densityMassPerCount = instance.densityMassPerCount;
  final densityMassPerCountSerialized = densityMassPerCount?.toString();
  final densityMassPerCountConstructed = densityMassPerCountSerialized != null
      ? XmlAttribute(XmlName('I'), densityMassPerCountSerialized)
      : null;
  if (densityMassPerCountConstructed != null) {
    attributes.add(densityMassPerCountConstructed);
  }
  final densityVolumePerCount = instance.densityVolumePerCount;
  final densityVolumePerCountSerialized = densityVolumePerCount?.toString();
  final densityVolumePerCountConstructed =
      densityVolumePerCountSerialized != null
          ? XmlAttribute(XmlName('J'), densityVolumePerCountSerialized)
          : null;
  if (densityVolumePerCountConstructed != null) {
    attributes.add(densityVolumePerCountConstructed);
  }
  return attributes;
}

List<XmlNode> _$ProductToXmlChildren(Product instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final relations = instance.relations;
  final relationsSerialized = relations;
  final relationsConstructed = relationsSerialized.map((e) => XmlElement(
      XmlName('PRN'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(relationsConstructed);
  return children;
}

XmlElement _$ProductToXmlElement(Product instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('PDT'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$ProductXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ProductBuildXmlChildren(this as Product, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ProductBuildXmlElement(this as Product, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$ProductToXmlAttributes(this as Product, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$ProductToXmlChildren(this as Product, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$ProductToXmlElement(this as Product, namespaces: namespaces);
}

void _$ProductAllocationBuildXmlChildren(
    ProductAllocation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final allocationStamp = instance.allocationStamp;
  final allocationStampSerialized = allocationStamp;
  if (allocationStampSerialized != null) {
    builder.element('ASP', nest: () {
      allocationStampSerialized.buildXmlChildren(builder,
          namespaces: namespaces);
    });
  }
  final productIdRef = instance.productIdRef;
  final productIdRefSerialized = productIdRef;
  builder.attribute('A', productIdRefSerialized);
  final quantityDDI = instance.quantityDDI;
  final quantityDDISerialized = quantityDDI;
  if (quantityDDISerialized != null) {
    builder.attribute('B', quantityDDISerialized);
  }
  final quantityValue = instance.quantityValue;
  final quantityValueSerialized = quantityValue?.toString();
  if (quantityValueSerialized != null) {
    builder.attribute('C', quantityValueSerialized);
  }
  final transferMode = instance.transferMode;
  final transferModeSerialized =
      transferMode != null ? $TransferModeEnumMap[transferMode]! : null;
  if (transferModeSerialized != null) {
    builder.attribute('D', transferModeSerialized);
  }
  final deviceElementIdRef = instance.deviceElementIdRef;
  final deviceElementIdRefSerialized = deviceElementIdRef;
  if (deviceElementIdRefSerialized != null) {
    builder.attribute('E', deviceElementIdRefSerialized);
  }
  final valuePresentationIdRef = instance.valuePresentationIdRef;
  final valuePresentationIdRefSerialized = valuePresentationIdRef;
  if (valuePresentationIdRefSerialized != null) {
    builder.attribute('F', valuePresentationIdRefSerialized);
  }
  final productSubTypeIdRef = instance.productSubTypeIdRef;
  final productSubTypeIdRefSerialized = productSubTypeIdRef;
  if (productSubTypeIdRefSerialized != null) {
    builder.attribute('G', productSubTypeIdRefSerialized);
  }
}

void _$ProductAllocationBuildXmlElement(
    ProductAllocation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('PAN', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ProductAllocation _$ProductAllocationFromXmlElement(XmlElement element) {
  final allocationStamp = element.getElement('ASP');
  final productIdRef = element.getAttribute('A')!;
  final quantityDDI = element.getAttribute('B');
  final quantityValue = element.getAttribute('C');
  final transferMode = element.getAttribute('D');
  final deviceElementIdRef = element.getAttribute('E');
  final valuePresentationIdRef = element.getAttribute('F');
  final productSubTypeIdRef = element.getAttribute('G');
  return ProductAllocation(
      allocationStamp: allocationStamp != null
          ? AllocationStamp.fromXmlElement(allocationStamp)
          : null,
      productIdRef: productIdRef,
      quantityDDI: quantityDDI,
      quantityValue: quantityValue != null ? int.parse(quantityValue) : null,
      transferMode: transferMode != null
          ? $TransferModeEnumMap.entries
              .singleWhere(
                  (transferModeEnumMapEntry) =>
                      transferModeEnumMapEntry.value == transferMode,
                  orElse: () => throw ArgumentError(
                      '`$transferMode` is not one of the supported values: ${$TransferModeEnumMap.values.join(', ')}'))
              .key
          : null,
      deviceElementIdRef: deviceElementIdRef,
      valuePresentationIdRef: valuePresentationIdRef,
      productSubTypeIdRef: productSubTypeIdRef);
}

List<XmlAttribute> _$ProductAllocationToXmlAttributes(
    ProductAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final productIdRef = instance.productIdRef;
  final productIdRefSerialized = productIdRef;
  final productIdRefConstructed =
      XmlAttribute(XmlName('A'), productIdRefSerialized);
  attributes.add(productIdRefConstructed);
  final quantityDDI = instance.quantityDDI;
  final quantityDDISerialized = quantityDDI;
  final quantityDDIConstructed = quantityDDISerialized != null
      ? XmlAttribute(XmlName('B'), quantityDDISerialized)
      : null;
  if (quantityDDIConstructed != null) {
    attributes.add(quantityDDIConstructed);
  }
  final quantityValue = instance.quantityValue;
  final quantityValueSerialized = quantityValue?.toString();
  final quantityValueConstructed = quantityValueSerialized != null
      ? XmlAttribute(XmlName('C'), quantityValueSerialized)
      : null;
  if (quantityValueConstructed != null) {
    attributes.add(quantityValueConstructed);
  }
  final transferMode = instance.transferMode;
  final transferModeSerialized =
      transferMode != null ? $TransferModeEnumMap[transferMode]! : null;
  final transferModeConstructed = transferModeSerialized != null
      ? XmlAttribute(XmlName('D'), transferModeSerialized)
      : null;
  if (transferModeConstructed != null) {
    attributes.add(transferModeConstructed);
  }
  final deviceElementIdRef = instance.deviceElementIdRef;
  final deviceElementIdRefSerialized = deviceElementIdRef;
  final deviceElementIdRefConstructed = deviceElementIdRefSerialized != null
      ? XmlAttribute(XmlName('E'), deviceElementIdRefSerialized)
      : null;
  if (deviceElementIdRefConstructed != null) {
    attributes.add(deviceElementIdRefConstructed);
  }
  final valuePresentationIdRef = instance.valuePresentationIdRef;
  final valuePresentationIdRefSerialized = valuePresentationIdRef;
  final valuePresentationIdRefConstructed =
      valuePresentationIdRefSerialized != null
          ? XmlAttribute(XmlName('F'), valuePresentationIdRefSerialized)
          : null;
  if (valuePresentationIdRefConstructed != null) {
    attributes.add(valuePresentationIdRefConstructed);
  }
  final productSubTypeIdRef = instance.productSubTypeIdRef;
  final productSubTypeIdRefSerialized = productSubTypeIdRef;
  final productSubTypeIdRefConstructed = productSubTypeIdRefSerialized != null
      ? XmlAttribute(XmlName('G'), productSubTypeIdRefSerialized)
      : null;
  if (productSubTypeIdRefConstructed != null) {
    attributes.add(productSubTypeIdRefConstructed);
  }
  return attributes;
}

List<XmlNode> _$ProductAllocationToXmlChildren(ProductAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final allocationStamp = instance.allocationStamp;
  final allocationStampSerialized = allocationStamp;
  final allocationStampConstructed = allocationStampSerialized != null
      ? XmlElement(
          XmlName('ASP'),
          allocationStampSerialized.toXmlAttributes(namespaces: namespaces),
          allocationStampSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (allocationStampConstructed != null) {
    children.add(allocationStampConstructed);
  }
  return children;
}

XmlElement _$ProductAllocationToXmlElement(ProductAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('PAN'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$ProductAllocationXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ProductAllocationBuildXmlChildren(this as ProductAllocation, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ProductAllocationBuildXmlElement(this as ProductAllocation, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$ProductAllocationToXmlAttributes(this as ProductAllocation,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$ProductAllocationToXmlChildren(this as ProductAllocation,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$ProductAllocationToXmlElement(this as ProductAllocation,
          namespaces: namespaces);
}

void _$ProductGroupBuildXmlChildren(ProductGroup instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  builder.attribute('B', designatorSerialized);
  final type = instance.type;
  final typeSerialized = type != null ? $ProductGroupTypeEnumMap[type]! : null;
  if (typeSerialized != null) {
    builder.attribute('C', typeSerialized);
  }
}

void _$ProductGroupBuildXmlElement(ProductGroup instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('PGP', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ProductGroup _$ProductGroupFromXmlElement(XmlElement element) {
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B')!;
  final type = element.getAttribute('C');
  return ProductGroup(
      id: id,
      designator: designator,
      type: type != null
          ? $ProductGroupTypeEnumMap.entries
              .singleWhere(
                  (productGroupTypeEnumMapEntry) =>
                      productGroupTypeEnumMapEntry.value == type,
                  orElse: () => throw ArgumentError(
                      '`$type` is not one of the supported values: ${$ProductGroupTypeEnumMap.values.join(', ')}'))
              .key
          : null);
}

List<XmlAttribute> _$ProductGroupToXmlAttributes(ProductGroup instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed =
      XmlAttribute(XmlName('B'), designatorSerialized);
  attributes.add(designatorConstructed);
  final type = instance.type;
  final typeSerialized = type != null ? $ProductGroupTypeEnumMap[type]! : null;
  final typeConstructed = typeSerialized != null
      ? XmlAttribute(XmlName('C'), typeSerialized)
      : null;
  if (typeConstructed != null) {
    attributes.add(typeConstructed);
  }
  return attributes;
}

List<XmlNode> _$ProductGroupToXmlChildren(ProductGroup instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$ProductGroupToXmlElement(ProductGroup instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('PGP'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$ProductGroupXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ProductGroupBuildXmlChildren(this as ProductGroup, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ProductGroupBuildXmlElement(this as ProductGroup, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$ProductGroupToXmlAttributes(this as ProductGroup,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$ProductGroupToXmlChildren(this as ProductGroup, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$ProductGroupToXmlElement(this as ProductGroup, namespaces: namespaces);
}

void _$ProductRelationBuildXmlChildren(
    ProductRelation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final productIdRef = instance.productIdRef;
  final productIdRefSerialized = productIdRef;
  builder.attribute('A', productIdRefSerialized);
  final quantityValue = instance.quantityValue;
  final quantityValueSerialized = quantityValue.toString();
  builder.attribute('B', quantityValueSerialized);
}

void _$ProductRelationBuildXmlElement(
    ProductRelation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('PRN', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ProductRelation _$ProductRelationFromXmlElement(XmlElement element) {
  final productIdRef = element.getAttribute('A')!;
  final quantityValue = element.getAttribute('B')!;
  return ProductRelation(
      productIdRef: productIdRef, quantityValue: int.parse(quantityValue));
}

List<XmlAttribute> _$ProductRelationToXmlAttributes(ProductRelation instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final productIdRef = instance.productIdRef;
  final productIdRefSerialized = productIdRef;
  final productIdRefConstructed =
      XmlAttribute(XmlName('A'), productIdRefSerialized);
  attributes.add(productIdRefConstructed);
  final quantityValue = instance.quantityValue;
  final quantityValueSerialized = quantityValue.toString();
  final quantityValueConstructed =
      XmlAttribute(XmlName('B'), quantityValueSerialized);
  attributes.add(quantityValueConstructed);
  return attributes;
}

List<XmlNode> _$ProductRelationToXmlChildren(ProductRelation instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$ProductRelationToXmlElement(ProductRelation instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('PRN'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$ProductRelationXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ProductRelationBuildXmlChildren(this as ProductRelation, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ProductRelationBuildXmlElement(this as ProductRelation, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$ProductRelationToXmlAttributes(this as ProductRelation,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$ProductRelationToXmlChildren(this as ProductRelation,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$ProductRelationToXmlElement(this as ProductRelation,
          namespaces: namespaces);
}

void _$CustomerBuildXmlChildren(Customer instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final lastName = instance.lastName;
  final lastNameSerialized = lastName;
  builder.attribute('B', lastNameSerialized);
  final firstName = instance.firstName;
  final firstNameSerialized = firstName;
  if (firstNameSerialized != null) {
    builder.attribute('C', firstNameSerialized);
  }
  final street = instance.street;
  final streetSerialized = street;
  if (streetSerialized != null) {
    builder.attribute('D', streetSerialized);
  }
  final poBox = instance.poBox;
  final poBoxSerialized = poBox;
  if (poBoxSerialized != null) {
    builder.attribute('E', poBoxSerialized);
  }
  final postalCode = instance.postalCode;
  final postalCodeSerialized = postalCode;
  if (postalCodeSerialized != null) {
    builder.attribute('F', postalCodeSerialized);
  }
  final city = instance.city;
  final citySerialized = city;
  if (citySerialized != null) {
    builder.attribute('G', citySerialized);
  }
  final state = instance.state;
  final stateSerialized = state;
  if (stateSerialized != null) {
    builder.attribute('H', stateSerialized);
  }
  final country = instance.country;
  final countrySerialized = country;
  if (countrySerialized != null) {
    builder.attribute('I', countrySerialized);
  }
  final phone = instance.phone;
  final phoneSerialized = phone;
  if (phoneSerialized != null) {
    builder.attribute('J', phoneSerialized);
  }
  final mobile = instance.mobile;
  final mobileSerialized = mobile;
  if (mobileSerialized != null) {
    builder.attribute('K', mobileSerialized);
  }
  final fax = instance.fax;
  final faxSerialized = fax;
  if (faxSerialized != null) {
    builder.attribute('L', faxSerialized);
  }
  final email = instance.email;
  final emailSerialized = email;
  if (emailSerialized != null) {
    builder.attribute('M', emailSerialized);
  }
}

void _$CustomerBuildXmlElement(Customer instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('CTR', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Customer _$CustomerFromXmlElement(XmlElement element) {
  final id = element.getAttribute('A')!;
  final lastName = element.getAttribute('B')!;
  final firstName = element.getAttribute('C');
  final street = element.getAttribute('D');
  final poBox = element.getAttribute('E');
  final postalCode = element.getAttribute('F');
  final city = element.getAttribute('G');
  final state = element.getAttribute('H');
  final country = element.getAttribute('I');
  final phone = element.getAttribute('J');
  final mobile = element.getAttribute('K');
  final fax = element.getAttribute('L');
  final email = element.getAttribute('M');
  return Customer(
      id: id,
      lastName: lastName,
      firstName: firstName,
      street: street,
      poBox: poBox,
      postalCode: postalCode,
      city: city,
      state: state,
      country: country,
      phone: phone,
      mobile: mobile,
      fax: fax,
      email: email);
}

List<XmlAttribute> _$CustomerToXmlAttributes(Customer instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final lastName = instance.lastName;
  final lastNameSerialized = lastName;
  final lastNameConstructed = XmlAttribute(XmlName('B'), lastNameSerialized);
  attributes.add(lastNameConstructed);
  final firstName = instance.firstName;
  final firstNameSerialized = firstName;
  final firstNameConstructed = firstNameSerialized != null
      ? XmlAttribute(XmlName('C'), firstNameSerialized)
      : null;
  if (firstNameConstructed != null) {
    attributes.add(firstNameConstructed);
  }
  final street = instance.street;
  final streetSerialized = street;
  final streetConstructed = streetSerialized != null
      ? XmlAttribute(XmlName('D'), streetSerialized)
      : null;
  if (streetConstructed != null) {
    attributes.add(streetConstructed);
  }
  final poBox = instance.poBox;
  final poBoxSerialized = poBox;
  final poBoxConstructed = poBoxSerialized != null
      ? XmlAttribute(XmlName('E'), poBoxSerialized)
      : null;
  if (poBoxConstructed != null) {
    attributes.add(poBoxConstructed);
  }
  final postalCode = instance.postalCode;
  final postalCodeSerialized = postalCode;
  final postalCodeConstructed = postalCodeSerialized != null
      ? XmlAttribute(XmlName('F'), postalCodeSerialized)
      : null;
  if (postalCodeConstructed != null) {
    attributes.add(postalCodeConstructed);
  }
  final city = instance.city;
  final citySerialized = city;
  final cityConstructed = citySerialized != null
      ? XmlAttribute(XmlName('G'), citySerialized)
      : null;
  if (cityConstructed != null) {
    attributes.add(cityConstructed);
  }
  final state = instance.state;
  final stateSerialized = state;
  final stateConstructed = stateSerialized != null
      ? XmlAttribute(XmlName('H'), stateSerialized)
      : null;
  if (stateConstructed != null) {
    attributes.add(stateConstructed);
  }
  final country = instance.country;
  final countrySerialized = country;
  final countryConstructed = countrySerialized != null
      ? XmlAttribute(XmlName('I'), countrySerialized)
      : null;
  if (countryConstructed != null) {
    attributes.add(countryConstructed);
  }
  final phone = instance.phone;
  final phoneSerialized = phone;
  final phoneConstructed = phoneSerialized != null
      ? XmlAttribute(XmlName('J'), phoneSerialized)
      : null;
  if (phoneConstructed != null) {
    attributes.add(phoneConstructed);
  }
  final mobile = instance.mobile;
  final mobileSerialized = mobile;
  final mobileConstructed = mobileSerialized != null
      ? XmlAttribute(XmlName('K'), mobileSerialized)
      : null;
  if (mobileConstructed != null) {
    attributes.add(mobileConstructed);
  }
  final fax = instance.fax;
  final faxSerialized = fax;
  final faxConstructed =
      faxSerialized != null ? XmlAttribute(XmlName('L'), faxSerialized) : null;
  if (faxConstructed != null) {
    attributes.add(faxConstructed);
  }
  final email = instance.email;
  final emailSerialized = email;
  final emailConstructed = emailSerialized != null
      ? XmlAttribute(XmlName('M'), emailSerialized)
      : null;
  if (emailConstructed != null) {
    attributes.add(emailConstructed);
  }
  return attributes;
}

List<XmlNode> _$CustomerToXmlChildren(Customer instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$CustomerToXmlElement(Customer instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('CTR'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$CustomerXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CustomerBuildXmlChildren(this as Customer, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CustomerBuildXmlElement(this as Customer, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$CustomerToXmlAttributes(this as Customer, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$CustomerToXmlChildren(this as Customer, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$CustomerToXmlElement(this as Customer, namespaces: namespaces);
}

void _$FarmBuildXmlChildren(Farm instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  builder.attribute('B', designatorSerialized);
  final street = instance.street;
  final streetSerialized = street;
  if (streetSerialized != null) {
    builder.attribute('C', streetSerialized);
  }
  final poBox = instance.poBox;
  final poBoxSerialized = poBox;
  if (poBoxSerialized != null) {
    builder.attribute('D', poBoxSerialized);
  }
  final postalCode = instance.postalCode;
  final postalCodeSerialized = postalCode;
  if (postalCodeSerialized != null) {
    builder.attribute('E', postalCodeSerialized);
  }
  final city = instance.city;
  final citySerialized = city;
  if (citySerialized != null) {
    builder.attribute('F', citySerialized);
  }
  final state = instance.state;
  final stateSerialized = state;
  if (stateSerialized != null) {
    builder.attribute('G', stateSerialized);
  }
  final country = instance.country;
  final countrySerialized = country;
  if (countrySerialized != null) {
    builder.attribute('H', countrySerialized);
  }
  final customerIdRef = instance.customerIdRef;
  final customerIdRefSerialized = customerIdRef;
  if (customerIdRefSerialized != null) {
    builder.attribute('I', customerIdRefSerialized);
  }
}

void _$FarmBuildXmlElement(Farm instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('FRM', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Farm _$FarmFromXmlElement(XmlElement element) {
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B')!;
  final street = element.getAttribute('C');
  final poBox = element.getAttribute('D');
  final postalCode = element.getAttribute('E');
  final city = element.getAttribute('F');
  final state = element.getAttribute('G');
  final country = element.getAttribute('H');
  final customerIdRef = element.getAttribute('I');
  return Farm(
      id: id,
      designator: designator,
      street: street,
      poBox: poBox,
      postalCode: postalCode,
      city: city,
      state: state,
      country: country,
      customerIdRef: customerIdRef);
}

List<XmlAttribute> _$FarmToXmlAttributes(Farm instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed =
      XmlAttribute(XmlName('B'), designatorSerialized);
  attributes.add(designatorConstructed);
  final street = instance.street;
  final streetSerialized = street;
  final streetConstructed = streetSerialized != null
      ? XmlAttribute(XmlName('C'), streetSerialized)
      : null;
  if (streetConstructed != null) {
    attributes.add(streetConstructed);
  }
  final poBox = instance.poBox;
  final poBoxSerialized = poBox;
  final poBoxConstructed = poBoxSerialized != null
      ? XmlAttribute(XmlName('D'), poBoxSerialized)
      : null;
  if (poBoxConstructed != null) {
    attributes.add(poBoxConstructed);
  }
  final postalCode = instance.postalCode;
  final postalCodeSerialized = postalCode;
  final postalCodeConstructed = postalCodeSerialized != null
      ? XmlAttribute(XmlName('E'), postalCodeSerialized)
      : null;
  if (postalCodeConstructed != null) {
    attributes.add(postalCodeConstructed);
  }
  final city = instance.city;
  final citySerialized = city;
  final cityConstructed = citySerialized != null
      ? XmlAttribute(XmlName('F'), citySerialized)
      : null;
  if (cityConstructed != null) {
    attributes.add(cityConstructed);
  }
  final state = instance.state;
  final stateSerialized = state;
  final stateConstructed = stateSerialized != null
      ? XmlAttribute(XmlName('G'), stateSerialized)
      : null;
  if (stateConstructed != null) {
    attributes.add(stateConstructed);
  }
  final country = instance.country;
  final countrySerialized = country;
  final countryConstructed = countrySerialized != null
      ? XmlAttribute(XmlName('H'), countrySerialized)
      : null;
  if (countryConstructed != null) {
    attributes.add(countryConstructed);
  }
  final customerIdRef = instance.customerIdRef;
  final customerIdRefSerialized = customerIdRef;
  final customerIdRefConstructed = customerIdRefSerialized != null
      ? XmlAttribute(XmlName('I'), customerIdRefSerialized)
      : null;
  if (customerIdRefConstructed != null) {
    attributes.add(customerIdRefConstructed);
  }
  return attributes;
}

List<XmlNode> _$FarmToXmlChildren(Farm instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$FarmToXmlElement(Farm instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('FRM'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$FarmXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$FarmBuildXmlChildren(this as Farm, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$FarmBuildXmlElement(this as Farm, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$FarmToXmlAttributes(this as Farm, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$FarmToXmlChildren(this as Farm, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$FarmToXmlElement(this as Farm, namespaces: namespaces);
}

void _$WorkerBuildXmlChildren(Worker instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final lastName = instance.lastName;
  final lastNameSerialized = lastName;
  builder.attribute('B', lastNameSerialized);
  final firstName = instance.firstName;
  final firstNameSerialized = firstName;
  if (firstNameSerialized != null) {
    builder.attribute('C', firstNameSerialized);
  }
  final street = instance.street;
  final streetSerialized = street;
  if (streetSerialized != null) {
    builder.attribute('D', streetSerialized);
  }
  final poBox = instance.poBox;
  final poBoxSerialized = poBox;
  if (poBoxSerialized != null) {
    builder.attribute('E', poBoxSerialized);
  }
  final postalCode = instance.postalCode;
  final postalCodeSerialized = postalCode;
  if (postalCodeSerialized != null) {
    builder.attribute('F', postalCodeSerialized);
  }
  final city = instance.city;
  final citySerialized = city;
  if (citySerialized != null) {
    builder.attribute('G', citySerialized);
  }
  final state = instance.state;
  final stateSerialized = state;
  if (stateSerialized != null) {
    builder.attribute('H', stateSerialized);
  }
  final country = instance.country;
  final countrySerialized = country;
  if (countrySerialized != null) {
    builder.attribute('I', countrySerialized);
  }
  final phone = instance.phone;
  final phoneSerialized = phone;
  if (phoneSerialized != null) {
    builder.attribute('J', phoneSerialized);
  }
  final mobile = instance.mobile;
  final mobileSerialized = mobile;
  if (mobileSerialized != null) {
    builder.attribute('K', mobileSerialized);
  }
  final licenseNumber = instance.licenseNumber;
  final licenseNumberSerialized = licenseNumber;
  if (licenseNumberSerialized != null) {
    builder.attribute('L', licenseNumberSerialized);
  }
  final email = instance.email;
  final emailSerialized = email;
  if (emailSerialized != null) {
    builder.attribute('M', emailSerialized);
  }
}

void _$WorkerBuildXmlElement(Worker instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('WKR', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Worker _$WorkerFromXmlElement(XmlElement element) {
  final id = element.getAttribute('A')!;
  final lastName = element.getAttribute('B')!;
  final firstName = element.getAttribute('C');
  final street = element.getAttribute('D');
  final poBox = element.getAttribute('E');
  final postalCode = element.getAttribute('F');
  final city = element.getAttribute('G');
  final state = element.getAttribute('H');
  final country = element.getAttribute('I');
  final phone = element.getAttribute('J');
  final mobile = element.getAttribute('K');
  final licenseNumber = element.getAttribute('L');
  final email = element.getAttribute('M');
  return Worker(
      id: id,
      lastName: lastName,
      firstName: firstName,
      street: street,
      poBox: poBox,
      postalCode: postalCode,
      city: city,
      state: state,
      country: country,
      phone: phone,
      mobile: mobile,
      licenseNumber: licenseNumber,
      email: email);
}

List<XmlAttribute> _$WorkerToXmlAttributes(Worker instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final lastName = instance.lastName;
  final lastNameSerialized = lastName;
  final lastNameConstructed = XmlAttribute(XmlName('B'), lastNameSerialized);
  attributes.add(lastNameConstructed);
  final firstName = instance.firstName;
  final firstNameSerialized = firstName;
  final firstNameConstructed = firstNameSerialized != null
      ? XmlAttribute(XmlName('C'), firstNameSerialized)
      : null;
  if (firstNameConstructed != null) {
    attributes.add(firstNameConstructed);
  }
  final street = instance.street;
  final streetSerialized = street;
  final streetConstructed = streetSerialized != null
      ? XmlAttribute(XmlName('D'), streetSerialized)
      : null;
  if (streetConstructed != null) {
    attributes.add(streetConstructed);
  }
  final poBox = instance.poBox;
  final poBoxSerialized = poBox;
  final poBoxConstructed = poBoxSerialized != null
      ? XmlAttribute(XmlName('E'), poBoxSerialized)
      : null;
  if (poBoxConstructed != null) {
    attributes.add(poBoxConstructed);
  }
  final postalCode = instance.postalCode;
  final postalCodeSerialized = postalCode;
  final postalCodeConstructed = postalCodeSerialized != null
      ? XmlAttribute(XmlName('F'), postalCodeSerialized)
      : null;
  if (postalCodeConstructed != null) {
    attributes.add(postalCodeConstructed);
  }
  final city = instance.city;
  final citySerialized = city;
  final cityConstructed = citySerialized != null
      ? XmlAttribute(XmlName('G'), citySerialized)
      : null;
  if (cityConstructed != null) {
    attributes.add(cityConstructed);
  }
  final state = instance.state;
  final stateSerialized = state;
  final stateConstructed = stateSerialized != null
      ? XmlAttribute(XmlName('H'), stateSerialized)
      : null;
  if (stateConstructed != null) {
    attributes.add(stateConstructed);
  }
  final country = instance.country;
  final countrySerialized = country;
  final countryConstructed = countrySerialized != null
      ? XmlAttribute(XmlName('I'), countrySerialized)
      : null;
  if (countryConstructed != null) {
    attributes.add(countryConstructed);
  }
  final phone = instance.phone;
  final phoneSerialized = phone;
  final phoneConstructed = phoneSerialized != null
      ? XmlAttribute(XmlName('J'), phoneSerialized)
      : null;
  if (phoneConstructed != null) {
    attributes.add(phoneConstructed);
  }
  final mobile = instance.mobile;
  final mobileSerialized = mobile;
  final mobileConstructed = mobileSerialized != null
      ? XmlAttribute(XmlName('K'), mobileSerialized)
      : null;
  if (mobileConstructed != null) {
    attributes.add(mobileConstructed);
  }
  final licenseNumber = instance.licenseNumber;
  final licenseNumberSerialized = licenseNumber;
  final licenseNumberConstructed = licenseNumberSerialized != null
      ? XmlAttribute(XmlName('L'), licenseNumberSerialized)
      : null;
  if (licenseNumberConstructed != null) {
    attributes.add(licenseNumberConstructed);
  }
  final email = instance.email;
  final emailSerialized = email;
  final emailConstructed = emailSerialized != null
      ? XmlAttribute(XmlName('M'), emailSerialized)
      : null;
  if (emailConstructed != null) {
    attributes.add(emailConstructed);
  }
  return attributes;
}

List<XmlNode> _$WorkerToXmlChildren(Worker instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$WorkerToXmlElement(Worker instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('WKR'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$WorkerXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$WorkerBuildXmlChildren(this as Worker, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$WorkerBuildXmlElement(this as Worker, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$WorkerToXmlAttributes(this as Worker, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$WorkerToXmlChildren(this as Worker, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$WorkerToXmlElement(this as Worker, namespaces: namespaces);
}

void _$CulturalPracticeBuildXmlChildren(
    CulturalPractice instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final operationTechniqueReferences = instance.operationTechniqueReferences;
  final operationTechniqueReferencesSerialized = operationTechniqueReferences;
  for (final value in operationTechniqueReferencesSerialized) {
    builder.element('OTR', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  builder.attribute('B', designatorSerialized);
}

void _$CulturalPracticeBuildXmlElement(
    CulturalPractice instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('CPC', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

CulturalPractice _$CulturalPracticeFromXmlElement(XmlElement element) {
  final operationTechniqueReferences = element.getElements('OTR')!;
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B')!;
  return CulturalPractice(
      operationTechniqueReferences: operationTechniqueReferences
          .map((e) => OperationTechniqueReference.fromXmlElement(e))
          .toList(),
      id: id,
      designator: designator);
}

List<XmlAttribute> _$CulturalPracticeToXmlAttributes(CulturalPractice instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed =
      XmlAttribute(XmlName('B'), designatorSerialized);
  attributes.add(designatorConstructed);
  return attributes;
}

List<XmlNode> _$CulturalPracticeToXmlChildren(CulturalPractice instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final operationTechniqueReferences = instance.operationTechniqueReferences;
  final operationTechniqueReferencesSerialized = operationTechniqueReferences;
  final operationTechniqueReferencesConstructed =
      operationTechniqueReferencesSerialized.map((e) => XmlElement(
          XmlName('OTR'),
          e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(operationTechniqueReferencesConstructed);
  return children;
}

XmlElement _$CulturalPracticeToXmlElement(CulturalPractice instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('CPC'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$CulturalPracticeXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CulturalPracticeBuildXmlChildren(this as CulturalPractice, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$CulturalPracticeBuildXmlElement(this as CulturalPractice, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$CulturalPracticeToXmlAttributes(this as CulturalPractice,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$CulturalPracticeToXmlChildren(this as CulturalPractice,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$CulturalPracticeToXmlElement(this as CulturalPractice,
          namespaces: namespaces);
}

void _$TaskBuildXmlChildren(Task instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final commentAllocations = instance.commentAllocations;
  final commentAllocationsSerialized = commentAllocations;
  for (final value in commentAllocationsSerialized) {
    builder.element('CAN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final controlAssignments = instance.controlAssignments;
  final controlAssignmentsSerialized = controlAssignments;
  for (final value in controlAssignmentsSerialized) {
    builder.element('CAT', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final connections = instance.connections;
  final connectionsSerialized = connections;
  for (final value in connectionsSerialized) {
    builder.element('CNN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final deviceAllocations = instance.deviceAllocations;
  final deviceAllocationsSerialized = deviceAllocations;
  for (final value in deviceAllocationsSerialized) {
    builder.element('DAN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final dataLogTriggers = instance.dataLogTriggers;
  final dataLogTriggersSerialized = dataLogTriggers;
  for (final value in dataLogTriggersSerialized) {
    builder.element('DLT', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final grid = instance.grid;
  final gridSerialized = grid;
  if (gridSerialized != null) {
    builder.element('GRD', nest: () {
      gridSerialized.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final guidanceAllocations = instance.guidanceAllocations;
  final guidanceAllocationsSerialized = guidanceAllocations;
  for (final value in guidanceAllocationsSerialized) {
    builder.element('GAN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final operationTechniquePractice = instance.operationTechniquePractice;
  final operationTechniquePracticeSerialized = operationTechniquePractice;
  if (operationTechniquePracticeSerialized != null) {
    builder.element('OTP', nest: () {
      operationTechniquePracticeSerialized.buildXmlChildren(builder,
          namespaces: namespaces);
    });
  }
  final productAllocations = instance.productAllocations;
  final productAllocationsSerialized = productAllocations;
  for (final value in productAllocationsSerialized) {
    builder.element('PAN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final times = instance.times;
  final timesSerialized = times;
  for (final value in timesSerialized) {
    builder.element('TIM', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final timeLogs = instance.timeLogs;
  final timeLogsSerialized = timeLogs;
  for (final value in timeLogsSerialized) {
    builder.element('TLG', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final treatmentZones = instance.treatmentZones;
  final treatmentZonesSerialized = treatmentZones;
  for (final value in treatmentZonesSerialized) {
    builder.element('TZN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final workerAllocations = instance.workerAllocations;
  final workerAllocationsSerialized = workerAllocations;
  for (final value in workerAllocationsSerialized) {
    builder.element('WAN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  if (designatorSerialized != null) {
    builder.attribute('B', designatorSerialized);
  }
  final customerIdRef = instance.customerIdRef;
  final customerIdRefSerialized = customerIdRef;
  if (customerIdRefSerialized != null) {
    builder.attribute('C', customerIdRefSerialized);
  }
  final farmIdRef = instance.farmIdRef;
  final farmIdRefSerialized = farmIdRef;
  if (farmIdRefSerialized != null) {
    builder.attribute('D', farmIdRefSerialized);
  }
  final partfieldIdRef = instance.partfieldIdRef;
  final partfieldIdRefSerialized = partfieldIdRef;
  if (partfieldIdRefSerialized != null) {
    builder.attribute('E', partfieldIdRefSerialized);
  }
  final responsibleWorkerIdRef = instance.responsibleWorkerIdRef;
  final responsibleWorkerIdRefSerialized = responsibleWorkerIdRef;
  if (responsibleWorkerIdRefSerialized != null) {
    builder.attribute('F', responsibleWorkerIdRefSerialized);
  }
  final status = instance.status;
  final statusSerialized = $TaskStatusEnumMap[status]!;
  builder.attribute('G', statusSerialized);
  final defaultTreatmentZoneCode = instance.defaultTreatmentZoneCode;
  final defaultTreatmentZoneCodeSerialized =
      defaultTreatmentZoneCode?.toString();
  if (defaultTreatmentZoneCodeSerialized != null) {
    builder.attribute('H', defaultTreatmentZoneCodeSerialized);
  }
  final positionLostTreatmentZoneCode = instance.positionLostTreatmentZoneCode;
  final positionLostTreatmentZoneCodeSerialized =
      positionLostTreatmentZoneCode?.toString();
  if (positionLostTreatmentZoneCodeSerialized != null) {
    builder.attribute('I', positionLostTreatmentZoneCodeSerialized);
  }
  final outOfFieldTreatmentZoneCode = instance.outOfFieldTreatmentZoneCode;
  final outOfFieldTreatmentZoneCodeSerialized =
      outOfFieldTreatmentZoneCode?.toString();
  if (outOfFieldTreatmentZoneCodeSerialized != null) {
    builder.attribute('J', outOfFieldTreatmentZoneCodeSerialized);
  }
}

void _$TaskBuildXmlElement(Task instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('TSK', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Task _$TaskFromXmlElement(XmlElement element) {
  final commentAllocations = element.getElements('CAN')!;
  final controlAssignments = element.getElements('CAT')!;
  final connections = element.getElements('CNN')!;
  final deviceAllocations = element.getElements('DAN')!;
  final dataLogTriggers = element.getElements('DLT')!;
  final grid = element.getElement('GRD');
  final guidanceAllocations = element.getElements('GAN')!;
  final operationTechniquePractice = element.getElement('OTP');
  final productAllocations = element.getElements('PAN')!;
  final times = element.getElements('TIM')!;
  final timeLogs = element.getElements('TLG')!;
  final treatmentZones = element.getElements('TZN')!;
  final workerAllocations = element.getElements('WAN')!;
  final id = element.getAttribute('A')!;
  final designator = element.getAttribute('B');
  final customerIdRef = element.getAttribute('C');
  final farmIdRef = element.getAttribute('D');
  final partfieldIdRef = element.getAttribute('E');
  final responsibleWorkerIdRef = element.getAttribute('F');
  final status = element.getAttribute('G')!;
  final defaultTreatmentZoneCode = element.getAttribute('H');
  final positionLostTreatmentZoneCode = element.getAttribute('I');
  final outOfFieldTreatmentZoneCode = element.getAttribute('J');
  return Task(
      commentAllocations: commentAllocations
          .map((e) => CommentAllocation.fromXmlElement(e))
          .toList(),
      controlAssignments: controlAssignments
          .map((e) => ControlAssignment.fromXmlElement(e))
          .toList(),
      connections:
          connections.map((e) => Connection.fromXmlElement(e)).toList(),
      deviceAllocations: deviceAllocations
          .map((e) => DeviceAllocation.fromXmlElement(e))
          .toList(),
      dataLogTriggers:
          dataLogTriggers.map((e) => DataLogTrigger.fromXmlElement(e)).toList(),
      grid: grid != null ? Grid.fromXmlElement(grid) : null,
      guidanceAllocations: guidanceAllocations
          .map((e) => GuidanceAllocation.fromXmlElement(e))
          .toList(),
      operationTechniquePractice: operationTechniquePractice != null
          ? OperationTechniquePractice.fromXmlElement(
              operationTechniquePractice)
          : null,
      productAllocations: productAllocations
          .map((e) => ProductAllocation.fromXmlElement(e))
          .toList(),
      times: times.map((e) => Time.fromXmlElement(e)).toList(),
      timeLogs: timeLogs.map((e) => TimeLog.fromXmlElement(e)).toList(),
      treatmentZones:
          treatmentZones.map((e) => TreatmentZone.fromXmlElement(e)).toList(),
      workerAllocations: workerAllocations
          .map((e) => WorkerAllocation.fromXmlElement(e))
          .toList(),
      id: id,
      designator: designator,
      customerIdRef: customerIdRef,
      farmIdRef: farmIdRef,
      partfieldIdRef: partfieldIdRef,
      responsibleWorkerIdRef: responsibleWorkerIdRef,
      status: $TaskStatusEnumMap.entries
          .singleWhere(
              (taskStatusEnumMapEntry) =>
                  taskStatusEnumMapEntry.value == status,
              orElse: () => throw ArgumentError(
                  '`$status` is not one of the supported values: ${$TaskStatusEnumMap.values.join(', ')}'))
          .key,
      defaultTreatmentZoneCode: defaultTreatmentZoneCode != null
          ? int.parse(defaultTreatmentZoneCode)
          : null,
      positionLostTreatmentZoneCode: positionLostTreatmentZoneCode != null
          ? int.parse(positionLostTreatmentZoneCode)
          : null,
      outOfFieldTreatmentZoneCode: outOfFieldTreatmentZoneCode != null
          ? int.parse(outOfFieldTreatmentZoneCode)
          : null);
}

List<XmlAttribute> _$TaskToXmlAttributes(Task instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed = designatorSerialized != null
      ? XmlAttribute(XmlName('B'), designatorSerialized)
      : null;
  if (designatorConstructed != null) {
    attributes.add(designatorConstructed);
  }
  final customerIdRef = instance.customerIdRef;
  final customerIdRefSerialized = customerIdRef;
  final customerIdRefConstructed = customerIdRefSerialized != null
      ? XmlAttribute(XmlName('C'), customerIdRefSerialized)
      : null;
  if (customerIdRefConstructed != null) {
    attributes.add(customerIdRefConstructed);
  }
  final farmIdRef = instance.farmIdRef;
  final farmIdRefSerialized = farmIdRef;
  final farmIdRefConstructed = farmIdRefSerialized != null
      ? XmlAttribute(XmlName('D'), farmIdRefSerialized)
      : null;
  if (farmIdRefConstructed != null) {
    attributes.add(farmIdRefConstructed);
  }
  final partfieldIdRef = instance.partfieldIdRef;
  final partfieldIdRefSerialized = partfieldIdRef;
  final partfieldIdRefConstructed = partfieldIdRefSerialized != null
      ? XmlAttribute(XmlName('E'), partfieldIdRefSerialized)
      : null;
  if (partfieldIdRefConstructed != null) {
    attributes.add(partfieldIdRefConstructed);
  }
  final responsibleWorkerIdRef = instance.responsibleWorkerIdRef;
  final responsibleWorkerIdRefSerialized = responsibleWorkerIdRef;
  final responsibleWorkerIdRefConstructed =
      responsibleWorkerIdRefSerialized != null
          ? XmlAttribute(XmlName('F'), responsibleWorkerIdRefSerialized)
          : null;
  if (responsibleWorkerIdRefConstructed != null) {
    attributes.add(responsibleWorkerIdRefConstructed);
  }
  final status = instance.status;
  final statusSerialized = $TaskStatusEnumMap[status]!;
  final statusConstructed = XmlAttribute(XmlName('G'), statusSerialized);
  attributes.add(statusConstructed);
  final defaultTreatmentZoneCode = instance.defaultTreatmentZoneCode;
  final defaultTreatmentZoneCodeSerialized =
      defaultTreatmentZoneCode?.toString();
  final defaultTreatmentZoneCodeConstructed =
      defaultTreatmentZoneCodeSerialized != null
          ? XmlAttribute(XmlName('H'), defaultTreatmentZoneCodeSerialized)
          : null;
  if (defaultTreatmentZoneCodeConstructed != null) {
    attributes.add(defaultTreatmentZoneCodeConstructed);
  }
  final positionLostTreatmentZoneCode = instance.positionLostTreatmentZoneCode;
  final positionLostTreatmentZoneCodeSerialized =
      positionLostTreatmentZoneCode?.toString();
  final positionLostTreatmentZoneCodeConstructed =
      positionLostTreatmentZoneCodeSerialized != null
          ? XmlAttribute(XmlName('I'), positionLostTreatmentZoneCodeSerialized)
          : null;
  if (positionLostTreatmentZoneCodeConstructed != null) {
    attributes.add(positionLostTreatmentZoneCodeConstructed);
  }
  final outOfFieldTreatmentZoneCode = instance.outOfFieldTreatmentZoneCode;
  final outOfFieldTreatmentZoneCodeSerialized =
      outOfFieldTreatmentZoneCode?.toString();
  final outOfFieldTreatmentZoneCodeConstructed =
      outOfFieldTreatmentZoneCodeSerialized != null
          ? XmlAttribute(XmlName('J'), outOfFieldTreatmentZoneCodeSerialized)
          : null;
  if (outOfFieldTreatmentZoneCodeConstructed != null) {
    attributes.add(outOfFieldTreatmentZoneCodeConstructed);
  }
  return attributes;
}

List<XmlNode> _$TaskToXmlChildren(Task instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final commentAllocations = instance.commentAllocations;
  final commentAllocationsSerialized = commentAllocations;
  final commentAllocationsConstructed = commentAllocationsSerialized.map((e) =>
      XmlElement(XmlName('CAN'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(commentAllocationsConstructed);
  final controlAssignments = instance.controlAssignments;
  final controlAssignmentsSerialized = controlAssignments;
  final controlAssignmentsConstructed = controlAssignmentsSerialized.map((e) =>
      XmlElement(XmlName('CAT'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(controlAssignmentsConstructed);
  final connections = instance.connections;
  final connectionsSerialized = connections;
  final connectionsConstructed = connectionsSerialized.map((e) => XmlElement(
      XmlName('CNN'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(connectionsConstructed);
  final deviceAllocations = instance.deviceAllocations;
  final deviceAllocationsSerialized = deviceAllocations;
  final deviceAllocationsConstructed = deviceAllocationsSerialized.map((e) =>
      XmlElement(XmlName('DAN'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(deviceAllocationsConstructed);
  final dataLogTriggers = instance.dataLogTriggers;
  final dataLogTriggersSerialized = dataLogTriggers;
  final dataLogTriggersConstructed = dataLogTriggersSerialized.map((e) =>
      XmlElement(XmlName('DLT'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(dataLogTriggersConstructed);
  final grid = instance.grid;
  final gridSerialized = grid;
  final gridConstructed = gridSerialized != null
      ? XmlElement(
          XmlName('GRD'),
          gridSerialized.toXmlAttributes(namespaces: namespaces),
          gridSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (gridConstructed != null) {
    children.add(gridConstructed);
  }
  final guidanceAllocations = instance.guidanceAllocations;
  final guidanceAllocationsSerialized = guidanceAllocations;
  final guidanceAllocationsConstructed = guidanceAllocationsSerialized.map(
      (e) => XmlElement(
          XmlName('GAN'),
          e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(guidanceAllocationsConstructed);
  final operationTechniquePractice = instance.operationTechniquePractice;
  final operationTechniquePracticeSerialized = operationTechniquePractice;
  final operationTechniquePracticeConstructed =
      operationTechniquePracticeSerialized != null
          ? XmlElement(
              XmlName('OTP'),
              operationTechniquePracticeSerialized.toXmlAttributes(
                  namespaces: namespaces),
              operationTechniquePracticeSerialized.toXmlChildren(
                  namespaces: namespaces))
          : null;
  if (operationTechniquePracticeConstructed != null) {
    children.add(operationTechniquePracticeConstructed);
  }
  final productAllocations = instance.productAllocations;
  final productAllocationsSerialized = productAllocations;
  final productAllocationsConstructed = productAllocationsSerialized.map((e) =>
      XmlElement(XmlName('PAN'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(productAllocationsConstructed);
  final times = instance.times;
  final timesSerialized = times;
  final timesConstructed = timesSerialized.map((e) => XmlElement(
      XmlName('TIM'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(timesConstructed);
  final timeLogs = instance.timeLogs;
  final timeLogsSerialized = timeLogs;
  final timeLogsConstructed = timeLogsSerialized.map((e) => XmlElement(
      XmlName('TLG'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(timeLogsConstructed);
  final treatmentZones = instance.treatmentZones;
  final treatmentZonesSerialized = treatmentZones;
  final treatmentZonesConstructed = treatmentZonesSerialized.map((e) =>
      XmlElement(XmlName('TZN'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(treatmentZonesConstructed);
  final workerAllocations = instance.workerAllocations;
  final workerAllocationsSerialized = workerAllocations;
  final workerAllocationsConstructed = workerAllocationsSerialized.map((e) =>
      XmlElement(XmlName('WAN'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(workerAllocationsConstructed);
  return children;
}

XmlElement _$TaskToXmlElement(Task instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('TSK'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$TaskXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$TaskBuildXmlChildren(this as Task, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$TaskBuildXmlElement(this as Task, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$TaskToXmlAttributes(this as Task, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$TaskToXmlChildren(this as Task, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$TaskToXmlElement(this as Task, namespaces: namespaces);
}

void _$TaskControllerCapabilitiesBuildXmlChildren(
    TaskControllerCapabilities instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final functionNAME = instance.functionNAME;
  final functionNAMESerialized = functionNAME;
  builder.attribute('A', functionNAMESerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  builder.attribute('B', designatorSerialized);
  final versionNumber = instance.versionNumber;
  final versionNumberSerialized = $VersionNumberEnumMap[versionNumber]!;
  builder.attribute('C', versionNumberSerialized);
  final providedCapabilities = instance.providedCapabilities;
  final providedCapabilitiesSerialized = providedCapabilities.toString();
  builder.attribute('D', providedCapabilitiesSerialized);
  final numberOfBoomsSectionControl = instance.numberOfBoomsSectionControl;
  final numberOfBoomsSectionControlSerialized =
      numberOfBoomsSectionControl.toString();
  builder.attribute('E', numberOfBoomsSectionControlSerialized);
  final numberOfSectionsSectionControl =
      instance.numberOfSectionsSectionControl;
  final numberOfSectionsSectionControlSerialized =
      numberOfSectionsSectionControl.toString();
  builder.attribute('F', numberOfSectionsSectionControlSerialized);
  final numberOfControlChannels = instance.numberOfControlChannels;
  final numberOfControlChannelsSerialized = numberOfControlChannels.toString();
  builder.attribute('G', numberOfControlChannelsSerialized);
}

void _$TaskControllerCapabilitiesBuildXmlElement(
    TaskControllerCapabilities instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('TCC', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

TaskControllerCapabilities _$TaskControllerCapabilitiesFromXmlElement(
    XmlElement element) {
  final functionNAME = element.getAttribute('A')!;
  final designator = element.getAttribute('B')!;
  final versionNumber = element.getAttribute('C')!;
  final providedCapabilities = element.getAttribute('D')!;
  final numberOfBoomsSectionControl = element.getAttribute('E')!;
  final numberOfSectionsSectionControl = element.getAttribute('F')!;
  final numberOfControlChannels = element.getAttribute('G')!;
  return TaskControllerCapabilities(
      functionNAME: functionNAME,
      designator: designator,
      versionNumber: $VersionNumberEnumMap.entries
          .singleWhere(
              (versionNumberEnumMapEntry) =>
                  versionNumberEnumMapEntry.value == versionNumber,
              orElse: () => throw ArgumentError(
                  '`$versionNumber` is not one of the supported values: ${$VersionNumberEnumMap.values.join(', ')}'))
          .key,
      providedCapabilities: int.parse(providedCapabilities),
      numberOfBoomsSectionControl: int.parse(numberOfBoomsSectionControl),
      numberOfSectionsSectionControl: int.parse(numberOfSectionsSectionControl),
      numberOfControlChannels: int.parse(numberOfControlChannels));
}

List<XmlAttribute> _$TaskControllerCapabilitiesToXmlAttributes(
    TaskControllerCapabilities instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final functionNAME = instance.functionNAME;
  final functionNAMESerialized = functionNAME;
  final functionNAMEConstructed =
      XmlAttribute(XmlName('A'), functionNAMESerialized);
  attributes.add(functionNAMEConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed =
      XmlAttribute(XmlName('B'), designatorSerialized);
  attributes.add(designatorConstructed);
  final versionNumber = instance.versionNumber;
  final versionNumberSerialized = $VersionNumberEnumMap[versionNumber]!;
  final versionNumberConstructed =
      XmlAttribute(XmlName('C'), versionNumberSerialized);
  attributes.add(versionNumberConstructed);
  final providedCapabilities = instance.providedCapabilities;
  final providedCapabilitiesSerialized = providedCapabilities.toString();
  final providedCapabilitiesConstructed =
      XmlAttribute(XmlName('D'), providedCapabilitiesSerialized);
  attributes.add(providedCapabilitiesConstructed);
  final numberOfBoomsSectionControl = instance.numberOfBoomsSectionControl;
  final numberOfBoomsSectionControlSerialized =
      numberOfBoomsSectionControl.toString();
  final numberOfBoomsSectionControlConstructed =
      XmlAttribute(XmlName('E'), numberOfBoomsSectionControlSerialized);
  attributes.add(numberOfBoomsSectionControlConstructed);
  final numberOfSectionsSectionControl =
      instance.numberOfSectionsSectionControl;
  final numberOfSectionsSectionControlSerialized =
      numberOfSectionsSectionControl.toString();
  final numberOfSectionsSectionControlConstructed =
      XmlAttribute(XmlName('F'), numberOfSectionsSectionControlSerialized);
  attributes.add(numberOfSectionsSectionControlConstructed);
  final numberOfControlChannels = instance.numberOfControlChannels;
  final numberOfControlChannelsSerialized = numberOfControlChannels.toString();
  final numberOfControlChannelsConstructed =
      XmlAttribute(XmlName('G'), numberOfControlChannelsSerialized);
  attributes.add(numberOfControlChannelsConstructed);
  return attributes;
}

List<XmlNode> _$TaskControllerCapabilitiesToXmlChildren(
    TaskControllerCapabilities instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$TaskControllerCapabilitiesToXmlElement(
    TaskControllerCapabilities instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('TCC'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$TaskControllerCapabilitiesXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$TaskControllerCapabilitiesBuildXmlChildren(
          this as TaskControllerCapabilities, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$TaskControllerCapabilitiesBuildXmlElement(
          this as TaskControllerCapabilities, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$TaskControllerCapabilitiesToXmlAttributes(
          this as TaskControllerCapabilities,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$TaskControllerCapabilitiesToXmlChildren(
          this as TaskControllerCapabilities,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$TaskControllerCapabilitiesToXmlElement(
          this as TaskControllerCapabilities,
          namespaces: namespaces);
}

void _$Iso11783TaskDataBuildXmlChildren(
    Iso11783TaskData instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final attachedFiles = instance.attachedFiles;
  final attachedFilesSerialized = attachedFiles;
  for (final value in attachedFilesSerialized) {
    builder.element('AFE', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final baseStations = instance.baseStations;
  final baseStationsSerialized = baseStations;
  for (final value in baseStationsSerialized) {
    builder.element('BSN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final codedComments = instance.codedComments;
  final codedCommentsSerialized = codedComments;
  for (final value in codedCommentsSerialized) {
    builder.element('CCT', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final codedCommentGroups = instance.codedCommentGroups;
  final codedCommentGroupsSerialized = codedCommentGroups;
  for (final value in codedCommentGroupsSerialized) {
    builder.element('CCG', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final colourLegends = instance.colourLegends;
  final colourLegendsSerialized = colourLegends;
  for (final value in colourLegendsSerialized) {
    builder.element('CLD', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final cropTypes = instance.cropTypes;
  final cropTypesSerialized = cropTypes;
  for (final value in cropTypesSerialized) {
    builder.element('CTP', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final culturalPractices = instance.culturalPractices;
  final culturalPracticesSerialized = culturalPractices;
  for (final value in culturalPracticesSerialized) {
    builder.element('CPC', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final customers = instance.customers;
  final customersSerialized = customers;
  for (final value in customersSerialized) {
    builder.element('CTR', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final devices = instance.devices;
  final devicesSerialized = devices;
  for (final value in devicesSerialized) {
    builder.element('DVC', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final farms = instance.farms;
  final farmsSerialized = farms;
  for (final value in farmsSerialized) {
    builder.element('FRM', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final operationTechniques = instance.operationTechniques;
  final operationTechniquesSerialized = operationTechniques;
  for (final value in operationTechniquesSerialized) {
    builder.element('OTQ', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final partfields = instance.partfields;
  final partfieldsSerialized = partfields;
  for (final value in partfieldsSerialized) {
    builder.element('PFD', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final products = instance.products;
  final productsSerialized = products;
  for (final value in productsSerialized) {
    builder.element('PDT', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final productGroups = instance.productGroups;
  final productGroupsSerialized = productGroups;
  for (final value in productGroupsSerialized) {
    builder.element('PGP', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final tasks = instance.tasks;
  final tasksSerialized = tasks;
  for (final value in tasksSerialized) {
    builder.element('TSK', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final taskControllerCapabilities = instance.taskControllerCapabilities;
  final taskControllerCapabilitiesSerialized = taskControllerCapabilities;
  for (final value in taskControllerCapabilitiesSerialized) {
    builder.element('TCC', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final valuePresentations = instance.valuePresentations;
  final valuePresentationsSerialized = valuePresentations;
  for (final value in valuePresentationsSerialized) {
    builder.element('VPN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final workers = instance.workers;
  final workersSerialized = workers;
  for (final value in workersSerialized) {
    builder.element('WKR', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final externalFileReferences = instance.externalFileReferences;
  final externalFileReferencesSerialized = externalFileReferences;
  for (final value in externalFileReferencesSerialized) {
    builder.element('XFR', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final versionMajor = instance.versionMajor;
  final versionMajorSerialized = $VersionMajorEnumMap[versionMajor]!;
  builder.attribute('VersionMajor', versionMajorSerialized);
  final versionMinor = instance.versionMinor;
  final versionMinorSerialized = $VersionMinorEnumMap[versionMinor]!;
  builder.attribute('VersionMinor', versionMinorSerialized);
  final dataTransferOrigin = instance.dataTransferOrigin;
  final dataTransferOriginSerialized =
      $DataTransferOriginEnumMap[dataTransferOrigin]!;
  builder.attribute('DataTransferOrigin', dataTransferOriginSerialized);
  final managementSoftwareManufacturer =
      instance.managementSoftwareManufacturer;
  final managementSoftwareManufacturerSerialized =
      managementSoftwareManufacturer;
  builder.attribute('ManagementSoftwareManufacturer',
      managementSoftwareManufacturerSerialized);
  final managementSoftwareVersion = instance.managementSoftwareVersion;
  final managementSoftwareVersionSerialized = managementSoftwareVersion;
  builder.attribute(
      'ManagementSoftwareVersion', managementSoftwareVersionSerialized);
  final taskControllerManufacturer = instance.taskControllerManufacturer;
  final taskControllerManufacturerSerialized = taskControllerManufacturer;
  if (taskControllerManufacturerSerialized != null) {
    builder.attribute(
        'TaskControllerManufacturer', taskControllerManufacturerSerialized);
  }
  final taskControllerVersion = instance.taskControllerVersion;
  final taskControllerVersionSerialized = taskControllerVersion;
  if (taskControllerVersionSerialized != null) {
    builder.attribute('TaskControllerVersion', taskControllerVersionSerialized);
  }
  final language = instance.language;
  final languageSerialized = language;
  if (languageSerialized != null) {
    builder.attribute('lang', languageSerialized);
  }
}

void _$Iso11783TaskDataBuildXmlElement(
    Iso11783TaskData instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('ISO11783_TaskData', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Iso11783TaskData _$Iso11783TaskDataFromXmlElement(XmlElement element) {
  final attachedFiles = element.getElements('AFE')!;
  final baseStations = element.getElements('BSN')!;
  final codedComments = element.getElements('CCT')!;
  final codedCommentGroups = element.getElements('CCG')!;
  final colourLegends = element.getElements('CLD')!;
  final cropTypes = element.getElements('CTP')!;
  final culturalPractices = element.getElements('CPC')!;
  final customers = element.getElements('CTR')!;
  final devices = element.getElements('DVC')!;
  final farms = element.getElements('FRM')!;
  final operationTechniques = element.getElements('OTQ')!;
  final partfields = element.getElements('PFD')!;
  final products = element.getElements('PDT')!;
  final productGroups = element.getElements('PGP')!;
  final tasks = element.getElements('TSK')!;
  final taskControllerCapabilities = element.getElements('TCC')!;
  final valuePresentations = element.getElements('VPN')!;
  final workers = element.getElements('WKR')!;
  final externalFileReferences = element.getElements('XFR')!;
  final versionMajor = element.getAttribute('VersionMajor')!;
  final versionMinor = element.getAttribute('VersionMinor')!;
  final dataTransferOrigin = element.getAttribute('DataTransferOrigin')!;
  final managementSoftwareManufacturer =
      element.getAttribute('ManagementSoftwareManufacturer')!;
  final managementSoftwareVersion =
      element.getAttribute('ManagementSoftwareVersion')!;
  final taskControllerManufacturer =
      element.getAttribute('TaskControllerManufacturer');
  final taskControllerVersion = element.getAttribute('TaskControllerVersion');
  final language = element.getAttribute('lang');
  return Iso11783TaskData(
      attachedFiles:
          attachedFiles.map((e) => AttachedFile.fromXmlElement(e)).toList(),
      baseStations:
          baseStations.map((e) => BaseStation.fromXmlElement(e)).toList(),
      codedComments:
          codedComments.map((e) => CodedComment.fromXmlElement(e)).toList(),
      codedCommentGroups: codedCommentGroups
          .map((e) => CodedCommentGroup.fromXmlElement(e))
          .toList(),
      colourLegends:
          colourLegends.map((e) => ColourLegend.fromXmlElement(e)).toList(),
      cropTypes: cropTypes.map((e) => CropType.fromXmlElement(e)).toList(),
      culturalPractices: culturalPractices
          .map((e) => CulturalPractice.fromXmlElement(e))
          .toList(),
      customers: customers.map((e) => Customer.fromXmlElement(e)).toList(),
      devices: devices.map((e) => Device.fromXmlElement(e)).toList(),
      farms: farms.map((e) => Farm.fromXmlElement(e)).toList(),
      operationTechniques: operationTechniques
          .map((e) => OperationTechnique.fromXmlElement(e))
          .toList(),
      partfields: partfields.map((e) => Partfield.fromXmlElement(e)).toList(),
      products: products.map((e) => Product.fromXmlElement(e)).toList(),
      productGroups:
          productGroups.map((e) => ProductGroup.fromXmlElement(e)).toList(),
      tasks: tasks.map((e) => Task.fromXmlElement(e)).toList(),
      taskControllerCapabilities: taskControllerCapabilities
          .map((e) => TaskControllerCapabilities.fromXmlElement(e))
          .toList(),
      valuePresentations: valuePresentations
          .map((e) => ValuePresentation.fromXmlElement(e))
          .toList(),
      workers: workers.map((e) => Worker.fromXmlElement(e)).toList(),
      externalFileReferences: externalFileReferences
          .map((e) => ExternalFileReference.fromXmlElement(e))
          .toList(),
      versionMajor: $VersionMajorEnumMap.entries
          .singleWhere(
              (versionMajorEnumMapEntry) =>
                  versionMajorEnumMapEntry.value == versionMajor,
              orElse: () => throw ArgumentError(
                  '`$versionMajor` is not one of the supported values: ${$VersionMajorEnumMap.values.join(', ')}'))
          .key,
      versionMinor: $VersionMinorEnumMap.entries
          .singleWhere(
              (versionMinorEnumMapEntry) =>
                  versionMinorEnumMapEntry.value == versionMinor,
              orElse: () => throw ArgumentError(
                  '`$versionMinor` is not one of the supported values: ${$VersionMinorEnumMap.values.join(', ')}'))
          .key,
      dataTransferOrigin: $DataTransferOriginEnumMap.entries
          .singleWhere(
              (dataTransferOriginEnumMapEntry) =>
                  dataTransferOriginEnumMapEntry.value == dataTransferOrigin,
              orElse: () => throw ArgumentError(
                  '`$dataTransferOrigin` is not one of the supported values: ${$DataTransferOriginEnumMap.values.join(', ')}'))
          .key,
      managementSoftwareManufacturer: managementSoftwareManufacturer,
      managementSoftwareVersion: managementSoftwareVersion,
      taskControllerManufacturer: taskControllerManufacturer,
      taskControllerVersion: taskControllerVersion,
      language: language);
}

List<XmlAttribute> _$Iso11783TaskDataToXmlAttributes(Iso11783TaskData instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final versionMajor = instance.versionMajor;
  final versionMajorSerialized = $VersionMajorEnumMap[versionMajor]!;
  final versionMajorConstructed =
      XmlAttribute(XmlName('VersionMajor'), versionMajorSerialized);
  attributes.add(versionMajorConstructed);
  final versionMinor = instance.versionMinor;
  final versionMinorSerialized = $VersionMinorEnumMap[versionMinor]!;
  final versionMinorConstructed =
      XmlAttribute(XmlName('VersionMinor'), versionMinorSerialized);
  attributes.add(versionMinorConstructed);
  final dataTransferOrigin = instance.dataTransferOrigin;
  final dataTransferOriginSerialized =
      $DataTransferOriginEnumMap[dataTransferOrigin]!;
  final dataTransferOriginConstructed =
      XmlAttribute(XmlName('DataTransferOrigin'), dataTransferOriginSerialized);
  attributes.add(dataTransferOriginConstructed);
  final managementSoftwareManufacturer =
      instance.managementSoftwareManufacturer;
  final managementSoftwareManufacturerSerialized =
      managementSoftwareManufacturer;
  final managementSoftwareManufacturerConstructed = XmlAttribute(
      XmlName('ManagementSoftwareManufacturer'),
      managementSoftwareManufacturerSerialized);
  attributes.add(managementSoftwareManufacturerConstructed);
  final managementSoftwareVersion = instance.managementSoftwareVersion;
  final managementSoftwareVersionSerialized = managementSoftwareVersion;
  final managementSoftwareVersionConstructed = XmlAttribute(
      XmlName('ManagementSoftwareVersion'),
      managementSoftwareVersionSerialized);
  attributes.add(managementSoftwareVersionConstructed);
  final taskControllerManufacturer = instance.taskControllerManufacturer;
  final taskControllerManufacturerSerialized = taskControllerManufacturer;
  final taskControllerManufacturerConstructed =
      taskControllerManufacturerSerialized != null
          ? XmlAttribute(XmlName('TaskControllerManufacturer'),
              taskControllerManufacturerSerialized)
          : null;
  if (taskControllerManufacturerConstructed != null) {
    attributes.add(taskControllerManufacturerConstructed);
  }
  final taskControllerVersion = instance.taskControllerVersion;
  final taskControllerVersionSerialized = taskControllerVersion;
  final taskControllerVersionConstructed =
      taskControllerVersionSerialized != null
          ? XmlAttribute(
              XmlName('TaskControllerVersion'), taskControllerVersionSerialized)
          : null;
  if (taskControllerVersionConstructed != null) {
    attributes.add(taskControllerVersionConstructed);
  }
  final language = instance.language;
  final languageSerialized = language;
  final languageConstructed = languageSerialized != null
      ? XmlAttribute(XmlName('lang'), languageSerialized)
      : null;
  if (languageConstructed != null) {
    attributes.add(languageConstructed);
  }
  return attributes;
}

List<XmlNode> _$Iso11783TaskDataToXmlChildren(Iso11783TaskData instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final attachedFiles = instance.attachedFiles;
  final attachedFilesSerialized = attachedFiles;
  final attachedFilesConstructed = attachedFilesSerialized.map((e) =>
      XmlElement(XmlName('AFE'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(attachedFilesConstructed);
  final baseStations = instance.baseStations;
  final baseStationsSerialized = baseStations;
  final baseStationsConstructed = baseStationsSerialized.map((e) => XmlElement(
      XmlName('BSN'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(baseStationsConstructed);
  final codedComments = instance.codedComments;
  final codedCommentsSerialized = codedComments;
  final codedCommentsConstructed = codedCommentsSerialized.map((e) =>
      XmlElement(XmlName('CCT'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(codedCommentsConstructed);
  final codedCommentGroups = instance.codedCommentGroups;
  final codedCommentGroupsSerialized = codedCommentGroups;
  final codedCommentGroupsConstructed = codedCommentGroupsSerialized.map((e) =>
      XmlElement(XmlName('CCG'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(codedCommentGroupsConstructed);
  final colourLegends = instance.colourLegends;
  final colourLegendsSerialized = colourLegends;
  final colourLegendsConstructed = colourLegendsSerialized.map((e) =>
      XmlElement(XmlName('CLD'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(colourLegendsConstructed);
  final cropTypes = instance.cropTypes;
  final cropTypesSerialized = cropTypes;
  final cropTypesConstructed = cropTypesSerialized.map((e) => XmlElement(
      XmlName('CTP'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(cropTypesConstructed);
  final culturalPractices = instance.culturalPractices;
  final culturalPracticesSerialized = culturalPractices;
  final culturalPracticesConstructed = culturalPracticesSerialized.map((e) =>
      XmlElement(XmlName('CPC'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(culturalPracticesConstructed);
  final customers = instance.customers;
  final customersSerialized = customers;
  final customersConstructed = customersSerialized.map((e) => XmlElement(
      XmlName('CTR'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(customersConstructed);
  final devices = instance.devices;
  final devicesSerialized = devices;
  final devicesConstructed = devicesSerialized.map((e) => XmlElement(
      XmlName('DVC'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(devicesConstructed);
  final farms = instance.farms;
  final farmsSerialized = farms;
  final farmsConstructed = farmsSerialized.map((e) => XmlElement(
      XmlName('FRM'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(farmsConstructed);
  final operationTechniques = instance.operationTechniques;
  final operationTechniquesSerialized = operationTechniques;
  final operationTechniquesConstructed = operationTechniquesSerialized.map(
      (e) => XmlElement(
          XmlName('OTQ'),
          e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(operationTechniquesConstructed);
  final partfields = instance.partfields;
  final partfieldsSerialized = partfields;
  final partfieldsConstructed = partfieldsSerialized.map((e) => XmlElement(
      XmlName('PFD'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(partfieldsConstructed);
  final products = instance.products;
  final productsSerialized = products;
  final productsConstructed = productsSerialized.map((e) => XmlElement(
      XmlName('PDT'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(productsConstructed);
  final productGroups = instance.productGroups;
  final productGroupsSerialized = productGroups;
  final productGroupsConstructed = productGroupsSerialized.map((e) =>
      XmlElement(XmlName('PGP'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(productGroupsConstructed);
  final tasks = instance.tasks;
  final tasksSerialized = tasks;
  final tasksConstructed = tasksSerialized.map((e) => XmlElement(
      XmlName('TSK'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(tasksConstructed);
  final taskControllerCapabilities = instance.taskControllerCapabilities;
  final taskControllerCapabilitiesSerialized = taskControllerCapabilities;
  final taskControllerCapabilitiesConstructed =
      taskControllerCapabilitiesSerialized.map((e) => XmlElement(
          XmlName('TCC'),
          e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(taskControllerCapabilitiesConstructed);
  final valuePresentations = instance.valuePresentations;
  final valuePresentationsSerialized = valuePresentations;
  final valuePresentationsConstructed = valuePresentationsSerialized.map((e) =>
      XmlElement(XmlName('VPN'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(valuePresentationsConstructed);
  final workers = instance.workers;
  final workersSerialized = workers;
  final workersConstructed = workersSerialized.map((e) => XmlElement(
      XmlName('WKR'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(workersConstructed);
  final externalFileReferences = instance.externalFileReferences;
  final externalFileReferencesSerialized = externalFileReferences;
  final externalFileReferencesConstructed =
      externalFileReferencesSerialized.map((e) => XmlElement(
          XmlName('XFR'),
          e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(externalFileReferencesConstructed);
  return children;
}

XmlElement _$Iso11783TaskDataToXmlElement(Iso11783TaskData instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('ISO11783_TaskData'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$Iso11783TaskDataXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$Iso11783TaskDataBuildXmlChildren(this as Iso11783TaskData, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$Iso11783TaskDataBuildXmlElement(this as Iso11783TaskData, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$Iso11783TaskDataToXmlAttributes(this as Iso11783TaskData,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$Iso11783TaskDataToXmlChildren(this as Iso11783TaskData,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$Iso11783TaskDataToXmlElement(this as Iso11783TaskData,
          namespaces: namespaces);
}

void _$WorkerAllocationBuildXmlChildren(
    WorkerAllocation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final allocationStamp = instance.allocationStamp;
  final allocationStampSerialized = allocationStamp;
  if (allocationStampSerialized != null) {
    builder.element('ASP', nest: () {
      allocationStampSerialized.buildXmlChildren(builder,
          namespaces: namespaces);
    });
  }
  final workerIdRef = instance.workerIdRef;
  final workerIdRefSerialized = workerIdRef;
  builder.attribute('A', workerIdRefSerialized);
}

void _$WorkerAllocationBuildXmlElement(
    WorkerAllocation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('WAN', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

WorkerAllocation _$WorkerAllocationFromXmlElement(XmlElement element) {
  final allocationStamp = element.getElement('ASP');
  final workerIdRef = element.getAttribute('A')!;
  return WorkerAllocation(
      allocationStamp: allocationStamp != null
          ? AllocationStamp.fromXmlElement(allocationStamp)
          : null,
      workerIdRef: workerIdRef);
}

List<XmlAttribute> _$WorkerAllocationToXmlAttributes(WorkerAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final workerIdRef = instance.workerIdRef;
  final workerIdRefSerialized = workerIdRef;
  final workerIdRefConstructed =
      XmlAttribute(XmlName('A'), workerIdRefSerialized);
  attributes.add(workerIdRefConstructed);
  return attributes;
}

List<XmlNode> _$WorkerAllocationToXmlChildren(WorkerAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final allocationStamp = instance.allocationStamp;
  final allocationStampSerialized = allocationStamp;
  final allocationStampConstructed = allocationStampSerialized != null
      ? XmlElement(
          XmlName('ASP'),
          allocationStampSerialized.toXmlAttributes(namespaces: namespaces),
          allocationStampSerialized.toXmlChildren(namespaces: namespaces))
      : null;
  if (allocationStampConstructed != null) {
    children.add(allocationStampConstructed);
  }
  return children;
}

XmlElement _$WorkerAllocationToXmlElement(WorkerAllocation instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('WAN'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$WorkerAllocationXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$WorkerAllocationBuildXmlChildren(this as WorkerAllocation, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$WorkerAllocationBuildXmlElement(this as WorkerAllocation, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$WorkerAllocationToXmlAttributes(this as WorkerAllocation,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$WorkerAllocationToXmlChildren(this as WorkerAllocation,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$WorkerAllocationToXmlElement(this as WorkerAllocation,
          namespaces: namespaces);
}

void _$TimeBuildXmlChildren(Time instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final positions = instance.positions;
  final positionsSerialized = positions;
  for (final value in positionsSerialized) {
    builder.element('PTN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final dataLogValues = instance.dataLogValues;
  final dataLogValuesSerialized = dataLogValues;
  for (final value in dataLogValuesSerialized) {
    builder.element('DLV', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final start = instance.start;
  final startSerialized = start.toIso8601String();
  builder.attribute('A', startSerialized);
  final stop = instance.stop;
  final stopSerialized = stop?.toIso8601String();
  if (stopSerialized != null) {
    builder.attribute('B', stopSerialized);
  }
  final duration = instance.duration;
  final durationSerialized = duration?.toString();
  if (durationSerialized != null) {
    builder.attribute('C', durationSerialized);
  }
  final type = instance.type;
  final typeSerialized = $TimeTypeEnumMap[type]!;
  builder.attribute('D', typeSerialized);
}

void _$TimeBuildXmlElement(Time instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('TIM', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

Time _$TimeFromXmlElement(XmlElement element) {
  final positions = element.getElements('PTN')!;
  final dataLogValues = element.getElements('DLV')!;
  final start = element.getAttribute('A')!;
  final stop = element.getAttribute('B');
  final duration = element.getAttribute('C');
  final type = element.getAttribute('D')!;
  return Time(
      positions: positions.map((e) => Position.fromXmlElement(e)).toList(),
      dataLogValues:
          dataLogValues.map((e) => DataLogValue.fromXmlElement(e)).toList(),
      start: DateTime.parse(start),
      stop: stop != null ? DateTime.parse(stop) : null,
      duration: duration != null ? int.parse(duration) : null,
      type: $TimeTypeEnumMap.entries
          .singleWhere(
              (timeTypeEnumMapEntry) => timeTypeEnumMapEntry.value == type,
              orElse: () => throw ArgumentError(
                  '`$type` is not one of the supported values: ${$TimeTypeEnumMap.values.join(', ')}'))
          .key);
}

List<XmlAttribute> _$TimeToXmlAttributes(Time instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final start = instance.start;
  final startSerialized = start.toIso8601String();
  final startConstructed = XmlAttribute(XmlName('A'), startSerialized);
  attributes.add(startConstructed);
  final stop = instance.stop;
  final stopSerialized = stop?.toIso8601String();
  final stopConstructed = stopSerialized != null
      ? XmlAttribute(XmlName('B'), stopSerialized)
      : null;
  if (stopConstructed != null) {
    attributes.add(stopConstructed);
  }
  final duration = instance.duration;
  final durationSerialized = duration?.toString();
  final durationConstructed = durationSerialized != null
      ? XmlAttribute(XmlName('C'), durationSerialized)
      : null;
  if (durationConstructed != null) {
    attributes.add(durationConstructed);
  }
  final type = instance.type;
  final typeSerialized = $TimeTypeEnumMap[type]!;
  final typeConstructed = XmlAttribute(XmlName('D'), typeSerialized);
  attributes.add(typeConstructed);
  return attributes;
}

List<XmlNode> _$TimeToXmlChildren(Time instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final positions = instance.positions;
  final positionsSerialized = positions;
  final positionsConstructed = positionsSerialized.map((e) => XmlElement(
      XmlName('PTN'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(positionsConstructed);
  final dataLogValues = instance.dataLogValues;
  final dataLogValuesSerialized = dataLogValues;
  final dataLogValuesConstructed = dataLogValuesSerialized.map((e) =>
      XmlElement(XmlName('DLV'), e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(dataLogValuesConstructed);
  return children;
}

XmlElement _$TimeToXmlElement(Time instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('TIM'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$TimeXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$TimeBuildXmlChildren(this as Time, builder, namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$TimeBuildXmlElement(this as Time, builder, namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$TimeToXmlAttributes(this as Time, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$TimeToXmlChildren(this as Time, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$TimeToXmlElement(this as Time, namespaces: namespaces);
}

void _$TimeLogBuildXmlChildren(TimeLog instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final filename = instance.filename;
  final filenameSerialized = filename;
  builder.attribute('A', filenameSerialized);
  final fileLength = instance.fileLength;
  final fileLengthSerialized = fileLength?.toString();
  if (fileLengthSerialized != null) {
    builder.attribute('B', fileLengthSerialized);
  }
  final type = instance.type;
  final typeSerialized = $TimeLogTypeEnumMap[type]!;
  builder.attribute('C', typeSerialized);
}

void _$TimeLogBuildXmlElement(TimeLog instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('TLG', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

TimeLog _$TimeLogFromXmlElement(XmlElement element) {
  final filename = element.getAttribute('A')!;
  final fileLength = element.getAttribute('B');
  final type = element.getAttribute('C')!;
  return TimeLog(
      filename: filename,
      fileLength: fileLength != null ? int.parse(fileLength) : null,
      type: $TimeLogTypeEnumMap.entries
          .singleWhere(
              (timeLogTypeEnumMapEntry) =>
                  timeLogTypeEnumMapEntry.value == type,
              orElse: () => throw ArgumentError(
                  '`$type` is not one of the supported values: ${$TimeLogTypeEnumMap.values.join(', ')}'))
          .key);
}

List<XmlAttribute> _$TimeLogToXmlAttributes(TimeLog instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final filename = instance.filename;
  final filenameSerialized = filename;
  final filenameConstructed = XmlAttribute(XmlName('A'), filenameSerialized);
  attributes.add(filenameConstructed);
  final fileLength = instance.fileLength;
  final fileLengthSerialized = fileLength?.toString();
  final fileLengthConstructed = fileLengthSerialized != null
      ? XmlAttribute(XmlName('B'), fileLengthSerialized)
      : null;
  if (fileLengthConstructed != null) {
    attributes.add(fileLengthConstructed);
  }
  final type = instance.type;
  final typeSerialized = $TimeLogTypeEnumMap[type]!;
  final typeConstructed = XmlAttribute(XmlName('C'), typeSerialized);
  attributes.add(typeConstructed);
  return attributes;
}

List<XmlNode> _$TimeLogToXmlChildren(TimeLog instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$TimeLogToXmlElement(TimeLog instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('TLG'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$TimeLogXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$TimeLogBuildXmlChildren(this as TimeLog, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$TimeLogBuildXmlElement(this as TimeLog, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$TimeLogToXmlAttributes(this as TimeLog, namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$TimeLogToXmlChildren(this as TimeLog, namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$TimeLogToXmlElement(this as TimeLog, namespaces: namespaces);
}

void _$ProcessDataVariableBuildXmlChildren(
    ProcessDataVariable instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final processDataVariables = instance.processDataVariables;
  final processDataVariablesSerialized = processDataVariables;
  for (final value in processDataVariablesSerialized) {
    builder.element('PDV', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final ddi = instance.ddi;
  final ddiSerialized = ddi;
  builder.attribute('A', ddiSerialized);
  final value = instance.value;
  final valueSerialized = value.toString();
  builder.attribute('B', valueSerialized);
  final productIdRef = instance.productIdRef;
  final productIdRefSerialized = productIdRef;
  if (productIdRefSerialized != null) {
    builder.attribute('C', productIdRefSerialized);
  }
  final deviceElementIdRef = instance.deviceElementIdRef;
  final deviceElementIdRefSerialized = deviceElementIdRef;
  if (deviceElementIdRefSerialized != null) {
    builder.attribute('D', deviceElementIdRefSerialized);
  }
  final valuePresentationIdRef = instance.valuePresentationIdRef;
  final valuePresentationIdRefSerialized = valuePresentationIdRef;
  if (valuePresentationIdRefSerialized != null) {
    builder.attribute('E', valuePresentationIdRefSerialized);
  }
  final actualCulturalPracticeValue = instance.actualCulturalPracticeValue;
  final actualCulturalPracticeValueSerialized =
      actualCulturalPracticeValue?.toString();
  if (actualCulturalPracticeValueSerialized != null) {
    builder.attribute('F', actualCulturalPracticeValueSerialized);
  }
  final elementTypeInstanceValue = instance.elementTypeInstanceValue;
  final elementTypeInstanceValueSerialized =
      elementTypeInstanceValue?.toString();
  if (elementTypeInstanceValueSerialized != null) {
    builder.attribute('G', elementTypeInstanceValueSerialized);
  }
}

void _$ProcessDataVariableBuildXmlElement(
    ProcessDataVariable instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('PDV', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ProcessDataVariable _$ProcessDataVariableFromXmlElement(XmlElement element) {
  final processDataVariables = element.getElements('PDV')!;
  final ddi = element.getAttribute('A')!;
  final value = element.getAttribute('B')!;
  final productIdRef = element.getAttribute('C');
  final deviceElementIdRef = element.getAttribute('D');
  final valuePresentationIdRef = element.getAttribute('E');
  final actualCulturalPracticeValue = element.getAttribute('F');
  final elementTypeInstanceValue = element.getAttribute('G');
  return ProcessDataVariable(
      processDataVariables: processDataVariables
          .map((e) => ProcessDataVariable.fromXmlElement(e))
          .toList(),
      ddi: ddi,
      value: int.parse(value),
      productIdRef: productIdRef,
      deviceElementIdRef: deviceElementIdRef,
      valuePresentationIdRef: valuePresentationIdRef,
      actualCulturalPracticeValue: actualCulturalPracticeValue != null
          ? int.parse(actualCulturalPracticeValue)
          : null,
      elementTypeInstanceValue: elementTypeInstanceValue != null
          ? int.parse(elementTypeInstanceValue)
          : null);
}

List<XmlAttribute> _$ProcessDataVariableToXmlAttributes(
    ProcessDataVariable instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final ddi = instance.ddi;
  final ddiSerialized = ddi;
  final ddiConstructed = XmlAttribute(XmlName('A'), ddiSerialized);
  attributes.add(ddiConstructed);
  final value = instance.value;
  final valueSerialized = value.toString();
  final valueConstructed = XmlAttribute(XmlName('B'), valueSerialized);
  attributes.add(valueConstructed);
  final productIdRef = instance.productIdRef;
  final productIdRefSerialized = productIdRef;
  final productIdRefConstructed = productIdRefSerialized != null
      ? XmlAttribute(XmlName('C'), productIdRefSerialized)
      : null;
  if (productIdRefConstructed != null) {
    attributes.add(productIdRefConstructed);
  }
  final deviceElementIdRef = instance.deviceElementIdRef;
  final deviceElementIdRefSerialized = deviceElementIdRef;
  final deviceElementIdRefConstructed = deviceElementIdRefSerialized != null
      ? XmlAttribute(XmlName('D'), deviceElementIdRefSerialized)
      : null;
  if (deviceElementIdRefConstructed != null) {
    attributes.add(deviceElementIdRefConstructed);
  }
  final valuePresentationIdRef = instance.valuePresentationIdRef;
  final valuePresentationIdRefSerialized = valuePresentationIdRef;
  final valuePresentationIdRefConstructed =
      valuePresentationIdRefSerialized != null
          ? XmlAttribute(XmlName('E'), valuePresentationIdRefSerialized)
          : null;
  if (valuePresentationIdRefConstructed != null) {
    attributes.add(valuePresentationIdRefConstructed);
  }
  final actualCulturalPracticeValue = instance.actualCulturalPracticeValue;
  final actualCulturalPracticeValueSerialized =
      actualCulturalPracticeValue?.toString();
  final actualCulturalPracticeValueConstructed =
      actualCulturalPracticeValueSerialized != null
          ? XmlAttribute(XmlName('F'), actualCulturalPracticeValueSerialized)
          : null;
  if (actualCulturalPracticeValueConstructed != null) {
    attributes.add(actualCulturalPracticeValueConstructed);
  }
  final elementTypeInstanceValue = instance.elementTypeInstanceValue;
  final elementTypeInstanceValueSerialized =
      elementTypeInstanceValue?.toString();
  final elementTypeInstanceValueConstructed =
      elementTypeInstanceValueSerialized != null
          ? XmlAttribute(XmlName('G'), elementTypeInstanceValueSerialized)
          : null;
  if (elementTypeInstanceValueConstructed != null) {
    attributes.add(elementTypeInstanceValueConstructed);
  }
  return attributes;
}

List<XmlNode> _$ProcessDataVariableToXmlChildren(ProcessDataVariable instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final processDataVariables = instance.processDataVariables;
  final processDataVariablesSerialized = processDataVariables;
  final processDataVariablesConstructed = processDataVariablesSerialized.map(
      (e) => XmlElement(
          XmlName('PDV'),
          e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(processDataVariablesConstructed);
  return children;
}

XmlElement _$ProcessDataVariableToXmlElement(ProcessDataVariable instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('PDV'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$ProcessDataVariableXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ProcessDataVariableBuildXmlChildren(
          this as ProcessDataVariable, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ProcessDataVariableBuildXmlElement(this as ProcessDataVariable, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$ProcessDataVariableToXmlAttributes(this as ProcessDataVariable,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$ProcessDataVariableToXmlChildren(this as ProcessDataVariable,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$ProcessDataVariableToXmlElement(this as ProcessDataVariable,
          namespaces: namespaces);
}

void _$TreatmentZoneBuildXmlChildren(TreatmentZone instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final polygons = instance.polygons;
  final polygonsSerialized = polygons;
  for (final value in polygonsSerialized) {
    builder.element('PLN', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final processDataVariables = instance.processDataVariables;
  final processDataVariablesSerialized = processDataVariables;
  for (final value in processDataVariablesSerialized) {
    builder.element('PDV', nest: () {
      value.buildXmlChildren(builder, namespaces: namespaces);
    });
  }
  final code = instance.code;
  final codeSerialized = code.toString();
  builder.attribute('A', codeSerialized);
  final designator = instance.designator;
  final designatorSerialized = designator;
  if (designatorSerialized != null) {
    builder.attribute('B', designatorSerialized);
  }
  final colour = instance.colour;
  final colourSerialized = colour?.toString();
  if (colourSerialized != null) {
    builder.attribute('C', colourSerialized);
  }
}

void _$TreatmentZoneBuildXmlElement(TreatmentZone instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('TZN', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

TreatmentZone _$TreatmentZoneFromXmlElement(XmlElement element) {
  final polygons = element.getElements('PLN')!;
  final processDataVariables = element.getElements('PDV')!;
  final code = element.getAttribute('A')!;
  final designator = element.getAttribute('B');
  final colour = element.getAttribute('C');
  return TreatmentZone(
      polygons: polygons.map((e) => Polygon.fromXmlElement(e)).toList(),
      processDataVariables: processDataVariables
          .map((e) => ProcessDataVariable.fromXmlElement(e))
          .toList(),
      code: int.parse(code),
      designator: designator,
      colour: colour != null ? int.parse(colour) : null);
}

List<XmlAttribute> _$TreatmentZoneToXmlAttributes(TreatmentZone instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final code = instance.code;
  final codeSerialized = code.toString();
  final codeConstructed = XmlAttribute(XmlName('A'), codeSerialized);
  attributes.add(codeConstructed);
  final designator = instance.designator;
  final designatorSerialized = designator;
  final designatorConstructed = designatorSerialized != null
      ? XmlAttribute(XmlName('B'), designatorSerialized)
      : null;
  if (designatorConstructed != null) {
    attributes.add(designatorConstructed);
  }
  final colour = instance.colour;
  final colourSerialized = colour?.toString();
  final colourConstructed = colourSerialized != null
      ? XmlAttribute(XmlName('C'), colourSerialized)
      : null;
  if (colourConstructed != null) {
    attributes.add(colourConstructed);
  }
  return attributes;
}

List<XmlNode> _$TreatmentZoneToXmlChildren(TreatmentZone instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  final polygons = instance.polygons;
  final polygonsSerialized = polygons;
  final polygonsConstructed = polygonsSerialized.map((e) => XmlElement(
      XmlName('PLN'),
      e.toXmlAttributes(namespaces: namespaces),
      e.toXmlChildren(namespaces: namespaces)));
  children.addAll(polygonsConstructed);
  final processDataVariables = instance.processDataVariables;
  final processDataVariablesSerialized = processDataVariables;
  final processDataVariablesConstructed = processDataVariablesSerialized.map(
      (e) => XmlElement(
          XmlName('PDV'),
          e.toXmlAttributes(namespaces: namespaces),
          e.toXmlChildren(namespaces: namespaces)));
  children.addAll(processDataVariablesConstructed);
  return children;
}

XmlElement _$TreatmentZoneToXmlElement(TreatmentZone instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('TZN'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$TreatmentZoneXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$TreatmentZoneBuildXmlChildren(this as TreatmentZone, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$TreatmentZoneBuildXmlElement(this as TreatmentZone, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$TreatmentZoneToXmlAttributes(this as TreatmentZone,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$TreatmentZoneToXmlChildren(this as TreatmentZone,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$TreatmentZoneToXmlElement(this as TreatmentZone,
          namespaces: namespaces);
}

void _$ValuePresentationBuildXmlChildren(
    ValuePresentation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  final id = instance.id;
  final idSerialized = id;
  builder.attribute('A', idSerialized);
  final offset = instance.offset;
  final offsetSerialized = offset.toString();
  builder.attribute('B', offsetSerialized);
  final scale = instance.scale;
  final scaleSerialized = scale.toString();
  builder.attribute('C', scaleSerialized);
  final numberOfDecimals = instance.numberOfDecimals;
  final numberOfDecimalsSerialized = numberOfDecimals.toString();
  builder.attribute('D', numberOfDecimalsSerialized);
  final unitDesignator = instance.unitDesignator;
  final unitDesignatorSerialized = unitDesignator;
  if (unitDesignatorSerialized != null) {
    builder.attribute('E', unitDesignatorSerialized);
  }
  final colourLegendIdRef = instance.colourLegendIdRef;
  final colourLegendIdRefSerialized = colourLegendIdRef;
  if (colourLegendIdRefSerialized != null) {
    builder.attribute('F', colourLegendIdRefSerialized);
  }
}

void _$ValuePresentationBuildXmlElement(
    ValuePresentation instance, XmlBuilder builder,
    {Map<String, String> namespaces = const {}}) {
  builder.element('VPN', namespaces: namespaces, nest: () {
    instance.buildXmlChildren(builder, namespaces: namespaces);
  });
}

ValuePresentation _$ValuePresentationFromXmlElement(XmlElement element) {
  final id = element.getAttribute('A')!;
  final offset = element.getAttribute('B')!;
  final scale = element.getAttribute('C')!;
  final numberOfDecimals = element.getAttribute('D')!;
  final unitDesignator = element.getAttribute('E');
  final colourLegendIdRef = element.getAttribute('F');
  return ValuePresentation(
      id: id,
      offset: int.parse(offset),
      scale: double.parse(scale),
      numberOfDecimals: int.parse(numberOfDecimals),
      unitDesignator: unitDesignator,
      colourLegendIdRef: colourLegendIdRef);
}

List<XmlAttribute> _$ValuePresentationToXmlAttributes(
    ValuePresentation instance,
    {Map<String, String?> namespaces = const {}}) {
  final attributes = <XmlAttribute>[];
  final id = instance.id;
  final idSerialized = id;
  final idConstructed = XmlAttribute(XmlName('A'), idSerialized);
  attributes.add(idConstructed);
  final offset = instance.offset;
  final offsetSerialized = offset.toString();
  final offsetConstructed = XmlAttribute(XmlName('B'), offsetSerialized);
  attributes.add(offsetConstructed);
  final scale = instance.scale;
  final scaleSerialized = scale.toString();
  final scaleConstructed = XmlAttribute(XmlName('C'), scaleSerialized);
  attributes.add(scaleConstructed);
  final numberOfDecimals = instance.numberOfDecimals;
  final numberOfDecimalsSerialized = numberOfDecimals.toString();
  final numberOfDecimalsConstructed =
      XmlAttribute(XmlName('D'), numberOfDecimalsSerialized);
  attributes.add(numberOfDecimalsConstructed);
  final unitDesignator = instance.unitDesignator;
  final unitDesignatorSerialized = unitDesignator;
  final unitDesignatorConstructed = unitDesignatorSerialized != null
      ? XmlAttribute(XmlName('E'), unitDesignatorSerialized)
      : null;
  if (unitDesignatorConstructed != null) {
    attributes.add(unitDesignatorConstructed);
  }
  final colourLegendIdRef = instance.colourLegendIdRef;
  final colourLegendIdRefSerialized = colourLegendIdRef;
  final colourLegendIdRefConstructed = colourLegendIdRefSerialized != null
      ? XmlAttribute(XmlName('F'), colourLegendIdRefSerialized)
      : null;
  if (colourLegendIdRefConstructed != null) {
    attributes.add(colourLegendIdRefConstructed);
  }
  return attributes;
}

List<XmlNode> _$ValuePresentationToXmlChildren(ValuePresentation instance,
    {Map<String, String?> namespaces = const {}}) {
  final children = <XmlNode>[];
  return children;
}

XmlElement _$ValuePresentationToXmlElement(ValuePresentation instance,
    {Map<String, String?> namespaces = const {}}) {
  return XmlElement(
      XmlName('VPN'),
      [
        ...namespaces.toXmlAttributes(),
        ...instance.toXmlAttributes(namespaces: namespaces)
      ],
      instance.toXmlChildren(namespaces: namespaces));
}

mixin _$ValuePresentationXmlSerializableMixin {
  void buildXmlChildren(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ValuePresentationBuildXmlChildren(this as ValuePresentation, builder,
          namespaces: namespaces);

  void buildXmlElement(XmlBuilder builder,
          {Map<String, String> namespaces = const {}}) =>
      _$ValuePresentationBuildXmlElement(this as ValuePresentation, builder,
          namespaces: namespaces);

  List<XmlAttribute> toXmlAttributes(
          {Map<String, String?> namespaces = const {}}) =>
      _$ValuePresentationToXmlAttributes(this as ValuePresentation,
          namespaces: namespaces);

  List<XmlNode> toXmlChildren({Map<String, String?> namespaces = const {}}) =>
      _$ValuePresentationToXmlChildren(this as ValuePresentation,
          namespaces: namespaces);

  XmlElement toXmlElement({Map<String, String?> namespaces = const {}}) =>
      _$ValuePresentationToXmlElement(this as ValuePresentation,
          namespaces: namespaces);
}
