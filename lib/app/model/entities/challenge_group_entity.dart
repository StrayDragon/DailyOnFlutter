import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge_group_entity.g.dart';

@JsonSerializable()
class ChallengeGroupEntity extends Equatable {
  @JsonKey(name: '_id')
  int id;

  String title;

  String tags;

  int levelColorValue;

  int isFinished;

  int startTimeStamp;

  int endTimeStamp;

  int limitedTimeStamp;

  ChallengeGroupEntity(
      {this.id,
      this.title,
      this.tags,
      this.levelColorValue,
      this.isFinished,
      this.startTimeStamp,
      this.endTimeStamp,
      this.limitedTimeStamp});

  factory ChallengeGroupEntity.fromJson(Map<String, dynamic> json) =>
      _$ChallengeGroupEntityFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$ChallengeGroupEntityToJson(this);
}
