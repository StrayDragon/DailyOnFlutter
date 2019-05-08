import 'dart:async';

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
