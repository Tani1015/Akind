import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      body: buildFirstPage(context)
    );
  }

  buildFirstPage(BuildContext context){
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 25.0),
      child: ListView(children: [
        SizedBox(height: 250.0),
        GestureDetector(
          child: Container(
            height: 50.0,
            child: Material(
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Colors.greenAccent,
              color: Colors.green,
              elevation: 7.0,
              child: Center(
                child: Text("ユーザ登録"),
              ),
            ),
          ),
          onTap: (){
            //タップ処理
            Get.toNamed("/SignUp");
          },
        ),
        SizedBox(height: 70.0),
        GestureDetector(
          child: Container(
            height: 50.0,
            child: Material(
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Colors.greenAccent,
              color: Colors.green,
              elevation: 7.0,
              child: Center(
                child: Text("ログイン"),
              ),
            ),
          ),
          onTap: (){
            //タップ処理
            Get.toNamed("/Login");
          },
        ),
      ])
    );
  }
}