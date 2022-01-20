import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:akindo/logo_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:akindo/providers/controller/recommend_controller.dart';
import 'dart:io' as Io;
import 'package:path/path.dart' as path;


class PostPage extends StatefulWidget {

  @override
  _PostPagePageState createState() => _PostPagePageState();
}

class _PostPagePageState extends State<PostPage> {
  final picker = ImagePicker();
  File? _image;
  String? img;
  String? imgname;
  String? imgpath;
  var file;
  TextEditingController _textEditingController = TextEditingController();
  final controller = Get.put(RecommendController());

  @override
  Widget build(BuildContext context) {
    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(198, 241, 232, 1),
        title: Text("投稿画面"),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              controller.sendpost(_textEditingController.text, imgname!);
              controller.uploadFiles(imgname!,_image!);
              Get.offAllNamed("/Routes");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:<Widget>[
            Container(
              width: weight * 0.8,
              height: height * 0.1,
              child: TextField(
                controller: _textEditingController,
                enabled: true,
                maxLength: 200, // 入力数
                maxLengthEnforced: true, // 入力上限になったときに、文字入力を抑制するか
                style: TextStyle(color: Colors.black),
                obscureText: false,
                maxLines: 2,
                minLines: 1,
                decoration: const InputDecoration(
                  hintText: '投稿内容を記載します(200文字まで)',
                  labelText: '内容 * ',
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed:() async {
                        //controller.cameraget();
                        final pickedFile = await picker.getImage(source: ImageSource.camera);
                        //final File file = File(pickedFile!.path);
                        setState(() {
                          _image = File(pickedFile!.path);
                        });
                      },
                      child: Column(
                        children:<Widget> [
                          Icon(Icons.camera_alt_outlined),
                          Text("カメラ"),
                        ],
                      )
                  ),
                  TextButton(

                      onPressed:() async {
                        //controller.galleryget();

                        final pickedFile = await picker.getImage(source: ImageSource.gallery);
                        //final File file = File(pickedFile!.path);
                        setState(() {
                          _image = File(pickedFile!.path);
                          imgname = path.basename(pickedFile.path);
                          imgpath = (pickedFile.path);
                          //controller.uploadFiles(pickedFile.path,imgname!);
                        });

                      },
                      child: Column(

                        children:<Widget> [
                          Icon(Icons.picture_as_pdf),
                          Text("ファイル"),
                        ],
                      )
                  ),
                ]),
            SafeArea(
              child: _image == null? Text('') : Container(
                width: weight * 0.6,
                height: height * 0.6,
                child: Image.file(_image!),
              ),
            ),
          ]
      ),
      )
    );
  }
}