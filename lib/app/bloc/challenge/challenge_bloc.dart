import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class ChallengeBloc extends Bloc<ChallengeEvent, ChallengeState> {
  @override
  ChallengeState get initialState => InitialChallengeState();

  @override
  Stream<ChallengeState> mapEventToState(
    ChallengeEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
