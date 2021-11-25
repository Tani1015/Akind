import 'package:get/get.dart';

//クラスインポート
import 'package:akindo/providers/controller/home_controller.dart';
import 'package:akindo/providers/controller/listing_controller.dart';
import 'package:akindo/providers/controller/recommend_controller.dart';
import 'package:akindo/providers/controller/route_controller.dart';
import 'package:akindo/providers/controller/search_controller.dart';

class BottomRoutes_Binding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<RouteController>(() => RouteController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ListingController>(() => ListingController());
    Get.lazyPut<RecommendController>(() => RecommendController());
    Get.lazyPut<SearchController>(() => SearchController());
  }
}