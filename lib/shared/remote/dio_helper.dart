import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://api.weatherapi.com/v1',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    required Map<String, dynamic> qurey,
  }) async {
    return await dio?.get(
      url,
      queryParameters: qurey,
    );
  }
}

class DioHelperCoutry {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://countriesnow.space/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    Map<String, dynamic>? qurey,
  }) async {
    return await dio?.get(
      url,
      queryParameters: qurey,
    );
  }
}
