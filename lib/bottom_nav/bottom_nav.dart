import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuta_admin_app/state_manager/home/home_state.dart';

import '../consts.dart';
class BottomNavBav extends StatelessWidget {
  final icons;
  final page_index;
  BottomNavBav({
    @required this.icons,
    @required this.page_index
});

  @override
  Widget build(BuildContext context) {
    final homeState=Get.find<HomeState>();
    return  FancyBottomNavigation(
      activeIconColor: Colors.white,
      // barBackgroundColor: Constants.primaryColor,
circleColor:Constants.primaryColor,
      inactiveIconColor:Constants.primaryColor ,

      tabs:icons,
      onTabChangedListener: (position) {
        switch(page_index){
          case 0:
            homeState.changeHomePageIndex(position);
            break;
          case 1:
            homeState.changeStockIndex(position);
            break;
          case 2:
            homeState.changeSubPageIndex(position);
            break;
          case 3:
            homeState.changeDiscountPageIndex(position);
            break;
          case 7:
            homeState.changeOrderIndex(position);
            break;


        }

      },
    );
  }
}
