import 'package:get/get.dart';
import 'package:yuta_admin_app/pages/notifications_page.dart';
import 'package:yuta_admin_app/widget_trees/coupon_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/discount_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/dp_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/extras_actions_dropdown_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/home_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/off_items_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/orders_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/product_actions_dropdown_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/stocks_widget_tree.dart';
import 'package:yuta_admin_app/widget_trees/subscriber_widget_tree.dart';

import '../dummy.dart';

class Routes{
   static final route_list=[
     // GetPage(name: "/dummy",page: ()=>Dummy()),

     GetPage(name: "/home",page: ()=>HomePage()),
   GetPage(name: "/stocks",page: ()=>StocksPage()),
   GetPage(name: "/subs",page: ()=>SubscribersPage()),
   GetPage(name: "/disc",page: ()=>DiscountPage()),
   GetPage(name: "/coupon",page: ()=>CouponsPage()),
   GetPage(name: "/offItems",page: ()=>OffItemsPage()),
   GetPage(name: "/changedp",page: ()=>DpPage()),
  GetPage(name: "/orders",page: ()=>OrdersPage()),
     GetPage(name: "/product-actions",page: ()=>ProductActionsPage()),
     GetPage(name: "/dashboard-extras",page: ()=>ExtrasDropDown()),
     GetPage(name: "/notifications",page: ()=>NotificationsPage()),






   ];
}