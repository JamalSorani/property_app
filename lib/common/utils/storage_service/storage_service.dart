// 📦 Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import 'package:template_app/common/utils/storage_service/imp/secure.dart';
import 'package:template_app/common/utils/storage_service/imp/shared.dart';

abstract class SharedStorage {}

abstract class SecureStorage {}

abstract class HiveStorage {}

abstract class StorageService<T> {
  bool? getBool(String key);

  getString(String key);

  int? getInt(String key);

  Future<List<String>?> getStringList(String key);

  Future setStringList(String key, List<String> value);

  Future setBool(String key, bool value);

  Future setString(String key, String value);

  Future setInt(String key, int value);

  remove(String key);

  factory StorageService.shared(SharedPreferences sharedPreferences) =>
      StorageServiceSharedImp(sharedPreferences);
  factory StorageService.secure(FlutterSecureStorage flutterSecureStorage) =>
      SecureStorageImp(flutterSecureStorage);
}
