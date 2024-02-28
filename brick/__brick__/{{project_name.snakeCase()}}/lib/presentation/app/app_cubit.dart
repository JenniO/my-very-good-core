import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{project_name.snakeCase()}}/domain/use_case/use_case.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required IsOnboardingFinishedUseCase isOnBoardingFinishedUseCase,
  })  : _isOnBoardingFinishedUseCase = isOnBoardingFinishedUseCase,
        super(const AppState()) {
    _init();
  }

  final IsOnboardingFinishedUseCase _isOnBoardingFinishedUseCase;

  late final StreamSubscription<bool> _isOnBoardingFinishedSubscription;

  void _init() {
    _isOnBoardingFinishedSubscription = _isOnBoardingFinishedUseCase
        .execute()
        .listen(_isOnBoardingFinishedChanged);
  }

  void _isOnBoardingFinishedChanged(bool value) {
    emit(state.copyWith(isOnBoardingFinished: value));
  }

  @override
  Future<void> close() async {
    await _isOnBoardingFinishedSubscription.cancel();
    return super.close();
  }
}
