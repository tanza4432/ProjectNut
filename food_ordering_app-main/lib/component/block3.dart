import 'package:flutter/material.dart';
import 'package:restaurant/theme/Style.dart';

class block3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: 165,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: black,
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 0,
                      offset: Offset(0, 10),
                      blurRadius: 0,
                      color: black.withOpacity(0.4))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/food3.png"))),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Prato Sushi",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 14,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.white,
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
