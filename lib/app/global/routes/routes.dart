// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pombo_wallet/app/features/authentication/application/firebase_auth_instance.dart';
import 'package:pombo_wallet/app/features/authentication/presentation/auth_screen.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_screen_layout.dart';

enum AppRoute { home, login, account, support, register }

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: false,
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
              path: '/${AppRoute.home.name}',
              name: AppRoute.home.name,
              pageBuilder: (context, state) => NoTransitionPage(
                child: Center(
                  child: Text(AppRoute.home.name),
                ),
              ),
            ),
            GoRoute(
              path: '/${AppRoute.account.name}',
              name: AppRoute.account.name,
              pageBuilder: (context, state) => NoTransitionPage(
                child: Center(
                  child: Text(AppRoute.account.name),
                ),
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
