// import 'package:yuta_admin/widget_trees/coupon_gen_widget_tree.dart';
// import 'package:yuta_admin/widget_trees/discount_widget_tree.dart';
// import 'package:yuta_admin/widget_trees/dp_widget_tree.dart';
// import 'package:yuta_admin/widget_trees/email_widget_tree.dart';
// import 'package:yuta_admin/widget_trees/home_widget_tree.dart';
// import 'package:yuta_admin/widget_trees/off_item_widget_tree.dart';
// import 'package:yuta_admin/widget_trees/order_tree.dart';
// import 'package:yuta_admin/widget_trees/stocks_widget_tree.dart';
//
// import 'drawer/coupon_gen_drawer_page.dart';
// import 'drawer/home_drawer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:get/get.dart';
import 'package:yuta_admin_app/state_manager/home/home_state.dart';

class Actions{
  final IconData actionIcon;
  final String actionTitle;

  Actions(this.actionIcon, this.actionTitle);


}
class DashBoardActions{
  //The drawer's list tiles
  static List <Actions> drawerItems=[
    Actions(FrinoIcons.f_home,"Home"),
    Actions(FrinoIcons.f_chart_line,"Product Stocks"),
    Actions(FrinoIcons.f_mail,"Email SubScribers"),
    Actions(FrinoIcons.f_disk,"Discounts"),
    Actions(FrinoIcons.f_gift,"Coupon Generator"),
    Actions(FrinoIcons.f_free,"50% off Items"),
    Actions(FrinoIcons.f_child,"Chanange Your DP"),
    Actions(FrinoIcons.f_shop,"Orders"),

  ];
  static List <Actions> drawerDropDownItems=[
    Actions(FrinoIcons.f_diamond,"Products"),
    Actions(FrinoIcons.f_exclamation_mark_triangle,"Extras"),

  ];
  static stopProgress(){
    final homeState=Get.find<HomeState>();
    SchedulerBinding.instance!.addPostFrameCallback((_)  {
      homeState.changeLoadingStatusToFalse();
      print("after stop progress ${homeState.is_loading.value}");
    });
  }


  //for handling drawer routings
  static pushToNextRoute(route){
    Future.delayed(Duration(milliseconds:200),(){
      Get.toNamed(route,preventDuplicates: false);

    });
  }

  static  nextRouteHandler(int routeIndex){
    switch(routeIndex){
      case 0:
        pushToNextRoute("/home");
        break;
      case 1:
        pushToNextRoute("/stocks");
        break;
      case 2:
        pushToNextRoute("/subs");
        break;
      case 3:
        pushToNextRoute("/disc");
        break;
        case 4:
      pushToNextRoute("/coupon");
      break;

      case 5:
        pushToNextRoute("/offItems");
        break;
      case 6:
        pushToNextRoute("/changedp");
        break;
      case 7:
        pushToNextRoute("/orders");
        break;
      case 8:
        pushToNextRoute("/product-actions");
        break;
      case 9:
        pushToNextRoute("/dashboard-extras");
        break;
  //
    }
  }




}