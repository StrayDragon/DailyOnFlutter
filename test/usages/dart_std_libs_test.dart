import 'dart:convert' show json;

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('标准库常用库学习', () {
    group('时间与日期', () {
      test('获取当前时间', () {
        // 获取现在的日期和时间
        final now = DateTime.now();
        print(now);

        // (推荐) 使用 Unix 时间戳指定一个日期和时间
        final utfUnixDate =
            DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
        print(utfUnixDate);

        // 解析一个 ISO 8601 格式的日期
        final dateIso8601 = DateTime.parse('2000-01-01T00:00:00Z');
        print(dateIso8601);
      });

      test('创建DateTime', () {
        var localZoneTime = DateTime(2000, 1, 2); // 2000年1月2日
        print(localZoneTime);
      });

      group('序列化/反序列化', () {
        var now = DateTime.now();

        test('做法一(推荐) 存数值 MillisecondsSinceEpoch', () {
          String jsonStr = json.encode({
            "startTime": now.millisecondsSinceEpoch,
            "finishTime": now.add(Duration(days: 3)).millisecondsSinceEpoch,
          });
          print(jsonStr);

          Map<String, dynamic> jsonObj = json.decode(jsonStr);
          jsonObj.forEach((k, v) => print("$k : ${v.toString()}"));

          var start = DateTime.fromMillisecondsSinceEpoch(jsonObj['startTime']);
          var finish =
              DateTime.fromMillisecondsSinceEpoch(jsonObj['finishTime']);
          print(start);
          print(finish);
        });

        test('做法二 存数值字符串 MillisecondsSinceEpoch', () {
          String jsonStr = json.encode({
            "startTime": now.millisecondsSinceEpoch.toString(),
            "finishTime":
                now.add(Duration(days: 3)).millisecondsSinceEpoch.toString(),
          });
          print(jsonStr);

          Map<String, dynamic> jsonObj = json.decode(jsonStr);
          jsonObj.forEach((k, v) => print("$k : ${v.toString()}"));

          var start = DateTime.fromMillisecondsSinceEpoch(
              int.parse(jsonObj['startTime']));
          var finish = DateTime.fromMillisecondsSinceEpoch(
              int.parse(jsonObj['finishTime']));
          print(start);
          print(finish);
        });
      });

      test('做法三 存格式化的时间 Iso8601', () {
        var now = DateTime.now();
        String jsonStr = json.encode({
          "startTime": now.toIso8601String(),
          "finishTime": now.add(Duration(days: 3)).toIso8601String()
        });
        print(jsonStr);

        Map<String, dynamic> jsonObj = json.decode(jsonStr);
        jsonObj.forEach((k, v) => print("$k : ${v.toString()}"));

        var start = DateTime.parse(jsonObj['startTime']);
        var finish = DateTime.parse(jsonObj['finishTime']);

        print(start);
        print(finish);
      });
    });
  });
}
