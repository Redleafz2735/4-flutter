import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/Transaction.dart';

class TransactionProvider with ChangeNotifier {
  // ตัวอย่างข้อมูล
  List<Transaction> transaction = [];

  //ดึงข้อมูล
  List<Transaction> getTransaction() {
    return transaction;
  }

  addTransaction(Transaction statment) {
    transaction.insert(0, statment);
    //แจ้งเตือน Consumer
    notifyListeners();
  }
}
