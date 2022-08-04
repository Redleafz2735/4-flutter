import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Transactions.dart';
import 'package:flutter_application_1/providers/transaction_provider.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:provider/provider.dart';

class Fromscreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();

  // contoller
  final titleController = TextEditingController(); // รับค่าชื่อรายการ
  final amountController = TextEditingController(); //รับตัวเลขจำนวนเงิน
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("แบบฟอร์มบันทึกข้อมูล"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "ชื่อรายการ"),
                  autofocus: false,
                  controller: titleController,
                  validator: (var str) {
                    //ชือ่รายการเป็นค่่าว่าง
                    if (str!.isEmpty) {
                      return "กรุณาป้อนชื่อรายการ";
                    }
                    return null;
                  },
                ),
                TextFormField(
                    decoration: new InputDecoration(labelText: "จำนวนเงิน"),
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    validator: (var str) {
                      //ชือ่รายการเป็นค่่าว่าง
                      if (str!.isEmpty) {
                        return "กรุณาป้อนจำนวนเงิน";
                      }
                      if (double.parse(str) <= 0) {
                        return "กรุณาระบุจำนวนเงินมากกว่า 0";
                      }
                      return null;
                    }),
                FlatButton(
                  child: Text("เพิ่มข้อมูล"),
                  color: Colors.purple,
                  textColor: Colors.white,
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      var title = titleController.text;
                      var amount = amountController.text;
                      // เตรียมข้อมูล
                      Transactions statement = Transactions(
                          title: title,
                          amount: double.parse(amount),
                          date: DateTime.now()); //pbject

                      // เรียก Provider
                      var provider = Provider.of<TransactionProvider>(context,
                          listen: false);
                      provider.addTransaction(statement);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                        //กลับHome
                      }));
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
