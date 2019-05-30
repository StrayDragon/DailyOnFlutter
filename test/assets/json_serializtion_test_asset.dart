const String challengeItemSampleJson = """
{
  "_id":1,
  "title":"听力训练",
  "isFinished":0,
  "startTime":null,
  "limitedTime":259200000,
  "endTime":null
}
""";

const String zippedChallengeItemSampleJson =
    '{"_id":1,"title":"听力训练","isFinished":0,"startTime":null,"endTime":null,"limitedTime":259200000}';

const String challengeGroupSampleJson = """
{
  "_id":1,
  "title":"决战CET6",
  "tags":["英语","证书"],
  "color":4282661449,
  "isFinished":0,
  "startTime":null,
  "limitedTime":259200000,
  "endTime":null,
  "challengeItems":[
		{
			"_id":1,
			"title":"听力训练",
			"isFinished":0,
			"startTime":null,
			"limitedTime":259200000,
			"endTime":null
		},{
			"_id":2,
			"title":"阅读训练",
			"isFinished":0,
			"startTime":null,
			"limitedTime":259200000,
			"endTime":null
		},{
			"_id":3,
			"title":"写作和翻译训练",
			"isFinished":0,
			"startTime":null,
			"limitedTime":259200000,
			"endTime":null
		}
  ]
}
""";

const String zippedChallengeGroupSampleJson =
    '{"_id":1,"title":"决战CET6","tags":["英语","证书"],"isFinished":0,"color":4282661449,"startTime":null,"endTime":null,"limitedTime":259200000,"challengeItems":[{"_id":1,"title":"听力训练","isFinished":0,"startTime":null,"endTime":null,"limitedTime":259200000},{"_id":2,"title":"阅读训练","isFinished":0,"startTime":null,"endTime":null,"limitedTime":259200000},{"_id":3,"title":"写作和翻译训练","isFinished":0,"startTime":null,"endTime":null,"limitedTime":259200000}]}';
