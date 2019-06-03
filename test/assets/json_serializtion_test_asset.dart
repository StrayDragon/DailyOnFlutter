const String challengeItemSampleJson = """
{
  "_id":1,
  "group_id":1,
  "title":"听力训练",
  "isFinished":0,
  "startTime":0,
  "limitedTime":259200000,
  "endTime":0
}
""";

const String zippedChallengeItemSampleJson =
		'{"_id":1,"group_id":1,"title":"听力训练","isFinished":0,"startTime":0,"endTime":0,"limitedTime":259200000}';

const String challengeGroupSampleJson = """
{
  "_id":1,
  "title":"决战CET6",
  "tags":["英语","证书"],
  "color":4282661449,
  "isFinished":0,
  "startTime":0,
  "limitedTime":259200000,
  "endTime":0,
  "challengeItemIds":[
    1,
    2,
    3
  ]
}
""";

const String zippedChallengeGroupSampleJson =
		'{_id: 1, title: 决战CET6, tags: [英语, 证书], isFinished: 0, color: 4282661449, startTime: 0, endTime: 0, limitedTime: 259200000, challengeItemIds: [1,2,3]}';
