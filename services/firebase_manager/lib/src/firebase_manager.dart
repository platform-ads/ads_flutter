import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_manager/src/firebase_manager_impl.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

abstract class FirebaseManager {
  static FirebaseManager? _instance;

  static FirebaseManager get instance => _instance ??= FirebaseManagerImpl();

  static Future<FirebaseApp> initializeApp({FirebaseOptions? options}) => Firebase.initializeApp(options: options);

  static FirebaseRemoteConfig instanceFirebaseRemoteConfig() => FirebaseRemoteConfig.instance;

  static FirebaseCrashlytics instanceFirebaseCrashlytics() => FirebaseCrashlytics.instance;

  static FirebaseAnalytics instanceFirebaseAnalytics() => FirebaseAnalytics.instance;

  static FirebaseInstallations instanceFirebaseInstallations() => FirebaseInstallations.instance;

  Future<String> installationId();
}
