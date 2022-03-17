import 'package:flutter/material.dart';
import 'package:restaurant/listrestaurant/HotelPage.dart';
import 'package:restaurant/theme/Style.dart';

class detail extends StatelessWidget {
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
  detail(
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
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(image == ""
                    ? "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png"
                    : image),
                fit: BoxFit.scaleDown),
          ),
        ),
        SizedBox(width: 10),
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
                "เวลา : " + open + "\nเบอร์โทร : " + tel,
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => hotelPage(
                    id,
                    address,
                    idstore,
                    image,
                    latitude,
                    longitude,
                    name,
                    open,
                    tel,
                    total_review,
                    website,
                    type,
                    iduser,
                    username),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: greenBtn),
            child: Text(
              idstore == iduser ? "แก้ไขข้อมูล" : "รายละเอียด",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }
}
