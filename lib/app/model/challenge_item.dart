import 'package:json_annotation/json_annotation.dart';

part 'challenge_item.g.dart';

@JsonSerializable()
class ChallengeItem {
  final String title;
  final int duration;
  final bool isDone;
  final int loopCount;

  ChallengeItem({
    this.title,
    this.duration,
    this.isDone,
    this.loopCount,
  });

  //反序列化
  factory ChallengeItem.fromJson(Map<String, dynamic> json) =>
      _$ChallengeItemFromJson(json);

  //序列化
  Map<String, dynamic> toJson() => _$ChallengeItemToJson(this);
}
