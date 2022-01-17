import 'package:get/get.dart';

class RouteController extends GetxController{
  var tappedIndex = 0;

  void changeTabIndex(int index) {
    tappedIndex = index;
    update();
  }
}
