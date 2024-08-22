import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pombo_wallet/app/features/authentication/application/auth_service.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_sidebar_item.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/constants/pombo_icons.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/global/routes/routes.dart';

class PomboSideBar extends ConsumerWidget {
  const PomboSideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String currentPath = GoRouterState.of(context).matchedLocation;
    final AuthService authService = ref.read(authServiceProvider.notifier);
    return Material(
      elevation: 10.0,
      child: Container(
        width: 300,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  'pombo_logo.svg',
                  width: 220,
                  height: 220,
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 20, 149, 255),
                    BlendMode.srcIn,
                  ),
                ),
                const Divider(),
                PomboSidebarItem(
                  title: 'Home',
                  icon: PomboIcons.home,
                  isActive: currentPath == '/${AppRoute.home.name}',
                  action: () {
                    context.goNamed(AppRoute.home.name);
                  },
                ),
                PomboSidebarItem(
                  title: 'Cuenta',
                  icon: PomboIcons.userAccount,
                  isActive: currentPath == '/${AppRoute.account.name}',
                  action: () {
                    context.goNamed(AppRoute.account.name);
                  },
                ),
                PomboSidebarItem(
                  title: 'Soporte',
                  icon: PomboIcons.support,
                  isActive: currentPath == '/${AppRoute.support.name}',
                  action: () {
                    context.goNamed(AppRoute.support.name);
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextButton(
                onPressed: () {
                  authService.logOut();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      PomboIcons.logOut,
                      color: PomboColors.pomboRed,
                    ),
                    PomboWhiteSpaces.wSpaceM,
                    PomboText().pomboMdText(
                      text: 'Cerrar sesión',
                      color: PomboColors.pomboRed,
                      isBold: true,
                      isPrimary: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
