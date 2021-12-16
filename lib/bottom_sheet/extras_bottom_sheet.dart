import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuta_admin_app/state_manager/home/dashboard_extras_controller.dart';
import 'package:yuta_admin_app/state_manager/home/product_controller.dart';

class YutaExtraRadio extends StatelessWidget {
  final String title;
  final String subtitle;
  final int index;
  YutaExtraRadio({
    this.title="",this.subtitle="",this.index=0
  });

  @override
  Widget build(BuildContext context) {
    final dashboardExtrasController=Get.find<DashBoardExtrasController>();

    // print("value_ $index");
    return GetBuilder<DashBoardExtrasController>(
        builder:(_)=>RadioListTile(
          // autofocus: true,
          controlAffinity: ListTileControlAffinity.trailing,
          groupValue: dashboardExtrasController.selected_action,
          value: dashboardExtrasController.actions[index],
          onChanged: (value){
            dashboardExtrasController.rdBtnClicked(value);
            // Get.back();
            print('dashboardExtrasController.actions ${dashboardExtrasController.selected_action}');
          },
          title: Text(dashboardExtrasController.actions[index],style: TextStyle(
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