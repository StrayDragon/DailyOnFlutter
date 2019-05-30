// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeItem _$ChallengeItemFromJson(Map<String, dynamic> json) {
  return ChallengeItem(
      id: json['_id'] as int,
      title: json['title'] as String,
      isFinished: json['isFinished'] == null
          ? null
          : BoolUtil.fromJson(json['isFinished'] as int),
      startTime: json['startTime'] == null
          ? null
          : DateTimeUtil.fromJson(json['startTime'] as int),
      limitedTime: json['limitedTime'] == null
          ? null
          : DurationUtil.fromJson(json['limitedTime'] as int),
      endTime: json['endTime'] == null
          ? null
          : DateTimeUtil.fromJson(json['endTime'] as int));
}

Map<String, dynamic> _$ChallengeItemToJson(ChallengeItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'isFinished': instance.isFinished == null
          ? null
          : BoolUtil.toJson(instance.isFinished),
      'startTime': instance.startTime == null
          ? null
          : DateTimeUtil.toJson(instance.startTime),
      'endTime': instance.endTime == null
          ? null
          : DateTimeUtil.toJson(instance.endTime),
      'limitedTime': instance.limitedTime == null
          ? null
          : DurationUtil.toJson(instance.limitedTime)
    };
