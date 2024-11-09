// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core/main.dart' as _i188;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:login/src/data/datasources/login_remote_datasource.dart'
    as _i681;
import 'package:login/src/di/login_injector.dart' as _i13;
import 'package:login/src/domain/repositories/login_repository.dart' as _i605;
import 'package:login/src/presentation/cubit/login_cubit.dart' as _i516;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initLoginGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final loginModule = _$LoginModule();
    gh.singleton<_i681.LoginRemoteDatasource>(
        () => loginModule.loginRemoteDatasource(gh<_i188.ApiClient>()));
    gh.singleton<_i605.LoginRepository>(
        () => loginModule.loginRepository(gh<_i681.LoginRemoteDatasource>()));
    gh.singleton<_i516.LoginCubit>(
        () => loginModule.loginCubit(gh<_i605.LoginRepository>()));
    return this;
  }
}

class _$LoginModule extends _i13.LoginModule {}
