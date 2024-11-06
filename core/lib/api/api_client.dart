import 'package:dio_export/dio.dart';
import 'package:get_it_export/get_it.dart';
import 'package:secure_storage/secure_storage.dart';

abstract class ApiClient {
  Future<Response> getRequest({required String endpoint, Map<String, dynamic>? queryParameters});
  Future<Response> postRequest({required String endpoint, Map<String, dynamic>? data});
  Future<Response> patchRequest({required String endpoint, Map<String, dynamic>? data});
}

class ApiClientImpl implements ApiClient {
  final Dio _dio = GetIt.I.get<Dio>();
  final secureStorage = GetIt.I.get<SecureStorageService>();
  initDio() {
    Dio(BaseOptions(
      baseUrl: 'https://grow-sphere-luisbonifacio.pythonanywhere.com/api',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ));
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await secureStorage.read('auth_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (DioException e, handler) {
        if (e.response?.statusCode == 401) {
          //TODO (rodrigo): implement way to use refresh token if is valid or return a exception to throw user to login
        }
        handler.next(e);
      },
    ));
  }

  @override
  Future<Response> getRequest({required String endpoint, Map<String, dynamic>? queryParameters}) async {
    initDio();
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response> postRequest({required String endpoint, Map<String, dynamic>? data}) async {
    initDio();
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Response> patchRequest({required String endpoint, Map<String, dynamic>? data}) async {
    initDio();
    try {
      final response = await _dio.patch(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw _handleError(e);
    }
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
