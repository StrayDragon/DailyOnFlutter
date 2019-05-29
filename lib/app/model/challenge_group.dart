import 'package:daily/app/utils.dart';
import 'package:equatable/equatable.dart';

import 'challenge_item.dart';
import 'entities/challenge_group_entity.dart';

class ChallengeGroup extends Equatable {
  int id;

  String title;

  String tags;

  bool isFinished;

  DateTime startTime;

  DateTime endTime;

  DateTime limitedTime;

  List<ChallengeItem> challengeItems;

  ChallengeGroup({
    this.id,
    this.title,
    this.tags,
    this.isFinished,
    this.startTime,
    this.endTime,
    this.limitedTime,
    this.challengeItems,
  });

  factory ChallengeGroup.fromEntity(ChallengeGroupEntity entity) {
    return ChallengeGroup(
      id: entity.id,
      title: entity.title,
      tags: entity.tags,
      isFinished: dbTypify(entity.isFinished == 1),
      limitedTime: dbTypify(entity.limitedTimeStamp),
      startTime: dbTypify(entity.startTimeStamp),
      endTime: dbTypify(entity.endTimeStamp),
    );
  }

  @override
  String toString() {
    return 'ChallengeGroup{id: $id, title: $title, tags: $tags, isFinished: $isFinished, startTime: $startTime, endTime: $endTime, limitedTime: $limitedTime, ChallengeItemIds: ${challengeItems.map((e) => e.id).toList()}}';
  }
}
