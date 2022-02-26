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
                            ],
                          ),
                          SizedBox(
                            height: 200,
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
                                "Today's Special",
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
                          placesWidget("food1", "Sushi Platter"),
                          SizedBox(
                            height: 20,
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

  Row placesWidget(String img, String name) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage("asset/images/$img.png"))),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.orange,
                  ),
                ],
              ),
              Text(
                "Lorem ipsum sits dolar amet is for publishing",
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ],
    );
  }
}
