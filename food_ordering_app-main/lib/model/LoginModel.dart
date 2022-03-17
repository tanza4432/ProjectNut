// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.type,
        this.name,
        this.id
    });

    String type;
    String name;
    String id;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        type: json["type"],
        name: json["name"],
        id: json["id"]
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "id": id
    };
}
