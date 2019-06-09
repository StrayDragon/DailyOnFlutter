import 'package:meta/meta.dart';

@immutable
abstract class ChallengeState {}

class InitialChallengeState extends ChallengeState {}

class AddChallengeState extends ChallengeState {}

class RemoveChallengeState extends ChallengeState {}

class ModifyChallengeState extends ChallengeState {}
