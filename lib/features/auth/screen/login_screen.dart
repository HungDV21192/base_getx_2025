import 'package:base_getx_2025/app/config/app_color.dart';
import 'package:base_getx_2025/app/config/router_name.dart';
import 'package:base_getx_2025/app/config/text_styles.dart';
import 'package:base_getx_2025/features/auth/screen/widgets/custom_richtext.dart';
import 'package:base_getx_2025/utils/constant.dart';
import 'package:base_getx_2025/utils/validations.dart';
import 'package:base_getx_2025/widgets/auth_base_screen.dart';
import 'package:base_getx_2025/widgets/custom_button.dart';
import 'package:base_getx_2025/widgets/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameCtr = TextEditingController();
  final _passwordCtr = TextEditingController();
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  var validButton = false;
  final _formKey = GlobalKey<FormState>();
  var isSaveAccount = false;

  Future<void> _loadUserData() async {
    const storage = FlutterSecureStorage();
    final userName = await storage.read(key: LocalStorageKey.USERNAME);
    final password = await storage.read(key: LocalStorageKey.PASSWORD);
    isSaveAccount = (userName ?? '').isNotEmpty && (password ?? '').isNotEmpty;
  }

  @override
  void dispose() {
    _usernameCtr.dispose();
    _passwordCtr.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void onValidButton() {
    setState(() {
      validButton = _formKey.currentState?.validate() ?? false;
    });
  }

  void _login() {
    context.go(RouterName.HomeView);
  }
var isChecked = true;
  @override
  void initState() {
    _loadUserData();
    // StreamSubscription<List<ConnectivityResult>> subscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((List<ConnectivityResult> result) {
    //   if (result.contains(ConnectivityResult.none)) {
    //     FlushBarServices.showWarning('Không có kết nối mạng');
    //   }
    // });
    super.initState();
  }

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
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    controller: _usernameCtr,
                    focusNode: _usernameFocus,
                    targetFocusNode: _passwordFocus,
                    leadingIcon: Icon(
                      Icons.account_circle,
                      color: AppColor.colorWelcome,
                    ),
                    label: 'username'.tr(),
                    onChanged: (value) => onValidButton(),
                    validator: (value) =>
                        Validations.isValidAccount(value),
                  ),
                  CustomTextField(
                    controller: _passwordCtr,
                    focusNode: _passwordFocus,
                    label: 'password'.tr(),
                    onChanged: (value) => onValidButton(),
                    leadingIcon: Icon(
                      Icons.key,
                      color: AppColor.colorWelcome,
                    ),
                    isPassword: true,
                    validator: (value) =>
                        Validations.isValidPassword(value),
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
                            Icon(
                              isChecked
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: AppColor.colorMain,
                            ),
                            const SizedBox(width: 8),
                            Text('remember_me'.tr(),
                                style: TextStyles.medium),
                          ],
                        ),
                      ),
                      TextButton(
                        child: Text(
                          'forgot_password'.tr(),
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
                CustomButton(
                  onTap: validButton ? () => _login() : null,
                  label: 'sign_in'.tr(),
                ),
                const SizedBox(height: 20),
                Center(
                  child: CustomRichText(
                    title: '${'no_account'.tr()} ',
                    subTitle: 'register'.tr(),
                    onTap: () => context.go(RouterName.RegisterView),
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
