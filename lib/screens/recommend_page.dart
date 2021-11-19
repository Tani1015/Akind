import 'package:flutter/material.dart';
import 'package:get/get.dart';

//クラスインポート
import 'package:akindo/providers/controller/recommend_controller.dart';

class RecommendPage extends GetView<RecommendController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("おすすめ"),
      ),
    );
  }
}