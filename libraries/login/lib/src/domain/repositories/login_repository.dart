import 'package:core/models/customer_model.dart';

abstract class LoginRepository {
  Future<CustomerModel> getLogin(String username, String password);
}
