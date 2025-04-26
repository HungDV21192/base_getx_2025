import 'package:base_getx_2025/app/config/app_router.dart';
import 'package:base_getx_2025/features/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Obx(() => Column(
        children: [
          TextField(onChanged: (v) => controller.email.value = v),
          TextField(onChanged: (v) => controller.password.value = v, obscureText: true),
          controller.isLoading.value
              ? CircularProgressIndicator()
              : ElevatedButton(
            onPressed: controller.login,
            child: Text('Login'),
          ),
          TextButton(
            onPressed: () => Get.toNamed(AppRoutes.register),
            child: Text("Don't have an account? Register"),
          )
        ],
      )),
    );
  }
}
