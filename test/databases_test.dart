import 'dart:convert' show json;

import 'package:daily/app/model/models.dart';
import 'package:flutter_test/flutter_test.dart' hide Finder;
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';

import 'assets/json_serializtion_test_asset.dart';

void main() {
  final challengeGroup =
      ChallengeGroup.fromJson(json.decode(challengeGroupSampleJson));

  group('Sembast Database', () {
    String dbPath = 'sample.db';
    DatabaseFactory dbFactory = databaseFactoryMemory;
    Database db;

    setUp(() async => db = await dbFactory.openDatabase(dbPath));

    test("save ChallengeGroup", () async {
      var store = intMapStoreFactory.store('challengeGroups');

      await db.transaction((txn) async {
        await store.add(txn, challengeGroup.toJson());
      });

      var finder = Finder(filter: Filter.equals("title", "决战CET6"));

      var records = await store.find(db, finder: finder);

      // FIXME: nested type can not save.
      print(records[0]);
      // expect(records[0], "决战CET6");
    });

    tearDown(() async => await db.clear());
  });
}
