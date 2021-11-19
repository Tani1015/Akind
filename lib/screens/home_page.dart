import 'package:flutter/material.dart';
import 'package:get/get.dart';

//クラスインポート
import 'package:akindo/providers/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ホーム"),
      ),
    );
  }
}