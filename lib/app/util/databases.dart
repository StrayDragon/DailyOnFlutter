import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as Sqflite;

/// Get the database's path that is always a new database
Future<String> getDatabasePath(String dbName) async {
  var databasePath = await Sqflite.getDatabasesPath();
  // print(databasePath);
  String path = join(databasePath, dbName);

  // make sure the folder exists
  if (await Directory(dirname(path)).exists()) {
    await Sqflite.deleteDatabase(path);
  } else {
    try {
      await Directory(dirname(path)).create(recursive: true);
    } catch (e) {
      print(e);
    }
  }
  return path;
}

/// If `dbName` != null, will replace the db name with this `dbName`,
/// otherwise, the actual db name and asset db name are same.
/// You also can modify the default assets(resource) directory name
Future<Sqflite.Database> getAssetsDatabase(String assetDbName, [
  String dbName,
  String assetDirName = 'assets',
]) async {
  var databasesPath = await Sqflite.getDatabasesPath();
  String path = join(databasesPath, assetDbName);

  // delete existing if any
  await Sqflite.deleteDatabase(path);

  // Make sure the parent directory exists
  try {
    await Directory(dirname(path)).create(recursive: true);
  } catch (_) {}

  // Copy from asset
  ByteData data =
  await rootBundle.load(join(assetDirName, dbName ?? assetDbName));
  List<int> bytes =
  data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

  // Write and flush the bytes written
  await File(path).writeAsBytes(bytes, flush: true);

  // return opened database handler
  return await Sqflite.openDatabase(path);
}
