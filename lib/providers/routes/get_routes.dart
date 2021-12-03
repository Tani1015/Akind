import 'package:akindo/providers/routes/bottom_routes.dart';
import 'package:get/get.dart';

//クラスインポート
import 'package:akindo/screens/login_page.dart';
import 'package:akindo/screens/signup_page.dart';
import 'package:akindo/screens/home_page.dart';
import 'package:akindo/screens/listing_page.dart';
import 'package:akindo/screens/recommend_page.dart';
import 'package:akindo/screens/search_page.dart';
import 'package:akindo/screens/splash_screen.dart';

//バインディングインポート
import 'package:akindo/providers/binding/bottom_routes_binding.dart';

class GetRoutes {
  static final pages = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/Login', page: () => LoginPage()),
    GetPage(name: '/SignUp', page: () => SignUpPage()),
    GetPage(name: '/Routes', page: () => BottomRoutes(), binding: BottomRoutes_Binding()),
    GetPage(name: '/Recommend', page: () => RecommendPage()),
    GetPage(name: '/Search', page: () => SearchPage()),
    GetPage(name: '/Listing', page: () => ListingPage()),
    GetPage(name: '/Home', page: () => HomePage()),
  ];
}