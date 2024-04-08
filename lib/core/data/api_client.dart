import 'dart:io';

import 'package:dio/dio.dart';

class ApiClient {
  final String baseUrl;
  final String token;

  const ApiClient({required this.baseUrl, required this.token});

//
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(seconds: 60),
          receiveTimeout: const Duration(seconds: 60),
          headers: {
            HttpHeaders.authorizationHeader: token,
          },
        ),
      );
}
