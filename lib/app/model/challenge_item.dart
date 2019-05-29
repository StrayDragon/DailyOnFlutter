import 'package:daily/app/utils.dart';
import 'package:equatable/equatable.dart';

import 'entities/challenge_item_entity.dart';

class ChallengeItem extends Equatable {
  int id;

  String title;

  bool isFinished;

  DateTime startTime;

  DateTime limitedTime;

  DateTime endTime;

  ChallengeItem({
    this.id,
    this.title,
    this.isFinished,
    this.startTime,
    this.limitedTime,
    this.endTime,
  });

  factory ChallengeItem.fromEntity(ChallengeItemEntity entity) {
    return ChallengeItem(
      id: entity.id,
      title: entity.title,
      isFinished: dbTypify(entity.isFinishedFlag),
      limitedTime: dbTypify(entity.limitedTimeStamp),
      startTime: dbTypify(entity.startTimeStamp),
      endTime: dbTypify(entity.endTimeStamp),
    );
  }

  @override
  String toString() {
    return 'ChallengeItem{id: $id, title: $title, isFinished: $isFinished, startTime: $startTime, limitedTime: $limitedTime, endTime: $endTime}';
  }
}
