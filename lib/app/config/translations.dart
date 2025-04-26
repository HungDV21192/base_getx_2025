import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'home_title': 'Home Page',
      'settings': 'Settings',
      'change_theme': 'Change Theme',
      'change_language': 'Change Language',
    },
    'vi_VN': {
      'home_title': 'Trang Chủ',
      'settings': 'Cài Đặt',
      'change_theme': 'Đổi Giao Diện',
      'change_language': 'Đổi Ngôn Ngữ',
    },
  };
}
