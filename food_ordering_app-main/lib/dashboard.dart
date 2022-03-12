// import 'package:flutter/material.dart';
// import 'package:restaurant/component/WillPop.dart';
// import 'package:restaurant/component/block1.dart';
// import 'package:restaurant/component/block2.dart';
// import 'package:restaurant/component/block3.dart';
// import 'package:restaurant/component/detail.dart';
// import 'package:restaurant/screens/login/Signin.dart';

// class MyHomePage extends StatefulWidget {
//   final type;
//   final name;
//   MyHomePage(this.type, this.name);
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: onWillPop,
//       child: Scaffold(
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "รวมร้านคาเฟ่",
//                         style: TextStyle(
//                           fontSize: 26,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                       widget.type == "none"
//                           ? Padding(
//                               padding: const EdgeInsets.only(right: 20),
//                               child: InkWell(
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => SignInScreen(),
//                                     ),
//                                   );
//                                 },
//                                 child: Text("เข้าสู่ระบบ"),
//                               ),
//                             )
//                           : Padding(
//                               padding: const EdgeInsets.only(right: 20),
//                               child: InkWell(
//                                 onTap: () {
//                                   showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return AlertDialog(
//                                         title: Text("บัญชี: " + widget.name),
//                                         actions: [
//                                           FlatButton(
//                                             child: Text("ตกลง"),
//                                             onPressed: () {
//                                               Navigator.pop(context);
//                                             },
//                                           )
//                                         ],
//                                       );
//                                     },
//                                   );
//                                 },
//                                 child: Icon(
//                                   Icons.account_circle,
//                                   color: Colors.white,
//                                   size: 40,
//                                 ),
//                               ),
//                             ),
//                     ],
//                   ),


//                   SizedBox(height: 5),
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(right: 16, top: 8, bottom: 0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 240, 85, 85),
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(38.0),
//                         ),
//                         boxShadow: <BoxShadow>[
//                           BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               offset: const Offset(0, 2),
//                               blurRadius: 8.0),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                             left: 16, right: 16, top: 4, bottom: 4),
//                         child: TextField(
//                           decoration: const InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'London...',
//                           ),
//                           onChanged: (String txt) {},
//                           style: const TextStyle(
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 240, 85, 85),
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(38.0),
//                       ),
//                       boxShadow: <BoxShadow>[
//                         BoxShadow(
//                             color: Colors.grey.withOpacity(0.4),
//                             offset: const Offset(0, 2),
//                             blurRadius: 8.0),
//                       ],
//                     ),
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         borderRadius: const BorderRadius.all(
//                           Radius.circular(32.0),
//                         ),
//                         onTap: () {
//                           FocusScope.of(context).requestFocus(FocusNode());
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Icon(
//                             Icons.search,
//                             size: 20,
//                             color: Color.fromARGB(255, 240, 85, 85),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   SizedBox(
//                     height: 20,
//                   ),
//                   deatil(
//                     "hotel1",
//                     "ร้านคอฟฟี่วิว น้ำหนาว จ. เพชรบูรณ์",
//                     widget.type,
//                     widget.name,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   deatil(
//                     "hotel2",
//                     "ลิตเติ้ลวินเทอร์คาเฟ่",
//                     widget.type,
//                     widget.name,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   deatil(
//                     "hotel3",
//                     "Coffee View Phetchabun",
//                     widget.type,
//                     widget.name,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
