//import 'dart:convert' show json;
//
//import 'package:daily/app/model/models.dart' show ChallengeItem, ChallengeGroup;
//import 'package:daily/app/util/existing_types.dart';
//import 'package:flutter_test/flutter_test.dart';
//
//import 'assets/json_serializtion_test_asset.dart';
//
//void main() {
//  group("ChallengeTime", () {
//    test("serialization from json", () {
//      var challengeItem =
//          ChallengeItem.fromMap(json.decode(challengeItemSampleJson));
//
//      expect(challengeItem.id, 1);
//      expect(challengeItem.title, "听力训练");
//      expect(challengeItem.startTime, DateTimeUtil.none);
//      expect(challengeItem.limitedTime.inMilliseconds, 259200000);
//      expect(challengeItem.isFinished, false);
//    });
//
//    test("deserialization to json", () {
//      Map expectedMap = json.decode(challengeItemSampleJson);
//      Map actualMap = ChallengeItem.fromMap(expectedMap).toMap();
//
//      expect(actualMap, expectedMap);
//      // expectedMap.forEach((k, expected) {
//      //   expect(actualMap[k], expected);
//      // });
//    });
//  });
//
//  group("ChallengeGroup", () {
//    test("serialization from json", () {
//      var challengeGroup =
//          ChallengeGroup.fromMap(json.decode(challengeGroupSampleJson));
//
//      expect(challengeGroup.id, 1);
//      expect(challengeGroup.title, "决战CET6");
//      expect(challengeGroup.isFinished, false);
//      expect(challengeGroup.startTime, DateTimeUtil.none);
//      expect(challengeGroup.limitedTime.inMilliseconds, 259200000);
//      expect(challengeGroup.tagIds[0], "英语");
//      expect(challengeGroup.color.value, 4282661449);
//      expect(challengeGroup.challengeItemIds[0], 1);
//    });
//
//    test("deserialization to json", () {
//      Map expectedMap = json.decode(challengeGroupSampleJson);
//      Map actualMap = ChallengeGroup.fromMap(expectedMap).toMap();
//
//      expect(actualMap, expectedMap);
//    });
//  });
//}
