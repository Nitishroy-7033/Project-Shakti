// // data/datasource/api_client.dart
// import 'package:dio/dio.dart';

// class ApiClient {
//   final Dio _dio;

//   ApiClient(String? token)
//       : _dio = Dio(BaseOptions(
//           baseUrl: 'https://project-shakti-server.onrender.com/', // Replace with your base URL
//           headers: {
//             'Authorization': token != null ? 'Bearer $token' : '',
//             'Content-Type': 'application/json',
//           },
//         ));

//   Future<Response> post(String path, dynamic data) async {
//     return await _dio.post(path, data: data);
//   }

//   // Add more methods if needed (get, put, delete)
// }



// lib/data/datasource/api_client.dart
import 'package:dio/dio.dart';
import 'package:project_shakti/core/utils/sharedpref_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://project-shakti-server.onrender.com/',
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal();
              final SharedPrefsHelper _prefsHelper = SharedPrefsHelper();

  Future<void> _setTokenHeader({bool useToken = true}) async {
    if (useToken) {
      final token = await _prefsHelper.getToken();
      if (token != null && token.isNotEmpty) {
        _dio.options.headers['Authorization'] = 'Bearer $token';
      }
    } else {
      _dio.options.headers.remove('Authorization');
    }
  }

  Future<Response> get(String path, {bool useToken = true}) async {
    await _setTokenHeader(useToken: useToken);
    return await _dio.get(path);
  }

  Future<Response> post(String path, dynamic data, {bool useToken = true}) async {
    await _setTokenHeader(useToken: useToken);
    return await _dio.post(path, data: data);
  }

  Future<Response> put(String path, dynamic data, {bool useToken = true}) async {
    await _setTokenHeader(useToken: useToken);
    return await _dio.put(path, data: data);
  }

  Future<Response> delete(String path, {bool useToken = true}) async {
    await _setTokenHeader(useToken: useToken);
    return await _dio.delete(path);
  }
}
