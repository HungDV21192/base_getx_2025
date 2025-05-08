import 'dart:io';

import 'package:base_getx_2025/services/network/api_service.dart';
import 'package:base_getx_2025/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:base_getx_2025/utils/message.dart';

class UploadRepository {
  final ApiService _apiService;

  UploadRepository(this._apiService);

  /// Upload một file
  Future<ApiResult<dynamic>> uploadSingleFile({
    required File file,
    String fileField = 'file',
    Map<String, String>? data,
  }) async {
    try {
      EasyLoading.show(status: 'Đang tải lên...');
      final formData = FormData.fromMap({
        if (data != null) ...data,
        fileField: await MultipartFile.fromFile(file.path, filename: file.path.split('/').last),
      });

      final response = await _apiService.post(
        Endpoint.UPLOAD,
        data: formData,
      );
      EasyLoading.dismiss();
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      return ApiResult.failure('Tải lên thất bại');
    }
  }

  /// Upload nhiều file
  Future<ApiResult<dynamic>> uploadMultipleFiles({
    required List<File> files,
    String fileField = 'files',
    Map<String, String>? data,
  }) async {
    try {
      EasyLoading.show(status: 'Đang tải lên...');

      final fileList = await Future.wait(files.map((file) async {
        return await MultipartFile.fromFile(file.path, filename: file.path.split('/').last);
      }));

      final formData = FormData.fromMap({
        if (data != null) ...data,
        fileField: fileList,
      });

      final response = await _apiService.post(
        Endpoint.UPLOAD,
        data: formData,
      );

      EasyLoading.dismiss();
      return response;
    } catch (e) {
      EasyLoading.dismiss();
      return ApiResult.failure('Tải lên nhiều file thất bại');
    }
  }
}
