import 'dart:io';

import 'package:akindo/logo_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class ListingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    //端末ごとの高さと横幅を取得
    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: height * 0.035),
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
                        onPressed:() async {
                          final picker = ImagePicker();
                          final pickedFile = await picker.getImage(source: ImageSource.camera);
                          final File file = File(pickedFile!.path);

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
                        onPressed: ()async{
                          final picker = ImagePicker();
                          final pickedFile = await picker.getImage(source: ImageSource.gallery);
                          final File file = File(pickedFile!.path);
                        },
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.picture_as_pdf),
                            Text("アルバム"),
                          ],
                        )),
                    TextButton(
                        onPressed: ()async{

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