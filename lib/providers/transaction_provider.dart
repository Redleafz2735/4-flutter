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

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbName: "transactions.db");
    //บันทึำข้อมูล
    await db.InsertData(statement);
    transaction.insert(0, statement);
    //แจ้งเตือน Consumer
    notifyListeners();
  }
}
