
import 'package:dio/dio.dart';
import 'package:project_shakti/core/utils/sharedpref_helper.dart';
import 'package:project_shakti/core/network/api_response.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://project-shakti-server.onrender.com/',
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  factory ApiClient() => _instance;

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

  // GET request
  Future<ApiResponse<T>> get<T>(
    String path, {
    bool useToken = true,
    T Function(dynamic json)? fromJson,
    Map<String, dynamic>? queryParameters,
  }) async {
    await _setTokenHeader(useToken: useToken);

    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  // POST request
  Future<ApiResponse<T>> post<T>(
    String path,
    dynamic data, {
    bool useToken = true,
    T Function(dynamic json)? fromJson,
  }) async {
    await _setTokenHeader(useToken: useToken);

    try {
      final response = await _dio.post(path, data: data);
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  // PUT request
  Future<ApiResponse<T>> put<T>(
    String path,
    dynamic data, {
    bool useToken = true,
    T Function(dynamic json)? fromJson,
  }) async {
    await _setTokenHeader(useToken: useToken);

    try {
      final response = await _dio.put(path, data: data);
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  // PATCH request
  Future<ApiResponse<T>> patch<T>(
    String path,
    dynamic data, {
    bool useToken = true,
    T Function(dynamic json)? fromJson,
  }) async {
    await _setTokenHeader(useToken: useToken);

    try {
      final response = await _dio.patch(path, data: data);
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  // DELETE request
  Future<ApiResponse<T>> delete<T>(
    String path, {
    bool useToken = true,
    T Function(dynamic json)? fromJson,
    Map<String, dynamic>? queryParameters,
  }) async {
    await _setTokenHeader(useToken: useToken);

    try {
      final response = await _dio.delete(path, queryParameters: queryParameters);
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  // ✅ Shared success handler
  ApiResponse<T> _handleResponse<T>(
    Response response,
    T Function(dynamic json)? fromJson,
  ) {
    final json = response.data;
    return ApiResponse<T>(
      success: json['success'] ?? false,
      message: json['message'],
      data: fromJson != null && json['data'] != null ? fromJson(json['data']) : null,
    );
  }

  // ❌ Shared error handler
  ApiResponse<T> _handleError<T>(Object error) {
    if (error is DioException) {
      final response = error.response;
      final errorMsg = response?.data?['message'] ?? error.message ?? 'An unexpected error occurred.';
      return ApiResponse<T>(
        success: false,
        message: errorMsg,
        data: null,
      );
    }

    return ApiResponse<T>(
      success: false,
      message: 'Unexpected error: $error',
      data: null,
    );
  }
}
