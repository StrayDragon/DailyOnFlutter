import 'package:daily/app/backend/handler/challenge_group_handler.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:meta/meta.dart';

class ChallengeItem {
  ChallengeItem();

  ChallengeItem.make({
//    /*Generated*/ this.id,
    this.groupId,
    @required this.title,
    @required this.isFinished,
    this.createTime,
    this.startTime,
    this.endTime,
    this.limitedDuration,
  }) {
    this.createTime ??= DateTime.now();
  }

  @PrimaryKey(auto: true)
  int id;

  @BelongsTo(ChallengeGroupHandler, refCol: '_id')
  int groupId;

  @Column()
  String title;

  @Column()
  bool isFinished;

  @Column(isNullable: true)
  DateTime createTime;

  @Column(isNullable: true)
  DateTime startTime;

  @Column(isNullable: true)
  DateTime endTime;

  @Column(isNullable: true)
  int limitedDuration;

  @override
  String toString() {
    return 'ChallengeItem{id: $id, title: $title, isFinished: $isFinished}';
  }
}
