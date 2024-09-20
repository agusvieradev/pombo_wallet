import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';

class PomboPrimaryButton extends ConsumerWidget {
  const PomboPrimaryButton({
    super.key,
    required this.buttonText,
    required this.buttonAction,
    this.buttonIcon,
    this.buttonColor,
    this.buttonTextColor,
  });

  final String buttonText;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final IconData? buttonIcon;
  final void Function()? buttonAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStatePropertyAll(
            buttonColor ?? PomboColors.pomboBlue,
          ),
        ),
        onPressed: buttonAction,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                buttonIcon,
                color: buttonTextColor ?? PomboColors.pomboWhite,
              ),
              PomboWhiteSpaces.wSpaceM,
              PomboText().pomboMdText(
                text: buttonText,
                color: buttonTextColor ?? PomboColors.pomboWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
