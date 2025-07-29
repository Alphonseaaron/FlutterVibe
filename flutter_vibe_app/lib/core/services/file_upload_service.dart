import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class FileUploadService extends ChangeNotifier {
  double _progress = 0;

  double get progress => _progress;

  Future<void> uploadFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final file = File(result.files.single.path!);
      final dio = Dio();
      await dio.post(
        'https://httpbin.org/post',
        data: FormData.fromMap({
          'file': await MultipartFile.fromFile(file.path),
        }),
        onSendProgress: (sent, total) {
          _progress = sent / total;
          notifyListeners();
        },
      );
    }
  }
}
