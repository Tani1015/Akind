import 'package:akindo/providers/controller/route_controller.dart';
import 'package:akindo/screens/home_page.dart';
import 'package:akindo/screens/listing_page.dart';
import 'package:akindo/screens/recommend_page.dart';
import 'package:akindo/screens/search_page.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BottomRoutes extends StatelessWidget{

  var bottomNavigationItem = [
    BottomNavyBarItem(icon: Icon(Icons.update), title: Text('おすすめ')),
    BottomNavyBarItem(icon: Icon(Icons.search_outlined), title: Text('探す')),
    BottomNavyBarItem(icon: Icon(Icons.add), title: Text('出品')),
    BottomNavyBarItem(icon: Icon(Icons.home), title: Text('ホーム'))
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RouteController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
              index: controller.tappedIndex,
              children: [
                RecommendPage(),
                SearchPage(),
                ListingPage(),
                HomePage()
              ],
            ),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: controller.tappedIndex,
            onItemSelected: controller.changeTabIndex,
            items: bottomNavigationItem,
          )
        );
      }
    );
  }
}