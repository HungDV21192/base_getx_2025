import 'package:base_getx_2025/app/bindings/home_binding.dart';
import 'package:base_getx_2025/app/bindings/login_binding.dart';
import 'package:base_getx_2025/app/bindings/register_binding.dart';
import 'package:base_getx_2025/app/config/app_router.dart';
import 'package:base_getx_2025/features/home/home_view.dart';
import 'package:base_getx_2025/features/login/login_view.dart';
import 'package:base_getx_2025/features/register/register_view.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.login, page: () => LoginView(), binding: LoginBinding()),
    GetPage(name: AppRoutes.register, page: () => const RegisterView(), binding: RegisterBinding()),
    GetPage(name: AppRoutes.home, page: () => HomeView(), binding: HomeBinding()),
  ];
}
