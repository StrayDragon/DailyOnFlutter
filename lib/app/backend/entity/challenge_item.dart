import 'package:daily/app/backend/handler/challenge_group_handler.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:meta/meta.dart';

class ChallengeItem {
  ChallengeItem();

  ChallengeItem.make({
    @required this.title,
    @required this.isFinished,
    this.startTime,
    this.limitedTime,
    this.endTime,
  });

  @PrimaryKey(auto: true)
  int id;

  @BelongsTo(ChallengeGroupHandler)
  int groupId;

  @Column()
  String title;

  @Column()
  bool isFinished;

  @Column(isNullable: true)
  int startTime;

  @Column(isNullable: true)
  int endTime;

  @Column(isNullable: true)
  int limitedTime;
}
