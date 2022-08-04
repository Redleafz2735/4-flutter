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

  void addTransaction(Transactions statment) async {
    var db = TransactionDB(dbName: "transaction.db").openDatabese();
    print(db);
    transaction.insert(0, statment);
    //แจ้งเตือน Consumer
    notifyListeners();
  }
}
