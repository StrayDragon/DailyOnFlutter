// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeGroup _$ChallengeGroupFromJson(Map<String, dynamic> json) {
  return ChallengeGroup(
      id: json['_id'] as int,
      title: json['title'] as String,
      tags: json['tags'] as String,
      color: json['color'] == null
          ? null
          : ColorUtil.fromJson(json['color'] as int),
      isFinished: json['isFinished'] == null
          ? null
          : BoolUtil.fromJson(json['isFinished'] as int),
      startTime: json['startTime'] == null
          ? null
          : DateTimeUtil.fromJson(json['startTime'] as int),
      endTime: json['endTime'] == null
          ? null
          : DateTimeUtil.fromJson(json['endTime'] as int),
      limitedTime: json['limitedTime'] == null
          ? null
          : DateTimeUtil.fromJson(json['limitedTime'] as int),
      challengeItems: (json['challengeItems'] as List)
          ?.map((e) => e == null
              ? null
              : ChallengeItem.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ChallengeGroupToJson(ChallengeGroup instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'tags': instance.tags,
      'isFinished': instance.isFinished == null
          ? null
          : BoolUtil.toJson(instance.isFinished),
      'color': instance.color == null ? null : ColorUtil.toJson(instance.color),
      'startTime': instance.startTime == null
          ? null
          : DateTimeUtil.toJson(instance.startTime),
      'endTime': instance.endTime == null
          ? null
          : DateTimeUtil.toJson(instance.endTime),
      'limitedTime': instance.limitedTime == null
          ? null
          : DateTimeUtil.toJson(instance.limitedTime),
      'challengeItems': instance.challengeItems
    };
