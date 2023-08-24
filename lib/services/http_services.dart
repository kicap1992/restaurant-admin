import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../app/app.logger.dart';

class MyHttpServices {
  final log = getLogger('MyHttpServices');
  final _options = BaseOptions(
    baseUrl: dotenv.env['url']!,
    connectTimeout: const Duration(seconds: 120),
    receiveTimeout: const Duration(seconds: 120),
  );

  late Dio _dio;

  MyHttpServices() {
    _dio = Dio(_options);
  }

  Future<Response> get(String path) async {
    try {
      return await _dio.get(path);
    } on DioException catch (e) {
      log.e('error : $e');
      rethrow;
    }
  }

  Future<Response> postWithFormData(String path, FormData formData) async {
    try {
      return await _dio.post(
        path,
        data: formData,
        // method="POST" enctype="multipart/form-data">
        options: Options(
          contentType: 'multipart/form-data',
        ),
      );
    } on DioException {
      rethrow;
    }
  }
}
