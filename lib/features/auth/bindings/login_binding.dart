import 'package:base_getx_2025/app/env/env_controller.dart';
import 'package:base_getx_2025/features/auth/controller/login_controller.dart';
import 'package:base_getx_2025/services/network/api_service.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => EnvController());
    Get.lazyPut(() => EnvController());
    final apiService = await ApiService.create(Get
        .find<EnvController>()
        .baseUrl);
    Get.put<ApiService>(apiService, permanent: true);
  }
}
