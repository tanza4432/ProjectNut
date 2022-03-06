// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    RegisterModel({
        this.email,
        this.idStore,
        this.name,
        this.password,
        this.type,
        this.tel
    });

    String email;
    String idStore;
    String name;
    String password;
    String type;
    String tel;

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        email: json["email"],
        idStore: json["id_store"],
        name: json["name"],
        password: json["password"],
        type: json["type"],
        tel: json["tel"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "id_store": idStore,
        "name": name,
        "password": password,
        "type": type,
        "tel": tel,
    };
}
