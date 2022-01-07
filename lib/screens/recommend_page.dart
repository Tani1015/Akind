import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:akindo/screens/post_page.dart';

//クラスインポート
import 'package:akindo/providers/controller/recommend_controller.dart';

class RecommendPage extends GetView<RecommendController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235,177,243,1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(150,100,150,1),
        title: Text("掲示板デモ"),
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
          itemBuilder: (context, index) => Card(
            color: Colors.white,
            child: ListTile(
              title: Text(controller.cardlist[index].description!),
              subtitle: Text(controller.cardlist[index].imgurl!),
            ),
          ),
        )
      ),
    );

  }
}