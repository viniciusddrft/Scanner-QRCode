import 'package:scannerqrcode/src/shared/services/interface/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageSharedPreferrence implements ILocalStorage {
  @override
  Future<T?> getValue<T>(String key) {
    return SharedPreferences.getInstance()
        .then((SharedPreferences preferences) => preferences.get(key) as T?);
  }

  @override
  void saveValue<T>(String key, T value) {
    SharedPreferences.getInstance().then((SharedPreferences preferences) {
      if (value is int) {
        preferences.setInt(key, value);
      } else if (value is String) {
        preferences.setString(key, value);
      } else {
        throw Exception('type unsuported in LocalStorageSharedPreferre');
      }
    });
  }
}