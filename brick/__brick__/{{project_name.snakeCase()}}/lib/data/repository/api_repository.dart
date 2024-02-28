import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:{{project_name.snakeCase()}}/common/api_result.dart';
import 'package:{{project_name.snakeCase()}}/data/api/api_service.dart';
import 'package:{{project_name.snakeCase()}}/data/common/network_exceptions.dart';
import 'package:{{project_name.snakeCase()}}/domain/repository/base_api_repository.dart';

/// Example Api Repository
class ApiRepository implements BaseApiRepository {
  ApiRepository({required String baseUrl}) : _baseUrl = baseUrl {
    _apiService = ApiService(
      Dio(
        BaseOptions(
          baseUrl: '$baseUrl/api',
          contentType: 'application/json',
        ),
      )..interceptors.addAll(
          [
            PrettyDioLogger(
              request: true,
              requestBody: true,
              requestHeader: true,
              responseBody: false,
            ),
          ],
        ),
      baseUrl: _baseUrl,
    );
  }

  late final ApiService _apiService;
  late final String _baseUrl;
  @override
  Future<ApiResult<bool>> getGoodWeather() async {
    try {
      final response = await _apiService.getGoodWeather();
      return ApiResult.success(data: response);
    } catch (error) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(error));
    }
  }
}
