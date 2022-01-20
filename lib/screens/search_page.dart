import 'package:flutter/material.dart';
import 'package:get/get.dart';

//クラスインポート
import 'package:akindo/providers/controller/search_controller.dart';

class SearchPage extends GetView<SearchController> {

  @override
  Widget build(BuildContext context) {
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
            controller.getSearch(search);
          },
        ),
        // bottom: TabBar(
        //   controller: controller.tabController,
        //   tabs: [
        //     Tab(text:"人気"),
        //     Tab(text:"おすすめ"),
        //     Tab(text:"カジュアル"),
        //     Tab(text:"モード"),
        //     Tab(text:"フェミニン"),
        //   ],
        // ),
      ),
      // body: TabBarView(
      //   controller: controller.tabController,
      //   children: [
      //   ],
      // ),
    );
  }
}