import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  static AppDatabase get instance => _instance;

  AppDatabase._();
  static final AppDatabase _instance = AppDatabase._();
  Completer<Database> _dbOpenCompleter;

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();

      _openDatabase();
    }
    return _dbOpenCompleter.future;
  }

  Future _openDatabase() async {
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    final dbPath = join(appDocumentsDir.path, 'DailyApp.db');
    final database = await databaseFactoryIo.openDatabase(dbPath);

    _dbOpenCompleter.complete(database);
  }
}

class ExampleModelDao {
  static const String EXAMPLE_MODEL_STORE_NAME = 'example_model';

  final _exampleModelStore = intMapStoreFactory.store(EXAMPLE_MODEL_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(ExampleModel model) async =>
      await _exampleModelStore.add(await _db, model.toMap());

  Future update(ExampleModel model) async {
    final finder = Finder(filter: Filter.byKey(model.id));
    await _exampleModelStore.update(
      await _db,
      model.toMap(),
      finder: finder,
    );
  }

  Future delete(ExampleModel model) async {
    final finder = Finder(filter: Filter.byKey(model.id));
    await _exampleModelStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<ExampleModel>> getAllExampleModels() async {
    final finder = Finder(
      sortOrders: [SortOrder('name')],
    );

    final recordSnapshot = await _exampleModelStore.find(
      await _db,
      finder: finder,
    );

    return recordSnapshot.map((snapshot) {
      final model = ExampleModel.fromMap(snapshot.value);
      model.id = snapshot.key;
      return model;
    }).toList();
  }
}

class ExampleModel {
  int id;

  Map<String, dynamic> toMap() {
    return {"test": "asd"};
  }

  static ExampleModel fromMap(Map<String, dynamic> value) {
    return ExampleModel();
  }
}
