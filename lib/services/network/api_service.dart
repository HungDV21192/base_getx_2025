import 'package:base_getx_2025/utils/constant.dart';
import 'package:base_getx_2025/utils/message.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ApiService {
  late final Dio _dio;

  ApiService._internal();

  static Future<ApiService> create(String baseUrl) async {
    final apiService = ApiService._internal();
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        const storage = FlutterSecureStorage();
        final token = await storage.read(key: StorageKey.ACCESS_TOKEN);
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    ));

    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
    ));

    apiService._dio = dio;
    return apiService;
  }

  void updateBaseUrl(String newBaseUrl) {
    _dio.options.baseUrl = newBaseUrl;
  }

  Future<ApiResult<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      return ApiResult.success(response.data);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<ApiResult<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return ApiResult.success(response.data);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<ApiResult<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.patch<T>(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return ApiResult.success(response.data);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<ApiResult<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return ApiResult.success(response.data);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<ApiResult<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.delete<T>(
        path,
        data: data,
        options: Options(headers: headers),
      );
      return ApiResult.success(response.data);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  ApiResult<T> _handleError<T>(dynamic error) {
    String message = 'Unknown error occurred';
    if (error is DioException) {
      if (error.type == DioExceptionType.connectionTimeout) {
        FlushBarServices.showError('connection_timeout'.tr);
      } else if (error.type == DioExceptionType.badResponse) {
        if (error.response?.data['code'] == '010') {
          //Todo: Hết hạn token.
          // Get.offAllNamed(RouterName.LoginView);
          FlushBarServices.showError(error.response?.data['message']);
        } else {
          FlushBarServices.showError(error.response?.data['message']);
        }
      } else if (error.type == DioExceptionType.connectionError) {
        //Todo: Không có kết nối mạng.
        FlushBarServices.showWarning('no_internet'.tr);
      } else {
        FlushBarServices.showError(error.toString());
        EasyLoading.dismiss();
      }
    }
    return ApiResult.failure(message);
  }
}

class ApiResult<T> {
  final T? data;
  final String? error;

  ApiResult._(this.data, this.error);

  factory ApiResult.success(T? data) => ApiResult._(data, null);

  factory ApiResult.failure(String error) => ApiResult._(null, error);

  bool get isSuccess => error == null;
}
