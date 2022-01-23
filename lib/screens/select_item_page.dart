import 'package:akindo/providers/controller/search_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectItemPage extends GetWidget<SearchController> {
  Widget build(BuildContext context){
    final index = Get.arguments;
    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Center(
              child:FutureBuilder<String?>(
                future: controller.getitemimg(controller.searchList[index].itemimg!),
                builder: (BuildContext context, AsyncSnapshot<String?> snapshot){
                  if(snapshot.hasData){
                    return Container(
                      height: height * 0.4,
                      width: weight * 1,
                      child: CachedNetworkImage(imageUrl:snapshot.data!),
                    );
                  }else if(snapshot.hasError){
                    return Text('Error');
                  }else {
                    return CircularProgressIndicator();
                  }
                }
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
                child: Column(
                  children: <Widget>[
                    Text(controller.searchList[index].itemname!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27
                      ),
                    ),
                  SizedBox(height: height * 0.01,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: weight * 0.32),
                      Text(controller.searchList[index].sex!,
                        style: TextStyle(
                          fontSize: 13
                        ),
                      ),
                      SizedBox(width:  weight * 0.05,),
                      Text(controller.searchList[index].category!,
                        style: TextStyle(
                          fontSize: 13
                        ),
                      )
                    ],
                  ),
                  SizedBox(height:  height * 0.03,),
                  Container(
                    child: Text("￥ ${controller.searchList[index].price!}",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.red
                      ),
                    ),
                  ),
                  SizedBox(height:  height * 0.03),
                  Container(
                      child: Text("商品の説明",
                        style: TextStyle(
                          fontSize: 15
                        ),
                      ),
                  ),
                  SizedBox(height: height * 0.01,),
                  Container(
                      child: Text(controller.searchList[index].description!,
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                  ),
                    SizedBox(height: height * 0.12),
                    Container(
                        child: TextButton(
                          onPressed: () {
                            //レンタル
                            Get.defaultDialog(
                              title: "",
                              middleText: "${controller.searchList[index].itemname}をレンタルしますか？",
                              middleTextStyle: TextStyle(
                                  fontFamily: "Font3",
                                  color: Colors.black,letterSpacing: 0.5,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold
                              ),
                              textCancel: "NO",
                              onConfirm: (){
                                controller.sendmyrentals(index);
                                Get.offAllNamed("/Routes");
                              }
                            );
                          },
                          child: Text("レンタルする",style: TextStyle(
                              fontFamily: "Font3",
                              color: Colors.white,letterSpacing: 0.5,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              padding: const EdgeInsets.symmetric(vertical:  10.0, horizontal: 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              )
                          ),
                        )
                    ),
                ]
            ),
        )]
      ))
    );
  }
}