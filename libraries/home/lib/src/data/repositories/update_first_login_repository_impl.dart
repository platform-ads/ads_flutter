import 'package:home/src/data/datasource/home_remote_datasource.dart';

import '../../domain/repositories/update_first_login_repository.dart';

class UpdateFirstLoginRepositoryImpl extends UpdateFirstLoginRepository {
  final HomeRemoteDatasource homeRemoteDatasource;

  UpdateFirstLoginRepositoryImpl(this.homeRemoteDatasource);

  @override
  Future<String> call(String userId) async {
    final response = await homeRemoteDatasource.updateUserFirstLogin(userId);
    return response;
  }
}
