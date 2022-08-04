import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/database/transaction_db.dart';
import 'package:flutter_application_1/models/Transactions.dart';

class TransactionProvider with ChangeNotifier {
  // ตัวอย่างข้อมูล
  List<Transactions> transaction = [];

  //ดึงข้อมูล
  List<Transactions> getTransaction() {
    return transaction;
  }

  void intiDate() async {
    var db = TransactionDB(dbName: "transactions.db");
    //ดึงข้อมูลมาแสดงผล
    var snapR = await db.loadAllData();
    notifyListeners();
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    //บันทึำข้อมูล
    await db.InsertData(statement);

    //ดึงข้อมูลมาแสดงผล
    var snapR = await db.loadAllData();
    //ดึงที่ละแถว
    for (var record in snapR) {
      String d1 = record["date"] as String;
      var didate = DateTime.parse(d1);
      double a1 = record["amount"] as double;
      Transactions tranlist =
          Transactions(title: record["title"], amount: a1, date: didate);

      transaction.add(tranlist);
    }
    transaction;
    //แจ้งเตือน Consumer
    notifyListeners();
  }
}
