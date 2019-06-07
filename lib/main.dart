import 'package:flutter/material.dart';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

import 'app/backend/entity/entities.dart';
import 'app/backend/handler/handlers.dart';
import 'app/util/databases.dart';
import 'app/view/pages.dart' show DailyChallengesPage;

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

		//
		await groupHandler.drop();
		await itemHandler.drop();

		//
		await groupHandler.createTable();
		await itemHandler.createTable();

		//
		await groupHandler.removeAll();
		await itemHandler.removeAll();

		var group = ChallengeGroup.make(
			title: "一个挑战",
			isFinished: false,
			challengeItems: [
				ChallengeItem.make(title: "子挑战1", isFinished: false),
				ChallengeItem.make(title: "子挑战2", isFinished: false),
				ChallengeItem.make(title: "子挑战2", isFinished: false),
			],
		);
		int groupId = await groupHandler.insert(group, cascade: true);
		print("看这 $groupId");

		int groupId2 = await groupHandler.insert(group..title = '另一个挑战');
		print("看这 $groupId2");

		var foundGroup = await groupHandler.find(groupId, preload: true);
		print("看这 $foundGroup");
		print("子看这 ${foundGroup.challengeItems}");

		var foundGroup2 = await groupHandler.find(groupId2);
		print("看这 $foundGroup2");

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
