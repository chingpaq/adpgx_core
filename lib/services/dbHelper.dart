import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/services.dart' show rootBundle;
import '../constants.dart';

class DBHelper with ChangeNotifier {
  bool isDBReady = false;
  sql.Database db;
  SharedPreferences prefs;
  String testString = 'Old String';

  DBHelper() {
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
    final dbPath = await sql.getDatabasesPath();
    db = await sql.openDatabase(
      path.join(dbPath, kDbName),
      onCreate: (db, version) async {
        String script = await rootBundle.loadString(kSqlScriptAssets);
        List<String> scripts = script.split(";");
        scripts.forEach((v) async{
          if (v.isNotEmpty) {
            print(v.trim());
            await db.execute(v.trim());
          }
        });
      },
      version: 1,
    );

    //createMissingTablesFromScript();

    isDBReady = true;
    notifyListeners();
  }
  void testNotifier(){
    testString = 'New String changed by Provider';
    notifyListeners();
  }

  Future<void> createMissingTablesFromScript() async {
    String script = await rootBundle.loadString(kSqlScriptAssets);
    List<String> scripts = script.split(";");
    scripts.forEach((v) {
      if (v.isNotEmpty) {
        print(v.trim());
        db.execute(v.trim());
      }
    });
  }

  Future<void> insert(String table, Map<String, Object> data) async {
    try {
      await db.insert(table, data,
          conflictAlgorithm: sql.ConflictAlgorithm.replace);
      notifyListeners();
    }catch(e){
      print(e);
    }

  }

  Future<void> batchInsert(String table, List<Map<String, Object>> data) async {

    var batch = db.batch();
    data.forEach((element) async{
      try {
        batch.insert(table, element,
            conflictAlgorithm: sql.ConflictAlgorithm.replace);
      }catch(e){
        print(e);
      }
    });

    try{
      await batch.commit();
    }catch(e){
      print(e);
    }

    notifyListeners();

  }
  Future<void> batchUpdate({@required String table, @required List<Map<String, Object>> list}) async {

    var batch = db.batch();
    list.forEach((data) async{
      try {
        batch.update(table, data['values'],where: data['conditions'], whereArgs: data['conditionsArgument'],
            conflictAlgorithm: sql.ConflictAlgorithm.replace);
      }catch(e){
        print(e);
      }
    });

    try{
      await batch.commit();
    }catch(e){
      print(e);
    }

    notifyListeners();

  }
  Future<void> update(String table, Map<String, Object> data) async {
    try {
      await db.update(
          table, data['values'], where: data['conditions'], whereArgs: data['conditionsArgument']);
    }catch (e){
      print(e);
    }
  }

  Future<void> delete(String table, Map<String, Object> data) async {
    try {
      await db.delete(table, where: data['conditions'], whereArgs: data['conditionsArgument']);
    }catch (e){
      print(e);
    }
  }

  Future<void> deleteTable(String table) async {
    try {
      await db.delete(table);
    }catch (e){
      print(e);
    }
  }

  Future<List<dynamic>> getData(String table) async {
    List<Map<String, dynamic>> maps;
    try {
      maps = await db.query(table);
    }catch(e){
      print(e);
    }
    return maps;
  }

  Future<List<dynamic>> getDataFrom(String table,
      {@required String where, @required List<dynamic> whereArguments}) async {
    List<Map<String, dynamic>> maps;
    try {
      maps = await db.query(
        table,
        where: where,
        whereArgs: whereArguments,
      );
    } on Exception catch (e){
      print(e);
    }
    return maps;
  }

  Future<List<Map>> rawQueryFromTable(String rawQuery) async {
    List<Map> maps;
    try {
      maps = await db.rawQuery(rawQuery);
    } on Exception catch (e){
      print(e);
    }
    return maps;
  }

}