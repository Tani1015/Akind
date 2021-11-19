import 'package:flutter/material.dart';
import 'package:get/get.dart';

//クラスインポート
import 'package:akindo/providers/controller/listing_controller.dart';

class ListingPage extends GetView<ListingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("出品画面"),
      ),
    );
  }
}