import 'package:base_getx_2025/services/api_service.dart';
import 'package:base_getx_2025/utils/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {

  final ApiService apiService;

  AuthRepository({ required this.apiService});

  Future<bool> register(
      {required String username, required String password}) async {
    try {
    await apiService.get(Endpoint.REGISTER);
    return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> login(
      {required String username, required String password}) async {
    try {
      await apiService.post(Endpoint.LOGIN, data: {
        'username': username,
        'password': password,
        'on': 'CLIENT',
      },);
      return true;
    } catch (err) {
      return false;
    }
    // if (password.length >= 8) {
    //   return true;
    // } else {
    //   return false;
    // }

    return true;
    // final savedUser = await storage.read(key: 'username');
    // final savedPass = await storage.read(key: 'password');
    // if (username == savedUser && password == savedPass) {
    //   await storage.write(key: 'token', value: 'fake_token');
    //   return true;
    // }
    // return false;
  }
}
