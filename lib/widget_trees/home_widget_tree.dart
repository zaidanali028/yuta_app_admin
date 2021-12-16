

//This will be the main(home widget tree)
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/scheduler.dart';
import 'package:yuta_admin_app/Panels/home_page_panels/home_panel_center.dart';
import 'package:yuta_admin_app/Panels/home_page_panels/home_panel_left.dart';
import 'package:yuta_admin_app/Panels/home_page_panels/home_panel_right.dart';
import 'package:yuta_admin_app/app_bar/bottom_nav_top_intro.dart';
import 'package:yuta_admin_app/app_bar/home_app_bar_widget.dart';
import 'package:yuta_admin_app/bottom_nav/bottom_nav.dart';
import 'package:yuta_admin_app/drawer_pages/home_drawer_page.dart';
import 'package:get/get.dart';
import 'package:yuta_admin_app/state_manager/home/home_state.dart';

import '../consts.dart';
import '../dash_board_actions.dart';


//the lenght of phone views and that of the button should be the same
var phone_views=[
  HomePanelLeft(),
  HomePanelRight(),

];
List<TabData> icons = [
  TabData(iconData: Icons.home, title: "Home"),
  TabData(iconData: Icons.search, title: "Search"),

];


List <BottomNavItemsIntro> buttons=[
  BottomNavItemsIntro("Home Overview"),
  BottomNavItemsIntro("Home Analysis"),

];

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var drawerToUse=HomeDrawerPage();
    DashBoardActions.stopProgress();


    return WillPopScope(
      onWillPop: (){
        homeState.changePageIndexToPrevious(homeState.previous_index.value);
        Get.toNamed(Get.previousRoute);

        return Future<bool>.value(false);
      },

      child: Scaffold(
        body:SafeArea(child:Obx(()=>phone_views[homeState.home_phone_index.value])),
          //**The utilizaton**//

          drawer: drawerToUse,



          appBar:PreferredSize(
            preferredSize:Size(Constants.app_bar_width,Constants.app_bar_height),
            child: AppBarWidget(
              page_index: 0,
              button_names: buttons,
            ),
          ),
        // bottomNavigationBar: FancyBottomNavigation(
        //
        //   tabs:_icons,
        //   onTabChangedListener: (position) {
        //     homeState.changeHomePageIndex(position);
        //   },
        // ),
          bottomNavigationBar:icons.length>=2||buttons.length>=2? BottomNavBav(
            icons: icons,
            page_index: 0,

          ):null




      ),
    );



  }
}
