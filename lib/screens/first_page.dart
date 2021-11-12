import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget{
  final colors = <Color>[Colors.lime,Colors.pink, Colors.purple];
  Widget build(BuildContext context){

    return Scaffold(
      body: buildFirstPage(context),
      backgroundColor: Color.fromRGBO(235,177,243,1),


    );
  }

  buildFirstPage(BuildContext context){



    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Center(
              child:Container(

                width: 330,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('images/logo.png'),
                ),
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
                  color: Color.fromRGBO(136 , 255, 227, 1),
                  elevation: 8.0,
                  child: Center(
                    child: Text("ユーザ登録",
                        style: TextStyle(
                          fontFamily: "font3",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(87, 93, 107, 1)
                        )),
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
                  shadowColor: Colors.black,
                  color: Color.fromRGBO(136 , 255, 227, 1),
                  elevation: 8.0,
                  child: Center(
                    child: Text("ログイン",
                        style: TextStyle(
                          fontFamily: "font3",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(87, 93, 100, 1)
                        )),
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

  }
}