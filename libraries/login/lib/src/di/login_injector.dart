import 'package:core/main.dart';
import 'package:get_it_export/get_it.dart';
import 'package:injectable_export/injectable.dart';
import 'package:login/src/data/datasources/login_remote_datasource.dart';
import 'package:login/src/data/repositories/login_repository_impl.dart';
import 'package:login/src/domain/repositories/login_repository.dart';
import 'package:login/src/presentation/cubit/login_cubit.dart';

import 'login_injector.config.dart';

@InjectableInit(initializerName: 'initLoginGetIt')
Future<void> configureLoginDependencies(GetIt getIt) async {
  getIt.initLoginGetIt();
}

@module
abstract class LoginModule {
  @singleton
  LoginRemoteDatasource loginRemoteDatasource(ApiClient apiClient) => LoginRemoteDatasourceImpl(
        apiClient,
      );

  @singleton
  LoginRepository loginRepository(LoginRemoteDatasource loginRemoteDatasource) => LoginRepositoryImpl(
        loginRemoteDatasource,
      );

  @singleton
  LoginCubit loginCubit(LoginRepository loginRepository) => LoginCubit(
        loginRepository,
      );
}
