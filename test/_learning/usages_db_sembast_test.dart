import 'dart:convert';

import 'package:flutter_test/flutter_test.dart' hide Finder;
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:sembast/utils/sembast_import_export.dart';

void main() {
  // 数据库初始化与连接
  String dbPath = 'sample.db';
  // NOTE: Step 1.初始化IO并创建Database实例,等待之后连接(打开)数据库
  //              [注] 测试使用内存存储,实际应用使用下面这个工厂实例,导入此标记#tag1
  // DatabaseFactory dbFactory = databaseFactoryIo;
  DatabaseFactory dbFactory = databaseFactoryMemory;
  Database db;

  group(
    "连接Sembast数据库与基本操作",
				() {
      // NOTE: Step 2. 连接(打开)目标数据库
      setUp(() async => db = await dbFactory.openDatabase(dbPath));

      tearDown(() async => await db.clear());

      // NOTE: Step 3. 该咋用就咋用...
      group(
        "最基本功能(读/写数据)",
						() {
          test("写/读 String", () async {
            await db.put('Simple application', 'title');
            String title = await db.get('title') as String;

            expect(title, 'Simple application');
          });
          test("写/读 int", () async {
            await db.put(10, 'version');
            int version = await db.get('version') as int;

            expect(version, 10);
          });
          test("写/读 Map", () async {
            await db.put({'offline': true}, 'settings');
            Map settings = await db.get('settings') as Map;

            expect(settings, {'offline': true});
          });
        },
      );

      group(
        "事务功能",
						() {
          test(
            "写/读 一堆String",
								() async {
              await db.transaction((txn) async {
                await txn.put('value1', 'value1');
                await txn.put('value2', 'value2');
              });
              String v1, v2;
              await db.transaction((txn) async {
                v1 = await txn.get('value1');
                v2 = await txn.get('value2');
              });

              expect(v1, 'value1');
              expect(v2, 'value2');
            },
          );
        },
      );

      group(
        '新的store API',
						() {
          test('写/读 String', () async {
            const expectedUrl = 'my_url';
            const expectedUsername = 'my_username';

            var store = StoreRef<String, String>.main();
            await store.record('username').put(db, expectedUsername);
            await store.record('url').put(db, expectedUrl);

            var url = await store.record('url').get(db);
            var username = await store.record('username').get(db);

            expect(url, expectedUrl);
            expect(username, expectedUsername);
          });

          test('Store用法', () async {
            // Use the animals store using Map records with int keys
            var store = intMapStoreFactory.store('animals');

            // Store some objects
            await db.transaction((txn) async {
              await store.add(txn, {'name': 'fish'});
              await store.add(txn, {'name': 'cat'});

              // You can specify a key
              await store.record(10).put(txn, {'name': 'dog'});
            });
          });
        },
      );

      group('条件查找', () {
        test('示例1 : 大于等于某个键值', () async {
          // Use the animals store using Map records with int keys
          var store = intMapStoreFactory.store('zoo');

          // Store some objects
          await db.transaction((txn) async {
            await store.add(txn, {'name': 'fish'});
            await store.add(txn, {'name': 'cat'});
            await store.add(txn, {'name': 'dog'});
          });

          // Look for any animal "greater than" (alphabetically) 'cat'
          // ordered by name
          var finder = Finder(
              filter: Filter.greaterThan('name', 'cat'),
              sortOrders: [SortOrder('name')]);
          var records = await store.find(db, finder: finder);

          expect(records.length, 2);
          expect(records[0]['name'], 'dog');
          expect(records[1]['name'], 'fish');
        });
      });
    },
  );

  group('加密的Sembast数据库', () {
    // NOTE: Step 2. 连接自定义加密数据库: 参考:https://github.com/tekartik/sembast.dart/blob/521b702104b71decda55bf594cd765b74c27153e/sembast/test/compat/xxtea_codec.dart#L65
//    // Initialize the encryption codec with a user password
//    var codec = getXXTeaSembastCodec(password: '[your_user_password]');
//
//    // Open the database with the codec
//    Database db = await factory.openDatabase(dbPath, codec: codec);
//
//    // ...your database is ready to use as encrypted
  }, skip: true);

  group('导入/导出Sembast数据库', () {
    setUp(() async => await dbFactory.openDatabase(dbPath));
    tearDown(() async {
      await db.clear();
      await db.close();
    });

    test('导入', () async {
//      db = await dbFactory.openDatabase(dbPath);
      // Our shop store sample data
      var store = intMapStoreFactory.store('shop');
      int lampKey, chairKey;
      await db.transaction((txn) async {
        // Add 2 records
        lampKey = await store.add(txn, {'name': 'Lamp', 'price': 10});
        chairKey = await store.add(txn, {'name': 'Chair', 'price': 15});
      });

      // update the price of the lamp record
      await store.record(lampKey).update(db, {'price': 12});

      var content = await exportDatabase(db);
      // Save as text
      var saved = jsonEncode(content);

      print(saved);
//      await db.clear();
    });

    test('导出', () async {
      String saved = r"""{
  "sembast_export": 1,
  "version": 1,
  "stores": [
    {
      "name": "shop",
      "keys": [
        1,
        2
      ],
      "values": [
        {
          "name": "Lamp",
          "price": 12
        },
        {
          "name": "Chair",
          "price": 15
        }
      ]
    }
  ]
}
      """;
      // Import the data
      var map = jsonDecode(saved) as Map;
      var importedDb = await importDatabase(map, dbFactory, 'imported.db');
//      db = await dbFactory.openDatabase(dbPath);

      var store = intMapStoreFactory.store('shop');
      int lampKey = 1;
      // Check the lamp price
      expect((await store.record(lampKey).get(importedDb))['price'], 12);

//      await db.clear();
    });
  });
}
