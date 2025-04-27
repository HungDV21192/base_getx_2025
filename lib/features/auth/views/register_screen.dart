import 'package:base_getx_2025/app/config/app_color.dart';
import 'package:base_getx_2025/app/config/text_styles.dart';
import 'package:base_getx_2025/app/router/router_name.dart';
import 'package:base_getx_2025/features/auth/controller/register_controller.dart';
import 'package:base_getx_2025/features/auth/widgets/custom_richtext.dart';
import 'package:base_getx_2025/utils/validations.dart';
import 'package:base_getx_2025/widgets/auth_base_screen.dart';
import 'package:base_getx_2025/widgets/custom_button.dart';
import 'package:base_getx_2025/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBaseScreen(
      indexScreen: 2,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16)
                  .copyWith(bottom: 200),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'register'.tr,
                      style: TextStyles.large
                          .copyWith(fontSize: 40, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 35),
                      width: 100,
                      height: 2,
                      color: AppColor.colorMain,
                    ),
                    CustomTextField(
                      controller: controller.usernameCtr,
                      focusNode: controller.usernameFocus,
                      targetFocusNode: controller.passwordFocus,
                      leadingIcon: Icon(
                        Icons.account_circle,
                        color: AppColor.colorWelcome,
                      ),
                      label: 'username'.tr,
                      onChanged: (value) => controller.onValidButton(),
                      validator: (value) => Validations.isValidAccount(value),
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      controller: controller.passwordCtr,
                      focusNode: controller.passwordFocus,
                      targetFocusNode: controller.confirmPWFocus,
                      label: 'password'.tr,
                      onChanged: (value) => controller.onValidButton(),
                      leadingIcon: Icon(
                        Icons.key,
                        color: AppColor.colorWelcome,
                      ),
                      isPassword: true,
                      validator: (value) => Validations.isValidPassword(value),
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      controller: controller.confirmPWCtr,
                      focusNode: controller.confirmPWFocus,
                      isPassword: true,
                      label: 'confirm_password'.tr,
                      onChanged: (value) => controller.onValidButton(),
                      leadingIcon: Icon(
                        Icons.key,
                        color: AppColor.colorWelcome,
                      ),
                      onFieldSubmitted: (_) => controller.passwordFocus.unfocus,
                      validator: (value) => Validations.isValidConfirmPW(
                        value,
                        controller.passwordCtr.text.trim(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                children: [
                  Obx(
                    () => CustomButton(
                      onTap: controller.validButton.value
                          ? () => controller.register()
                          : null,
                      label: 'register'.tr,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: CustomRichText(
                      title: '${'have_account'.tr} ',
                      subTitle: 'sign_in'.tr,
                      onTap: () => Get.offNamed(RouterName.LoginSceen),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
