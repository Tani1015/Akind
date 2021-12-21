import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:akindo/logo_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:akindo/providers/controller/recommend_controller.dart';

class PostPage extends StatefulWidget {

  @override
  _PostPagePageState createState() => _PostPagePageState();
}

class _PostPagePageState extends State<PostPage> {

  final picker = ImagePicker();
  File? _image;
  TextEditingController _textEditingController = TextEditingController();
  final controller = Get.put(RecommendController());

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(235,177,243,1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(150,100,150,1),
        title: Text("投稿画面"),
          actions: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                  controller.sendpost(_textEditingController.text, "imgurl.jpg");
              },
            ),
          ],
      ),
      body: Column(
        children:<Widget>[
          Container(
            width: 400,
            height: 100,
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
                icon: Icon(Icons.speaker_notes),
                hintText: '投稿内容を記載します(200文字まで)',
                labelText: '内容 * ',
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed:() async {

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

                      final pickedFile = await picker.getImage(source: ImageSource.gallery);
                      //final File file = File(pickedFile!.path);
                      setState(() {
                        _image = File(pickedFile!.path);
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
            child: _image == null? Text('No image') : Image.file(_image!),
          ),
        ]

      ),

    );
  }
}

