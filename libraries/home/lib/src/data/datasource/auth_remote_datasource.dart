import 'package:core/main.dart';

abstract class AuthRemoteDatasource {
  Future<String> sendCodeToApi(String code, String appId, String clientSecret);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiClient apiClient;

  AuthRemoteDatasourceImpl(this.apiClient);

  @override
  Future<String> sendCodeToApi(String code, String appId, String clientSecret) async {
    try {
      final response = await apiClient.getRequest(
        endpoint: '',
        queryParameters: {
          "code": code,
          "client_id": appId,
          "client_secret": clientSecret,
        },
      );

      return response.data;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
