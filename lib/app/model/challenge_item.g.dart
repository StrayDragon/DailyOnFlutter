// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChallengeItem _$ChallengeItemFromJson(Map<String, dynamic> json) {
  return ChallengeItem(
      id: json['_id'] as int,
      title: json['title'] as String,
      isFinished: BoolUtil.fromJson(json['isFinished'] as int),
      startTime: DateTimeUtil.fromJson(json['startTime'] as int),
      limitedTime: DurationUtil.fromJson(json['limitedTime'] as int),
      endTime: DateTimeUtil.fromJson(json['endTime'] as int));
}

Map<String, dynamic> _$ChallengeItemToJson(ChallengeItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'isFinished': BoolUtil.toJson(instance.isFinished),
      'startTime': DateTimeUtil.toJson(instance.startTime),
      'endTime': DateTimeUtil.toJson(instance.endTime),
      'limitedTime': DurationUtil.toJson(instance.limitedTime)
    };
