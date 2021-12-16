

//This will be the main(home widget tree)
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:yuta_admin_app/Panels/home_page_panels/home_panel_center.dart';
import 'package:yuta_admin_app/Panels/home_page_panels/home_panel_left.dart';
import 'package:yuta_admin_app/Panels/home_page_panels/home_panel_right.dart';
import 'package:yuta_admin_app/app_bar/bottom_nav_top_intro.dart';
import 'package:yuta_admin_app/app_bar/home_app_bar_widget.dart';
import 'package:yuta_admin_app/bottom_nav/bottom_nav.dart';
import 'package:yuta_admin_app/drawer_pages/home_drawer_page.dart';
import 'package:get/get.dart';

import '../consts.dart';
import '../dash_board_actions.dart';


var phone_views=[
  HomePanelLeft(),


];

// List<TabData> icons = [
//   TabData(iconData: Icons.home, title: "Home"),
//   TabData(iconData: Icons.home, title: "Home"),
//   TabData(iconData: Icons.home, title: "Home"),
//   TabData(iconData: Icons.home, title: "Home"),
//
// ];
List <BottomNavItemsIntro> buttons=[
  BottomNavItemsIntro("Off Items Page"),

];



class DpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var drawerToUse=HomeDrawerPage();
    DashBoardActions.stopProgress();



    return
      WillPopScope(
        onWillPop: (){
      homeState.changePageIndexToPrevious(homeState.previous_index.value);
      Get.toNamed(Get.previousRoute);
      return Future<bool>.value(false);
    },

    child:
    Scaffold(
      body:SafeArea(child:Obx(()=>phone_views[homeState.dp_phone_index.value])),
        //**The utilizaton**//

        drawer: drawerToUse,





        appBar:PreferredSize(
          preferredSize:Size(Constants.app_bar_width,Constants.app_bar_height),
          child: AppBarWidget(page_index: 6,
            button_names: buttons,
          ),
        ),





    ));



  }
}
