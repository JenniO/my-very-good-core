class Constants {
  static String hiveStorageKey = '__hive_storage_key__';
  static String isOnBoardingFinished = '__is_on_boarding_finished__';

  /// The base url that is referring to the backend project.
  ///
  /// Android-Emulator: Use 10.0.2.2 to access the machines localhost
  /// (127.0.0.1 refers to the emulators localhost instance.
  ///
  /// iOS-Emulator: Use 127.0.0.1 to access the machines localhost
  static String baseUrlTest =
      'https://dummyjson.com'; // TODO: Update by own address
  static String baseUrlProd =
      'https://dummyjson.com'; // TODO: Update by own address
  static String baseUrlStaging =
      'https://dummyjson.com'; // TODO: Update by own address
  static String accessTokenStorageKey = '__access_token_key__';
  static String hasOnBoardingSeenKey = '__has_on_boarding_see_key__';
/*  static double zoomLevel = 16;
  static LatLng mapStartPosition =
      LatLng(53.891901513303246, 8.687039445348567);
  static LatLng onBoardingMapStartPosition =
      LatLng(53.888038887120246, 8.680851482537127);*/
}
