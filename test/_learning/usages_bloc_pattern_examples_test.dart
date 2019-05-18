import 'package:bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterBloc', () {
    CounterBloc counterBloc;
    setUp(() => counterBloc = CounterBloc());

    test('初始化状态为0', () {
      expect(counterBloc.initialState, 0);
    });

    test('调用单次increment,状态为1', () {
      final List<int> expected = [0, 1];

      expectLater(
        counterBloc.state,
        emitsInOrder(expected),
      );

      counterBloc.dispatch(CounterEvent.increment);
    });

    test('调用单次decrement,状态为-1', () {
      final List<int> expected = [0, -1];

      expectLater(
        counterBloc.state,
        emitsInOrder(expected),
      );

      counterBloc.dispatch(CounterEvent.decrement);
    });
  });
}

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event,) async* {
    switch (event) {
      case CounterEvent.increment:
        yield currentState + 1;
        break;
      case CounterEvent.decrement:
        yield currentState - 1;
        break;
    }
  }
}
