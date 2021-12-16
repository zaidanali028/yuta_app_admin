import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:yuta_admin_app/bottom_sheet/product_bottom_sheet.dart';
import 'package:yuta_admin_app/state_manager/home/product_controller.dart';

import '../consts.dart';
class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController=Get.find<ProductsController>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            height: MediaQuery.of(context).size.height/1.2,
            decoration: BoxDecoration(
              // color:Colors.white,
                gradient: LinearGradient(
                    colors:[
                      Constants.primaryColor.withOpacity(0.9),
                      Constants.primaryColorLight.withOpacity(0.9),


                    ]),
                borderRadius:BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),

                )


            ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                Padding(
                  padding: const EdgeInsets.only(top:20.0,),
                  child: Text("Products Controller",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color:Colors.white,fontSize: 25
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    color: Colors.white.withOpacity(0.5),
                    thickness: 1.0,
                  ),
                ),

                YutaRadio(
                  subtitle: "This allows you to add a new product to our list of "
                      "already exsisting products",
                  index: 0,
                ),
                Spacer(),
                YutaRadio(
                  subtitle: "You can also add a new category by selecting this option",
                  index: 1,
                ),
                Spacer(),

                YutaRadio(
                  subtitle: "You can edit exsisting categories by selecting this option",
                  index: 2,
                ),
                Spacer(),

                YutaRadio(
                  subtitle: "View Yutamart's current catalogue",
                  index: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    color: Colors.white.withOpacity(0.5),
                    thickness: 1.0,

                  ),
                ),
                Expanded(

                  child: Padding(
                    padding: const EdgeInsets.only(right:20.0,left:20.0,bottom:5.0),
                    child: InkWell(
                      onTap: (){
                        print("Selected... ${productController.is_loading}");
                        productController.toggleLoadingToTrue();

                       Future.delayed(Duration(milliseconds:1000),(){
                         Get.back();
                         productController.toggleLoadingToFalse();
                         print("Selected[NOW]... ${productController.is_loading}");
                       }
                       );






                      },
                      child: Container(
                        alignment: Alignment.center,

                        color: Colors.black,
                        child:GetBuilder<ProductsController>(
                          builder:(_)=>Center(child:productController.is_loading==true?CircularProgressIndicator(
    color: Colors.white,
    // backgroundColor: Constants.primaryColorLight,
    ):Text(
                          "OK",style: TextStyle(color:Colors.white),
                        )),
                      )),
                    ),
                  ),


                )


              ],
            )
        ),
      ],
    );
  }
}
