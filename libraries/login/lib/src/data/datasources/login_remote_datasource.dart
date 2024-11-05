import 'package:core/main.dart';

abstract class LoginRemoteDatasource {
  Future<String> loginToAPi(String email, String password);
}

class LoginRemoteDatasourceImpl implements LoginRemoteDatasource {
  final ApiClient apiClient;

  LoginRemoteDatasourceImpl(this.apiClient);

  @override
  Future<String> loginToAPi(String email, String password) {
    // TODO: implement loginToAPi
    throw UnimplementedError();
  }
}
