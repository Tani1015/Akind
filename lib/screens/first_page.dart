import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      body: buildFirstPage(context),
      // backgroundColor: Color.fromRGBO(198,241,231,1),
       backgroundColor:Colors.white,
    );
  }

  buildFirstPage(BuildContext context){

    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Container(
              width: 330,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('images/akind.jpg'),
              ),
            ),
          SizedBox(height: 80.0),
          GestureDetector(
                child: Container(
                  height: 50.0,
                  width: 300,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.greenAccent,
                    color: Colors.cyanAccent,
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
            SizedBox(height: 40.0),
            GestureDetector(
              child: Container(
                height: 50.0,
                width: 300,
                child: Material(
                  borderRadius: BorderRadius.circular(30.0),
                  shadowColor: Colors.greenAccent,
                  color: Colors.cyanAccent,
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
          ],
        ));






    // return Padding(
    //     padding: const EdgeInsets.only(left: 20.0, right: 25.0),
    //   child: ListView(children: [
    //     SizedBox(height: 550.0),
    //     GestureDetector(
    //       child: Container(
    //         height: 50.0,
    //         child: Material(
    //           borderRadius: BorderRadius.circular(30.0),
    //           shadowColor: Colors.greenAccent,
    //           color: Colors.green,
    //           elevation: 7.0,
    //           child: Center(
    //             child: Text("ユーザ登録"),
    //           ),
    //         ),
    //       ),
    //       onTap: (){
    //         //タップ処理
    //         Get.toNamed("/SignUp");
    //       },
    //     ),
    //     SizedBox(height: 20.0),
    //     GestureDetector(
    //       child: Container(
    //         height: 50.0,
    //         child: Material(
    //           borderRadius: BorderRadius.circular(30.0),
    //           shadowColor: Colors.greenAccent,
    //           color: Colors.green,
    //           elevation: 7.0,
    //           child: Center(
    //             child: Text("ログイン"),
    //           ),
    //         ),
    //       ),
    //       onTap: (){
    //         //タップ処理
    //         Get.toNamed("/Login");
    //       },
    //     ),
    //   ])
    // );
  }
}