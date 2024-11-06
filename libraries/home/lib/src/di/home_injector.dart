import 'package:core/api/api_client.dart';
import 'package:get_it_export/get_it.dart';
import 'package:home/src/data/datasource/auth_remote_datasource.dart';
import 'package:home/src/data/datasource/home_remote_datasource.dart';
import 'package:home/src/data/repositories/send_code_repository_impl.dart';
import 'package:home/src/data/repositories/update_first_login_repository_impl.dart';
import 'package:home/src/domain/repositories/send_code_repository.dart';
import 'package:home/src/domain/repositories/update_first_login_repository.dart';
import 'package:home/src/presentation/cubit/auth/auth_cubit.dart';
import 'package:home/src/presentation/cubit/home/home_cubit.dart';
import 'package:injectable_export/injectable.dart';

import 'home_injector.config.dart';

@InjectableInit(initializerName: 'initHomeGetIt')
Future<void> configureHomeDependencies(GetIt getIt) async {
  getIt.initHomeGetIt();
}

@module
abstract class HomeModule {
  @singleton
  AuthRemoteDatasource providesAuthRemoteDatasource(
    ApiClient apiClient,
  ) =>
      AuthRemoteDatasourceImpl(
        apiClient,
      );
  @singleton
  HomeRemoteDatasource providesHomeRemoteDatasource(
    ApiClient apiClient,
  ) =>
      HomeRemoteDatasourceImpl(
        apiClient,
      );

  @singleton
  SendCodeRepository providerSendCodeRepository(
    AuthRemoteDatasource authRemoteDatasource,
  ) =>
      SendCodeRepositoryImpl(
        authRemoteDatasource,
      );
  @singleton
  UpdateFirstLoginRepository providerUpdateFirstLoginRepository(
    HomeRemoteDatasource homeRemoteDatasource,
  ) =>
      UpdateFirstLoginRepositoryImpl(
        homeRemoteDatasource,
      );

  @singleton
  AuthCubit providerAuthCubit(
    SendCodeRepository sendCodeRepository,
  ) =>
      AuthCubit(
        sendCodeRepository,
      );
  @singleton
  HomeCubit providerHomeCubit(
    UpdateFirstLoginRepository updateFirstLoginRepository,
  ) =>
      HomeCubit(
        updateFirstLoginRepository,
      );
}
