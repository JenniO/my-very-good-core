import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/common/screen_status.dart';
import 'package:{{project_name.snakeCase()}}/presentation/onboarding/onboarding_cubit.dart';
import 'package:{{project_name.snakeCase()}}/presentation/ui/snackbars.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    final controller = PageController();

    return MultiBlocListener(
      listeners: [
        BlocListener<OnboardingCubit, OnboardingState>(
          listenWhen: (previous, current) =>
              previous.manuallySelectedPage != current.manuallySelectedPage &&
              current.manuallySelectedPage != null,
          listener: (context, state) {
            controller.animateToPage(
              state.manuallySelectedPage!.index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutCubic,
            );
          },
        ),
        BlocListener<OnboardingCubit, OnboardingState>(
          listenWhen: (previous, current) =>
              previous.screenStatus != current.screenStatus,
          listener: (context, state) {
            final status = state.screenStatus;

            if (status is ScreenStatusError && status.messageKey != null) {
              showErrorSnackBar(context, error: status.messageKey!);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
          actions: const [
            _SkipButton(),
          ],
        ),
        bottomNavigationBar: const _ContinueButton(),
        body: PageView(
          controller: controller,
          onPageChanged: cubit.pageIndexChanged,
          children: const [
            Center(
              child: Text('First Page'),
            ),
            Center(
              child: Text('Second Page'),
            ),
            Center(
              child: Text('Third Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      buildWhen: (previous, current) =>
          previous.screenStatus != current.screenStatus ||
          previous.currentPage != current.currentPage,
      builder: (context, state) {
        final cubit = context.read<OnboardingCubit>();

        if (state.isLastPage) {
          return FilledButton(
            onPressed: cubit.finishOnBoarding,
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.only(top: 25, bottom: 40),
              shape: const RoundedRectangleBorder(),
            ),
            child: SafeArea(
              top: false,
              child: Text(
                'onboarding.lets_go'.tr().toUpperCase(),
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        }

        return FilledButton(
          onPressed: cubit.showNextPage,
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.only(top: 25, bottom: 40),
            shape: const RoundedRectangleBorder(),
          ),
          child: SafeArea(
            top: false,
            child: Text(
              'onboarding.continue'.tr().toUpperCase(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}

class _SkipButton extends StatelessWidget {
  const _SkipButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      buildWhen: (previous, current) =>
          previous.screenStatus != current.screenStatus,
      builder: (context, state) {
        final cubit = context.read<OnboardingCubit>();

        return TextButton(
          onPressed: cubit.finishOnBoarding,
          child: Text(
            'onboarding.skip'.tr(),
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        );
      },
    );
  }
}
