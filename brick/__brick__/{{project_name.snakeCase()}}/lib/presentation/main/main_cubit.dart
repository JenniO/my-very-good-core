import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:{{project_name.snakeCase()}}/common/screen_status.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit({int? pageIndex}) : super(MainState(pageIndex: pageIndex ?? 0));

  void pageIndexChanged(int value) {
    emit(state.copyWith(pageIndex: value));
  }
}
