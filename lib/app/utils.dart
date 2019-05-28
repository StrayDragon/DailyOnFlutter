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
