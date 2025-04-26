import 'package:base_getx_2025/app/config/app_page.dart';
import 'package:base_getx_2025/app/config/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.login,
    getPages: AppPages.pages,
  ));
}
