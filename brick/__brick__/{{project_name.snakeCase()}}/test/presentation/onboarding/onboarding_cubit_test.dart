import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:{{project_name.snakeCase()}}/domain/use_case/use_case.dart';
import 'package:{{project_name.snakeCase()}}/presentation/onboarding/onboarding.dart';

class MockFinishUseCase extends Mock implements FinishOnboardingUseCase {}

void main() {
  group('OnBoardingCubit', () {
    late OnboardingCubit onBoardingCubit;

    setUp(() {
      onBoardingCubit = OnboardingCubit(
        finishOnBoardingUseCase: MockFinishUseCase(),
      );
    });

    blocTest(
      'Emits [] when nothing is added',
      build: () => onBoardingCubit,
      expect: () => [],
    );

    blocTest(
      '''
      Emits incremented manually selected page index when user wants to show the
      next page.
      ''',
      build: () => onBoardingCubit,
      act: (cubit) => cubit.showNextPage(),
      expect: () => const [
        OnboardingState(manuallySelectedPage: OnboardingPage.secondPage),
      ],
    );
  });
}
