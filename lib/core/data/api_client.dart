import 'package:dio/dio.dart';

class ApiClient {
  final String baseUrl;

  const ApiClient({required this.baseUrl});

//
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
        ),
      );
}
