import 'package:json_annotation/json_annotation.dart';

import 'existing_types.dart';

/// package: `json_annotation`'s simple extension for some special cases
class JsonKeys {
  /// Equals to `@JsonKey(name: '_id')`
  static const JsonKey safetyIdName = JsonKey(name: '_id');

  /// Equals to `@JsonKey(fromJson: BoolUtil.fromJson, toJson: BoolUtil.toJson)`
  ///
  /// Refer to: [BoolUtil]
  static const JsonKey boolean =
      JsonKey(fromJson: BoolUtil.fromJson, toJson: BoolUtil.toJson);

  /// Equals to `@JsonKey(fromJson: BoolUtil.fromJson, toJson: BoolUtil.toJson)`
  ///
  /// **WARNNING**: Using the keyword `bool` as field name maybe contrary to your cognition and code highlight, so just use [JsonKeys.boolean] instead.
  ///
  /// Refer to: [BoolUtil]
  static const JsonKey bool =
      JsonKey(fromJson: BoolUtil.fromJson, toJson: BoolUtil.toJson);

  /// Equals to `@JsonKey(fromJson: BoolUtil.fromJson, toJson: BoolUtil.toJson)`
  ///
  /// Refer to: [BoolUtil]
  static const JsonKey color =
      JsonKey(fromJson: ColorUtil.fromJson, toJson: ColorUtil.toJson);

  /// Equals to `@JsonKey(fromJson: DateTimeUtil.fromJson, toJson: DateTimeUtil.toJson)`
  ///
  /// Refer to: [DateTimeUtil]
  static const JsonKey dateTime =
      JsonKey(fromJson: DateTimeUtil.fromJson, toJson: DateTimeUtil.toJson);

  /// Equals to `@JsonKey(fromJson: DurationUtil.fromJson, toJson: DurationUtil.toJson)`
  ///
  /// Refer to: [DurationUtil]
  static const JsonKey duration =
      JsonKey(fromJson: DurationUtil.fromJson, toJson: DurationUtil.toJson);
}
