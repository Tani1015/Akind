import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_button/sign_button.dart';

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
      
      backgroundColor: Color.fromRGBO(235, 177, 243, 1),

      body: SingleChildScrollView(
        child: Expanded(
          flex: 1,
            child:SizedBox(
              width: weight,
              height: height,

              child: Column(
                children: <Widget> [
                  SizedBox(height: 70),
                  //画像配置
                  FadeAnimation(
                    delay: 1,
                    child:Container(
              

                      width: 230,

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('images/akind.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  //以下フェードインアニメーション　ログイン文字
                  FadeAnimation(
                    delay: 2,
                    child:Container(
                      margin: const EdgeInsets.only(right: 230.0),
                      child: Text("ログイン",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          letterSpacing: 0.5
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: height * 0.005,
                  ),

                  FadeAnimation(
                    delay: 2,
                    child: Container(
                      margin: const EdgeInsets.only(right: 146.0),
                      child: Text("ユーザ情報を入力してください",
                          style: TextStyle(
  :@                            letterSpacing: 0.5
                          ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: height * 0.025,
                  ),

                  FadeAnimation(
                    delay: 3,
                    child: Container(
                      width: weight * 0.7,
                      height: height * 0.061,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: products.selected == Gender.Email ? products.enabled : products.background,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        onTap: () {
                          products.emailselect();
                        },
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.account_circle_outlined,color: products.selected == Gender.Email ? products.enabledtxt : products.deaible,),
                          hintText: 'メールか電話番号を入力してください',
                          hintStyle: TextStyle(
                            color: products.selected == Gender.Email ? products.enabledtxt : products.deaible,
                          ),
                      ),
                        style: TextStyle(
                          color: products.selected == Gender.Email ? products.enabledtxt : products.deaible,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02,),

                  FadeAnimation(
                      delay: 3,
                      child: Container(
                        width: weight * 0.9,
                        height: height * 0.071,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: products.selected == Gender.password ? products.enabled : products.background
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onTap: () {
                            products.selected = Gender.password;
                          },
                          decoration: InputDecoration(
                            enabledBorder:  InputBorder.none,
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock_open_outlined, color: products.selected == Gender.password ? products.enabledtxt : products.deaible,),
                            suffixIcon: IconButton(
                              icon: products.password ? Icon(Icons.visibility_off,color: products.selected == Gender.password ? products.enabledtxt : products.deaible,): Icon(Icons.visibility, color: products.selected == Gender.password ? products.enabledtxt : products.deaible,),
                              onPressed: () => products.passwordselect(),
                            ),
                            hintText: 'パスワード',
                            hintStyle: TextStyle(
                              color: products.selected == Gender.password ? products.enabledtxt : products.deaible
                            ),
                          ),
                          obscureText: products.password,
                            style: TextStyle(
                              color: products.selected == Gender.password ? products.enabledtxt : products.deaible,
                              fontWeight: FontWeight.bold
                            ),
                        ),
                      ),
                  ),
                  SizedBox(height: height * 0.05),
                  FadeAnimation(
                      delay: 4,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("ログイン",style: TextStyle(
                          color: Colors.black,letterSpacing: 0.5,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),),
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromRGBO(136 , 255, 227, 1),
                          padding: const EdgeInsets.symmetric(vertical:  10.0, horizontal: 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )
                        ),
                      )
                  ),
                  SizedBox(height: height * 0.06,),
                  FadeAnimation(delay: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SignInButton.mini(
                              buttonType: ButtonType.google,
                              onPressed: () {}
                          ),
                          SignInButton.mini(
                              buttonType: ButtonType.amazon,
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
                  SizedBox(height: height * 0.053,),
                  FadeAnimation(
                      delay: 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("アカウントを持っていない方 ", style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 0.5, 
                              decoration: TextDecoration.underline,
                              decorationThickness: 3
                          )),
                          GestureDetector(
                            onTap: (){
                              Get.toNamed('/SignUp');
                            },
                            child: Text(" -> 登録",style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
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
        ),
      ),
    );
  }
}
