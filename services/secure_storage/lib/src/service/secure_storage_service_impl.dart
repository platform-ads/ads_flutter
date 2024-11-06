import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:secure_storage/src/service/secure_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageServiceImpl implements SecureStorageService {
  final _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> write(String key, String value) async {
    if (kIsWeb) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    } else {
      // Uso do flutter_secure_storage
      await _secureStorage.write(key: key, value: value);
    }
  }

  @override
  Future<String?> read(String key) async {
    if (kIsWeb) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } else {
      return await _secureStorage.read(key: key);
    }
  }

  @override
  Future<void> delete(String key) async {
    if (kIsWeb) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    } else {
      await _secureStorage.delete(key: key);
    }
  }

  @override
  Future<void> clear() async {
    if (kIsWeb) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } else {
      await _secureStorage.deleteAll();
    }
  }
}
