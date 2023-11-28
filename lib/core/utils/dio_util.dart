import 'package:dio/dio.dart';

class DioUtil {
  static final DioUtil _singleton = DioUtil._internal();
  late Dio _dio;

  DioUtil._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://api.example.com', // Set your base URL
    ));

    // Add interceptors
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // You can add headers or make other modifications here
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Handle response status codes
        if (response.statusCode == 200) {
          // Successful response
          return handler.next(response);
        } else {
          // Handle other status codes
          // You can also handle specific status codes here
          return handler.next(response);
        }
      },
      onError: (DioError e, handler) {
        // Handle errors
        // You can handle different types of errors here
        return handler.next(e);
      },
    ));
  }

  factory DioUtil() {
    return _singleton;
  }

  Dio get dioInstance => _dio;
}
