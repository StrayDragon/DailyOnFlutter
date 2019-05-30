import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore: unused_element
final List<String> _zhCnWeekdays = [
  "",
  "星期一",
  "星期二",
  "星期三",
  "星期四",
  "星期五",
  "星期六",
  "星期日",
];

// ignore: unused_element
final List<String> _zhCnShortWeekday = [
  "",
  "周一",
  "周二",
  "周三",
  "周四",
  "周五",
  "周六",
  "周日",
];

@Deprecated("Use JsonKeys.boolean instead")
const JsonKey boolJsonKey =
    JsonKey(fromJson: BoolUtil.fromJson, toJson: BoolUtil.toJson);

@Deprecated("Use JsonKeys.color instead")
const JsonKey colorJsonKey =
    JsonKey(fromJson: ColorUtil.fromJson, toJson: ColorUtil.toJson);

@Deprecated("Use JsonKeys.dateTime instead")
const JsonKey dateTimeJsonKey =
    JsonKey(fromJson: DateTimeUtil.fromJson, toJson: DateTimeUtil.toJson);

class JsonKeys {
  static const JsonKey safetyIdName = JsonKey(name: '_id');

  static const JsonKey boolean =
      JsonKey(fromJson: BoolUtil.fromJson, toJson: BoolUtil.toJson);

  static const JsonKey color =
      JsonKey(fromJson: ColorUtil.fromJson, toJson: ColorUtil.toJson);

  static const JsonKey dateTime =
      JsonKey(fromJson: DateTimeUtil.fromJson, toJson: DateTimeUtil.toJson);

	static const JsonKey duration =
	JsonKey(fromJson: DurationUtil.fromJson, toJson: DurationUtil.toJson);
}

class DurationUtil {
	static Duration fromJson(int millisecondsSinceEpochTimeStamp) {
		return Duration(milliseconds: millisecondsSinceEpochTimeStamp);
	}

	static int toJson(Duration time) => time.inMilliseconds;
}

class DateTimeUtil {
  static final DateFormat defaultFormatter = new DateFormat('Hm', 'zh_CN');

  static toHM(DateTime date) => DateTimeUtil.defaultFormatter.format(date);

  static DateTime fromJson(int millisecondsSinceEpochTimeStamp) {
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpochTimeStamp);
  }

  static int toJson(DateTime time) => time.millisecondsSinceEpoch;
}

class ColorUtil {
  static Color fromJson(int colorValue) => Color(colorValue);

  static int toJson(Color color) => color.value;
}

class BoolUtil {
  static bool fromJson(int flagValue) => flagValue == 1 ? true : false;

  static int toJson(bool flag) => flag ? 1 : 0;
}
