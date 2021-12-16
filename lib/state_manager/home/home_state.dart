import 'package:get/get.dart';
class HomeState extends GetxController{
  //for changing widget tree indexes
  var stock_phone_index=0.obs;
  var home_phone_index=0.obs;
  var sub_phone_index=0.obs;
  var disc_phone_index=0.obs;
  var coupon_phone_index=0.obs;
  var off_items_phone_index=0.obs;
  var dp_phone_index=0.obs;
  var order_phone_index=0.obs;
  var product_actions_phone_index=0.obs;




  //for controlling circular progressindicator state
  var is_loading=false.obs;
  //the current index references the current page index
  var current_index=0.obs;
  //the previous index references the previous page index
  var previous_index=0.obs;
   var product_controller_val=0.obs;




   changeLoadingStatus(){
    is_loading.value=true;

  }
   changeLoadingStatusToFalse(){
    is_loading.value=false;

  }

   changePageIndex(index){
    current_index.value=index;
  }

  //will use later
  changePageIndexToPrevious(previous_index){
    current_index.value=previous_index;
  }
  getPreviousPageIndex(previous_index_){
    previous_index.value=previous_index_;
  }

   changeHomePageIndex(index){
    home_phone_index.value=index;
  }

   changeSubPageIndex(index){
    sub_phone_index.value=index;
  }
   changeDiscountPageIndex(index){
    disc_phone_index.value=index;
  }

  changeCouponPageIndex(index){
    coupon_phone_index.value=index;
  }
  changeStockIndex(index){
    stock_phone_index.value=index;
  }

  changeOffItemsIndex(index){
    off_items_phone_index.value=index;
  }
  changeDpIndex(index){
    dp_phone_index.value=index;
  }

  changeOrderIndex(index){
    order_phone_index.value=index;
  }
  changeProductActionsIndex(index){
    product_actions_phone_index.value=index;
  }
  changeProductControllerVal(val){
    product_controller_val.value=val;
  }



}

