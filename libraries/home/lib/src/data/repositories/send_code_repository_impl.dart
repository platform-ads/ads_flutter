import 'package:home/src/data/datasource/auth_remote_datasource.dart';
import 'package:home/src/domain/repositories/send_code_repository.dart';

class SendCodeRepositoryImpl implements SendCodeRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  SendCodeRepositoryImpl(this.authRemoteDatasource);

  @override
  Future<String?> sendCode(String code, String appId, String clientSecret) async {
    final response = await authRemoteDatasource.sendCodeToApi(code, appId, clientSecret);
    return response;
  }
}
