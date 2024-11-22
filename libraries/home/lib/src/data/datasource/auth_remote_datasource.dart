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
      await apiClient.postRequest(
        endpoint: 'facebook/auth/',
        data: {
          "code": code,
        },
      );
      return 'ok';
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
