import 'package:flutter/foundation.dart';

class Transactions {
  String title; //ชื่อรายการ
  double amount; //จำนวนเงิน
  DateTime date; //วันที่ เวลา

  Transactions({required this.title, required this.amount, required this.date});
}
