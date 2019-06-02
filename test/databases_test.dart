import 'dart:convert' show json;

import 'package:daily/app/model/models.dart';
import 'package:flutter_test/flutter_test.dart' hide Finder;
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';

import 'assets/json_serializtion_test_asset.dart';

void main() {
  final challengeGroup =
      ChallengeGroup.fromJson(json.decode(challengeGroupSampleJson));
  final challengeItem =
  ChallengeItem.fromJson(json.decode(challengeItemSampleJson));
  final challengeItemUpdated =
  ChallengeItem.fromJson(json.decode(challengeItemSampleJson));
  challengeItemUpdated.isFinished = true;

  group('Sembast Database', () {
    String dbPath = 'sample.db';
    DatabaseFactory dbFactory = databaseFactoryMemory;
    Database db;

    setUp(() async => db = await dbFactory.openDatabase(dbPath));

    test("save ChallengeItem", () async {
      var store = intMapStoreFactory.store('challengeItems');

      await db.transaction((txn) async {
        await store.add(txn, challengeItem.toJson());
        await store.update(txn, challengeItemUpdated.toJson(),
            finder: Finder(
              filter: Filter.equal('_id', challengeItem.id),
            ));
      });

      var finder = Finder(filter: Filter.equals("title", "听力训练"));

      var records = await store.find(db, finder: finder);

      // FIXME: nested type can not save.
      records.forEach((record) => print(record));
      // expect(records[0], "决战CET6");
    });

    test("save ChallengeGroup", () async {
      var storeOfItem = intMapStoreFactory.store('challengeItems');

      var storeOfGroup = intMapStoreFactory.store('challengeGroups');

      var retrieveChallengeGroup = challengeGroup.toJson();

      List<ChallengeItem> itemsOfThisGroup =
      retrieveChallengeGroup['challengeItems'];

      retrieveChallengeGroup.remove('challengeItems');

      await db.transaction((txn) async {
        await storeOfGroup.add(txn, retrieveChallengeGroup);

        for (var item in itemsOfThisGroup) {
          await storeOfItem.add(txn, item.toJson());
        }
      });

      var finder = Finder(start: Boundary(include: true));

      var recordsOfItem = await storeOfGroup.find(db, finder: finder);
      var recordsOfGroup = await storeOfItem.find(db, finder: finder);

      // FIXME: nested type can not save.
      recordsOfItem.forEach((record) => print(record));
      recordsOfGroup.forEach((record) => print(record));
      // expect(records[0], "决战CET6");
    });

    tearDown(() async => await db.clear());
  });
}
