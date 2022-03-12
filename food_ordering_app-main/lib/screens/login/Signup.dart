// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:restaurant/component/WillPop.dart';
import 'package:restaurant/screens/login/Signin.dart';
import 'package:restaurant/theme/Style.dart';

import '../../controllers/LoginController.dart';

enum BestTutorSite { user, employer }

class SignupScreen extends StatefulWidget {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController passwordconfirm = new TextEditingController();
  TextEditingController tel = new TextEditingController();
  BestTutorSite _site = BestTutorSite.user;

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/register.png"), fit: BoxFit.cover),
      ),
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              SizedBox(height: 200),
              Container(
                padding: EdgeInsets.only(left: 35, top: 130),
                child: Text(
                  'Create\nAccount',
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            buttonRegister(
                                "Full Name", Icons.person, widget.name),
                            SizedBox(
                              height: 20,
                            ),
                            buttonRegister(
                                "Email", Icons.alternate_email, widget.email),
                            SizedBox(
                              height: 20,
                            ),
                            buttonRegisterPassword(
                                "Password", Icons.lock, widget.password),
                            SizedBox(
                              height: 20,
                            ),
                            buttonRegisterPassword("Password Confirm",
                                Icons.lock, widget.passwordconfirm),
                            SizedBox(
                              height: 20,
                            ),
                            buttonRegister(
                                "Tel", Icons.alternate_email, widget.tel),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 50.0),
                              child: ListTile(
                                title: const Text(
                                  'นักรีวิว',
                                  style: TextStyle(color: Colors.black),
                                ),
                                leading: Radio(
                                  value: BestTutorSite.user,
                                  groupValue: widget._site,
                                  onChanged: (BestTutorSite value) {
                                    setState(() {
                                      widget._site = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 50.0),
                              child: ListTile(
                                title: const Text(
                                  'เจ้าของร้าน',
                                  style: TextStyle(color: Colors.black),
                                ),
                                leading: Radio(
                                  value: BestTutorSite.employer,
                                  groupValue: widget._site,
                                  onChanged: (BestTutorSite value) {
                                    setState(() {
                                      widget._site = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 39),
                                Expanded(
                                  child: Container(
                                    // ignore: deprecated_member_use
                                    child: RaisedButton(
                                      onPressed: () {
                                        if (widget.name.text != "") {
                                          if (widget.email.text.contains("@")) {
                                            if (widget.password.text.length >=
                                                8) {
                                              if (widget.password.text ==
                                                  widget.passwordconfirm.text) {
                                                if (widget.tel.text.length ==
                                                    10) {
                                                  RegisterController(
                                                      context,
                                                      widget.email.text,
                                                      widget.name.text,
                                                      widget.password.text,
                                                      widget.tel.text,
                                                      widget._site);
                                                } else {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            "กรุณากรอกเบอร์โทรศัพท์ให้ถูกต้อง"),
                                                        actions: [
                                                          FlatButton(
                                                            child: Text("ตกลง"),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  );
                                                }
                                              } else {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          "รหัสผ่านไม่ตรงกัน"),
                                                      actions: [
                                                        FlatButton(
                                                          child: Text("ตกลง"),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              }
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "รหัสผ่านต้องมีความยาวอย่างน้อย 8 ตัว"),
                                                    actions: [
                                                      FlatButton(
                                                        child: Text("ตกลง"),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      )
                                                    ],
                                                  );
                                                },
                                              );
                                            }
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title:
                                                      Text("อีเมลไม่ถูกต้อง"),
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
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "กรุณากรอกข้อมูลให้ครบถ้วน"),
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
                                      },
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              children: [
                                SizedBox(width: 51),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInScreen()),
                                    );
                                  },
                                  child: Text(
                                    'Sign In',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                  style: ButtonStyle(),
                                ),
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

class buttonRegister extends StatelessWidget {
  buttonRegister(this.text, this.icon, this.typeController);
  String text;
  var icon;
  TextEditingController typeController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.black,
      ),
      controller: typeController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        icon: Icon(
          icon,
          color: kPrimaryColor,
        ),
        labelText: text,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}

class buttonRegisterPassword extends StatelessWidget {
  buttonRegisterPassword(this.text, this.icon, this.typeController);
  String text;
  var icon;
  TextEditingController typeController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.black,
      ),
      controller: typeController,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black),
        ),
        icon: Icon(
          icon,
          color: kPrimaryColor,
        ),
        labelText: text,
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
