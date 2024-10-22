import 'package:core/api/api_client.dart';
import 'package:dio_export/dio.dart';
import 'package:feature_flag/feature_flag.dart';
import 'package:firebase_manager/firebase_manager.dart';
import 'package:get_it_export/get_it.dart';
import 'package:injectable_export/injectable.dart';

import 'injection.config.dart';

@InjectableInit(initializerName: r'initCoreGetIt')
Future<void> configureCoreDependencies(
  GetIt getIt,
) async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(minutes: 10),
  ));
  await remoteConfig.fetchAndActivate();
  await remoteConfig.activate();

  getIt.registerLazySingleton<FirebaseManager>(() => FirebaseManagerImpl());

  getIt.registerLazySingleton<FirebaseFeatureFlag>(() => FirebaseFeatureFlagImpl(remoteConfig));
  getIt.registerLazySingleton(() => Dio());

  getIt.initCoreGetIt();
}

@module
abstract class CoreModule {
  @singleton
  ApiClient providesApiClient() => ApiClientImpl();
}
