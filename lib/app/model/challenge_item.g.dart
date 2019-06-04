// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeItem _$ChallengeItemFromJson(Map<String, dynamic> json) {
  return ChallengeItem(
      id: json['_id'] as int,
      title: json['title'] as String,
      groupId: json['group_id'] as int,
			isFinished: BoolUtil.fromJson(json['is_finished'] as int),
			startTime: DateTimeUtil.fromJson(json['start_time'] as int),
			limitedTime: DurationUtil.fromJson(json['limited_time'] as int),
			endTime: DateTimeUtil.fromJson(json['end_time'] as int));
}

Map<String, dynamic> _$ChallengeItemToJson(ChallengeItem instance) =>
    <String, dynamic>{
      'group_id': instance.groupId,
      '_id': instance.id,
      'title': instance.title,
			'is_finished': BoolUtil.toJson(instance.isFinished),
			'start_time': DateTimeUtil.toJson(instance.startTime),
			'end_time': DateTimeUtil.toJson(instance.endTime),
			'limited_time': DurationUtil.toJson(instance.limitedTime)
    };
