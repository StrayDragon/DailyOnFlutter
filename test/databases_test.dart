//import 'dart:convert' show json;
//
//import 'package:daily/app/model/models.dart';
//import 'package:daily/app/util/utils.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_test/flutter_test.dart' hide Finder;
//import 'package:sembast/sembast.dart';
//import 'package:sembast/sembast_memory.dart';
//
//import 'assets/json_serializtion_test_asset.dart';
//
//void main() {
//  final challengeGroup =
//      ChallengeGroup.fromMap(json.decode(challengeGroupSampleJson));
//  final challengeItem =
//      ChallengeItem.fromMap(json.decode(challengeItemSampleJson));
//  final challengeItemUpdated =
//      ChallengeItem.fromMap(json.decode(challengeItemSampleJson));
//  challengeItemUpdated.isFinished = true;
//
//  group('Sembast Database', () {
//    String dbPath = 'DebugDaily.db';
//    DatabaseFactory dbFactory = databaseFactoryMemory;
//    Database db;
//
//    setUp(() async => db = await dbFactory.openDatabase(dbPath));
//
//    test("save ChallengeItem", () async {
//      var store = intMapStoreFactory.store('challengeItems');
////      var store = stringMapStoreFactory.store("challengeItems");
//      await db.transaction((txn) async {
//        await store.add(txn, challengeItem.toMap());
//        await store.update(txn, challengeItemUpdated.toMap(),
//            finder: Finder(
//              filter: Filter.equal('_id', challengeItem.id),
//            ));
//      });
//
//      var finder = Finder(filter: Filter.equals("title", "听力训练"));
//
//      var records = await store.find(db, finder: finder);
//
//      // FIXME: nested type can not save.
//      records.forEach((record) => print(record));
//      // expect(records[0], "决战CET6");
//    });
//
//    test("save ChallengeGroup", () async {
//      var storeOfGroup = intMapStoreFactory.store('challengeGroups');
//
//      var retrieveChallengeGroup = challengeGroup.toMap();
//
//      List<ChallengeItem> itemsOfThisGroup =
//          retrieveChallengeGroup['challengeItems'];
//
//      retrieveChallengeGroup.remove('challengeItems');
//
//      await db.transaction((txn) async {
//        await storeOfGroup.add(txn, retrieveChallengeGroup);
//      });
//
//      var finder = Finder(start: Boundary(include: true));
//
//      var recordsOfGroup = await storeOfGroup.find(db, finder: finder);
//
//      // FIXME: nested type can not save.
//      recordsOfGroup.forEach((record) => print(record));
//      // expect(records[0], "决战CET6");
//    });
//
//    test("Add a challenge (include ChallengeGroup and ChallengeItems)",
//        () async {
//      var store = StoreRef<String, dynamic>.main();
//
//      // User add a new challenge
//      var challengeGroup = ChallengeGroup(
//        id: 1,
//        title: "高数夺命12题",
//        startTime: DateTime.now(),
//        isFinished: false,
//        limitedTime: Duration(hours: 1),
//        color: Colors.blue,
//        tagIds: <String>["考研", "高数"],
//        challengeItemIds: [],
//        // FIXME: 可能需要一个默认值以避免无意的bug
//        endTime: DateTimeUtil.none,
//      );
//
//      var item1 = ChallengeItem(
//        id: 1,
//        groupId: challengeGroup.id,
//        isFinished: false,
//        title: "前六题",
//        // FIXME: 是不是需要一个判断,子挑战限定时间总和不超过总限定时间
//        limitedTime: Duration(minutes: 20),
//        startTime: DateTimeUtil.none,
//        endTime: DateTimeUtil.none,
//      );
//      var item2 = ChallengeItem(
//        id: 2,
//        groupId: challengeGroup.id,
//        isFinished: false,
//        title: "后六题",
//        // FIXME: 是否有机制能自动计算剩余时间
//        limitedTime: Duration(minutes: 40),
//        startTime: DateTimeUtil.none,
//        endTime: DateTimeUtil.none,
//      );
//
//      List<ChallengeItem> items = [item1, item2];
//      items.forEach((item) => challengeGroup.challengeItemIds.add(item.id));
//
//      await db.transaction((txn) async {
//        await store
//            .record('challenge_groups')
//            .put(txn, challengeGroup.toMap());
//        for (var item in items) {
//          await store.record("challenge_items").put(txn, item.toMap());
//        }
//      });
//
//      var value = await store.findFirst(db);
//      var value2 = await store.findKeys(
//        db,
//        finder: Finder(
//          filter: Filter.greaterThan('_id', 0),
//        ),
//      );
//
//      print(value);
//      print(value2);
//    });
//
//    tearDown(() async => await db.clear());
//  });
//}
