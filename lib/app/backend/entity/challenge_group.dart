import 'package:daily/app/backend/entity/entities.dart';
import 'package:daily/app/backend/handler/handlers.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:meta/meta.dart';

class ChallengeGroup {
  ChallengeGroup();

  ChallengeGroup.make({
//    /*Generated*/ this.id,
    @required this.title,
    @required this.isFinished,
    this.colorValue,
    this.createTime,
    this.startTime,
    this.endTime,
    this.limitedDuration,
    this.challengeItems,
    this.tags,
  }) {
    this.colorValue ??= Colors.lightBlue.value;
    this.createTime ??= DateTime.now();
  }

  @PrimaryKey(auto: true, name: '_id')
  int id;

  @Column()
  String title;

  @Column()
  bool isFinished;

  @Column(isNullable: true)
  int colorValue;

  @Column(isNullable: true)
  DateTime createTime;

  @Column(isNullable: true)
  DateTime startTime;

  @Column(isNullable: true)
  DateTime endTime;

  @Column(isNullable: true)
  int limitedDuration;

  @HasMany(ChallengeItemHandler)
  List<ChallengeItem> challengeItems;

  @HasMany(ChallengeTagHandler)
  List<ChallengeTag> tags;

  @override
  String toString() {
    return 'ChallengeGroup{id: $id, title: $title, isFinished: $isFinished, createTime: $createTime, challengeItems: $challengeItems, tags: $tags}';
  }
}
