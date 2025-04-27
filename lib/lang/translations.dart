import 'dart:ui';

import 'package:base_getx_2025/lang/lang_en.dart';
import 'package:base_getx_2025/lang/lang_vi.dart';
import 'package:get/get.dart';

class MyTranslations extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('vi', 'VI');

  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'vi': vi,
      };
}
