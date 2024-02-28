import 'package:{{project_name.snakeCase()}}/common/constants.dart';
import 'package:{{project_name.snakeCase()}}/domain/api/base_key_value_storage.dart';
import 'package:{{project_name.snakeCase()}}/domain/repository/base_local_storage_repository.dart';

class LocalStorageRepository implements BaseLocalStorageRepository {
  LocalStorageRepository({
    required BaseKeyValueStorage keyValueStorage,
  }) : _keyValueStorage = keyValueStorage;

  final BaseKeyValueStorage _keyValueStorage;

  @override
  Stream<bool> get isOnBoardingFinished {
    return _keyValueStorage.watchAndReturnFirst<bool>(
      key: Constants.isOnBoardingFinished,
      defaultValue: false,
    );
  }

  @override
  Future<void> finishOnBoarding() {
    return _keyValueStorage.write(
      key: Constants.isOnBoardingFinished,
      value: true,
    );
  }
}
