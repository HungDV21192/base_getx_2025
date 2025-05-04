import 'package:base_getx_2025/app/router/router_name.dart';
import 'package:base_getx_2025/features/auth/bindings/login_binding.dart';
import 'package:base_getx_2025/features/auth/bindings/register_binding.dart';
import 'package:base_getx_2025/features/auth/views/login_screen.dart';
import 'package:base_getx_2025/features/auth/views/register_screen.dart';
import 'package:base_getx_2025/features/home/bindings/home_binding.dart';
import 'package:base_getx_2025/features/home/screen/home_screen.dart';
import 'package:base_getx_2025/features/home/widgets/BluePage.dart';
import 'package:base_getx_2025/features/home/widgets/RedPage.dart';
import 'package:base_getx_2025/features/settings/views/settings_screen.dart';
import 'package:base_getx_2025/features/splash_screen/screen/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = RouterName.SplashScreen;

  static final routes = [
    GetPage(
      name: RouterName.SplashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      binding: RegisterBinding(),
      name: RouterName.RegisterScreen,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      binding: LoginBinding(),
      name: RouterName.LoginSceen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      binding: HomeBinding(),
      name: RouterName.HomeScreen,
      page: () => const HomeScreen(),
      children: [
        GetPage(
          name: RouterName.RedPage,
          page: () => const RedPage(),
        ),
        GetPage(
          name: RouterName.BluePage,
          page: () => const BluePage(),
        ),
      ],
    ),
    GetPage(
      name: RouterName.SettingScreen,
      page: () => const SettingsScreen(),
    ),
  ];
}
