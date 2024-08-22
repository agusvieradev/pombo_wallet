import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/home/presentation/home_screen.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_screen_layout.dart';
import 'package:pombo_wallet/app/features/account/presentation/account_screen.dart';
import 'package:pombo_wallet/app/features/authentication/presentation/auth_screen.dart';
import 'package:pombo_wallet/app/features/authentication/application/firebase_auth_instance.dart';

enum AppRoute { home, login, account, support, register }

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final AsyncValue<User?> authState = ref.watch(authProvider);

    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: false,
      redirect: (context, state) {
        final bool isLoggedIn = authState.asData?.value != null;
        final bool loginLocation = state.name == AppRoute.login.name;

        if (!isLoggedIn && !loginLocation) return '/${AppRoute.login.name}';
        if (isLoggedIn && loginLocation) return '/';

        return null;
      },
      routes: [
        ShellRoute(
          builder: (
            BuildContext context,
            GoRouterState state,
            Widget child,
          ) {
            return PomboScreenLayout(
              child: child,
            );
          },
          routes: [
            GoRoute(
              path: '/',
              name: AppRoute.home.name,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(),
              ),
            ),
            GoRoute(
              path: '/${AppRoute.account.name}',
              name: AppRoute.account.name,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AccountScreen(),
              ),
            ),
            GoRoute(
              path: '/${AppRoute.support.name}',
              name: AppRoute.support.name,
              pageBuilder: (context, state) => NoTransitionPage(
                child: Center(
                  child: Text(AppRoute.support.name),
                ),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/${AppRoute.login.name}',
          name: AppRoute.login.name,
          builder: (context, state) => const AuthScreen(),
        ),
      ],
      // errorBuilder: (context, state) => const NotFoundScreen(),
    );
  },
);
