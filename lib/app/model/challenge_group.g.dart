// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeGroup _$ChallengeGroupFromJson(Map<String, dynamic> json) {
  return ChallengeGroup(
      id: json['_id'] as int,
      title: json['title'] as String,
      tags: (json['tags'] as List)?.map((e) => e as String)?.toList(),
      color: ColorUtil.fromJson(json['color'] as int),
      isFinished: BoolUtil.fromJson(json['isFinished'] as int),
      startTime: DateTimeUtil.fromJson(json['startTime'] as int),
      endTime: DateTimeUtil.fromJson(json['endTime'] as int),
      limitedTime: DurationUtil.fromJson(json['limitedTime'] as int),
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
      'isFinished': BoolUtil.toJson(instance.isFinished),
      'color': ColorUtil.toJson(instance.color),
      'startTime': DateTimeUtil.toJson(instance.startTime),
      'endTime': DateTimeUtil.toJson(instance.endTime),
      'limitedTime': DurationUtil.toJson(instance.limitedTime),
      'challengeItems': instance.challengeItems
    };
