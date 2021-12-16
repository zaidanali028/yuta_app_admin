

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
  HomePanelLeft(),
  HomePanelLeft(),
  HomePanelLeft(),


];

List<TabData> icons = [
  TabData(iconData: Icons.check, title: "Delivered"),
  TabData(iconData: Icons.seventeen_mp_sharp, title: "Yet to deliver"),
  TabData(iconData: Icons.close, title: "Not processed"),
  TabData(iconData: Icons.eleven_mp_rounded, title: "pending"),

];
List <BottomNavItemsIntro> buttons=[
  BottomNavItemsIntro(icons[0].title),
  BottomNavItemsIntro(icons[1].title),
  BottomNavItemsIntro(icons[2].title),
  BottomNavItemsIntro(icons[3].title),

];



class OrdersPage extends StatelessWidget {

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
      body:SafeArea(child:Obx(()=>phone_views[homeState.order_phone_index.value])),
        //**The utilizaton**//

        drawer: drawerToUse,





        appBar:PreferredSize(
          preferredSize:Size(Constants.app_bar_width,Constants.app_bar_height),
          child: AppBarWidget(page_index: 7,
            button_names: buttons,
          ),
        ),
        bottomNavigationBar:icons.length>=2||buttons.length>=2? BottomNavBav(
          icons: icons,
          page_index: 7,

        ):null





    ));



  }
}
