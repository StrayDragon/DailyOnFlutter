import 'package:daily/app/backend/handler/challenge_group_handler.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:meta/meta.dart';

class ChallengeTag {
  ChallengeTag();

  ChallengeTag.make({
    @required this.name,
  });

  @PrimaryKey(auto: true)
  int id;

  @BelongsTo(ChallengeGroupHandler)
  int groupId;

  @Column()
  String name;
}
