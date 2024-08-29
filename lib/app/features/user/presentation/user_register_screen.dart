import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/routes/routes.dart';
import 'package:pombo_wallet/app/global/constants/pombo_icons.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/features/user/presentation/user_register_form.dart';

class UserRegisterScreen extends ConsumerWidget {
  const UserRegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        color: PomboColors.pomboBlue,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(
                  PomboIcons.goBack,
                  color: PomboColors.pomboWhite,
                ),
                onPressed: () {
                  context.goNamed(AppRoute.login.name);
                },
              ),
            ),
            const UserRegisterForm(),
            PomboWhiteSpaces.hSpaceL
          ],
        ),
      ),
    );
  }
}
