import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/domain/repository/base_local_storage_repository.dart';
import 'package:{{project_name.snakeCase()}}/domain/use_case/use_case.dart';
import 'package:{{project_name.snakeCase()}}/presentation/app/app_cubit.dart';
import 'package:{{project_name.snakeCase()}}/presentation/app/app_view.dart';

class App extends StatelessWidget {
  const App({
    required this.localStorageRepository,
    required this.finishOnBoardingUseCase,
    required this.isOnBoardingFinishedUseCase,
    super.key,
  });

  /// Use cases
  final FinishOnboardingUseCase finishOnBoardingUseCase;
  final IsOnboardingFinishedUseCase isOnBoardingFinishedUseCase;

  /// Repositories
  final BaseLocalStorageRepository localStorageRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        /// Use cases
        RepositoryProvider(create: (_) => finishOnBoardingUseCase),
        RepositoryProvider(create: (_) => isOnBoardingFinishedUseCase),

        /// Repositories
        RepositoryProvider(create: (_) => localStorageRepository),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('de', 'DE')],
        fallbackLocale: const Locale('de', 'DE'),
        path: 'assets/translations',
        child: BlocProvider(
          create: (_) => AppCubit(
            isOnBoardingFinishedUseCase: isOnBoardingFinishedUseCase,
          ),
          child: const AppView(),
        ),
      ),
    );
  }
}
