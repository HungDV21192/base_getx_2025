import 'package:base_getx_2025/app/router/router_name.dart';
import 'package:base_getx_2025/features/auth/repository/auth_repository.dart';
import 'package:base_getx_2025/services/network/api_service.dart';
import 'package:base_getx_2025/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernameCtr = TextEditingController();
  final passwordCtr = TextEditingController();
  final usernameFocus = FocusNode();
  final passwordFocus = FocusNode();
  var validButton = false.obs;
  final formKey = GlobalKey<FormState>();
  var isChecked = false.obs;
  late final FlutterSecureStorage _storage;
  final ApiService _apiSvc = Get.find<ApiService>();
late AuthRepository authRepo ;
  @override
  void onInit() {
    _storage = const FlutterSecureStorage();
    authRepo = AuthRepository( apiService: _apiSvc);
    // StreamSubscription<List<ConnectivityResult>> subscription = Connectivity()
    //     .onConnectivityChanged
    //     .listen((List<ConnectivityResult> result) {
    //   if (result.contains(ConnectivityResult.none)) {
    //     FlushBarServices.showWarning('Không có kết nối mạng');
    //   }
    // });
    _loadUserData();
    super.onInit();
  }

  Future<void> _loadUserData() async {
    final stgUsn = await _storage.read(key: StorageKey.USERNAME);
    final stgPass = await _storage.read(key: StorageKey.PASSWORD);
    usernameCtr.text = stgUsn ?? '';
    passwordCtr.text = stgPass ?? '';
    isChecked.value = (stgUsn ?? '').isNotEmpty && (stgPass ?? '').isNotEmpty;
    validButton.value = (stgPass ?? '').isNotEmpty && (stgUsn ?? '').isNotEmpty;
    print('check valud bi${validButton.value}');
  }

  void onValidButton() {
    validButton.value = formKey.currentState?.validate() ?? false;
  }

  void login() async {
    final username = usernameCtr.text.trim();
    final password = passwordCtr.text.trim();
    final usn = await _storage.read(key: StorageKey.USERNAME);
    final pas = await _storage.read(key: (StorageKey.PASSWORD));

    if ( username.isNotEmpty &&  password.isNotEmpty) {
      final data = await authRepo.login(username: username, password: password);
      if(data) {
      await  _storage.write(key: StorageKey.USERNAME, value: username);
      await  _storage.write(key: StorageKey.PASSWORD, value: password);
        Get.offNamed(RouterName.HomeScreen);
      }


    } else {
      Get.snackbar('Error', 'Invalid username or password');
    }
  }

  @override
  void dispose() {
    usernameCtr.dispose();
    passwordCtr.dispose();
    usernameFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }
}
