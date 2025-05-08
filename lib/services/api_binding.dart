import 'package:get/get.dart';
import 'api_service.dart';

class ApiBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    final apiService = await ApiService.create(); // Khởi tạo bất đồng bộ
    Get.put<ApiService>(apiService, permanent: true); // Giữ instance vĩnh viễn
  }
}
