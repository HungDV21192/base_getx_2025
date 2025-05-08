import 'package:base_getx_2025/app/config/app_color.dart';
import 'package:base_getx_2025/app/config/app_themes.dart';
import 'package:base_getx_2025/app/router/app_pages.dart';
import 'package:base_getx_2025/features/settings/bindings/setting_binding.dart';
import 'package:base_getx_2025/features/settings/controller/setting_controller.dart';
import 'package:base_getx_2025/lang/translations.dart';
import 'package:base_getx_2025/services/network/api_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApiBinding().dependencies();
  await GetStorage.init();
  _configLoading();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        init: SettingsController(),
        builder: (ctr) {
          return GetMaterialApp(
            initialBinding: SettingsBinding(),
            title: 'Base Getx 2025',
            key: ValueKey(
                "${ctr.locale.value.languageCode}_${ctr.themeMode.value.name}"),
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: ctr.themeMode.value,
            locale: ctr.locale.value,
            supportedLocales: const <Locale>[
              Locale('vi', 'VI'),
              Locale('en', 'EN'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            fallbackLocale: ctr.locale.value,
            translations: MyTranslations(),
            getPages: AppPages.routes,
            initialRoute: AppPages.initial,
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
