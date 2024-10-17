import 'package:feature_flag/firebase/firebase_feature_flag.dart';
import 'package:firebase_manager/firebase_manager.dart';

class FirebaseFeatureFlagImpl implements FirebaseFeatureFlag {
  FirebaseFeatureFlagImpl._(FirebaseRemoteConfig remoteConfig) : _remoteConfig = remoteConfig;

  static const Duration _fetchTimeout = Duration(minutes: 1);
  static const Duration _minimumFetchInterval = Duration(minutes: 10);

  final FirebaseRemoteConfig _remoteConfig;

  static FirebaseFeatureFlag? _instance;

  static Future<FirebaseFeatureFlag> getInstance({
    FirebaseRemoteConfig? remoteConfig,
  }) async {
    if (_instance != null) {
      return _instance!;
    }
    final remoteInstance = remoteConfig ?? FirebaseManager.instanceFirebaseRemoteConfig();

    final remoteConfigured = await _initialize(remoteConfig: remoteInstance);

    return _instance ??= FirebaseFeatureFlagImpl._(remoteConfigured);
  }

  static Future<FirebaseRemoteConfig> _initialize({required FirebaseRemoteConfig remoteConfig}) async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: _fetchTimeout,
      minimumFetchInterval: _minimumFetchInterval,
    ));
    try {
      await remoteConfig.fetchAndActivate();
      remoteConfig.onConfigUpdated.listen((_) async {
        await remoteConfig.activate();
      });
      // ignore: unused_catch_stack
    } on Exception catch (exception, stackTrace) {
      throw Exception(exception);
    }
    return remoteConfig;
  }

  @override
  bool getBool(String key) => _remoteConfig.getBool(key);

  @override
  double getDouble(String key) => _remoteConfig.getDouble(key);

  @override
  int getInt(String key) => _remoteConfig.getInt(key);

  @override
  String getString(String key) => _remoteConfig.getString(key);
}
