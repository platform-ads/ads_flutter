import 'package:core/main.dart';
import 'package:core/models/customer_model.dart';
import 'package:get_it_export/get_it.dart';
import 'package:secure_storage/secure_storage.dart';

abstract class LoginRemoteDatasource {
  Future<CustomerModel?> loginToAPi(String username, String password);
}

class LoginRemoteDatasourceImpl implements LoginRemoteDatasource {
  final ApiClient apiClient;
  final SecureStorageService _secureStorage = GetIt.I.get<SecureStorageService>();

  LoginRemoteDatasourceImpl(this.apiClient);

  @override
  Future<CustomerModel?> loginToAPi(String username, String password) async {
    try {
      final response = await apiClient.postRequest(
        endpoint: 'login/',
        data: {
          'username': username,
          'password': password,
        },
      );

      var customer = CustomerModel.fromJson(response.data);
      if (customer.access.token.isNotEmpty) {
        await _secureStorage.write(SecureStorageConst.authToken, customer.access.token);
      }
      return customer;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
