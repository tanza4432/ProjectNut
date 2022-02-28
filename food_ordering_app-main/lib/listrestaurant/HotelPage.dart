import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:restaurant/component/WillPop.dart';
import 'package:restaurant/dashboard.dart';
import 'package:restaurant/screens/map/map.dart';
import 'package:restaurant/theme/Style.dart';

class hotelPage extends StatefulWidget {
  hotelPage(this.name);
  String name;
  @override
  _hotelPageState createState() => _hotelPageState(name);
}

class _hotelPageState extends State<hotelPage> {
  _hotelPageState(this.name);
  String name;

  final List<String> imageList = [
    "https://phetchabun.org/wp-content/uploads/2018/08/2.jpg",
    "https://phetchabun.org/wp-content/uploads/2018/08/5.jpg",
    "https://lh5.googleusercontent.com/p/AF1QipNYPfEKXyP4v9iFlmcQY45FM_zt-YgnsJ-SW9Fn=w1080-k-no",
    "https://phetchabun.org/wp-content/uploads/2018/08/4.jpg",
  ];

  List img = [
    "https://user-images.githubusercontent.com/26750131/48912712-52415400-ee44-11e8-9994-5054dabd0ab2.png"
        "https://user-images.githubusercontent.com/26750131/48912712-52415400-ee44-11e8-9994-5054dabd0ab2.png"
        "https://user-images.githubusercontent.com/26750131/48912712-52415400-ee44-11e8-9994-5054dabd0ab2.png"
        "https://user-images.githubusercontent.com/26750131/48912712-52415400-ee44-11e8-9994-5054dabd0ab2.png"
        "https://user-images.githubusercontent.com/26750131/48912712-52415400-ee44-11e8-9994-5054dabd0ab2.png"
        "https://user-images.githubusercontent.com/26750131/48912712-52415400-ee44-11e8-9994-5054dabd0ab2.png"
  ];
  bool isVisible = false;

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
                              image: AssetImage("assets/images/hotelBig.png"),
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
                                    setState(() {
                                      isVisible = false;
                                    });
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
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MapShow(),
                                        ),
                                      );
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
                                    name,
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
                          placesWidget("food1", name),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "ภาพบรรยากาศ",
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
                          CarouselSlider(
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlay: true,
                            ),
                            items: imageList
                                .map((e) => ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: <Widget>[
                                          Image.network(
                                            e,
                                            width: 1050,
                                            height: 350,
                                            fit: BoxFit.cover,
                                          )
                                        ],
                                      ),
                                    ))
                                .toList(),
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
                            height: 260,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.black,
                                    width: 380,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons
                                                        .account_circle_rounded,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text("User01")
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
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
                                                    color: Colors.white,
                                                    fontSize: 13),
                                              )
                                            ],
                                          ),
                                          Text(
                                              "ดกเ่สกด่เสกาด่เสากด่เสากด่เสากด่เสาก่ดเสากด่เsdfssdf sdfsdfsdf"),
                                          SizedBox(height: 24.0),
                                          if (!isVisible)
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  isVisible = !isVisible;
                                                });
                                              },
                                              child: Container(
                                                child: Text("ดูรูปภาพ"),
                                              ),
                                            ),
                                          SizedBox(height: 24.0),
                                          if (isVisible)
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  "https://user-images.githubusercontent.com/26750131/48912712-52415400-ee44-11e8-9994-5054dabd0ab2.png",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          // Expanded(
                                          //   child: Padding(
                                          //     padding: EdgeInsets.symmetric(
                                          //         vertical: 18.0),
                                          //     child: StaggeredGridView
                                          //         .countBuilder(
                                          //       crossAxisCount: 2,
                                          //       crossAxisSpacing: 12,
                                          //       mainAxisSpacing: 12,
                                          //       itemCount: img.length,
                                          //       itemBuilder: (context, index) {
                                          //         return Container(
                                          //           decoration: BoxDecoration(
                                          //             color: Colors.transparent,
                                          //             borderRadius:
                                          //                 BorderRadius.circular(
                                          //                     8.0),
                                          //           ),
                                          //           child: ClipRRect(
                                          //             borderRadius:
                                          //                 BorderRadius.circular(
                                          //                     8.0),
                                          //             child: Image.network(
                                          //               img[index],
                                          //               fit: BoxFit.fill,
                                          //             ),
                                          //           ),
                                          //         );
                                          //       },
                                          //       staggeredTileBuilder: (index) {
                                          //         return new StaggeredTile
                                          //                 .count(1,
                                          //             index.isEven ? 1.2 : 2);
                                          //       },
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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

  Padding placesWidget(String img, String name) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
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
