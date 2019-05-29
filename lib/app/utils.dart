import 'package:flutter/material.dart';

final List<String> _hansWeekdays = [
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
final List<String> _hansShortWeekday = [
	"",
	"周一",
	"周二",
	"周三",
	"周四",
	"周五",
	"周六",
	"周日",
];

class DateUtil {
	static List<String> parseDateTimeInfo(int millisecondsTimeStampSinceEpoch,
			{bool showYear = true,
				bool showMonth = true,
				bool showDay = true,
				bool showWeekDay = true}) {
		var that =
		DateTime.fromMillisecondsSinceEpoch(millisecondsTimeStampSinceEpoch);

		List<String> result;
		if (showYear) result.add(that.year.toString());
		if (showMonth) result.add(that.month.toString());
		if (showDay) result.add(that.day.toString());
		if (showWeekDay) result.add(_hansWeekdays[that.weekday]);

		return result;
	}
}

dynamic dbTypify(dynamic object) {
	if (object is Color) {
		return object.value;
	} else if (object is DateTime) {
		return object.millisecondsSinceEpoch;
	} else if (object is bool) {
		return object ? 1 : 0;
	} else {
		return object;
	}
}
