import 'package:floor/floor.dart';

/// Entity that contains the current app settings.
@entity
class Settings {
  @primaryKey
  final int id;

  final bool isOnBoardingFinished;

  Settings(this.id, this.isOnBoardingFinished);
}
