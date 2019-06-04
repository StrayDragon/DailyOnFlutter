import 'package:daily/app/util/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge_group.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChallengeGroup with EquatableMixinBase, EquatableMixin {
  @JsonKeys.safetyIdName
  int id;

  String title;

	List<int> tagIds;

  @JsonKeys.boolean
  bool isFinished;

  @JsonKeys.color
  Color color;

  @JsonKeys.dateTime
  DateTime startTime, endTime;

  @JsonKeys.duration
  Duration limitedTime;

  List<int> challengeItemIds;

  ChallengeGroup({
    this.id,
    this.title,
		this.tagIds,
    this.color,
    this.isFinished,
    this.startTime,
    this.endTime,
    this.limitedTime,
    this.challengeItemIds,
  });

	factory ChallengeGroup.fromMap(Map<String, dynamic> jsonObj) =>
      _$ChallengeGroupFromJson(jsonObj);

	Map<String, dynamic> toMap() => _$ChallengeGroupToJson(this);

  String toDebugString() =>
			'ChallengeGroup{id: $id, title: $title, tags: $tagIds, isFinished: $isFinished, color: $color, startTime: $startTime, endTime: $endTime, limitedTime: $limitedTime,...}';

  @override
  String toString() =>
			'ChallengeGroup{id: $id, title: $title, tags: $tagIds, isFinished: $isFinished,...';

  @override
  List get props =>
			[id, title, tagIds, isFinished, color, startTime, endTime, limitedTime];
}
