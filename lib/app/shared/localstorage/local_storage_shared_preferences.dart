import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_sciencedex/app/shared/localstorage/i_local_storage.dart';

class LocalStorageSharedPreferences implements ILocalStorage {
  @override
  Future<String?> getImagePath(String key) {
    // TODO: implement getImagePath
    throw UnimplementedError();
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
  Future<void> saveImagePath(File file) {
    // TODO: implement saveImagePath
    throw UnimplementedError();
  }
}
