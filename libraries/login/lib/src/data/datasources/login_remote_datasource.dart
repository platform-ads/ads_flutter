import 'package:core/main.dart';
import 'package:core/models/customer_model.dart';

abstract class LoginRemoteDatasource {
  Future<CustomerModel?> loginToAPi(String username, String password);
}

class LoginRemoteDatasourceImpl implements LoginRemoteDatasource {
  final ApiClient apiClient;

  LoginRemoteDatasourceImpl(this.apiClient);

  @override
  Future<CustomerModel?> loginToAPi(String username, String password) async {
    try {
      final response = await apiClient.postRequest(
        endpoint: '/login/',
        data: {
          'username': username,
          'password': password,
        },
      );
      return response.data;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
