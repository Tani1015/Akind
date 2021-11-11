import 'package:get/get.dart';

//クラスインポート
import 'package:akindo/screens/login_page.dart';
import 'package:akindo/screens/signup_page.dart';

class GetRoutes {
  static final pages = [
    GetPage(name: '/Login', page: () => LoginPage()),
    GetPage(name: '/SignUp', page: () => SignUpPage()),
  ];
}