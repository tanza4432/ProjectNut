import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:restaurant/component/WillPop.dart';
import 'package:restaurant/dashboard.dart';
import 'package:restaurant/dashboard_1.dart';
import 'package:restaurant/listrestaurant/detailReview/detailReview.dart';
import 'package:restaurant/screens/employer/Addshop.dart';
import 'package:restaurant/screens/map/map.dart';
import 'package:restaurant/theme/Style.dart';

class hotelPage extends StatefulWidget {
  final id;
  final address;
  final idstore;
  final image;
  final latitude;
  final longitude;
  final name;
  final open;
  final tel;
  final total_review;
  final website;
  final type;
  final iduser;
  final username;
  hotelPage(
      this.id,
      this.address,
      this.idstore,
      this.image,
      this.latitude,
      this.longitude,
      this.name,
      this.open,
      this.tel,
      this.total_review,
      this.website,
      this.type,
      this.iduser,
      this.username);
  @override
  _hotelPageState createState() => _hotelPageState();
}

class _hotelPageState extends State<hotelPage> {
  final List<String> imageList = [
    "https://phetchabun.org/wp-content/uploads/2018/08/2.jpg",
    "https://phetchabun.org/wp-content/uploads/2018/08/5.jpg",
    "https://lh5.googleusercontent.com/p/AF1QipNYPfEKXyP4v9iFlmcQY45FM_zt-YgnsJ-SW9Fn=w1080-k-no",
    "https://phetchabun.org/wp-content/uploads/2018/08/4.jpg",
  ];

  final List<String> reviewimg = [
    "https://www.paiduaykan.com/travel/wp-content/uploads/2020/10/44-SON00466.jpg",
    "https://img.wongnai.com/p/256x256/2019/10/16/c49384e7bdae41a1bce9c21ddd4109a7.jpg",
    "https://www.paiduaykan.com/travel/wp-content/uploads/2020/10/45.jpg",
    "https://img.wongnai.com/p/400x0/2020/01/12/3d0f3bc4a62345ff9b71d2f7d8feb734.jpg",
    "https://img.freepik.com/free-photo/back-view-young-woman-traveller-sitting-enjoying-view-pino-late-coffee-shop-khao-kho-phetchabun-thailand_29285-2327.jpg",
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
                              image: NetworkImage(widget.image == ""
                                  ? "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png"
                                  : widget.image),
                              fit: BoxFit.scaleDown),
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
                                      builder: (context) => MyHomePage(
                                          widget.type,
                                          widget.username,
                                          widget.iduser),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  children: [
                                    widget.idstore == widget.iduser ?  IconButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EmployerPage(
                                                widget.id,
                                                widget.address,
                                                widget.idstore,
                                                widget.image,
                                                widget.latitude,
                                                widget.longitude,
                                                widget.name,
                                                widget.open,
                                                widget.tel,
                                                widget.total_review,
                                                widget.website,
                                                widget.type,
                                                widget.iduser,
                                                widget.username),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ) : Container(),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => MapShow(
                                                  widget.type,
                                                  widget.username,
                                                  widget.iduser),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.fmd_good_outlined,
                                          size: 35,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
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
                                    widget.name,
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
                                "???????????????????????????????????????",
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
                          placesWidget(widget.name, widget.tel, widget.address,
                              widget.open, widget.website),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "?????????????????????????????????",
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
                                "???????????????",
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
                                  detailReview(),
                                  detailReview(),
                                  detailReview(),
                                  detailReview(),
                                  detailReview()
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

  Padding placesWidget(
      String name, String tel, String address, String time, String web) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "?????????????????? : " + tel,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "????????????????????????????????? : " + address,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "???????????? ????????????-????????? : " + time,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text("???????????????????????? : " + web,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
