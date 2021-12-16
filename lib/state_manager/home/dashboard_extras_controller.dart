import 'package:get/get.dart';

class DashBoardExtrasController extends GetxController{

  var selected_action="Change App's Cover Photo";
  var is_loading=false.obs;

  // var selected;
  final List<String> actions=[
    "Change App's Cover Photo",
   "Update Site's Address Info"
  ];
  void rdBtnClicked(value){
    selected_action=value;
    update();
  }
  getCurrentPage(selected_action){
    //switching radio_button's value

      switch (selected_action) {
        case "Change App's Cover Photo":
          return 0;
        case "Update Site's Address Info":
          return 1;


      }
    }
    toggleLoadingToTrue(){is_loading.value=true;
    update();
    }
  toggleLoadingToFalse(){is_loading.value=false;
  update();
  }




}
