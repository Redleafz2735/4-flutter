import 'package:flutter/material.dart';

class Fromscreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
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
                  autofocus: true,
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
                      Navigator.pop(context);
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
