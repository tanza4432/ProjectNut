import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant/component/alert.dart';
import 'package:restaurant/component/loading.dart';
import 'package:restaurant/listrestaurant/HotelPage.dart';
import 'package:restaurant/model/StoreModel.dart';
import 'package:restaurant/services/StoreService.dart';

class EmployerPage extends StatefulWidget {
  final id;
  final address;
  final idstore;
  final image;
  final latitude;
  final longitude;
  final name;
  final open;
  final tel;
  final total_review;
  final website;
  final type;
  final iduser;
  final username;
  EmployerPage(
      this.id,
      this.address,
      this.idstore,
      this.image,
      this.latitude,
      this.longitude,
      this.name,
      this.open,
      this.tel,
      this.total_review,
      this.website,
      this.type,
      this.iduser,
      this.username);

  @override
  State<EmployerPage> createState() => _EmployerPageState();
}

class _EmployerPageState extends State<EmployerPage> {
  final TextEditingController fullname = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController tel = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmpassword = new TextEditingController();
  File file;

  bool _status = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingDoubleBounce()
        : new Scaffold(
            body: new Container(
            color: Colors.white,
            child: new ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // SizedBox(width: 50),
                      IconButton(
                        iconSize: 35,
                        color: Colors.black,
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => hotelPage(
                                      widget.id,
                                      widget.address,
                                      widget.idstore,
                                      widget.image,
                                      widget.latitude,
                                      widget.longitude,
                                      widget.name,
                                      widget.open,
                                      widget.tel,
                                      widget.total_review,
                                      widget.website,
                                      widget.type,
                                      widget.iduser,
                                      widget.username)),
                              (route) => false);
                        },
                      ),
                      SizedBox(width: 100),
                      Text(
                        "ข้อมูลร้าน",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 10.0),
                                child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'แก้ไขข้อมูล',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    new Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        _status
                                            ? _getEditIcon()
                                            : new Container(),
                                      ],
                                    )
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'ชื่อ',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: FutureBuilder<TextEditingController>(
                                      // future: datafullname(token),
                                      builder: (context, snapshot) {
                                        // fullname = snapshot?.data;
                                        return new TextField(
                                          controller: fullname,
                                          decoration: const InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            hintText: "ใส่ชื่อของคุณ",
                                          ),
                                          enabled: !_status,
                                          autofocus: !_status,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'อีเมล์',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(child:
                                        FutureBuilder<TextEditingController>(
                                            // future: dataemail(token),
                                            builder: (context, snapshot) {
                                      // email = snapshot?.data;
                                      return new TextField(
                                        controller: email,
                                        decoration: const InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            hintText: "ป้อน ID อีเมล"),
                                        enabled: !_status,
                                        autofocus: !_status,
                                      );
                                    })),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'เบอร์โทรศัพท์',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(child:
                                        FutureBuilder<TextEditingController>(
                                            // future: datatel(token),
                                            builder: (context, snapshot) {
                                      // tel = snapshot.data;
                                      return new TextField(
                                        controller: tel,
                                        decoration: const InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            hintText: "ใส่เบอร์โทรศัพท์"),
                                        enabled: !_status,
                                      );
                                    })),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'ตั้งรหัสผ่านใหม่',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        obscureText: true,
                                        controller: password,
                                        decoration: const InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            hintText: "ตั้งรหัสผ่านใหม่"),
                                        enabled: !_status,
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 25.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        new Text(
                                          'ยืนยัน ตั้งรหัสผ่านใหม่',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    new Flexible(
                                      child: new TextField(
                                        obscureText: true,
                                        controller: confirmpassword,
                                        decoration: const InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                            ),
                                            hintText: "ยืนยันตั้งรหัสผ่านใหม่"),
                                        enabled: !_status,
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 15.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, top: 2.0),
                                child: new Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[],
                                )),
                            !_status ? _getActionButtons() : new Container(),
                            // FutureBuilder<StoreModel>(
                            //   future: PreviewResume(token),
                            //   builder: (context, snapshot) {
                            //     if (snapshot?.connectionState ==
                            //         ConnectionState.done) {
                            //       if (snapshot.data?.link == "") {
                            //         return Text(
                            //           "ยังไม่ได้เลือกรูปภาพ",
                            //           textAlign: TextAlign.center,
                            //         );
                            //       } else {
                            //         return Container(
                            //           child: Image?.network(
                            //             snapshot.data?.link,
                            //             fit: BoxFit.fill,
                            //           ),
                            //         );
                            //       }
                            //     } else {
                            //       return LoadingRipple();
                            //     }
                            //   },
                            // ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: RaisedButton(
                                child: new Text("เพิ่มภาพพื้นหลัง"),
                                textColor: Colors.white,
                                color: Colors.black,
                                onPressed: () async {
                                  var image = await ImagePicker()
                                      .getImage(source: ImageSource?.gallery);
                                  if (image?.path != null) {
                                    String status = await UploadImgStore(
                                        widget.idstore, File(image?.path));

                                    if (status == "อัพโหลดรูปภาพเรียบร้อย") {
                                      showDialog(
                                        context: context,
                                        builder: (_) => AlertMessage(
                                            "แจ้งเตือน",
                                            "อัพเดตรูปภาพแล้ว",
                                            null),
                                      );
                                      setState(() {
                                        file = File(image?.path);
                                      });
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (_) => AlertMessage(
                                            "แจ้งเตือน",
                                            "การอัพโหลดมีปัญหา โปรดลองใหม่ภายหลัง",
                                            null),
                                      );
                                    }
                                  }
                                },
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ));
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("บันทึก"),
                textColor: Colors.black,
                color: Color(0xFF33CC33),
                onPressed: () async {
                  // if (password?.text != "") {
                  //   if (password?.text == confirmpassword.text) {
                  //     final String status = await UpdateProfilePassword(
                  //         fullname?.text,
                  //         email?.text,
                  //         tel?.text,
                  //         password?.text,
                  //         token);
                  //     if (status == "แก้ไขข้อมูลแล้ว") {
                  //       showDialog(
                  //           context: context,
                  //           builder: (_) => AlertMessage(
                  //               "แจ้งเตือน", "แก้ไขข้อมูลสำเร็จ", null));
                  //       Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //           builder: (context) =>
                  //               ProfilePage(typeUser, token)));
                  //     } else {
                  //       showDialog(
                  //           context: context,
                  //           builder: (_) => AlertMessage(
                  //               "แจ้งเตือน",
                  //               "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                  //               null));
                  //     }
                  //     setState(() {
                  //       _status = true;
                  //       FocusScope.of(context).requestFocus(new FocusNode());
                  //     });
                  //   } else {
                  //     showDialog(
                  //         context: context,
                  //         builder: (_) => AlertMessage(
                  //             "แจ้งเตือน", "กรอกกรหัสให้ตรงกัน", null));
                  //   }
                  // } else {
                  //   final String status = await UpdateProfile(
                  //       email.text, fullname.text, tel.text, token);
                  //   if (status == "แก้ไขข้อมูลแล้ว") {
                  //     showDialog(
                  //         context: context,
                  //         builder: (_) => AlertMessage(
                  //             "แจ้งเตือน",
                  //             "แก้ไขข้อมูลสำเร็จ",
                  //             HomeHome(1, token, typeUser, fullname)));
                  //   } else {
                  //     showDialog(
                  //         context: context,
                  //         builder: (_) => AlertMessage(
                  //             "แจ้งเตือน",
                  //             "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                  //             null));
                  //   }
                  //   setState(() {
                  //     _status = true;
                  //     FocusScope.of(context).requestFocus(new FocusNode());
                  //   });
                  // }
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("ยกเลิก"),
                textColor: Colors.black,
                color: Colors.red[600],
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.black,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
