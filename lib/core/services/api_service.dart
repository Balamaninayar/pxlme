import 'dart:async';
import 'dart:convert';

import '../utils/dio_util.dart';


class ApiService {
  static const allowedResponseCodes = [200, 202, 201, 204, 401, 422, 500];

  final DioUtil _dioUtil = DioUtil();

  _getAuthHeaders() async {
    Map<String, String> headers = {};
    String accessToken = "";

    headers['Authorization'] = 'Bearer $accessToken';
    headers['Content-Type'] = 'application/json; charset=UTF-8';

    return headers;
  }

  dynamic _handleResponse(dynamic response) async {
    if (allowedResponseCodes.contains(response.statusCode)) {
      return response.data;
    }

    throw Exception("Error: ${response.statusCode} | ${response.body}");
  }

  Future<dynamic> get(String url, {bool auth = true}) async {
    _dioUtil.dioInstance.options.headers =
        auth ? await _getAuthHeaders() : null;
    return _dioUtil.dioInstance
        .get(url)
        .then((value) => _handleResponse(value));
  }

  Future<dynamic> post(String url, dynamic body, {bool auth = false}) async {
    return _dioUtil.dioInstance
        .post(url, data: jsonEncode(body))
        .then((value) => _handleResponse(value));
  }

  Future<dynamic> put(String url, dynamic body, {bool auth = true}) async {
    _dioUtil.dioInstance.options.headers =
        auth ? await _getAuthHeaders() : null;
    return _dioUtil.dioInstance
        .put(url, data: jsonEncode(body))
        .then((value) => _handleResponse(value));
  }

  Future<dynamic> delete(String url,
      {bool auth = true, attachDeviceId = false}) async {
    _dioUtil.dioInstance.options.headers =
        auth ? await _getAuthHeaders() : null;

    return _dioUtil.dioInstance
        .delete(url)
        .then((value) => _handleResponse(value));
  }
}
