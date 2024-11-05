import 'package:get_it_export/get_it.dart';
import 'package:injectable_export/injectable.dart';
import 'package:secure_storage/src/service/secure_storage_service.dart';
import 'package:secure_storage/src/service/secure_storage_service_impl.dart';

import 'secure_storage_injector.config.dart';

@InjectableInit(initializerName: 'initSecureStorageGetIt')
Future<void> configureSecureStorageDependencies(GetIt getIt) async {
  getIt.initSecureStorageGetIt();
}

@module
abstract class SecureStorageModule {
  @singleton
  SecureStorageService providesAuthRemoteDatasource() => SecureStorageServiceImpl();
}
