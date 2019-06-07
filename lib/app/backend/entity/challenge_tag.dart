import 'package:daily/app/backend/handler/challenge_group_handler.dart';
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:meta/meta.dart';

class ChallengeTag {
  ChallengeTag();

  ChallengeTag.make({
//    /*Generated*/ this.id,
    @required this.name,
    this.groupId,
  });

  @PrimaryKey(auto: true)
  int id;

  @BelongsTo(ChallengeGroupHandler, refCol: '_id')
  int groupId;

  @Column()
  String name;

  @override
  String toString() {
    return 'ChallengeTag{id: $id, name: $name}';
  }
}
