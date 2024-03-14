import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_sciencedex/app/shared/localstorage/i_local_storage.dart';

class LocalStorageSharedPreferences implements ILocalStorage {
  @override
  Future<String?> getImagePath(String key) async {
    final shared = await SharedPreferences.getInstance();
    final path = shared.getString(key);
    if (path == null) {
      return path;
    }
    final file = await File(path).exists();
    if (!file) {
      shared.remove(key);
      return null;
    }

    return path;
  }

  @override
  Future<String?> getItem(String key) async {
    final shared = await SharedPreferences.getInstance();
    return shared.getString(key);
  }

  @override
  Future<void> putItem(String key, String value) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setString(key, value);
  }

  @override
  Future<void> saveImagePath(String filePath, String key) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setString(key, filePath);
  }
}
