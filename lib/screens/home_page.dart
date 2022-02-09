import 'package:akindo/providers/controller/firebase_controller.dart';
import 'package:akindo/providers/data/signup_data.dart';
import 'package:akindo/screens/my_listing_page.dart';
import 'package:akindo/screens/my_recommend_page.dart';
import 'package:akindo/screens/my_rental_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(children: [
            SizedBox(
              height: height * 0.2,
              width: weight,
            ),
            Positioned(
              top: height * 0.01,
              left: weight * 0.06,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/akind-3b21d.appspot.com/o/icon%2Fneko.jpg?alt=media&token=49860553-3338-4ec7-b7e3-6f232844b8e9"),
              ),
            ),
          ]),
        ),
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
        actions: [
          IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.settings)
          )
        ],
        bottom: TabBar(
          tabs:controller.tabs,
          controller: controller.tabController,
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          MyRecommendPage(),
          MyRentalPage(),
          MyListingPage()
        ],
      ),
    );
  }
}

