import 'package:flutter/material.dart';
import 'package:restaurant/theme/Style.dart';

class block1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width * 0.55,
        height: 350,
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: blue,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0,
                  offset: Offset(0, 10),
                  blurRadius: 0,
                  color: blue.withOpacity(0.4))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/images/food1.png"))),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Yoshimasa Sushi",
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 17,
                ),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 17,
                ),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 17,
                ),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 17,
                ),
                Icon(
                  Icons.star,
                  color: Colors.white,
                  size: 17,
                ),
                Text(
                  " 250 Ratings",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Lorem ipsum is a dummy text used for printing",
              style: TextStyle(color: Colors.white, fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
