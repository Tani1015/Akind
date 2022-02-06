import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:akindo/screens/post_page.dart';

//クラスインポート
import 'package:akindo/providers/controller/recommend_controller.dart';

class RecommendPage extends GetView<RecommendController>{
  @override

  Widget build(BuildContext context) {
    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(198, 241, 232, 1),
        title: Text("おすすめ"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.edit), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return PostPage();
            }));
          },
          ),
        ],
      ),
      body:Obx(() =>
          ListView.builder(
            itemCount: controller.cardlist.length,

            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26
                  ),
                  color: Colors.white
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 5
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 1,
                          horizontal: 10
                      ).copyWith(right: 0),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 16,
                            backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/akind-3b21d.appspot.com/o/icon%2Fneko.jpg?alt=media&token=49860553-3338-4ec7-b7e3-6f232844b8e9"),
                          ),
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      FutureBuilder<DocumentSnapshot>(
                                        future: users.doc(controller.cardlist[index].id).get(),
                                        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                          if (snapshot.connectionState == ConnectionState.done) {
                                            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                                            return Text("${data['Full Name']}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          }
                                          return Text("loading");
                                        },
                                      ),
                                    ]
                                ),
                              ),
                          ),
                          IconButton(
                              onPressed: (){
                                
                              },
                              icon: Icon(Icons.more_vert)
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.35,
                      width: double.infinity,
                      child:FutureBuilder<String?>(
                          future: controller.getimg(controller.cardlist[index].imgurl!),
                          builder: (BuildContext context, AsyncSnapshot<String?> snapshot){
                            if(snapshot.hasData){
                              return CachedNetworkImage(
                                imageUrl:snapshot.data!,
                                fit: BoxFit.contain,
                              );
                            }else {
                              return Text("");
                            }
                          }
                      ),
                    ),
                    ListTile(
                      title: Text(controller.cardlist[index].description!),
                    ),
                  ],
                ),
              );
            },
          )
      ),
    );

  }
}