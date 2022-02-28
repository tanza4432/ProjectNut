import 'package:flutter/material.dart';
import 'package:restaurant/component/WillPop.dart';
import 'package:restaurant/screens/login/Signin.dart';
import 'package:restaurant/theme/Style.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController passwordconfirm = new TextEditingController();
  TextEditingController tel = new TextEditingController();

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
                                "Email", Icons.alternate_email, email),
                            SizedBox(
                              height: 20,
                            ),
                            buttonRegisterPassword(
                                "Password", Icons.lock, password),
                            SizedBox(
                              height: 20,
                            ),
                            buttonRegisterPassword("Password Confirm",
                                Icons.lock, passwordconfirm),
                            SizedBox(
                              height: 20,
                            ),
                            buttonRegister(
                                "Tel", Icons.alternate_email, tel),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(width: 275),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xff4c505b),
                                  child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      print(email.text);
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
  buttonRegister(this.text, this.icon, typeController);
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
  buttonRegisterPassword(this.text, this.icon, typeController);
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
