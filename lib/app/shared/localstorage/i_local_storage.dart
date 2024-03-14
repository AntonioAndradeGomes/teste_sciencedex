abstract class ILocalStorage {
  Future<void> saveImagePath(
    String filePath,
    String key,
  );
  Future<String?> getImagePath(String key);
  Future<void> putItem(
    String key,
    String value,
  );
  Future<String?> getItem(
    String key,
  );
}
