

//This will be the main(home widget tree)
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yuta_admin_app/Panels/home_page_panels/home_panel_center.dart';
import 'package:yuta_admin_app/Panels/home_page_panels/home_panel_left.dart';
import 'package:yuta_admin_app/Panels/home_page_panels/home_panel_right.dart';

import 'package:yuta_admin_app/app_bar/bottom_nav_top_intro.dart';
import 'package:yuta_admin_app/app_bar/home_app_bar_widget.dart';
import 'package:yuta_admin_app/bottom_nav/bottom_nav.dart';
import 'package:yuta_admin_app/bottom_sheet/extras_bottom_sheet_widget.dart';
import 'package:yuta_admin_app/bottom_sheet/product_bottom_sheet_widget.dart';
import 'package:yuta_admin_app/drawer_pages/home_drawer_page.dart';
import 'package:get/get.dart';
import 'package:yuta_admin_app/state_manager/home/dashboard_extras_controller.dart';
import 'package:yuta_admin_app/state_manager/home/product_controller.dart';

import '../consts.dart';
import '../dash_board_actions.dart';


var phone_views=[
  Container(
      height:500,
      child:Text("Extra 1")
  ),Container(
      height:500,
      child:Text("Extra 2")
  )


];

// List<TabData> icons = [
//   TabData(iconData: Icons.home, title: "Home"),
//   TabData(iconData: Icons.home, title: "Home"),
//   TabData(iconData: Icons.home, title: "Home"),
//   TabData(iconData: Icons.home, title: "Home"),
//
// ];
List <BottomNavItemsIntro> buttons=[
  BottomNavItemsIntro("Ex 1"),
  BottomNavItemsIntro("Ex 2"),


];



class ExtrasDropDown extends StatelessWidget {

  // "Add New Product",
  // "Add A New Category",
  // "Edit Categories",
  // "View Produts",
  @override
  Widget build(BuildContext context) {
    final dashboardExtrasController=Get.find<DashBoardExtrasController>();

    // print("productController.selected_action ${productController.selected_action}");



    var drawerToUse=HomeDrawerPage();
    // DashBoardActions.stopProgress();
    SchedulerBinding.instance!.addPostFrameCallback((_)  {
      homeState.changeLoadingStatusToFalse();

      showModalBottomSheet<dynamic>(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext bc) {
            return Wrap(
                children: <Widget>[
                  ExtrasBottomSheet()

                ]
            );
          }
      );

    });



    return
      WillPopScope(
        onWillPop: (){
      homeState.changePageIndexToPrevious(homeState.previous_index.value);
      Get.toNamed(Get.previousRoute);
      return Future<bool>.value(false);
    },

    child:
    Scaffold(
      body:SafeArea(
          // child:phone_views[productController.getCurrentPage(productController.selected_action)]
        child:  GetBuilder<DashBoardExtrasController>(
    builder:(_)=>phone_views[dashboardExtrasController.getCurrentPage(dashboardExtrasController.selected_action)]),

      ),
        //**The utilizaton**//

        drawer: drawerToUse,





        appBar:PreferredSize(
          preferredSize:Size(Constants.app_bar_width,Constants.app_bar_height),
          child: AppBarWidget(page_index: 9,
            button_names: buttons,
          ),
        ),





    ));



  }
}
