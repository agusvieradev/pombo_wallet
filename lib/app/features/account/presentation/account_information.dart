import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';

class AccountInformation extends ConsumerWidget {
  const AccountInformation({
    super.key,
    required this.append,
    required this.prepend,
  });
  final String append;
  final String prepend;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: PomboText().pomboMdText(
              text: prepend,
            ),
          ),
          Flexible(
            child: PomboText().pomboMdText(
              text: append,
              isBold: false,
              isLight: true,
            ),
          ),
        ],
      ),
    );
  }
}
