import 'package:hive_flutter/hive_flutter.dart';
import 'package:{{project_name.snakeCase()}}/common/constants.dart';
import 'package:{{project_name.snakeCase()}}/domain/api/base_key_value_storage.dart';

/// Hive implementation to store key values.
class KeyValueStorage implements BaseKeyValueStorage {
  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(Constants.hiveStorageKey);
  }

  /// Writes the provide [key], [value] pair to the in-memory cache.
  @override
  Future<void> write<T extends Object>({
    required String key,
    required T value,
  }) {
    final box = Hive.box(Constants.hiveStorageKey);
    return box.put(key, value);
  }

  /// Looks up the value for the provided [key].
  /// Defaults to `null` if no value exists for the provided key.
  @override
  T? read<T extends Object>({required String key}) {
    final box = Hive.box(Constants.hiveStorageKey);
    final value = box.get(key);
    if (value is T) return value;
    return null;
  }

  @override
  Stream<T> watchAndReturnFirst<T extends Object>({
    required String key,
    required T defaultValue,
  }) async* {
    final box = Hive.box(Constants.hiveStorageKey);

    // Check if value has been initialised.
    final value = read<T>(key: key);
    if (value == null) {
      await write<T>(key: key, value: defaultValue);
      yield defaultValue;
    } else {
      // Return saved value of the database.
      yield value;
    }

    yield* box.watch(key: key).map((event) => event.value as T);
  }
}
