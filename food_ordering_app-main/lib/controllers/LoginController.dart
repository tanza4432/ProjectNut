// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../model/LoginModel.dart';
import '../screens/login/Signin.dart';
import '../services/LoginService.dart';

Future<LoginModel> LoginController(String email, String password) async {
  final response = await LoginService(email, password);
  return response;
}

Future<void> RegisterController(BuildContext context, String email, String name,
    String password, String tel) async {
  final response = await RegisterService(email, name, password, tel);
  // print("===============>" + response);
  if (response == "true") {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("สมัครสมาชิกเรียบร้อย"),
          actions: [
            FlatButton(
              child: Text("ตกลง"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
            )
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("สมัครสมาชิกไม่สำเร็จ"),
          actions: [
            FlatButton(
              child: Text("ตกลง"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
