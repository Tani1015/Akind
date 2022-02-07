import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//クラスインポート
import 'package:akindo/providers/controller/search_controller.dart';

class SearchPage extends GetView<SearchController> {

  @override
  Widget build(BuildContext context) {
    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(198, 241, 232, 1),
        title: TextField(
          style: TextStyle(fontSize: 15),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5.0),
            enabledBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color:Colors.black
              )
            ),
            hintText: "キーワードを入力してください",
            prefixIcon: Icon(Icons.search)
          ),
          onChanged: (search){
            controller.getsearch(search);
            controller.searchList.refresh();
          },
        )),
      body: Obx(() =>
          GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
              ),
              itemCount: controller.searchList.length,
            itemBuilder: (context, index){
                return GestureDetector(
                    onTap:(){
                      Get.toNamed("/Item", arguments:index);
                    },
                    child: Column(

                      children: <Widget>[
                        SizedBox(height:  height * 0.01),
                      Card(
                        child: FutureBuilder<String?>(
                            future: controller.getitemimg(controller.searchList[index].itemimg!),
                            builder: (BuildContext context, AsyncSnapshot<String?> snapshot){
                              if(snapshot.hasData){
                                return Container(
                                  width:  weight * 0.4,
                                  height:  height * 0.2,
                                  child: CachedNetworkImage(imageUrl:snapshot.data!),
                                );
                              }else {
                                return CircularProgressIndicator();
                              }
                            }
                        ),
                      ),
                      // Row(
                      //   children: <Widget>[
                      //     SizedBox(width:  weight * 0.2,),
                      //     Text(controller.searchList[index].price!,
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.red
                      //         )),
                      //     Text("円　/　週"),
                      //   ],
                      // )
                  ])
                );
          })
      ),
    );
  }
}