import 'package:daily/app/backend/entity/entities.dart';
import 'package:daily/app/backend/handler/handlers.dart';
import 'package:jaguar_orm/jaguar_orm.dart';

part 'challenge_tag_handler.jorm.dart';

@GenBean()
class ChallengeTagHandler extends Bean<ChallengeTag> with _ChallengeTagHandler {
  final String tableName = 'ChallengeTags';

  ChallengeTagHandler(Adapter adapter) : super(adapter);

  ChallengeGroupHandler _challengeGroupHandler;

  @override
  ChallengeGroupHandler get challengeGroupBean =>
      _challengeGroupHandler ??= ChallengeGroupHandler(adapter);
}
