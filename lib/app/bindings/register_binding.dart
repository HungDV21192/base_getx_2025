import 'package:base_getx_2025/features/login/login_controller.dart';
import 'package:base_getx_2025/features/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
