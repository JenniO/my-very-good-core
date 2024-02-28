import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/domain/use_case/use_case.dart';
import 'package:{{project_name.snakeCase()}}/presentation/onboarding/onboarding.dart';

class OnboardingProvider extends StatelessWidget {
  const OnboardingProvider({super.key});

  static String get routeName => 'onboarding';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(
        finishOnBoardingUseCase: context.read<FinishOnboardingUseCase>(),
      ),
      child: const OnboardingView(),
    );
  }
}
