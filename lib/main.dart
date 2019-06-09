import 'package:flutter/material.dart';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

import 'app/backend/entity/entities.dart';
import 'app/backend/handler/handlers.dart';
import 'app/util/databases.dart';
import 'app/view/daily_challenge/page/pages.dart' show DailyChallengesPage;

Future rawSqliteTest() async {
  Database db = await getAssetsDatabase("app_dev.db");

  // Attempt to test directly
  List<Map<String, dynamic>> list =
  await db.rawQuery("SELECT * FROM ChallengeTags");

  print(list);
}

Future ormSqliteTest() async {
  SqfliteAdapter _adapter;
  var sb = StringBuffer();

  var dbPath = await getDatabasesPath();
  _adapter = SqfliteAdapter(path.join(dbPath, "test.db"));

  try {
    //
    await _adapter.connect();

    //
    final groupHandler = ChallengeGroupHandler(_adapter);
    final itemHandler = ChallengeItemHandler(_adapter);
    final tagHandler = ChallengeTagHandler(_adapter);

    //
    await groupHandler.drop();
    await itemHandler.drop();
    await tagHandler.drop();

    //
    await groupHandler.createTable();
    await itemHandler.createTable();
    await tagHandler.createTable();

    //
    await groupHandler.removeAll();
    await itemHandler.removeAll();
    await tagHandler.removeAll();

    var group = ChallengeGroup.make(
      title: "一个挑战",
      isFinished: false,
      challengeItems: [
        ChallengeItem.make(title: "子挑战1", isFinished: false),
        ChallengeItem.make(title: "子挑战2", isFinished: false),
        ChallengeItem.make(title: "子挑战2", isFinished: false),
      ],
      tags: [
        ChallengeTag.make(name: "英语"),
        ChallengeTag.make(name: "学习"),
      ],
    );

    int groupId = await groupHandler.insert(group, cascade: true);
    print("看这 $groupId");

    var group2 = ChallengeGroup.make(
      title: "另一个挑战",
      isFinished: false,
      challengeItems: [
        ChallengeItem.make(title: "子挑战1", isFinished: false),
        ChallengeItem.make(title: "子挑战2", isFinished: false),
        ChallengeItem.make(title: "子挑战2", isFinished: false),
      ],
      tags: [
        ChallengeTag.make(name: "英语"),
        ChallengeTag.make(name: "学习"),
      ],
    );

    int groupId2 = await groupHandler.insert(group2);
    print("看这 $groupId2");

    var foundGroup = await groupHandler.find(groupId, preload: true);
    print("看这 $foundGroup");

    var foundGroup2 = await groupHandler.find(groupId2, preload: true);
    print("看这 $foundGroup2");

    var updatedGroupId = await groupHandler
        .update(foundGroup..isFinished = true, associate: true);
    print("看这 $updatedGroupId");

    var foundGroupAgain = await groupHandler.find(groupId, preload: true);
    print("看这 $foundGroupAgain");
    //
  } finally {
    await _adapter.close();
    print(sb.toString());
  }
}

void main() async {
  await Sqflite.devSetDebugModeOn(true);

//  await rawSqliteTest();
  await ormSqliteTest();
  // ---
  runApp(MyApp());
  // ---
//  await db.close();
}

class MyApp extends StatelessWidget {
  static const String ROUTE_NAME = '/';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily(测试版)',
      theme: ThemeData.light(),
      home: DailyChallengesPage(),
    );
  }
}
