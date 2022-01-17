import 'package:akindo/providers/controller/firebase_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sign_button/sign_button.dart';

//クラスインポート
import 'package:akindo/attach/animation/animation.dart';
import 'package:akindo/providers/data/login_data.dart';


class LoginPage extends GetWidget<FirebaseController>{

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final Firebase_controller = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {

    //端末ごとの高さと横幅を取得
    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final Login_products = Get.put(Login_Product());

    return Scaffold(
      backgroundColor: Color.fromRGBO(198, 241, 232, 1),
      body: SingleChildScrollView(


              child: Column(
                children: <Widget> [
                  SizedBox(height: height * 0.15),
                  //画像配置
                  FadeAnimation(
                    delay: 1,
                    child:Container(
                      child: Image.asset('images/icon&logo.png'),
                    ),
                  ),

                  SizedBox(height: 50),

                  //以下フェードインアニメーション　ログイン文字
                  // FadeAnimation(
                  //   delay: 2,
                  //   child:Container(
                  //     margin: const EdgeInsets.only(right: 230.0),
                  //     child: Text("ログイン",
                  //       style: TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 30.0,
                  //         letterSpacing: 0.5
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  //
                  // SizedBox(
                  //   height: height * 0.005,
                  // ),
                  //
                  // FadeAnimation(
                  //   delay: 2,
                  //   child: Container(
                  //     margin: const EdgeInsets.only(right: 146.0),
                  //     child: Text("ユーザ情報を入力してください",
                  //         style: TextStyle(
                  //             letterSpacing: 0.5
                  //         ),
                  //     ),
                  //   ),
                  // ),

                  SizedBox(
                    height: height * 0.03,
                  ),

                  FadeAnimation(
                    delay: 2,
                    child: Container(
                      width: weight * 0.9,
                      height: height * 0.071,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Login_products.selected == Gender.Email ? Login_products.enabled : Login_products.background,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onTap: () {
                          Login_products.emailselect();
                        },
                        controller: email,
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.account_circle_outlined,color: Login_products.selected == Gender.Email ? Login_products.enabledtxt : Login_products.deaible,),
                          hintText: 'メール',
                          hintStyle: TextStyle(
                            color: Login_products.selected == Gender.Email ? Login_products.enabledtxt : Login_products.deaible,
                          ),
                      ),
                        style: TextStyle(
                          fontFamily: "Font3",
                          color: Login_products.selected == Gender.Email ? Login_products.enabledtxt : Login_products.deaible,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02,),

                  FadeAnimation(
                      delay: 2,
                      child: Container(
                        width: weight * 0.9,
                        height: height * 0.071,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Login_products.selected == Gender.password ? Login_products.enabled : Login_products.background
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Obx(() => TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onTap: () {
                            Login_products.selected = Gender.password;
                          },
                          controller: pass,
                          decoration: InputDecoration(
                            enabledBorder:  InputBorder.none,
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock_open_outlined, color: Login_products.selected == Gender.password ? Login_products.enabledtxt : Login_products.deaible,),
                            suffixIcon: IconButton(
                              icon: Login_products.password.value ? Icon(Icons.visibility_off,color: Login_products.selected == Gender.password ? Login_products.enabledtxt : Login_products.deaible,): Icon(Icons.visibility, color: Login_products.selected == Gender.password ? Login_products.enabledtxt : Login_products.deaible,),
                              onPressed: () {
                                Login_products.password.value = !Login_products.password.value;
                              }
                            ),
                            hintText: 'パスワード',
                            hintStyle: TextStyle(
                              color: Login_products.selected == Gender.password ? Login_products.enabledtxt : Login_products.deaible
                            ),
                          ),
                          obscureText: Login_products.password.value,
                            style: TextStyle(
                              fontFamily: "Font3",
                              color: Login_products.selected == Gender.password ? Login_products.enabledtxt : Login_products.deaible,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: height * 0.06),
                  FadeAnimation(
                      delay: 3,
                      child: TextButton(
                        onPressed: () {
                          _login();
                        },
                        child: Text("ログイン",style: TextStyle(
                          fontFamily: "Font3",
                          color: Colors.white,letterSpacing: 0.5,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(vertical:  10.0, horizontal: 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )
                        ),
                      )
                  ),
                  SizedBox(height: height * 0.10,),
                  FadeAnimation(delay: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SignInButton.mini(
                              buttonType: ButtonType.google,
                              onPressed: () {}
                          ),
                          SignInButton.mini(
                              buttonType: ButtonType.microsoft,
                              onPressed: () {}
                          ),
                          SignInButton.mini(
                              buttonType: ButtonType.apple,
                              onPressed: () {}
                          ),
                          SignInButton.mini(
                              buttonType: ButtonType.yahoo,
                              onPressed: () {}
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: height * 0.08,),
                  FadeAnimation(
                      delay: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("アカウントを持っていない方 ", style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 0.5, 
                              // decoration: TextDecoration.underline,
                              // decorationThickness: 3
                          )),
                          Text(" ー＞ ", style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 0.5,
                          )),
                          GestureDetector(
                            onTap: (){
                              Get.offNamed('/SignUp');
                            },
                            child: Text("登 録",style: TextStyle(
                                color:  const Color(0xFF0DF5E4).withOpacity(1),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,

                            )),
                          )
                        ],
                      )
                  )
                ],
              ),
            )
        )
      ;
  }

  void _login() {
    Firebase_controller.login(email.text, pass.text);
  }
}
