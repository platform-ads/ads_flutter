// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core/api/api_client.dart' as _i908;
import 'package:get_it/get_it.dart' as _i174;
import 'package:home/src/data/datasource/auth_remote_datasource.dart' as _i223;
import 'package:home/src/data/datasource/home_remote_datasource.dart' as _i96;
import 'package:home/src/di/home_injector.dart' as _i346;
import 'package:home/src/domain/repositories/send_code_repository.dart'
    as _i591;
import 'package:home/src/domain/repositories/update_first_login_repository.dart'
    as _i643;
import 'package:home/src/presentation/cubit/auth/auth_cubit.dart' as _i857;
import 'package:home/src/presentation/cubit/home/home_cubit.dart' as _i820;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHomeGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final homeModule = _$HomeModule();
    gh.singleton<_i223.AuthRemoteDatasource>(
        () => homeModule.providesAuthRemoteDatasource(gh<_i908.ApiClient>()));
    gh.singleton<_i96.HomeRemoteDatasource>(
        () => homeModule.providesHomeRemoteDatasource(gh<_i908.ApiClient>()));
    gh.singleton<_i591.SendCodeRepository>(() => homeModule
        .providerSendCodeRepository(gh<_i223.AuthRemoteDatasource>()));
    gh.singleton<_i643.UpdateFirstLoginRepository>(() => homeModule
        .providerUpdateFirstLoginRepository(gh<_i96.HomeRemoteDatasource>()));
    gh.singleton<_i857.AuthCubit>(
        () => homeModule.providerAuthCubit(gh<_i591.SendCodeRepository>()));
    gh.singleton<_i820.HomeCubit>(() =>
        homeModule.providerHomeCubit(gh<_i643.UpdateFirstLoginRepository>()));
    return this;
  }
}

class _$HomeModule extends _i346.HomeModule {}
