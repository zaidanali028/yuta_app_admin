import 'package:flutter/material.dart';
import 'package:yuta_admin_app/pages/notifications_page.dart';
import 'package:yuta_admin_app/state_manager/home/dashboard_extras_controller.dart';
import 'package:yuta_admin_app/state_manager/home/home_state.dart';
import 'package:yuta_admin_app/state_manager/home/product_controller.dart';

import '../consts.dart';

import 'package:frino_icons/frino_icons.dart';

import 'bottom_nav_top_intro.dart';
import 'package:get/get.dart';







final homeState=Get.find<HomeState>();
final productController=Get.find<ProductsController>();
final dashboardExtrasController=Get.find<DashBoardExtrasController>();




class AppBarWidget extends StatelessWidget {
  get_current_Index(){
    switch(page_index){
      case 0:
      return homeState.home_phone_index.value;
      case 1:
      return homeState.stock_phone_index.value;
      case 2:
      return homeState.sub_phone_index.value;
      case 3:
      return homeState.disc_phone_index.value;
      case 4:
        return homeState.coupon_phone_index.value;
      case 5:
        return homeState.off_items_phone_index.value;
      case 6:
        return homeState.dp_phone_index.value;
      case 7:
        return homeState.order_phone_index.value;
      case 8:
        return productController.getCurrentPage(productController.selected_action);
      case 9:
        return dashboardExtrasController.getCurrentPage(dashboardExtrasController.selected_action);


    }


  }
  final button_names;
  final page_index;
  AppBarWidget({
    @required this.button_names,
    @required this.page_index
});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          // top: BorderSide(width: 16.0, color: Colors.white.withOpacity(0.5)),
          bottom: BorderSide(width: 1.5, color: Colors.white.withOpacity(0.5)),
        ),
        color: Constants.primaryColor,
      ),


      child: Row(
        children: [

          IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              iconSize: 30,
              color: Colors.white,
              icon: Icon(Icons.menu)
          ),

          Spacer(),


          Padding(
              padding: EdgeInsets.all(Constants.kPadding),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    page_index==8? GetBuilder<ProductsController>(
    builder:(_)=>Text(button_names[get_current_Index()].actionTitle)):page_index==9? GetBuilder<DashBoardExtrasController>(
                        builder:(_)=>Text(button_names[get_current_Index()].actionTitle)):Obx(()=>Text(button_names[get_current_Index()].actionTitle,style:
                    TextStyle(color:Colors.white))),
                    Container(
                      margin:EdgeInsets.all(Constants.kPadding/2),
                      width:60,
                      height:2,
                      decoration:BoxDecoration(
                          gradient:
                          LinearGradient(
                              colors: [
                                Constants.redDark,
                                Constants.orangeDark
                              ]
                          )
                      ) ,
                    ),
                  ]   )),
          Spacer(),
          RightNavItems()





        ],
      ),

    );
  }

  Widget RightNavItems(){
    return Row(
        children:[
          IconButton(
              iconSize: 30,
              onPressed:(){

              },icon:Icon(FrinoIcons.f_search,size:25,color:Colors.white)),


          Stack(
            children: [
              IconButton(
                  iconSize: 30,
                  onPressed:(){
                    Get.to(
                      NotificationsPage(),
                      fullscreenDialog:true,
                      );

                  },icon:Icon(Icons.notifications_none_outlined,color:Colors.white)),
              Positioned(
                right:6,
                top:6,

                child: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 10,
                  child: Text("9+",style: TextStyle(color:Colors.white,fontSize: 10),),
                ),
              )
            ],

          ),
          IconButton(
              iconSize: 25,
              onPressed:(){

              },icon:Icon(
              FrinoIcons.f_logout,    size:25,
              color:Colors.white)),

            Container(
              margin: EdgeInsets.all(Constants.kPadding),
              height:double.infinity,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 0),
                      spreadRadius: 1,


                    ),

                  ],
                  shape: BoxShape.circle

              ),
              child: CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 20,
                //for displaying user profile
                child: Image.asset("images/2.jpg"),
              ),
            ),


        ]
    );
  }

}
