import 'package:{{project_name.snakeCase()}}/common/api_result.dart';

/// Example Api Repository abstract class
abstract class BaseApiRepository {
  Future<ApiResult<bool>> getGoodWeather();
}
