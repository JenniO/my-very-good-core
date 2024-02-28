import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name.snakeCase()}}/assets/assets.dart';
import 'package:{{project_name.snakeCase()}}/presentation/main/main_cubit.dart';
import 'package:{{project_name.snakeCase()}}/presentation/main/widgets/color_section.dart';
import 'package:{{project_name.snakeCase()}}/presentation/main/widgets/dealer_section.dart';
import 'package:{{project_name.snakeCase()}}/presentation/main/widgets/home_section.dart';
import 'package:{{project_name.snakeCase()}}/presentation/main/widgets/menu_section.dart';
import 'package:{{project_name.snakeCase()}}/presentation/ui/theme/light_theme.dart';

class MainView extends StatelessWidget {
  const MainView({required this.child, super.key});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const _FloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        children: [
          child,
          Align(
            alignment: Alignment.bottomCenter,
            child: _NavigationBar(),
          ),
        ],
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorName.red,
      onPressed: () {},
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54 + MediaQuery.paddingOf(context).bottom,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorName.red,
            blurRadius: 20,
            offset: Offset(0, -6),
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        children: [
          Container(
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationBarItem(
                  index: 0,
                  onTap: (i) => _onRouteChanged(context, i),
                  icon: Icons.home,
                  selectedIcon: Icons.home,
                ),
                NavigationBarItem(
                  index: 1,
                  onTap: (i) => _onRouteChanged(context, i),
                  icon: Icons.business,
                  selectedIcon: Icons.business,
                ),
                NavigationBarItem(
                  index: 2,
                  onTap: (i) => _onRouteChanged(context, i),
                  icon: Icons.school,
                  selectedIcon: Icons.school,
                ),
                NavigationBarItem(
                  index: 3,
                  onTap: (i) => _onRouteChanged(context, i),
                  icon: Icons.school,
                  selectedIcon: Icons.school,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onRouteChanged(BuildContext context, int index) {
    context.read<MainCubit>().pageIndexChanged(index);
    context.goNamed(_routes[index]);
  }

  List<String> get _routes => [
        HomeSection.routeName,
        ColorSection.routeName,
        DealerSection.routeName,
        MenuSection.routeName,
      ];
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    required this.onTap,
    required this.icon,
    required this.index,
    Key? key,
    this.selectedIcon,
  }) : super(key: key);

  final IconData icon;
  final Function(int index) onTap;
  final IconData? selectedIcon;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (prev, cur) => prev.pageIndex != cur.pageIndex,
      builder: (context, state) {
        final isSelected = state.pageIndex == index;

        return GestureDetector(
          onTap: () => onTap(index),
          child: SizedBox(
            height: 48,
            width: 48,
            child: Icon(isSelected ? selectedIcon ?? icon : icon),
          ),
        );
      },
    );
  }
}
