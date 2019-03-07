import 'dart:convert' show json;
import 'package:flutter_test/flutter_test.dart';
import 'package:daily/model/course.dart' show Course;

Map<String, List<Course>> getCourseHandler(Map<String, dynamic> parsedJson) {
  List<String> keys = ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日'];
  Map<String, List<Course>> handler = {};
  for (String key in keys) {
    var list = parsedJson[key] as List;
    var tmp = list.map((e) => Course.fromJson(e)).toList();
    handler[key] = tmp;
  }
  return handler;
}

void main() {
  group('JSON反序列化Model接口', () {
    String testData = """
  {"星期一": [{"title": "多媒体技术与应用B", "week": "1-8", "time": "5,6", "teacher": "马垚", "place": "致远楼A106"}, {"title": "Web技术基础", "week": "1-10", "time": "7,8", "teacher": "马垚", "place": "致远楼A105"}], "星期二": [{"title": "网络工程与系统集成", "week": "1-6", "time": "3,4", "teacher": "郭昊", "place": "致远楼A306"}, {"title": "计算机科学与技术专业英语", "week": "9-16", "time": "5,6", "teacher": "杨丽凤", "place": "致远楼A105"}], "星期三": [{"title": "Web技术基础", "week": "1-10", "time": "1,2", "teacher": "马垚", "place": "致远楼A105"}, {"title": "多媒体技术与应用B", "week": "1-8", "time": "3,4", "teacher": "马垚", "place": "致远楼A106"}], "星期四": [{"title": "形势与政策(六)", "week": "1-5", "time": "1,2", "teacher": "刘振霞", "place": "致远楼A101"}, {"title": "网络工程与系统集成", "week": "1-6", "time": "5,6", "teacher": "郭昊", "place": "致远楼A306"}], "星期五": [{"title": "计算机科学与技术专业英语", "week": "9-16", "time": "1,2", "teacher": "杨丽凤", "place": "致远楼A105"}], "星期六": [], "星期日": []}
  """;

    test('测试转换课程数据并生成POD', () {
      String expected = """马垚""";
      Map<String, dynamic> parsedJson = json.decode(testData);
      var course = Course.fromJson(parsedJson['星期一'][0]);
      expect(course.teacher, expected);
    });

    test('测试数组嵌套对象,生成课程周对象', () {
      List<String> weekKeys = ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日'];
      Map<String, dynamic> parsedJson = json.decode(testData);
      Map<String, List<Course>> handler = getCourseHandler(parsedJson);
      for (var k in weekKeys) {
        print("$k ");
        handler[k]?.forEach((e) => print("${e.toString()} "));
      }
    });
  });
}
