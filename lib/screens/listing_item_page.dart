import 'package:akindo/providers/controller/listing_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListingItemPage extends GetWidget<ListingController>{
  static const menu = <String> [
    'コンサバ',
    'カジュアル',
    'フェミニン',
    'モード'
  ];

  Widget build(BuildContext context){

    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("出品ページ")
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            controller.file == null
                ? Text('No image')
                : Image.file(controller.file),
            SizedBox(height: height * 0.1),
            TextFormField(
            ),
            SizedBox(height: height * 0.1),

          ],
        )
      ),
    );
  }
}