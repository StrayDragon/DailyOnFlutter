import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DurationUtil {
  static Duration fromJson(int millisecondsSinceEpochTimeStamp) {
    return Duration(milliseconds: millisecondsSinceEpochTimeStamp ?? 0);
  }

  static int toJson(Duration time) => time.inMilliseconds;
}

class DateTimeUtil {
  static final none = DateTime.fromMillisecondsSinceEpoch(0);

  static final DateFormat defaultFormatter = new DateFormat('Hm', 'zh_CN');

  static toHM(DateTime date) => DateTimeUtil.defaultFormatter.format(date);

  static DateTime fromJson(int millisecondsSinceEpochTimeStamp) {
    return DateTime.fromMillisecondsSinceEpoch(
        millisecondsSinceEpochTimeStamp ?? 0);
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
