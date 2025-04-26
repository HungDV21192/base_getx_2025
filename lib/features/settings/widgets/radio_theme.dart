import 'package:base_getx_2025/app/config/text_styles.dart';
import 'package:base_getx_2025/features/settings/widgets/custom_radio_setting.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RadioThemeWidget extends StatefulWidget {
  const RadioThemeWidget(
      {super.key, required this.initMode, required this.onChanged});

  final ValueChanged<ThemeMode> onChanged;
  final ThemeMode initMode;

  @override
  State<RadioThemeWidget> createState() => _RadioThemeState();
}

class _RadioThemeState extends State<RadioThemeWidget> {
  late ThemeMode themeMode;

  @override
  void initState() {
    themeMode = widget.initMode;
    super.initState();
  }

  void onSelectThemeMode(ThemeMode? theme) {
    if (theme != null) {
      setState(() {
        themeMode = theme;
        widget.onChanged(themeMode);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('theme'.tr(), style: TextStyles.large),
        CustomRadioSetting<ThemeMode>(
          title: 'system'.tr(),
          value: ThemeMode.system,
          groupValue: themeMode,
          onChanged: (value) => onSelectThemeMode(value),
        ),
        CustomRadioSetting<ThemeMode>(
          title: 'light'.tr(),
          value: ThemeMode.light,
          groupValue: themeMode,
          onChanged: (value) => onSelectThemeMode(value),
        ),
        CustomRadioSetting<ThemeMode>(
          title: 'dark'.tr(),
          value: ThemeMode.dark,
          groupValue: themeMode,
          onChanged: (value) => onSelectThemeMode(value),
        ),
      ],
    );
  }
}
