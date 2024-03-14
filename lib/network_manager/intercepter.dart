import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:task_management/network_manager/rest_client.dart';

final restClient = RestClient(dio);

final dio = getDio();

Dio getDio() {
  BaseOptions options = BaseOptions(
    receiveDataWhenStatusError: true,
    contentType: "application/json",
    sendTimeout: const Duration(seconds: 10),
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );

  Dio dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(onRequest: (request, handler) {
    if (kDebugMode) {
      log('BODY: ${jsonEncode(request.data ?? {})}');
    }
    return handler.next(request);
  }, onResponse: (Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      log('response: -> ${jsonEncode(response.data)}');
    }
    return handler.next(response);
  }, onError: (DioException e, handler) {
    final response = e.response;
    if (kDebugMode) {
      log('API Error --> statusCode: ${response?.statusCode} --> ${response?.statusMessage} : Error ==> ${e.toString()}');
    }
    return handler.next(e);
  }));

  return dio;
}