import 'package:{{project_name.snakeCase()}}/domain/repository/base_local_storage_repository.dart';

class IsOnboardingFinishedUseCase {
  IsOnboardingFinishedUseCase({
    required BaseLocalStorageRepository localStorageRepository,
  }) : _localStorageRepository = localStorageRepository;

  final BaseLocalStorageRepository _localStorageRepository;

  Stream<bool> execute() async* {
    yield* _localStorageRepository.isOnBoardingFinished;
  }
}
