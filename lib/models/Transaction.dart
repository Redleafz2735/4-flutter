import 'package:flutter/foundation.dart';

class Transaction {
  String title; //ชื่อรายการ
  double amount; //จำนวนเงิน
  DateTime date; //วันที่ เวลา

  Transaction({required this.title, required this.amount, required this.date});
}
