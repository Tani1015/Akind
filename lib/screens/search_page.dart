import 'package:flutter/material.dart';
import 'package:get/get.dart';

//クラスインポート
import 'package:akindo/providers/controller/search_controller.dart';

class SearchPage extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("検索"),
      ),
    );
  }
}