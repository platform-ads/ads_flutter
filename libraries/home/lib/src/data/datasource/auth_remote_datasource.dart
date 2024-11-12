import 'package:core/main.dart';

abstract class AuthRemoteDatasource {
  Future<String> sendCodeToApi(String code, String appId, String clientSecret);
  Future<String> updateUserFirstLogin(String userId);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiClient apiClient;

  AuthRemoteDatasourceImpl(this.apiClient);

  @override
  Future<String> sendCodeToApi(String code, String appId, String clientSecret) async {
    try {
      final response = await apiClient.postRequest(
        endpoint: '/facebook/auth/',
        data: {
          "code": code,
        },
      );
      return response.data;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> updateUserFirstLogin(String userId) async {
    try {
      await apiClient.patchRequest(
        endpoint: 'users/$userId/',
        data: {
          'first_login': false,
        },
      );
      return 'Ok';
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
