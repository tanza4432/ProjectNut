import 'package:flutter/material.dart';
import 'package:restaurant/component/WillPop.dart';
import 'package:restaurant/component/block1.dart';
import 'package:restaurant/component/block2.dart';
import 'package:restaurant/component/block3.dart';
import 'package:restaurant/component/detail.dart';
import 'package:restaurant/screens/login/Signin.dart';

class MyHomePage extends StatefulWidget {
  final type;
  final name;
  MyHomePage(this.type, this.name);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "รวมร้านอาหาร",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      widget.type == "none"
                          ? Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignInScreen(),
                                    ),
                                  );
                                },
                                child: Text("เข้าสู่ระบบ"),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("บัญชี: " + widget.name),
                                        actions: [
                                          FlatButton(
                                            child: Text("ตกลง"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.account_circle,
                                  color: Colors.white,
                                  size: 45,
                                ),
                              ),
                            )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "จังหวัดเพชรบูรณ์ อำเภอน้ำหนาว",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 20),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        block1(),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            block2(),
                            SizedBox(
                              height: 20,
                            ),
                            block3(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "รายการร้านอาหาร",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  deatil(
                    "hotel1",
                    "ร้านคอฟฟี่วิว น้ำหนาว จ. เพชรบูรณ์",
                    widget.type,
                    widget.name,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  deatil(
                    "hotel2",
                    "ลิตเติ้ลวินเทอร์คาเฟ่",
                    widget.type,
                    widget.name,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  deatil(
                    "hotel3",
                    "Coffee View Phetchabun",
                    widget.type,
                    widget.name,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
