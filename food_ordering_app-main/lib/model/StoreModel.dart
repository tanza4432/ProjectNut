import 'dart:convert';

StoreModel storeModelFromJson(String str) => StoreModel.fromJson(json.decode(str));

String storeModelToJson(StoreModel data) => json.encode(data.toJson());

class StoreModel {
    StoreModel({
        this.id,
        this.address,
        this.idstore,
        this.image,
        this.latitude,
        this.longitude,
        this.name,
        this.open,
        this.tel,
        this.totalReview,
        this.website,
    });

    String id;
    String address;
    String idstore;
    String image;
    String latitude;
    String longitude;
    String name;
    String open;
    String tel;
    int totalReview;
    String website;

    factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        id: json["id"],
        address: json["address"],
        idstore: json["idstore"],
        image: json["image"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        name: json["name"],
        open: json["open"],
        tel: json["tel"],
        totalReview: json["total_review"],
        website: json["website"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "idstore": idstore,
        "image": image,
        "latitude": latitude,
        "longitude": longitude,
        "name": name,
        "open": open,
        "tel": tel,
        "total_review": totalReview,
        "website": website,
    };
}

class ImageModel {
  String link;
  ImageModel({this.link});
  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        link: json["link"] == null ? null : json["link"],
      );

  Map<String, dynamic> toJson() => {
        "link": link == null ? null : link,
      };
}