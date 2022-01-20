import 'dart:io';

import 'package:akindo/logo_icons.dart';
import 'package:akindo/providers/controller/listing_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class ListingPage extends GetWidget<ListingController>{
  @override
  Widget build(BuildContext context) {

    //端末ごとの高さと横幅を取得
    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Akindへ出品"),
        backgroundColor: Color.fromRGBO(198, 241, 232, 1),
        centerTitle: true,
      ),
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child:Container(

                    child: Image.asset('images/bar.png'),

                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed:(){
                          controller.camera();
                        },
                        child: Column(
                          children:<Widget> [
                            Icon(Icons.camera_alt_outlined),
                            Text("カメラ"),
                          ],
                        )
                    ),
                    //TextButton(onPressed: onPressed, child: child)
                    TextButton(
                        onPressed: () {
                          controller.gallery();
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.picture_as_pdf),
                            Text("アルバム"),
                          ],
                        )),
                    TextButton(
                        onPressed: () async{

                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Barcode.barcode_scan_icon_137911),
                            Text("バーコード"),
                          ],
                        )),
                  ],
                )
              ],
            )
        )
    );

    throw UnimplementedError();
  }

}