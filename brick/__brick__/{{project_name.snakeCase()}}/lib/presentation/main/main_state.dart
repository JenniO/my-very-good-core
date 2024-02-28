part of 'main_cubit.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(0) int pageIndex,
    @Default(ScreenStatus.pure()) ScreenStatus loadingStatus,
  }) = _MainState;
}
