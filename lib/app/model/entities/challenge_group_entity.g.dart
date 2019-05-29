// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_group_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeGroupEntity _$ChallengeGroupEntityFromJson(Map<String, dynamic> json) {
  return ChallengeGroupEntity()
    ..id = json['_id'] as int
    ..title = json['title'] as String
    ..tags = json['tags'] as String
    ..levelColorValue = json['levelColorValue'] as int
    ..isFinished = json['isFinished'] as int
    ..startTimeStamp = json['startTimeStamp'] as int
    ..endTimeStamp = json['endTimeStamp'] as int
    ..limitedTimeStamp = json['limitedTimeStamp'] as int;
}

Map<String, dynamic> _$ChallengeGroupEntityToJson(
        ChallengeGroupEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'tags': instance.tags,
      'levelColorValue': instance.levelColorValue,
      'isFinished': instance.isFinished,
      'startTimeStamp': instance.startTimeStamp,
      'endTimeStamp': instance.endTimeStamp,
      'limitedTimeStamp': instance.limitedTimeStamp
    };
