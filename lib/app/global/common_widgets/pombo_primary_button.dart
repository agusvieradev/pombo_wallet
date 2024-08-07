import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/constants/pombo_text.dart';

class PomboPrimaryButton extends ConsumerWidget {
  const PomboPrimaryButton({
    super.key,
    required this.buttonText,
    required this.buttonAction,
    this.buttonIcon,
  });

  final String buttonText;
  final IconData? buttonIcon;
  final void Function()? buttonAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            PomboColors.pomboBlue,
          ),
        ),
        onPressed: buttonAction,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  buttonIcon,
                  color: PomboColors.pomboWhite,
                ),
                PomboText().pomboMdText(
                  text: buttonText,
                  isBold: true,
                  color: PomboColors.pomboWhite,
                ),
              ],
            )),
      ),
    );
  }
}
