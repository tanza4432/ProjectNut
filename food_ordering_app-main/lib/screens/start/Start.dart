import 'package:flutter/material.dart';
import 'package:restaurant/component/WillPop.dart';

import '../../theme/Icons.dart';
import '../../theme/Style.dart';
import '../login/Signin.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/startLogo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "แอปค้นหาร้านอาหาร\n",
                        ),
                        TextSpan(
                          text: "แอปพลิเคชันเพื่อกรณีศึกษา",
                        )
                      ],
                    ),
                  ),
                  FittedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return SignInScreen();
                          },
                        ));
                      },
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            margin: EdgeInsets.only(bottom: 25),
                            padding: EdgeInsets.symmetric(
                                horizontal: 26, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: kPrimaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "ทดลองใช้งาน",
                                  style:
                                      Theme.of(context).textTheme.button.copyWith(
                                            color: Colors.black,
                                          ),
                                ),
                                Image.network(trials),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            margin: EdgeInsets.only(bottom: 25),
                            padding: EdgeInsets.symmetric(
                                horizontal: 26, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: kPrimaryColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "เข้าสู่ระบบ",
                                  style:
                                      Theme.of(context).textTheme.button.copyWith(
                                            color: Colors.black,
                                          ),
                                ),
                                Image.network(login),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
