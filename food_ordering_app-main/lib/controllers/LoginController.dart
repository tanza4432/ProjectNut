// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:restaurant/dashboard_1.dart';
import 'package:restaurant/screens/employer/Addshop.dart';

import '../dashboard.dart';
import '../model/LoginModel.dart';
import '../screens/login/Signin.dart';
import '../screens/login/Signup.dart';
import '../services/LoginService.dart';

Future<LoginModel> LoginController(
    BuildContext context, String email, String password) async {
  final response = await LoginService(email, password);
  if (response.type != "none") {
    switch (response.type) {
      case "user":
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(response.type, response.name),
          ),
        );
        break;
      default:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EmployerPage(),
          ),
        );
        break;
    }
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("บัญชีผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง"),
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
  return response;
}

Future<void> RegisterController(BuildContext context, String email, String name,
    String password, String tel, BestTutorSite type) async {
  final response = await RegisterService(email, name, password, tel, type);
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
