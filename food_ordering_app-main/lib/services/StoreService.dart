import 'dart:convert';
import 'dart:io';

import 'package:restaurant/http/host.dart';
import 'package:restaurant/model/StoreModel.dart';
import 'package:http/http.dart' as http;

Future<List<StoreModel>> get_Store() async {
  final String url = Host + "/api/store";
  final Response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  List jsonResponse = json.decode(Response.body);

  return jsonResponse.map((data) => new StoreModel.fromJson(data)).toList();
}

Future<String> add_Store(String idstore) async {
  try {
    final String Url = Host + "/api/store/add";
    final response = await http.post(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "idstore": idstore,
        "address": "",
        "image": "",
        "latitude": "",
        "longitude": "",
        "name": "",
        "open": "",
        "tel": "",
        "total_review": 0,
        "website": ""
      }),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}

Future<String> UploadImgStore(String token, File image) async {
  try {
    final String Url = Host + "/api/store/uploadimg/" + token;
    var request = http.MultipartRequest('POST', Uri.parse(Url));
    request.files.add(await http.MultipartFile.fromPath('img', image.path));
    request.headers.addAll({
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'multipart/form-data; charset=UTF-8',
    });
    request.send();

    return "อัพโหลดรูปภาพเรียบร้อย";
  } catch (e) {
    print(e);
  }
}
