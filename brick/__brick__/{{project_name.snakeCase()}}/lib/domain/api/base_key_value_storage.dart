abstract class BaseKeyValueStorage {
  Future<void> write<T extends Object>({required String key, required T value});
  T? read<T extends Object>({required String key});
  Stream<T> watchAndReturnFirst<T extends Object>({
    required String key,
    required T defaultValue,
  });
}
