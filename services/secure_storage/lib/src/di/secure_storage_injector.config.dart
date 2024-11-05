// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:secure_storage/src/di/secure_storage_injector.dart' as _i920;
import 'package:secure_storage/src/service/secure_storage_service.dart'
    as _i878;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initSecureStorageGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final secureStorageModule = _$SecureStorageModule();
    gh.singleton<_i878.SecureStorageService>(
        () => secureStorageModule.providesAuthRemoteDatasource());
    return this;
  }
}

class _$SecureStorageModule extends _i920.SecureStorageModule {}
