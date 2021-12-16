// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:yuta_admin_app/state_manager/home/home_state.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:yuta_admin_app/state_manager/home/product_controller.dart';
//
// import 'api_requests/bottom_sheet/product_bottom_sheet.dart';
// import 'consts.dart';
//
//
// class Dummy extends StatelessWidget {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final productController=Get.find<ProductsController>();
//
//
//
//
//
//     return Scaffold(
//       body: Container(
//         color:Colors.black,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Container(
//                 height: MediaQuery.of(context).size.height/1.2,
//                 decoration: BoxDecoration(
//                   // color:Colors.white,
//                     gradient: LinearGradient(
//                         colors:[
//                           Constants.primaryColor.withOpacity(0.9),
//                           Constants.primaryColorLight.withOpacity(0.9),
//
//
//                         ]),
//                     borderRadius:BorderRadius.only(
//                       topLeft: Radius.circular(15),
//                       topRight: Radius.circular(15),
//
//                     )
//
//
//                 ),
//                 child:Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top:20.0,),
//                       child: Text("Products Controller",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                         color:Colors.white,fontSize: 25
//                       ),),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child: Divider(
//                         color: Colors.white.withOpacity(0.5),
//                         thickness: 1.0,
//                       ),
//                     ),
//
//                     YutaRadio(
//                       subtitle: "This allows you to add a new product to our list of "
//                           "already exsisting products",
//                       index: 0,
//                     ),
//                     Spacer(),
//                     YutaRadio(
//                       subtitle: "You can also add a new category by selecting this option",
//                       index: 1,
//                     ),
//                     Spacer(),
//
//                     YutaRadio(
//                       subtitle: "You can edit exsisting categories by selecting this option",
//                       index: 2,
//                     ),
//                     Spacer(),
//
//                     YutaRadio(
//                       subtitle: "View Yutamart's current catalogue",
//                       index: 3,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                       child: Divider(
//                         color: Colors.white.withOpacity(0.5),
//                         thickness: 1.0,
//
//                       ),
//                     ),
//                     Expanded(
//
//                         child: Padding(
//                           padding: const EdgeInsets.only(right:20.0,left:20.0,bottom:5.0),
//                           child: InkWell(
//                             onTap: (){
//                               print("Selected... ${productController.selected_action}");
//
//                             },
//                             child: Container(
//                               alignment: Alignment.center,
//
//                               color: Colors.black,
//                               child: Text(
//                                 "OK",style: TextStyle(color:Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//
//
//                     )
//
//
//                   ],
//                 )
//             ),
//           ],
//         ),
//       ),
//     );
//
//   }
//
// }
//
//
//
