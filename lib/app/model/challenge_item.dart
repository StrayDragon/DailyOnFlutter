import 'package:daily/app/util/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge_item.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChallengeItem with EquatableMixinBase, EquatableMixin {
  @JsonKey(name: 'group_id')
  int groupId;

  @JsonKeys.safetyIdName
  int id;

  String title;

  @JsonKeys.bool
  bool isFinished;

  @JsonKeys.dateTime
  DateTime startTime, endTime;

  @JsonKeys.duration
  Duration limitedTime;

  ChallengeItem({
    this.id,
    this.title,
    this.groupId,
    this.isFinished,
    this.startTime,
    this.limitedTime,
    this.endTime,
  });

	factory ChallengeItem.fromMap(Map<String, dynamic> jsonObj) =>
      _$ChallengeItemFromJson(jsonObj);

	Map<String, dynamic> toMap() => _$ChallengeItemToJson(this);

  String toDebugString() =>
      'ChallengeItem{id: $id, title: $title, isFinished: $isFinished, startTime: $startTime, limitedTime: $limitedTime, endTime: $endTime}';

  @override
  String toString() =>
      'ChallengeItem{id: $id, title: $title, isFinished: $isFinished}';

  @override
  List get props =>
      [groupId, id, title, isFinished, limitedTime, startTime, endTime];
}
