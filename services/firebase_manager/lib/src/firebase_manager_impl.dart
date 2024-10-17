import 'package:firebase_manager/src/firebase_manager.dart';

class FirebaseManagerImpl implements FirebaseManager {
  @override
  Future<String> installationId() {
    return FirebaseManager.instanceFirebaseInstallations().getId();
  }
}
