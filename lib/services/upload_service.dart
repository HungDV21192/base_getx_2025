import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class UploadService {
  final ImagePicker _imagePicker = ImagePicker();

  Future<File?> pickImage({required ImageSource source}) async {
   try {
     final XFile? pickedFile = await _imagePicker.pickImage(
       source: source,
     );
     return pickedFile != null ? File(pickedFile.path) : null;
   } catch (e) {
     return Future.error(e);
   }
  }
  Future<File?> pickSingleFile({List<String>? allowedExtensions}) async {
    final result = await FilePicker.platform.pickFiles(
      type: allowedExtensions != null ? FileType.custom : FileType.any,
      allowedExtensions: allowedExtensions,
    );
    return result != null && result.files.single.path != null
        ? File(result.files.single.path!)
        : null;
  }

  Future<List<File>> pickMultipleFiles({List<String>? allowedExtensions}) async {
    final result = await FilePicker.platform.pickFiles(
      type: allowedExtensions != null ? FileType.custom : FileType.any,
      allowedExtensions: allowedExtensions,
      allowMultiple: true,
    );
    return result != null
        ? result.paths.whereType<String>().map((path) => File(path)).toList()
        : [];
  }
}


