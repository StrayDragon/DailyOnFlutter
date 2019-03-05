import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  final String place;
  final String teacher;
  final String time;
  final String title;
  final String week;

  Course({this.place, this.teacher, this.time, this.title, this.week});

  //反序列化
  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
