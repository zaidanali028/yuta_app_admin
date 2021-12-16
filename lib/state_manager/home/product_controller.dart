import 'package:get/get.dart';

class ProductsController extends GetxController{

  var selected_action="Add New Product";
  var is_loading=false.obs;

  // var selected;
  final List<String> actions=[
    "Add New Product",
    "Add A New Category",
    "Edit Categories",
    "View Produts",
  ];
  void rdBtnClicked(value){
    selected_action=value;
    update();
  }
  getCurrentPage(selected_action){
    //switching radio_button's value

      switch (selected_action) {
        case "Add New Product":
          return 0;
        case "Add A New Category":
          return 1;

        case "Edit Categories":
          return 2;

        case "View Produts":
          return 3;
      }
    }
    toggleLoadingToTrue(){is_loading.value=true;
    update();
    }
  toggleLoadingToFalse(){is_loading.value=false;
  update();
  }




}
