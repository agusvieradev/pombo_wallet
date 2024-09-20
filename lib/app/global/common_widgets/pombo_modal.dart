import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_icons.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';
import 'package:pombo_wallet/app/global/utils/utils.dart';

class PomboModal extends ConsumerWidget {
  const PomboModal({
    super.key,
    required this.body,
    this.stage = 1,
  });
  final Widget body;
  final int stage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: PomboColors.pomboWhite,
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width / 2.7,
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stage != 1
                      ? IconButton(
                          onPressed: () {
                            context.pop();
                          },
                          splashRadius: 1,
                          splashColor: PomboColors.pomboTrans,
                          icon: const Icon(
                            PomboIcons.goBack,
                            color: PomboColors.pomboBlue,
                          ),
                        )
                      : PomboWhiteSpaces.wSpaceS,
                  IconButton(
                    onPressed: () {
                      popMultipleTimes(context, stage);
                    },
                    splashRadius: 1,
                    splashColor: PomboColors.pomboTrans,
                    icon: const Icon(
                      PomboIcons.close,
                      color: PomboColors.pomboBlue,
                    ),
                  ),
                ],
              ),
            ),
            body,
          ],
        ),
      ),
    );
  }
}
