import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//クラスインポート
import 'package:akindo/component/animation/animation.dart';
import 'package:akindo/providers/data/login_data.dart';


class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    //端末ごとの高さと横幅を取得
    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final products = Get.put(Login_Product());

    return Scaffold(
      // backgroundColor: Color.fromRGBO(, , , 1),
      body: SingleChildScrollView(
        child: Expanded(
          flex: 1,
            // child:SizedBox(
            //   width: weight,
            //   height: height,

              child: Column(
                children: <Widget> [
                  SizedBox(height: 70),
                  //画像配置
                  Center(
                    child:Container(

                      width: 330,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('images/akind.jpg'),
                      ),
                    ),
                  ),

                  //以下フェードインアニメーション　ログイン文字
                  FadeAnimation(
                    delay: 1,
                    child:Container(
                      margin: const EdgeInsets.only(right: 230.0),
                      child: Text("ログイン",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                          letterSpacing: 0.5
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: height * 0.01,
                  ),


                  FadeAnimation(
                    delay: 1,
                    child: Container(
                      margin: const EdgeInsets.only(right: 150.0),
                      child: Text("ユーザ情報を入力してください",
                          style: TextStyle(
                              letterSpacing: 0.5
                          ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: height * 0.025,
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: Container(
                      width: weight * 0.9,
                      height: height * 0.071,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: products.selected == Gender.Email ? products.enabled : products.background,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onTap: () {
                            products.emailselect();
                        }
                      )
                    ),
                  ),



                ],
              ),
            )
        ),
      );
  }
}
