import 'package:base_getx_2025/app/bindings/setting_binding.dart';
import 'package:base_getx_2025/app/config/app_color.dart';
import 'package:base_getx_2025/app/config/app_router.dart';
import 'package:base_getx_2025/app/config/app_themes.dart';
import 'package:base_getx_2025/features/settings/setting_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  SettingsBinding.init();
  _configLoading();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(   EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('vi')],
    path: 'lib/l10n',
    fallbackLocale: const Locale('vi'),
    child: const MyApp(),
  ),);
}

class MyApp extends GetView<SettingsController> {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return MaterialApp.router(
        key: ValueKey("${controller.locale.value.languageCode}_${controller.themeMode.value.name}"),
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: controller.themeMode.value,
        routerConfig: AppRouter.router,
        locale: controller.locale.value,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        builder: EasyLoading.init(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
        ),
      );
    });
  }
}



void _configLoading() {
  EasyLoading.instance
    ..maskType = EasyLoadingMaskType.none
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..displayDuration = const Duration(seconds: 2)
    ..backgroundColor = AppColor.colorMain
    ..progressColor = Colors.transparent
    ..indicatorColor = Colors.transparent
    ..boxShadow = <BoxShadow>[]
    ..contentPadding = EdgeInsets.zero
    ..textColor = Colors.red
    ..maskColor = Colors.red
    ..indicatorWidget = LoadingAnimationWidget.threeArchedCircle(
      color: Colors.white,
      size: 50,
    );
}
