import 'package:base_getx_2025/app/config/text_styles.dart';
import 'package:base_getx_2025/features/settings/widgets/custom_radio_setting.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RadioLangWidget extends StatefulWidget {
  const RadioLangWidget(
      {super.key, required this.onChanged, required this.initLocale});

  final ValueChanged<Locale> onChanged;
  final Locale initLocale;

  @override
  State<RadioLangWidget> createState() => _RadioLangWidgetState();
}

class _RadioLangWidgetState extends State<RadioLangWidget> {
  late Locale locale;

  @override
  void initState() {
    locale = widget.initLocale;
    super.initState();
  }

  void onSelectLocale(Locale? lcl) {
    if (lcl != null) {
      setState(() {
        locale = lcl;
        widget.onChanged(locale);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(title: Text('language'.tr(), style: TextStyles.large)),
        CustomRadioSetting<Locale>(
          title: 'vietnamese'.tr(),
          value: const Locale('vi'),
          groupValue: locale,
          onChanged: (value) => onSelectLocale(value),
        ),
        CustomRadioSetting<Locale>(
          title: 'english'.tr(),
          value: const Locale('en'),
          groupValue: locale,
          onChanged: (value) => onSelectLocale(value),
        ),
      ],
    );
  }
}
