abstract class ILocalStorage {
  Future<T?> getValue<T>(String key);
  void saveValue<T>(String key, T value);
}
