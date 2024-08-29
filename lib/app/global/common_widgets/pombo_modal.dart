import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_primary_button.dart';

class PomboModal extends ConsumerWidget {
  const PomboModal({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      backgroundColor: PomboColors.pomboWhite,
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12,
          ), // Radio para asegurar que el container sigue el borde
        ),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            body,
            PomboWhiteSpaces.hSpaceM,
            Row(
              children: [
                PomboPrimaryButton(
                  buttonText: 'Continuar',
                  buttonAction: () {
                    context.pop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return PomboModal(
                          body: Container(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
