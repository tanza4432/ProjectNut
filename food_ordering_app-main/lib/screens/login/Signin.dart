// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:restaurant/component/WillPop.dart';
import 'package:restaurant/dashboard_1.dart';
import 'package:restaurant/screens/login/Signup.dart';

import '../../component/loading.dart';
import '../../controllers/LoginController.dart';
import '../../model/LoginModel.dart';
import '../../theme/Style.dart';

class SignInScreen extends StatefulWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  SignInScreen({Key key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? LoadingDoubleBounce()
        : Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/login.png"), fit: BoxFit.cover),
            ),
            child: WillPopScope(
              onWillPop: onWillPop,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: [
                    Container(),
                    Container(
                      padding: EdgeInsets.only(left: 35, top: 130),
                      child: Text(
                        'Welcome\nBack',
                        style: TextStyle(color: Colors.white, fontSize: 33),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(15),
                                    child: TextField(
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      controller: widget.email,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.black),
                                        ),
                                        icon: Icon(
                                          Icons.alternate_email,
                                          color: kPrimaryColor,
                                        ),
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(15),
                                    child: TextField(
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      controller: widget.password,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.black),
                                        ),
                                        icon: Icon(
                                          Icons.lock,
                                          color: kPrimaryColor,
                                        ),
                                        labelText: 'Password',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        hintText: 'Enter Password',
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 300),
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Color(0xff4c505b),
                                        child: IconButton(
                                          color: Colors.white,
                                          onPressed: () {
                                            setState(() {
                                              widget.isLoading = true;
                                            });
                                            LoginController(
                                                context,
                                                widget.email.text,
                                                widget.password.text,
                                                setState,
                                                widget.isLoading);
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(width: 50),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignupScreen()),
                                          );
                                        },
                                        child: Text(
                                          'Sign Up',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Color(0xff4c505b),
                                              fontSize: 18),
                                        ),
                                        style: ButtonStyle(),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Forgot Password',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color(0xff4c505b),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyHomePage(
                                                        "none", "Guest user", "")),
                                          );
                                        },
                                        child: Text(
                                          '????????????',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Color.fromARGB(
                                                255, 86, 127, 240),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 30),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
