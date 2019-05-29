import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge_item_entity.g.dart';

@JsonSerializable()
class ChallengeItemEntity extends Equatable {
  @JsonKey(name: '_id')
  int id;

  String title;

  int isFinishedFlag;

  int startTimeStamp;

  int endTimeStamp;

  int limitedTimeStamp;

  ChallengeItemEntity(
      {this.id,
      this.title,
      this.isFinishedFlag,
      this.startTimeStamp,
      this.endTimeStamp,
      this.limitedTimeStamp});

  //反序列化
  factory ChallengeItemEntity.fromJson(Map<String, dynamic> json) =>
      _$ChallengeItemEntityFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$ChallengeItemEntityToJson(this);
}
