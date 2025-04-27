import 'package:base_getx_2025/app/config/app_color.dart';
import 'package:base_getx_2025/app/config/text_styles.dart';
import 'package:base_getx_2025/app/router/router_name.dart';
import 'package:base_getx_2025/features/auth/controller/login_controller.dart';
import 'package:base_getx_2025/features/auth/widgets/custom_richtext.dart';
import 'package:base_getx_2025/utils/validations.dart';
import 'package:base_getx_2025/widgets/auth_base_screen.dart';
import 'package:base_getx_2025/widgets/custom_button.dart';
import 'package:base_getx_2025/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBaseScreen(
      indexScreen: 2,
      body: Stack(
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
                  CustomTextField(
                    controller: controller.passwordCtr,
                    focusNode: controller.passwordFocus,
                    label: 'password'.tr,
                    onChanged: (value) => controller.onValidButton(),
                    leadingIcon: Icon(
                      Icons.key,
                      color: AppColor.colorWelcome,
                    ),
                    isPassword: true,
                    validator: (value) => Validations.isValidPassword(value),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(
                              () => Icon(
                                controller.isChecked.value
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                                color: AppColor.colorMain,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text('remember_me'.tr, style: TextStyles.medium),
                          ],
                        ),
                      ),
                      TextButton(
                        child: Text(
                          'forgot_password'.tr,
                          style: TextStyles.medium.copyWith(
                            color: AppColor.colorMain,
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        onPressed: () {},
                      )
                    ],
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
                        ? () => controller.login()
                        : null,
                    label: 'sign_in'.tr,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: CustomRichText(
                    title: '${'no_account'.tr} ',
                    subTitle: 'register'.tr,
                    onTap: () => Get.offNamed(RouterName.RegisterScreen),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
