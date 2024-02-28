import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/presentation/main/main_cubit.dart';
import 'package:{{project_name.snakeCase()}}/presentation/main/main_view.dart';

class MainProvider extends StatelessWidget {
  final int? pageIndex;
  final Widget child;

  const MainProvider({
    required this.child,
    this.pageIndex,
    super.key,
  });

  static String get routeName => 'main';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainCubit(pageIndex: pageIndex),
      child: MainView(child: child),
    );
  }
}
