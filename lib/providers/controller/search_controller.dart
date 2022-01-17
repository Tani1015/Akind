import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController with SingleGetTickerProviderMixin{
  late TabController tabController;

  void onInit() {
    tabController = TabController(vsync: this, length: 5);
    super.onInit();
  }
}