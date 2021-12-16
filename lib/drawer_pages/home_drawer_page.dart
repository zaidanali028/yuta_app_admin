import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:yuta_admin_app/api_requests/general_stats_request.dart';
import 'package:yuta_admin_app/bottom_sheet/product_bottom_sheet_widget.dart';
import 'package:yuta_admin_app/state_manager/home/home_state.dart';



import '../consts.dart';
import '../dash_board_actions.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';







var drawerItems=DashBoardActions.drawerItems;
var drawerDropDownItems=DashBoardActions.drawerDropDownItems;

var stats_data;
class HomeDrawerPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final homeState=Get.find<HomeState>();
    final stats=Get.find<Stats>();

    stats_data=stats.getCurrentData();
    var product_stocks=stats_data!=null?stats_data["product_stocks"]:"0";
    var email_subscribers=stats_data!=null?stats_data["email_subscribers"]:"0";
    var generated_coupons=stats_data!=null?stats_data["generated_coupons"]:"0";
    var off_items=stats_data!=null?stats_data["off_items"]:"0";
    var orders=stats_data!=null?stats_data["orders"]:"0";








    return Drawer(

      child: SingleChildScrollView(
          child:Padding(
            padding:EdgeInsets.all(Constants.kPadding) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ListTile(
                  title: Text(
                    "Yuta Admin Menu",
                    style: TextStyle(
                      color:Colors.white,

                    ),

                  ),
                  trailing: IconButton(onPressed: (){

                    Get.back();
                  }, icon: Icon(Icons.close,color:Colors.white)),
                ),

                Padding(
                  padding: const EdgeInsets.all(Constants.kPadding),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.pink,
                   backgroundImage: AssetImage("images/1.jpg"),


                        radius: 20,
                        // child: Image.asset("images/1.png"),
                      ),
                      SizedBox(width:10),
                      Text("Kingthriveofficialllllllll",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                  thickness: 0.1,
                ),
                Obx(()=>Center(
                child:homeState.is_loading.value==true? CircularProgressIndicator(
                  color: Colors.white,
                  backgroundColor: Constants.primaryColorLight,
                ):null,
                )),

                Obx(()=>Padding(
                  padding:EdgeInsets.zero,
                  child:homeState.is_loading.value?
                  Divider(
             thickness: 0.3,
                    height: 2.0,
                    color: Colors.white,
                    ):null)),



                ...List.generate(drawerItems.length,(index)=>
    Obx(()=> Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: index==homeState.current_index.value?BorderRadius.circular(20):null,
                              gradient: index==homeState.current_index.value?LinearGradient(
                                  colors:[

                                    Constants.primaryColor.withOpacity(0.9),
                                    Constants.primaryColorLight.withOpacity(0.9),

                                  ]
                              ):null
                          ),
                          child: ListTile(

                            onTap:(){
                              if(homeState.current_index.value!=index){
                                homeState.getPreviousPageIndex(homeState.current_index.value);
                              homeState.changeLoadingStatus();

                              homeState.changePageIndex(index);
                              DashBoardActions.nextRouteHandler(homeState.current_index.value);



                              }else{
                                //meaning you are on the current index's page
                                Get.back();

                              }

                            },
                            title:Text(drawerItems[index].actionTitle,
                              style: TextStyle(
                                  color: Colors.white

                              ),),
                            leading: Padding(
                              child:Icon(
                                drawerItems[index].actionIcon,
                                color: Colors.white,

                              ),
                              padding: EdgeInsets.all(Constants.kPadding,



                              ),

                            ),
                            trailing: index==1?Chip(
                              backgroundColor:homeState.current_index !=1 ?Colors.black:null,



                              label: Text(product_stocks,style: TextStyle(color:Colors.white),),
                            ):index==2?Chip(
                              backgroundColor:homeState.current_index !=2 ?Colors.black:null,



                              label: Text(email_subscribers,style: TextStyle(color:Colors.white),),
                            ):index==4?Chip(
                              backgroundColor:homeState.current_index !=4?Colors.black:null,



                              label: Text(generated_coupons,style: TextStyle(color:Colors.white),),
                            ):index==5?Chip(
                              backgroundColor:homeState.current_index !=5 ?Colors.black:null,

                              //

                              label: Text(off_items,style: TextStyle(color:Colors.white),),
                            )
                                :index==7?Chip(
                              backgroundColor:homeState.current_index !=7  ?Colors.black:null,

                              //

                              label: Text(orders,style: TextStyle(color:Colors.white),),
                            ):null,
                          ),
                        ),
                        const Divider(

                          color:Colors.white,
                          thickness: 0.1,
                        )
                      ],

                    ))),
                const Padding(
                    padding: EdgeInsets.all(Constants.kPadding*2),
                  child: Text("Miscellaneous",style: TextStyle(
                    color: Colors.white
                  ),),

                ),
                Divider(
                  color: Colors.white,
                  thickness: 0.1,
                ),

                ...List.generate(


                    drawerDropDownItems.length,(index)=>
                    Obx(()=> Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: index+8==homeState.current_index.value?BorderRadius.circular(20)
                                 :null,
                              gradient: index+8==homeState.current_index.value?LinearGradient(
                                  colors:[
                                    Constants.primaryColor.withOpacity(0.9),
                                    Constants.primaryColorLight.withOpacity(0.9),
                                  ]
                              ):null
                          ),
                          child: ListTile(
                            trailing: Icon(
                                FrinoIcons.f_arrow_down,
                              color:Colors.white
                            ),

                            onTap:(){

                                // homeState.changePageIndex(index+8);
                              if(homeState.current_index.value!=index+8) {
                                homeState.getPreviousPageIndex(
                                    homeState.current_index.value);
                                homeState.changeLoadingStatus();

                                homeState.changePageIndex(index + 8);
                                DashBoardActions.nextRouteHandler(
                                    homeState.current_index.value);
                              }
                              // else if(homeState.current_index.value!=index+9) {
                              //   homeState.getPreviousPageIndex(
                              //       homeState.current_index.value);
                              //   homeState.changeLoadingStatus();
                              //
                              //   homeState.changePageIndex(index + 9);
                              //   DashBoardActions.nextRouteHandler(
                              //       homeState.current_index.value);
                              // }
                              else{
                                // Get.to(ProductActionsPage2());
                                // Navigator.of(context).push(ProductActionsPage2());
                                DashBoardActions.nextRouteHandler(
                                    homeState.current_index.value);
                              }






                                //meaning you are on the current index's page
                                // Get.back();
                                // ProductBottomSheet();





                                // DashBoardActions.nextRouteHandler(homeState.current_index.value);



                              }

                            // }
                            ,
                            title:Text(drawerDropDownItems[index].actionTitle,
                              style: TextStyle(
                                  color: Colors.white

                              ),),
                            leading: Padding(
                              child:Icon(
                                drawerDropDownItems[index].actionIcon,
                                color: Colors.white,

                              ),
                              padding: EdgeInsets.all(Constants.kPadding,



                              ),

                            ),

                          ),

                        )
                      ],

                    )))

              ],
            ),
          )

      ),
    );
  }


}