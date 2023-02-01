import 'package:dio/dio.dart';
import 'package:flutter_pjs_boilerplate/src/config/environment.dart';

import '../utils/helper.dart';

mixin DioMixin {
  Dio provideDio() {
    final dio = Dio();

    dio
      ..options.baseUrl = Environment.apiBaseUrl
      ..options.connectTimeout =
          (Helper.isNumeric(Environment.apiConnectionTimeout)
              ? int.parse(Environment.apiConnectionTimeout)
              : 15000)
      ..options.receiveTimeout =
          (Helper.isNumeric(Environment.apiReceiveTimeout)
              ? int.parse(Environment.apiReceiveTimeout)
              : 30000)
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options,
              RequestInterceptorHandler handler) async {
            // TODO hive로 storage에 토큰 저장..
            // Box box = Hive.box('');
            // var name = box.get('authToken');

            // getting token
            // var token = await sharedPrefHelper.authToken;

            // if (token != null) {
            //   options.headers.putIfAbsent('Authorization', () => token);
            // } else {
            //   print('Auth token is null');
            // }

            return handler.next(options);
          },
        ),
      );

    return dio;
  }
}
