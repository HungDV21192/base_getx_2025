import 'package:base_getx_2025/app/router/router_name.dart';
import 'package:base_getx_2025/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late String username;
  late TabController tabCtr;

  @override
  void dispose() {
    tabCtr.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    tabCtr = TabController(length: 2, vsync: this);
    tabCtr.addListener(() {
      if (tabCtr.indexIsChanging) {
        final route = tabCtr.index == 0
            ? '${RouterName.HomeScreen}${RouterName.RedPage}'
            : '${RouterName.HomeScreen}${RouterName.BluePage}';
        Get.rootDelegate.toNamed(route);
      }
    });
    _loadUserData();
    super.onInit();
  }

  Future<void> _loadUserData() async {
    const storage = FlutterSecureStorage();
    final stgUsn = await storage.read(key: StorageKey.USERNAME);
    username = stgUsn ?? '';
  }

// Future<void> _pickImage(ImageSource source) async {}
}
