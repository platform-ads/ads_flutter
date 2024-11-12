import 'package:core/entities/customer.dart';
import 'package:login/src/data/datasources/login_remote_datasource.dart';
import 'package:login/src/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDatasource loginRemoteDatasource;

  LoginRepositoryImpl(this.loginRemoteDatasource);

  @override
  Future<Customer?> getLogin(String username, String password) async {
    var sucess = await loginRemoteDatasource.loginToAPi(username, password);
    final entity = sucess?.toEntity();
    return entity;
  }
}
