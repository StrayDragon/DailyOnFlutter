import 'package:daily/app/util/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge_tag.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ChallengeTag {
  @JsonKeys.safetyIdName
  int id;

  String name;

  ChallengeTag({
    this.id,
    this.name,
  });

  factory ChallengeTag.fromMap(Map<String, dynamic> jsonObj) =>
      _$ChallengeTagFromJson(jsonObj);

  Map<String, dynamic> toMap() => _$ChallengeTagToJson(this);
}
