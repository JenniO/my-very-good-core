import 'package:{{project_name.snakeCase()}}/common/empty_resource.dart';
import 'package:{{project_name.snakeCase()}}/domain/repository/base_local_storage_repository.dart';

class FinishOnboardingUseCase {
  FinishOnboardingUseCase({
    required BaseLocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository;

  final BaseLocalStorageRepository _localStorageRepository;

  Future<EmptyResource> execute() async {
    try {
      await _localStorageRepository.finishOnBoarding();
      return const EmptyResource.success();
    } catch (e) {
      return const EmptyResource.error('message');
    }
  }
}
