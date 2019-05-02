// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeItem _$ChallengeItemFromJson(Map<String, dynamic> json) {
  return ChallengeItem(
      title: json['title'] as String,
      duration: json['duration'] as int,
      isDone: json['isDone'] as bool,
      loopCount: json['loopCount'] as int);
}

Map<String, dynamic> _$ChallengeItemToJson(ChallengeItem instance) =>
    <String, dynamic>{
      'title': instance.title,
      'duration': instance.duration,
      'isDone': instance.isDone,
      'loopCount': instance.loopCount
    };
