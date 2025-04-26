import 'package:base_getx_2025/app/config/app_router.dart';
import 'package:base_getx_2025/services/auth_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    final success = await AuthService.login(email.value, password.value);
    isLoading.value = false;

    if (success) {
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.snackbar('Error', 'Login failed');
    }
  }
}
