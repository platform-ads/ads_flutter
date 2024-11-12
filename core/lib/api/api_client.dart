import 'dart:developer';

import 'package:dio_export/dio.dart';
import 'package:get_it_export/get_it.dart';
import 'package:secure_storage/secure_storage.dart';

abstract class ApiClient {
  Future<Response> getRequest(
      {required String endpoint, Map<String, dynamic>? queryParameters, Map<String, String>? headers});
  Future<Response> postRequest({required String endpoint, Map<String, dynamic>? data, Map<String, String>? headers});
  Future<Response> patchRequest({required String endpoint, Map<String, dynamic>? data, Map<String, String>? headers});
}

class ApiClientImpl implements ApiClient {
  final Dio _dio;
  final SecureStorageService _secureStorage;

  ApiClientImpl()
      : _dio = GetIt.I.get<Dio>(),
        _secureStorage = GetIt.I.get<SecureStorageService>() {
    _initializeDio();
  }

  void _initializeDio() {
    _dio.options = BaseOptions(
      baseUrl: 'https://grow-sphere-luisbonifacio.pythonanywhere.com/api/',
      connectTimeout: const Duration(minutes: 5),
      receiveTimeout: const Duration(minutes: 3),
      headers: {
        'content-type': 'application/json',
      },
    );

    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _secureStorage.read('auth_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (DioException e, handler) {
          log('tipo de erro no request foi $e');
          if (e.response?.statusCode == 401) {
            // TODO: implementar lógica de refresh token ou redirecionar para login
          }
          handler.next(e);
        },
      ),
    );
  }

  Future<Response> _performRequest(Future<Response> Function() request, String endpoint) async {
    try {
      return await request();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response> getRequest({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _performRequest(
      () => _dio.get(endpoint, queryParameters: queryParameters, options: Options(headers: _mergeHeaders(headers))),
      endpoint,
    );
  }

  @override
  Future<Response> postRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) {
    return _performRequest(
      () => _dio.post(
        endpoint,
        data: data,
        options: Options(
          headers: _mergeHeaders(headers),
        ),
      ),
      endpoint,
    );
  }

  @override
  Future<Response> patchRequest({
    required String endpoint,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
  }) {
    return _performRequest(
      () => _dio.patch(
        endpoint,
        data: data,
        options: Options(
          headers: _mergeHeaders(headers),
        ),
      ),
      endpoint,
    );
  }

  Map<String, String> _mergeHeaders(Map<String, String>? additionalHeaders) {
    final defaultHeaders = {
      'content-type': 'application/json',
    };
    return {...defaultHeaders, ...?additionalHeaders};
  }

  Exception _handleError(DioException error) {
    if (error.response != null) {
      switch (error.response!.statusCode) {
        case 400:
          return Exception('Bad Request');
        case 401:
          return Exception('Unauthorized');
        case 403:
          return Exception('Forbidden');
        case 404:
          return Exception('Not Found');
        default:
          return Exception('Error: ${error.response!.statusCode}');
      }
    } else {
      return Exception('Network error');
    }
  }
}
