import 'package:cached_network_image/cached_network_image.dart';
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
              return Card(
                color: Colors.white,
                child: Column(
                  // ListTile(title: Text(controller.cardlist[index].description!),

                  children: [
                    // CachedNetworkImage(imageUrl:controller.getimg(controller.cardlist[index].imgurl!).toString())
                    //CachedNetworkImage(imageUrl:controller.imgdl!)
                    FutureBuilder<String?>(
                        future: controller.getimg(controller.cardlist[index].imgurl!),
                        builder: (BuildContext context, AsyncSnapshot<String?> snapshot){
                          if(snapshot.hasData){
                            return Container(
                              height: height * 0.2,
                              width: weight * 0.3,
                              child: CachedNetworkImage(imageUrl:snapshot.data!),
                            );
                          }else if(snapshot.hasError){
                            return Text('Error');
                          }else {
                            return CircularProgressIndicator();
                          }
                        }
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