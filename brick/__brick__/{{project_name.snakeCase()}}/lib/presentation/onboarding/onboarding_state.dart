part of 'onboarding_cubit.dart';

enum OnboardingPage {
  firstPage,
  secondPage,
  thirdPage;
}

class OnboardingState extends Equatable {
  const OnboardingState({
    this.currentPage = OnboardingPage.firstPage,
    this.manuallySelectedPage,
    this.screenStatus = const ScreenStatus.pure(),
  });

  final OnboardingPage currentPage;

  final OnboardingPage? manuallySelectedPage;

  /// Validation status for finishing the on boarding.
  final ScreenStatus screenStatus;

  /// Convenience getter to check if the user is on the last page
  bool get isLastPage => currentPage == OnboardingPage.thirdPage;

  OnboardingState copyWith({
    OnboardingPage? currentPage,
    OnboardingPage? manuallySelectedPage,
    ScreenStatus? screenStatus,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      manuallySelectedPage: manuallySelectedPage ?? this.manuallySelectedPage,
      screenStatus: screenStatus ?? this.screenStatus,
    );
  }

  @override
  List<Object?> get props => [
        currentPage,
        manuallySelectedPage,
        screenStatus,
      ];
}
