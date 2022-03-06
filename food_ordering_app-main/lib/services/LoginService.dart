import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../http/host.dart';
import 'package:http/http.dart' as http;

import '../model/LoginModel.dart';

Future<LoginModel> LoginService(String email, String password) async {
  String passwordHash = md5.convert(utf8.encode(password)).toString();
  final String url = Host + "/api/account/" + email + "/" + passwordHash;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return LoginModel.fromJson(jsonDecode(response.body));
}

Future<String> RegisterService(
    String email, String name, String password, String tel) async {
  try {
    print(email);
    print(name);
    print(password);
    print(tel);
    final String passwordHash = md5.convert(utf8.encode(password)).toString();
    final String Url = Host + "/api/account/";
    final response = await http.post(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "id_store": email,
        "name": name,
        "password": passwordHash,
        "type": "user",
        "tel": tel,
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
