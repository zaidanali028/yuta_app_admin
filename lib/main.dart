import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuta_admin_app/routes/routes.dart';
import 'package:yuta_admin_app/state_manager/home/dashboard_extras_controller.dart';
import 'package:yuta_admin_app/state_manager/home/home_state.dart';
import 'package:yuta_admin_app/state_manager/home/product_controller.dart';
import 'package:yuta_admin_app/widget_trees/coupon_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/discount_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/dp_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/home_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/off_items_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/stocks_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/subscriber_widget_tree.dart';

import 'api_requests/general_stats_request.dart';
import 'consts.dart';
import 'dummy.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final homeState=Get.put(HomeState());
    final getStats=Get.put(Stats());
    final productState=Get.put(ProductsController());
    final dashboardExtrasController=Get.put(DashBoardExtrasController());


    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title:"Yuta DashBoard",

        theme:ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Constants.primaryColor,
            canvasColor:Colors.transparent
        ),
      // initialRoute: "/dummy",
      initialRoute: "/home",
      getPages: Routes.route_list,



    );
  }
}


