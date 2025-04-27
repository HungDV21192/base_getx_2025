import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void showLoading({String? message}) {
  EasyLoading.show();
}

void hideLoading() {
  if (EasyLoading.isShow) {
    EasyLoading.dismiss();
  }
}

void backToPage(String routeName) {
  Get.until((route) => Get.currentRoute == routeName);
}
