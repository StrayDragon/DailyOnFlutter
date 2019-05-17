import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

class IndexedPair {
  final int n1, n2, index;

  const IndexedPair(
    this.n1,
    this.n2,
    this.index,
  );

  factory IndexedPair.next(IndexedPair prev) => IndexedPair(
      prev.n2, prev.index <= 1 ? prev.n1 : prev.n1 + prev.n2, prev.index + 1);

  @override
  String toString() => '$index: $n2';
}

void main() {
  group('测试RxDart', () {
    test("官方例子", () {
      var n = 10;
      const seed = IndexedPair(1, 1, 0);

      Observable.range(1, n)
          .scan((IndexedPair seq, _, __) => IndexedPair.next(seq), seed)
          .listen(
            print,
            onDone: () => print('done!'),
          );
    });
  });
}
