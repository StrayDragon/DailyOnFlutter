import 'dart:async';

import 'package:daily/app/backend/database.dart';
import 'package:sembast/sembast.dart';

class ExampleModelDao {
  static const String EXAMPLE_MODEL_STORE_NAME = 'example_model';

  final _exampleModelStore = intMapStoreFactory.store(EXAMPLE_MODEL_STORE_NAME);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(ExampleModel model) async =>
      await _exampleModelStore.add(await _db, model.toMap());

  Future update(ExampleModel model) async {
    await _exampleModelStore.update(
      await _db,
      model.toMap(),
      finder: Finder(
        filter: Filter.byKey(model.id),
      ),
    );
  }

  Future delete(ExampleModel model) async {
    await _exampleModelStore.delete(
      await _db,
      finder: Finder(
        filter: Filter.byKey(model.id),
      ),
    );
  }

  Future<List<ExampleModel>> getAllExampleModels() async {
    final recordSnapshot = await _exampleModelStore.find(
      await _db,
      finder: Finder(
        sortOrders: [SortOrder('name')],
      ),
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

  ExampleModel();

  factory ExampleModel.fromMap(Map<String, dynamic> value) {
    return ExampleModel();
  }
}
