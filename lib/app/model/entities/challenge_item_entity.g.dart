// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeItemEntity _$ChallengeItemEntityFromJson(Map<String, dynamic> json) {
  return ChallengeItemEntity()
    ..id = json['_id'] as int
    ..title = json['title'] as String
    ..isFinishedFlag = json['isFinishedFlag'] as int
    ..startTimeStamp = json['startTimeStamp'] as int
    ..endTimeStamp = json['endTimeStamp'] as int
    ..limitedTimeStamp = json['limitedTimeStamp'] as int;
}

Map<String, dynamic> _$ChallengeItemEntityToJson(
        ChallengeItemEntity instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'isFinishedFlag': instance.isFinishedFlag,
      'startTimeStamp': instance.startTimeStamp,
      'endTimeStamp': instance.endTimeStamp,
      'limitedTimeStamp': instance.limitedTimeStamp
    };
