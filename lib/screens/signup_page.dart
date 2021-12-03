import 'package:akindo/providers/controller/firebase_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//クラスインポート
import 'package:akindo/attach/animation/animation.dart';
import 'package:akindo/providers/data/signup_data.dart';

class SignUpPage extends GetWidget<FirebaseController>{

  final name = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  final firebase_controller = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {

    //端末ごとの高さと横幅を取得
    final weight = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;


    final products = Get.put(SignUp_Product());


    return Scaffold(
      backgroundColor: Color.fromRGBO(198, 241, 232, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          width: weight,
          height: height,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height * 0.05,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: weight * 0.04),
                  child: const Icon(Icons.arrow_back_outlined,color: Colors.white,size: 35.0,),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),

              FadeAnimation(
                delay: 1,
                child:Container(
                  child: Image.asset('images/icon&logo.png'),
                ),
              ),
              // FadeAnimation(
              //   delay: 1,
              //   child: Container(
              //     margin: const EdgeInsets.only(right: 80.0),
              //     child: Text("アカウント登録",style: TextStyle(
              //         color: Colors.blueGrey,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 35,
              //         letterSpacing: 2
              //     ),
              //     ),
              //   ),
              // ),
              // FadeAnimation(
              //   delay: 1,
              //   child: Container(
              //     margin: const EdgeInsets.only(right: 130.0),
              //     child: Text("ユーザ情報を入力してください",style: TextStyle(
              //         color: Colors.blueGrey,
              //         letterSpacing: 1),
              //     ),
              //
              //   ),
              // ),
              SizedBox(
                  height: height * 0.05
              ),
              FadeAnimation(
                delay: 2,
                child: Container(
                  width: weight * 0.9,
                  height:height * 0.071,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: products.selected == Gender.fullname ?  products.enabled : products.background,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child:  TextField(
                    controller: name,
                    onTap: (){
                      products.nameselect();
                    },
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      border:InputBorder.none,
                      prefixIcon: Icon(Icons.person_outlined,color: products.selected == Gender.fullname ? products.enabledtxt : products.deaible,),
                      hintText: 'ニックネーム',
                      hintStyle: TextStyle(
                        color:  products.selected == Gender.fullname ? products.enabledtxt : products.deaible,
                      ),
                    ),
                    style:  TextStyle(color:  products.selected == Gender.fullname ? products.enabledtxt : products.deaible,fontWeight:FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),

              FadeAnimation(
                delay: 2,
                child: Container(
                  width: weight * 0.9,
                  height:height * 0.071,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: products.selected == Gender.Email ?  products.enabled : products.background,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child:  TextField(
                    controller: email,
                    onTap: (){
                      products.emailselect();
                    },
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      border:InputBorder.none,
                      prefixIcon: Icon(Icons.email_outlined,color: products.selected == Gender.Email ? products.enabledtxt : products.deaible,),
                      hintText: 'eメール',
                      hintStyle: TextStyle(
                        color:  products.selected == Gender.Email ? products.enabledtxt : products.deaible,
                      ),
                    ),
                    style:  TextStyle(color:  products.selected == Gender.Email ? products.enabledtxt : products.deaible,fontWeight:FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              FadeAnimation(
                delay: 2,
                child: Container(
                  width: weight * 0.9,
                  height:height * 0.071,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: products.selected == Gender.password ? products.enabled : products.background
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Obx (() => TextField(
                    controller: pass,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onTap: (){
                      products.passselect();
                    },
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border:InputBorder.none,
                        prefixIcon: Icon(Icons.lock_open_outlined,color: products.selected == Gender.password ? products.enabledtxt : products.deaible,),
                        suffixIcon: IconButton(
                          icon: products.password.value ?  Icon(Icons.visibility_off,color: products.selected == Gender.password ? products.enabledtxt : products.deaible,): Icon(Icons.visibility,color: products.selected == Gender.password ? products.enabledtxt : products.deaible,) ,
                          onPressed: () {
                            products.password.value = !products.password.value;
                          }
                        ),
                        hintText: 'パスワード',
                        hintStyle: TextStyle(
                            color: products.selected == Gender.password ? products.enabledtxt : products.deaible
                        )
                    ),
                    obscureText: products.password.value,
                    style:  TextStyle(color: products.selected == Gender.password ? products.enabledtxt : products.deaible,fontWeight:FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              FadeAnimation(
                delay: 2,
                child: Container(
                  width: weight * 0.9,
                  height:height * 0.071,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: products.selected == Gender.confirmpassword ? products.enabled : products.background
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Obx( () => TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onTap: (){
                      products.confpassselect();
                    },
                    decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        border:InputBorder.none,
                        prefixIcon: Icon(Icons.lock_open_outlined,color: products.selected == Gender.confirmpassword ? products.enabledtxt : products.deaible,),
                        suffixIcon: IconButton(
                          icon: products.confpassword.value ?  Icon(Icons.visibility_off,color: products.selected == Gender.confirmpassword ? products.enabledtxt : products.deaible,): Icon(Icons.visibility,color: products.selected == Gender.confirmpassword ? products.enabledtxt : products.deaible,) ,
                            onPressed: () {
                              products.confpassword.value = !products.confpassword.value;
                            }
                          ),
                        hintText: '確認用パスワード',
                        hintStyle: TextStyle(
                            color: products.selected == Gender.confirmpassword ? products.enabledtxt : products.deaible
                        )
                    ),
                    obscureText: products.confpassword.value ,
                    style:  TextStyle(color: products.selected == Gender.confirmpassword ? products.enabledtxt : products.deaible,fontWeight:FontWeight.bold),
                  ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.07,
              ),
              FadeAnimation(
                delay: 3,
                child: TextButton(
                    onPressed: (){
                      RegisterUser();
                    },
                    child: Text("アカウント登録",style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 0.5,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),),
                    style:  TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 80),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        )
                    )
                ),
              ),
              SizedBox(
                  height: height * 0.09
              ),
              FadeAnimation(
                delay: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text("アカウントをお持ちの方 ー＞ ",style: TextStyle(
                      color:   Colors.blueGrey,
                      letterSpacing: 0.5,
                    )),
                    GestureDetector(
                      onTap: (){
                        Get.offNamed("/Login");
                      },
                      child: Text("ログイン",style: TextStyle(
                        color:  const Color(0xFF0DF5E4).withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void RegisterUser() {
    firebase_controller.createUser(name.text, email.text, pass.text);
  }

}