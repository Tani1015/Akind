import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

//クラスインポート
import 'package:akindo/screens/first_page.dart';
import 'screens/login_page.dart';
import 'screens/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      //route管理
      getPages: [
        GetPage(name: '/Login', page: () => LoginPage()),
        GetPage(name: '/SignUp', page: () => SignUpPage())
      ],

      home: FirstPage(),
    );
  }
}
