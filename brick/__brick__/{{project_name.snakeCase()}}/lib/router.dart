import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name.snakeCase()}}/presentation/main/main.dart';
import 'package:{{project_name.snakeCase()}}/presentation/onboarding/onboarding.dart';
import 'package:{{project_name.snakeCase()}}/presentation/splash/splash_view.dart';

/// key for the root navigation (for any view without bottom navigation bar)
final GlobalKey<NavigatorState> _rootNavigationKey =
    GlobalKey<NavigatorState>();

/// key for the main navigation (for any view with a bottom navigation bar)
final GlobalKey<NavigatorState> _mainNavigationKey =
    GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigationKey,
  routes: [
    GoRoute(
      name: '/',
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      name: OnboardingProvider.routeName,
      path: '/${OnboardingProvider.routeName}',
      builder: (BuildContext context, GoRouterState state) =>
          const OnboardingProvider(),
    ),
    ShellRoute(
      navigatorKey: _mainNavigationKey,
      builder: (_, state, child) {
        final page = state.extra as int?;
        return MainProvider(pageIndex: page, child: child);
      },
      routes: [
        GoRoute(
          path: '/${HomeSection.routeName}',
          name: HomeSection.routeName,
          builder: (context, state) => const HomeSection(),
        ),
        GoRoute(
          path: '/${DealerSection.routeName}',
          name: DealerSection.routeName,
          builder: (context, state) => const DealerSection(),
        ),
        GoRoute(
          path: '/${ColorSection.routeName}',
          name: ColorSection.routeName,
          builder: (context, state) => const ColorSection(),
        ),
        GoRoute(
          path: '/${MenuSection.routeName}',
          name: MenuSection.routeName,
          builder: (context, state) => const MenuSection(),
        ),
      ],
    ),
  ],
);
