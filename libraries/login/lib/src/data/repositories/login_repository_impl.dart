import 'package:core/models/customer_model.dart';
import 'package:login/src/data/datasources/login_remote_datasource.dart';
import 'package:login/src/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDatasource loginRemoteDatasource;

  LoginRepositoryImpl(this.loginRemoteDatasource);

  @override
  Future<CustomerModel> getLogin(String username, String password) async {
    var sucess = await loginRemoteDatasource.loginToAPi(username, password);

    return sucess;
  }
}
