import 'package:base_getx_2025/app/router/router_name.dart';
import 'package:base_getx_2025/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final usernameCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final confirmPWCtr = TextEditingController();
  final usernameFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPWFocus = FocusNode();
  var validButton = false.obs;

  @override
  void dispose() {
    usernameCtr.dispose();
    passwordCtr.dispose();
    usernameFocus.dispose();
    passwordFocus.dispose();
    confirmPWCtr.dispose();
    confirmPWFocus.dispose();
    super.dispose();
  }

  void onValidButton() {
    validButton.value = formKey.currentState?.validate() ?? false;
  }

  void register() async {
    if (formKey.currentState?.validate() ?? false) {
      const stg = FlutterSecureStorage();
      await stg.write(key: StorageKey.USERNAME, value: usernameCtr.text.trim());
      await stg.write(key: StorageKey.PASSWORD, value: passwordCtr.text.trim());
      Get.offNamed(RouterName.LoginSceen);
    }
  }
}
