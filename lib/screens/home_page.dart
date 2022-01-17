import 'package:akindo/providers/controller/firebase_controller.dart';
import 'package:akindo/providers/data/signup_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//クラスインポート
import 'package:akindo/providers/controller/home_controller.dart';
import 'package:akindo/models/users.dart';

class HomePage extends GetWidget<HomeController> {

  late final String documentID;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(198, 241, 232, 1),
        title: FutureBuilder<DocumentSnapshot>(
          future: users.doc(controller.uid).get(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              return Text("${data['Full Name']}");
            }
            return Text("loading");
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * 0.03),
                      CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 50.0,
                      ),
                      SizedBox(height: height * 0.001),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: <Widget>[
                      //     Expanded(
                      //       child: Column(
                      //
                      //         children: <Widget>[
                      //           Text(
                      //             "出品",
                      //             style: TextStyle(
                      //               color: Colors.redAccent,
                      //               fontSize: 22.0,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: height * 0.01,
                      //           ),
                      //           Text(
                      //             "0",
                      //             style: TextStyle(
                      //               fontSize: 22.0,
                      //               color: Colors.pinkAccent,
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: Column(
                      //
                      //         children: <Widget>[
                      //           Text(
                      //             "フォロワー",
                      //             style: TextStyle(
                      //               color: Colors.redAccent,
                      //               fontSize: 18.0,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 5.0,
                      //           ),
                      //           Text(
                      //             "0",
                      //             style: TextStyle(
                      //               fontSize: 22.0,
                      //               color: Colors.pinkAccent,
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: Column(
                      //
                      //         children: <Widget>[
                      //           Text(
                      //             "フォロー",
                      //             style: TextStyle(
                      //               color: Colors.redAccent,
                      //               fontSize: 20.0,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 5.0,
                      //           ),
                      //           Text(
                      //             "0",
                      //             style: TextStyle(
                      //               fontSize: 20.0,
                      //               color: Colors.pinkAccent,
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: Column(
                      //
                      //         children: <Widget>[
                      //           Text(
                      //             "お気に入り",
                      //             style: TextStyle(
                      //               color: Colors.redAccent,
                      //               fontSize: 18.0,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 5.0,
                      //           ),
                      //           Text(
                      //             "0",
                      //             style: TextStyle(
                      //               fontSize: 22.0,
                      //               color: Colors.pinkAccent,
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(height:  height * 0.03),
                      Obx(() =>
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.userlist.length,
                              itemBuilder: (context, index) => Card(
                                color: Colors.white60,
                                child: ListTile(
                                  title: Text(controller.userlist[index].name!),
                                  subtitle: Text(controller.userlist[index].email!),
                                ),
                              )
                          )
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}