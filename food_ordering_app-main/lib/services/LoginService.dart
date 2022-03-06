import 'dart:convert';

import 'package:crypto/crypto.dart';

import '../http/host.dart';
import 'package:http/http.dart' as http;

import '../model/LoginModel.dart';

Future<LoginModel> Login(String email, String password) async {
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