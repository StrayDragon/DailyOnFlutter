import 'package:daily/app/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge_item.g.dart';

@JsonSerializable()
class ChallengeItem {
  @JsonKeys.safetyIdName
  int id;

  String title;

  @JsonKeys.boolean
  bool isFinished;

  @JsonKeys.dateTime
  DateTime startTime, endTime;

  @JsonKeys.duration
  Duration limitedTime;

  ChallengeItem({
    this.id,
    this.title,
    this.isFinished,
    this.startTime,
    this.limitedTime,
    this.endTime,
  });

  factory ChallengeItem.fromJson(Map<String, dynamic> jsonObj) =>
      _$ChallengeItemFromJson(jsonObj);

  Map<String, dynamic> toJson() => _$ChallengeItemToJson(this);

  String toDebugString() =>
      'ChallengeItem{id: $id, title: $title, isFinished: $isFinished, startTime: $startTime, limitedTime: $limitedTime, endTime: $endTime}';

  @override
  String toString() =>
      'ChallengeItem{id: $id, title: $title, isFinished: $isFinished}';
}
