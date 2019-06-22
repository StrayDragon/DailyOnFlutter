import 'package:daily/app/backend/entity/entities.dart';
import 'package:daily/app/backend/handler/handlers.dart';
import 'package:jaguar_orm/jaguar_orm.dart';

part 'challenge_item_handler.jorm.dart';

@GenBean()
class ChallengeItemHandler extends Bean<ChallengeItem>
    with _ChallengeItemHandler {
  final String tableName = 'ChallengeItems';

  ChallengeGroupHandler _challengeGroupHandler;

  @override
  ChallengeGroupHandler get challengeGroupBean =>
      _challengeGroupHandler ??= ChallengeGroupHandler(adapter);

  ChallengeItemHandler(Adapter adapter) : super(adapter);

	Future<int> updateFinishState(int id, bool value) async {
		Update st = updater.where(this.id.eq(id)).set(this.isFinished, value);
		return adapter.update(st);
	}
}
