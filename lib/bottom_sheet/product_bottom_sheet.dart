import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuta_admin_app/state_manager/home/product_controller.dart';

class YutaRadio extends StatelessWidget {
  final String title;
  final String subtitle;
  final int index;
  YutaRadio({
    this.title="",this.subtitle="",this.index=0
  });

  @override
  Widget build(BuildContext context) {
    final productController=Get.find<ProductsController>();


    return GetBuilder<ProductsController>(
        builder:(_)=>RadioListTile(
          // autofocus: true,
          controlAffinity: ListTileControlAffinity.trailing,
          groupValue: productController.selected_action,
          value: productController.actions[index],
          onChanged: (value){
            productController.rdBtnClicked(value);
            // Get.back();
            print('productController.actions ${productController.selected_action}');
          },
          title: Text(productController.actions[index],style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20
          ),),
          subtitle: Text(subtitle,style: TextStyle(
              color: Colors.white,
              fontSize: 15

          )),
          activeColor: Colors.white,

        )

    );

  }
}