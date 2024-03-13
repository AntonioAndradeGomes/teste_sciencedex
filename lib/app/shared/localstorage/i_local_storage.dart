import 'dart:io';

abstract class ILocalStorage {
  Future<void> saveImagePath(File file);
  Future<String?> getImagePath(String key);
  Future<void> putItem(
    String key,
    String value,
  );
  Future<String?> getItem(
    String key,
  );
}
