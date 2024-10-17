import 'package:feature_flag/firebase/firebase_feature_flag.dart';
import 'package:firebase_manager/firebase_manager.dart';

class FirebaseFeatureFlagImpl implements FirebaseFeatureFlag {
  FirebaseFeatureFlagImpl(FirebaseRemoteConfig remoteConfig) : _remoteConfig = remoteConfig;

  final FirebaseRemoteConfig _remoteConfig;

  @override
  bool getBool(String key) => _remoteConfig.getBool(key);

  @override
  double getDouble(String key) => _remoteConfig.getDouble(key);

  @override
  int getInt(String key) => _remoteConfig.getInt(key);

  @override
  String getString(String key) => _remoteConfig.getString(key);
}
