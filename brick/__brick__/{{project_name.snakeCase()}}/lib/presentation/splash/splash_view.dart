import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/presentation/app/app_cubit.dart';
import 'package:{{project_name.snakeCase()}}/presentation/main/main.dart';
import 'package:{{project_name.snakeCase()}}/presentation/onboarding/onboarding_provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) =>
          previous.isOnBoardingFinished != current.isOnBoardingFinished,
      builder: (context, state) {
        return state.isOnBoardingFinished
            ? const MainProvider(child: HomeSection())
            : const OnboardingProvider();
      },
    );
  }
}
