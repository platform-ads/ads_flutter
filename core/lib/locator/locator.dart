import 'package:feature_flag/feature_flag.dart';
import 'package:firebase_manager/firebase_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'locator.config.dart';

final GetIt locator = GetIt.instance;

@InjectableInit()
Future<void> setupLocator() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(minutes: 10),
  ));
  await remoteConfig.fetchAndActivate();
  await remoteConfig.activate();

  locator.registerLazySingleton<FirebaseManager>(() => FirebaseManagerImpl());

  locator.registerLazySingleton<FirebaseFeatureFlag>(() => FirebaseFeatureFlagImpl(remoteConfig));
  locator.init();
}
