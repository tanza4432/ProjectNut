import 'package:flutter/material.dart';
import 'package:restaurant/component/WillPop.dart';
import 'package:restaurant/dashboard.dart';
import 'package:restaurant/screens/login/Signup.dart';

import '../../theme/Style.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                                // controller: usernameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide:
                                        BorderSide(width: 1, color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide:
                                        BorderSide(width: 1, color: Colors.black),
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
                                // controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide:
                                        BorderSide(width: 1, color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    borderSide:
                                        BorderSide(width: 1, color: Colors.black),
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
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MyHomePage(),
                                        ),
                                      );
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 50),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupScreen()),
                                    );
                                  },
                                  child: Text(
                                    'Sign Up',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
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
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
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

    // Scaffold(
    //   body: Column(
    //     children: <Widget>[
    //       Expanded(
    //         flex: 3,
    //         child: Container(
    //           decoration: BoxDecoration(
    //             image: DecorationImage(
    //               image: AssetImage("asset/signin.jpeg"),
    //               fit: BoxFit.cover,
    //               alignment: Alignment.bottomCenter,
    //             ),
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         flex: 4,
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 16),
    //           child: Column(
    //             children: <Widget>[
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: <Widget>[
    //                   Text(
    //                     "SIGN IN",
    //                     style: Theme.of(context).textTheme.headline4,
    //                   ),
    //                   Text(
    //                     "SIGN UP",
    //                     style: Theme.of(context).textTheme.button,
    //                   ),
    //                 ],
    //               ),
    //               Spacer(),
    //               Padding(
    //                 padding: const EdgeInsets.only(bottom: 40),
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: <Widget>[
    //                     Padding(
    //                       padding: const EdgeInsets.only(right: 16),
    //                       child: Icon(
    //                         Icons.alternate_email,
    //                         color: kPrimaryColor,
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: TextField(
    //                         decoration: InputDecoration(
    //                           hintText: "Email Address",
    //                         ),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: <Widget>[
    //                   Padding(
    //                     padding: const EdgeInsets.only(right: 16),
    //                     child: Icon(
    //                       Icons.lock,
    //                       color: kPrimaryColor,
    //                     ),
    //                   ),
    //                   Expanded(
    //                     child: TextField(
    //                       decoration: InputDecoration(
    //                         hintText: "Password",
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Spacer(),
    //               Padding(
    //                 padding: const EdgeInsets.only(bottom: 30),
    //                 child: Row(
    //                   children: <Widget>[
    //                     Spacer(),
    //                     InkWell(
    //                       onTap: () {
    //                         Navigator.pushReplacement(
    //                           context,
    //                           MaterialPageRoute(
    //                             builder: (context) => MyHomePage(),
    //                           ),
    //                         );
    //                       },
    //                       child: Container(
    //                         padding: EdgeInsets.all(16),
    //                         decoration: BoxDecoration(
    //                           shape: BoxShape.circle,
    //                           color: kPrimaryColor,
    //                         ),
    //                         child: Icon(
    //                           Icons.arrow_forward,
    //                           color: Colors.black,
    //                         ),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
