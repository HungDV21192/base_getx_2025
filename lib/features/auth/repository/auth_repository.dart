import 'package:base_getx_2025/services/network/api_service.dart';
import 'package:base_getx_2025/utils/constant.dart';
import 'package:get/get.dart';

class AuthRepository {
    AuthRepository();

  Future<bool> register(
      {required String username, required String password}) async {
    try {
      final ApiService _apiSvc = Get.find<ApiService>();
    await _apiSvc.get(Endpoint.REGISTER);
    return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> login(
      {required String username, required String password}) async {
    try {
      final ApiService _apiSvc = Get.find<ApiService>();
      await _apiSvc.post(Endpoint.LOGIN, data: {
        'username': username,
        'password': password,
        'on': 'CLIENT',
      },);
      return true;
    } catch (err) {
      return false;
    }
  }
}
