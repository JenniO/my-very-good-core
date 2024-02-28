import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/common/screen_status.dart';
import 'package:{{project_name.snakeCase()}}/domain/use_case/use_case.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit({
    required FinishOnboardingUseCase finishOnBoardingUseCase,
  })  : _finishOnBoardingUseCase = finishOnBoardingUseCase,
        super(const OnboardingState());

  final FinishOnboardingUseCase _finishOnBoardingUseCase;

  void pageIndexChanged(int index) {
    final currentPage = OnboardingPage.values[index];
    emit(state.copyWith(currentPage: currentPage));
  }

  void showNextPage() {
    final nextPage = OnboardingPage.values[state.currentPage.index + 1];

    emit(state.copyWith(manuallySelectedPage: nextPage));
  }

  void finishOnBoarding() async {
    emit(state.copyWith(screenStatus: const ScreenStatus.loading()));

    final result = await _finishOnBoardingUseCase.execute();

    result.when(
      success: () {
        emit(state.copyWith(screenStatus: const ScreenStatus.success()));
      },
      error: (error) {
        emit(state.copyWith(screenStatus: ScreenStatus.error(error)));
      },
    );
  }
}
