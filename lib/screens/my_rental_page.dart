import 'package:akindo/providers/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRentalPage extends GetWidget<HomeController> {

  @override
  Widget build(BuildContext context) {
    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Obx(() =>
        ListView.builder(
            itemCount: controller.myrentallist.length,
            itemBuilder: (context, index) {
              return Card(
                  child: Column(
                      children: <Widget> [
                        FutureBuilder<String?>(
                            future: controller.getitemimg(controller.myrentallist[index].itemimg!),
                            builder: (BuildContext context, AsyncSnapshot<String?> snapshot){
                              if(snapshot.hasData){
                                return Container(
                                  width:  weight * 0.4,
                                  height:  height * 0.2,
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
                          title: Text(controller.myrentallist[index].itemname!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30
                            ),
                          ),
                          subtitle: Text("￥ ${controller.myrentallist[index].price!}",
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.red
                            ),
                          ),
                        )
                      ]
                  )
              );
            })
    );
  }
}