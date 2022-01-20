import 'package:akindo/providers/controller/route_controller.dart';
import 'package:akindo/screens/home_page.dart';
import 'package:akindo/screens/listing_page.dart';
import 'package:akindo/screens/recommend_page.dart';
import 'package:akindo/screens/search_page.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BottomRoutes extends StatelessWidget{

  var floatingNavigationItem = [
    DotNavigationBarItem(icon: Icon(Icons.update),selectedColor: Colors.redAccent),
    DotNavigationBarItem(icon: Icon(Icons.search_outlined), selectedColor: Colors.redAccent),
    DotNavigationBarItem(icon: Icon(Icons.add), selectedColor: Colors.redAccent),
    DotNavigationBarItem(icon: Icon(Icons.home), selectedColor: Colors.redAccent)
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
          extendBody: true,
          bottomNavigationBar: DotNavigationBar(
            currentIndex: controller.tappedIndex,
            onTap: controller.changeTabIndex,
            items: floatingNavigationItem,
            dotIndicatorColor: Colors.redAccent,
            backgroundColor: Colors.black12,
          )
        );
      }
    );
  }
}