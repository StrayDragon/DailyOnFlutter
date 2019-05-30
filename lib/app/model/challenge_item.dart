import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

import 'package:daily/app/utils.dart';

part 'challenge_item.g.dart';

@JsonSerializable()
class ChallengeItem {
  @JsonKeys.safetyIdName
  int id;

  String title;

  @JsonKeys.boolean
  bool isFinished;

  @JsonKeys.dateTime
  DateTime startTime, limitedTime, endTime;

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

  @override
  String toString() {
    return 'ChallengeItem{id: $id, title: $title, isFinished: $isFinished, startTime: $startTime, limitedTime: $limitedTime, endTime: $endTime}';
  }
}
