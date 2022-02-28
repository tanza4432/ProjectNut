import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class detailReview extends StatefulWidget {
  @override
  State<detailReview> createState() => _detailReviewState();
}

class _detailReviewState extends State<detailReview> {

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
    return Container(
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 1.5,
        ),
      )),
      width: 380,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 24,
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
                  style: TextStyle(color: Colors.white, fontSize: 13),
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
              CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                ),
                items: reviewimg
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
          ],
        ),
      ),
    );
  }
}
