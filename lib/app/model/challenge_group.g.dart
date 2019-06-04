// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeGroup _$ChallengeGroupFromJson(Map<String, dynamic> json) {
  return ChallengeGroup(
      id: json['_id'] as int,
      title: json['title'] as String,
			tagIds: (json['tag_ids'] as List)?.map((e) => e as int)?.toList(),
      color: ColorUtil.fromJson(json['color'] as int),
			isFinished: BoolUtil.fromJson(json['is_finished'] as int),
			startTime: DateTimeUtil.fromJson(json['start_time'] as int),
			endTime: DateTimeUtil.fromJson(json['end_time'] as int),
			limitedTime: DurationUtil.fromJson(json['limited_time'] as int),
      challengeItemIds:
			(json['challenge_item_ids'] as List)?.map((e) => e as int)?.toList());
}

Map<String, dynamic> _$ChallengeGroupToJson(ChallengeGroup instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
			'tag_ids': instance.tagIds,
			'is_finished': BoolUtil.toJson(instance.isFinished),
      'color': ColorUtil.toJson(instance.color),
			'start_time': DateTimeUtil.toJson(instance.startTime),
			'end_time': DateTimeUtil.toJson(instance.endTime),
			'limited_time': DurationUtil.toJson(instance.limitedTime),
			'challenge_item_ids': instance.challengeItemIds
    };
