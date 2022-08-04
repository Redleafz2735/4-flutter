import 'dart:html';

import 'package:flutter_application_1/models/Transactions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  //ฐานช้อมูล

  String dbName; //เก็บฐานข้อมูล

  // ถ้ายังไม่สร้างให้สร้าง ท้าสร้างแล้วให้เปิด
  TransactionDB({required this.dbName});

  Future<Database> openDatabese() async {
    //หาตำแหน่ง
    var appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    // สร้างdatabase
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  //บันทึกข้อมูล
  InsertData(Transactions statement) async {
    //ฐานข้อมูล => store
    var db = await this.openDatabese();
    var store = intMapStoreFactory.store("expense");

    //json ข้อมูล
    store.add(db, {
      "title": statement.title,
      "amount": statement.amount,
      "date": statement.date
    });
  }
}
