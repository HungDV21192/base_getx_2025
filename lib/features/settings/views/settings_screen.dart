import 'package:base_getx_2025/features/settings/controller/setting_controller.dart';
import 'package:base_getx_2025/features/settings/widgets/radio_language.dart';
import 'package:base_getx_2025/features/settings/widgets/radio_theme.dart';
import 'package:base_getx_2025/widgets/custom_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      titleAppBar: 'settings'.tr,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            RadioThemeWidget(
              initMode: controller.themeMode.value,
              onChanged: (theme) => controller.updateTheme(theme),
            ),
            const Divider(height: 5, color: Colors.grey),
            RadioLangWidget(
              initLocale: controller.locale.value,
              onChanged: (locale) {
                controller.updateLanguage(locale);
              },
            ),
          ],
        ),
      ),
    );
  }
}
