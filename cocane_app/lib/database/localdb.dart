import 'package:sqflite/sqflite.dart';

void saveLocal() async {
  // Database database = await openDatabase(db.path, version: 1,
  //     onCreate: (Database db, int version) async {
  // await db.execute(
  //     'CREATE TABLE LOCALREPORT (id INTEGER PRIMARY KEY, filename TEXT, timestamp REAL)');
  // });

  // var res = await db.rawInsert(
  //     'INSERT INTO LOCALREPORT(id,filename, timestamp) VALUES(89,"Rob", 23)');

  // await db.transaction((txn) async {
  //   int id1 = await txn.rawInsert(
  //       'INSERT INTO LOCALREPORT(id, filename, timestamp) VALUES("some name", "1234", 456.789)');
  //   print('inserted1: $id1');
  // });
}

void insertToDB(int id, String filename, double timestamp) async {
  Database db = await openDatabase('cocane.db');
  var res = await db.rawInsert(
      'INSERT INTO LOCALREPORT(id,filename, timestamp) VALUES($id,$filename, $timestamp)');
  await db.close();
}

void showAllFiles() async {
  Database db = await openDatabase('cocane.db');
  var res = await db.rawQuery('SELECT * FROM LOCALREPORT');
  print(res);
  await db.close();
}

void deleteFiles(int id) async {
  Database db = await openDatabase('cocane.db');
  var res = await db
    ..rawDelete('DELETE FROM LOCALREPORT WHERE id = ?', [id]);
  print(res);
  await db.close();
}
