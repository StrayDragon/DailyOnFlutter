import 'dart:convert' show json;

import 'package:daily/app/model/models.dart' show ChallengeItem, ChallengeGroup;
import 'package:daily/app/util/existing_type.dart';
import 'package:flutter_test/flutter_test.dart';

import 'assets/json_serializtion_test_asset.dart';

void main() {
  group("ChallengeTime", () {
    test("serialization from json", () {
      var challengeItem =
          ChallengeItem.fromJson(json.decode(challengeItemSampleJson));

      expect(challengeItem.id, 1);
      expect(challengeItem.startTime, DateTimeUtil.none);
      expect(challengeItem.limitedTime.inMilliseconds, 259200000);
      expect(challengeItem.isFinished, false);
    });

    test("deserialization to json", () {
      var challengeItem =
          ChallengeItem.fromJson(json.decode(challengeItemSampleJson));

      expect(
          json.encode(challengeItem.toJson()), zippedChallengeItemSampleJson);
    });
  });

  group("ChallengeGroup", () {
    test("serialization from json", () {
      var challengeGroup =
          ChallengeGroup.fromJson(json.decode(challengeGroupSampleJson));

      expect(challengeGroup.id, 1);
      expect(challengeGroup.tags[0], "英语");
      expect(challengeGroup.color.value, 4282661449);
      expect(challengeGroup.challengeItems[0].id, 1);
    });
    test("deserialization to json", () {
      var challengeGroup =
          ChallengeGroup.fromJson(json.decode(challengeGroupSampleJson));

      expect(
          json.encode(challengeGroup.toJson()), zippedChallengeGroupSampleJson);
    });
  });
}
