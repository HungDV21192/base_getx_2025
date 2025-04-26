import 'package:base_getx_2025/features/settings/setting_controller.dart';
import 'package:get/get.dart';

class SettingsBinding  {
  static void init() {
    Get.put(SettingsController(), permanent: true);
  }
  }