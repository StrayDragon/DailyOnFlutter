import 'package:daily/app/backend/entity/entities.dart';
import 'package:daily/app/backend/handler/handlers.dart';
import 'package:jaguar_orm/jaguar_orm.dart';

part 'challenge_group_handler.jorm.dart';

@GenBean()
class ChallengeGroupHandler extends Bean<ChallengeGroup>
    with _ChallengeGroupHandler {
  final String tableName = 'ChallengeGroups';

  ChallengeGroupHandler(Adapter adapter)
      : challengeItemHandler = ChallengeItemHandler(adapter),
        challengeTagHandler = ChallengeTagHandler(adapter),
        super(adapter);

  ChallengeItemHandler challengeItemHandler;

  @override
  ChallengeItemHandler get challengeItemBean =>
      challengeItemHandler ??= ChallengeItemHandler(adapter);

  ChallengeTagHandler challengeTagHandler;

  @override
  ChallengeTagHandler get challengeTagBean =>
      challengeTagHandler ??= ChallengeTagHandler(adapter);

	Future<int> updateFinishState(int id, bool value) async {
		Update st = updater.where(this.id.eq(id)).set(this.isFinished, value);
		return adapter.update(st);
	}
}
