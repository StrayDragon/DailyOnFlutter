import 'package:daily/app/backend/entity/entities.dart';
import 'package:daily/app/backend/handler/handlers.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:meta/meta.dart';

class ChallengeGroup {
  ChallengeGroup();

  ChallengeGroup.make({
    @required this.title,
    @required this.isFinished,
    this.colorValue,
    this.startTime,
    this.endTime,
    this.limitedTime,
    this.challengeItems,
  });

  @PrimaryKey(auto: true)
  int id;

  @Column()
  String title;

  @Column()
  bool isFinished;

  @Column(isNullable: true)
  int colorValue;

  @Column(isNullable: true)
  DateTime startTime;

  @Column(isNullable: true)
  DateTime endTime;

  @Column(isNullable: true)
  int limitedTime;

  @HasMany(ChallengeItemHandler)
  List<ChallengeItem> challengeItems;

  @HasMany(ChallengeTagHandler)
  List<ChallengeTag> tags;

  @override
  String toString() {
    return 'ChallengeGroup{id: $id, title: $title, isFinished: $isFinished, colorValue: $colorValue, startTime: $startTime, endTime: $endTime, limitedTime: $limitedTime, challengeItems: $challengeItems}';
  }
}
