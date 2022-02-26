import 'package:flutter/material.dart';
import 'package:restaurant/component/WillPop.dart';
import 'package:restaurant/dashboard.dart';
import 'package:restaurant/theme/Style.dart';

class hotelPage extends StatefulWidget {
  @override
  _hotelPageState createState() => _hotelPageState();
}

class _hotelPageState extends State<hotelPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: blue,
                          image: DecorationImage(
                              image: AssetImage("asset/images/hotelBig.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyHomePage(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: IconButton(
                                    onPressed: () {
                                      // Navigator.pushReplacement(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => MyHomePage(),
                                      //   ),
                                      // );
                                    },
                                    icon: Icon(
                                      Icons.fmd_good_outlined,
                                      size: 35,
                                      color: Colors.white,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Yoshimasa Sushi",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        " 250 Reviews",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Lorem ipsum dolar sits amet is used in print industry",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "ข้อมูลทางร้าน",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
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
                            height: 10,
                          ),
                          placesWidget("food1", "Sushi Platter"),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "รีวิว",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
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
                          Container(
                            height: 200,
                            color: Colors.black,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.0, color: Colors.blue),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                'รีวิวทั้งหมด',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding placesWidget(String img, String name) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ร้าน : 97’ Cafe",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "ติดต่อ : 088-888-8888",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "สถานที่ตั้ง : 452 ตำบล วังกวาง อำเภอ น้ำหนาว เพชรบูรณ์ 67260",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        )
        // Container(
        //   height: 100,
        //   width: 100,

        // ),
        ,
      ),
    );
  }
}
