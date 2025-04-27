import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextStyles {
  TextStyles._();

  static TextStyle get large {
    return Theme.of(Get.context!).textTheme.titleLarge!;
  }

  static TextStyle get medium {
    return Theme.of(Get.context!).textTheme.titleMedium!;
  }

  static TextStyle get mediumButton {
    return Theme.of(Get.context!).textTheme.titleMedium!;
  }

  static TextStyle get small {
    return Theme.of(Get.context!).textTheme.titleSmall!;
  }
}
