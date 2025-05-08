import 'package:base_getx_2025/services/network/api_service.dart';
import 'package:base_getx_2025/utils/constant.dart';

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
  }
}
