import 'package:core/entities/customer.dart';

abstract class LoginRepository {
  Future<Customer> getLogin(String username, String password);
}
