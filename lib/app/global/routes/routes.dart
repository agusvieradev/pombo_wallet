// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pombo_wallet/app/features/authentication/application/firebase_auth_instance.dart';
import 'package:pombo_wallet/app/features/authentication/presentation/auth_screen.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_screen_layout.dart';

enum AppRoute { home, login, balance }

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: false,
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.login.name,
          builder: (context, state) => PomboScreenLayout(
            child: Container(
              width: 100,
              height: 100,
            ),
          ),
        ),
      ],
      // errorBuilder: (context, state) => const NotFoundScreen(),
    );
  },
);
