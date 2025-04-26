import 'package:base_getx_2025/app/config/router_name.dart';
import 'package:base_getx_2025/features/auth/screen/login_screen.dart';
import 'package:base_getx_2025/features/auth/screen/register_screen.dart';
import 'package:base_getx_2025/features/home/screen/home_screen.dart';
import 'package:base_getx_2025/features/settings/settings_screen.dart';
import 'package:base_getx_2025/features/splash_screen/screen/splash_screen.dart';
import 'package:base_getx_2025/main.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RouterName.SplashScreen,    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
          path: RouterName.SplashScreen,
          builder: (_, __) => const SplashScreen()),
      GoRoute(
          path: RouterName.RegisterView,
          builder: (_, __) => const RegisterScreen()),
      GoRoute(
          path: RouterName.LoginView, builder: (_, __) => const LoginScreen()),
      GoRoute(
          path: RouterName.HomeView, builder: (_, __) => const HomeScreen()),
      GoRoute(
          path: RouterName.Settings,
          builder: (_, __) => const SettingsScreen()),
      //Todo: Ví dụ cho việc data số qua constructor của màn hình
      // Tại màn hình chuyển gọi context.go('/detail', extra: product); hoặc context.push('/detail', extra: product);
      // GoRoute(
      //   path: '/detail',
      //   builder: (context, state) {
      //     final product = state.extra as Product;
      //     return DetailPage(product: product);
      //   },
      // ),
    ],
  );
}
