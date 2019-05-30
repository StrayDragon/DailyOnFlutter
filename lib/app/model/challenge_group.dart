import 'package:daily/app/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import 'challenge_item.dart';

part 'challenge_group.g.dart';

@JsonSerializable()
class ChallengeGroup {
	@JsonKeys.safetyIdName
	int id;

	String title;

	List<String> tags;

	@JsonKeys.boolean
	bool isFinished;

	@JsonKeys.color
	Color color;

	@JsonKeys.dateTime
	DateTime startTime, endTime;

	@JsonKeys.duration
	Duration limitedTime;

	List<ChallengeItem> challengeItems;

	ChallengeGroup({
		this.id,
		this.title,
		this.tags,
		this.color,
		this.isFinished,
		this.startTime,
		this.endTime,
		this.limitedTime,
		this.challengeItems,
	});

	factory ChallengeGroup.fromJson(Map<String, dynamic> jsonObj) =>
			_$ChallengeGroupFromJson(jsonObj);

	Map<String, dynamic> toJson() => _$ChallengeGroupToJson(this);

	String toDebugString() =>
			'ChallengeGroup{id: $id, title: $title, tags: $tags, isFinished: $isFinished, color: $color, startTime: $startTime, endTime: $endTime, limitedTime: $limitedTime, challengeItems: $challengeItems}';

	@override
	String toString() =>
			'ChallengeGroup{id: $id, title: $title, tags: $tags, isFinished: $isFinished, challengeItems: $challengeItems';
}
