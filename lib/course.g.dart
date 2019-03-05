// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
      place: json['place'] as String,
      teacher: json['teacher'] as String,
      time: json['time'] as String,
      title: json['title'] as String,
      week: json['week'] as String);
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'place': instance.place,
      'teacher': instance.teacher,
      'time': instance.time,
      'title': instance.title,
      'week': instance.week
    };
