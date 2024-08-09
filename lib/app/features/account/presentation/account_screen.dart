import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: PomboContainer(
          child: Column(
            children: [
              PomboText().pomboLgText(
                text: 'Tu información',
                isBold: true,
              ),
              PomboWhiteSpaces.hSpaceL,
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                color: PomboColors.pomboBackground,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PomboText().pomboMdText(text: 'Nombre', isBold: true),
                        PomboText().pomboMdText(
                            text: 'John doe', isBold: false, isLight: true),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PomboText().pomboMdText(text: 'Nombre', isBold: true),
                        PomboText().pomboMdText(
                          text: 'John doe',
                          isBold: false,
                          isLight: true,
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        PomboText().pomboMdText(
                          text: 'Nombre',
                          isBold: true,
                        ),
                        PomboText().pomboMdText(
                          text: 'John doe',
                          isBold: false,
                          isLight: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
