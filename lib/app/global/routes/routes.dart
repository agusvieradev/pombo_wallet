import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/firebase/firebase_providers.dart';
import 'package:pombo_wallet/app/features/home/presentation/home_screen.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_screen_layout.dart';
import 'package:pombo_wallet/app/features/account/presentation/account_screen.dart';
import 'package:pombo_wallet/app/features/user/presentation/user_register_screen.dart';
import 'package:pombo_wallet/app/features/authentication/presentation/auth_screen.dart';

enum AppRoute { home, login, account, support, register }

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final AsyncValue<User?> authState = ref.watch(firebeaseUserStateProvider);

    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: false,
      redirect: (context, state) {
        final bool isLoggedIn = authState.asData?.value != null;
        final bool loginLocation = state.fullPath == '/${AppRoute.login.name}';
        final bool registerLocation =
            state.fullPath == '/${AppRoute.register.name}';

        if (!isLoggedIn && !loginLocation && !registerLocation) {
          return '/${AppRoute.login.name}';
        }

        if (isLoggedIn && (loginLocation || registerLocation)) {
          return '/';
        }

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
        GoRoute(
          path: '/${AppRoute.register.name}',
          name: AppRoute.register.name,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: UserRegisterScreen(),
          ),
        ),
      ],
      // errorBuilder: (context, state) => const NotFoundScreen(),
    );
  },
);
