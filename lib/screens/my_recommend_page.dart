import 'package:akindo/providers/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRecommendPage extends GetWidget<HomeController> {

  @override
  Widget build(BuildContext context) {

    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Obx(() =>
          ListView.builder(
            itemCount: controller.mycardlist.length,

            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                child: Column(
                  // ListTile(title: Text(controller.cardlist[index].description!),

                  children: [
                    // CachedNetworkImage(imageUrl:controller.getimg(controller.cardlist[index].imgurl!).toString())
                    //CachedNetworkImage(imageUrl:controller.imgdl!)
                    FutureBuilder<String?>(
                        future: controller.getimg(controller.mycardlist[index].imgurl!),
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
                      title: Text(controller.mycardlist[index].description!),
                    ),
                  ],
                ),
              );
            },
          )
      );
  }
}