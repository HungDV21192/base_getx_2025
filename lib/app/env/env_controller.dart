import 'package:base_getx_2025/services/network/api_service.dart';
import 'package:base_getx_2025/utils/message.dart';
import 'package:get/get.dart';

enum Environment { dev, prod }

class EnvController extends GetxController {
  final Rx<Environment> _env = Environment.prod.obs;

  Environment get env => _env.value;

  String get baseUrl {
    switch (_env.value) {
      case Environment.dev:
        return 'https://api-dev.example.com';
      case Environment.prod:
        return 'https://api.example.com';
    }
  }

  void toggleEnvironment() {
    _env.value =
        _env.value == Environment.dev ? Environment.prod : Environment.dev;
    Get.find<ApiService>().updateBaseUrl(baseUrl);
    FlushBarServices.showSuccess(env.name.toUpperCase());
  }
}
