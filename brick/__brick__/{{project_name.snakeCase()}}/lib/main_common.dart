import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:{{project_name.snakeCase()}}/bootstrap.dart';
import 'package:{{project_name.snakeCase()}}/common/flavor_config.dart';
import 'package:{{project_name.snakeCase()}}/data/api/api_service.dart';
import 'package:{{project_name.snakeCase()}}/data/api/key_value_storage.dart';
import 'package:{{project_name.snakeCase()}}/data/repository/api_repository.dart';
import 'package:{{project_name.snakeCase()}}/data/repository/local_storage_repository.dart';
import 'package:{{project_name.snakeCase()}}/domain/use_case/use_case.dart';
import 'package:{{project_name.snakeCase()}}/presentation/app/app.dart';

void mainCommon() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await EasyLocalization.ensureInitialized();

  final hiveKeyStore = KeyValueStorage();
  await hiveKeyStore.init();

  final apiRepository = ApiRepository(baseUrl: FlavorConfig.baseUrl);

  final localStorageRepository = LocalStorageRepository(
    keyValueStorage: hiveKeyStore,
  );

  final finishOnBoardingUseCase = FinishOnboardingUseCase(
    localStorageRepository: localStorageRepository,
  );

  final isOnBoardingFinishedUseCase = IsOnboardingFinishedUseCase(
    localStorageRepository: localStorageRepository,
  );

  await bootstrap(
      () => App(
        localStorageRepository: localStorageRepository,
        finishOnBoardingUseCase: finishOnBoardingUseCase,
        isOnBoardingFinishedUseCase: isOnBoardingFinishedUseCase,
      ),
  );
}
