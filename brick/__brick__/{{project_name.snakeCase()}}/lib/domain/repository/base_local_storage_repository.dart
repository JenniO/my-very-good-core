/// Allows the storage of data.
abstract class BaseLocalStorageRepository {
  Stream<bool> get isOnBoardingFinished;
  Future<void> finishOnBoarding();
}
