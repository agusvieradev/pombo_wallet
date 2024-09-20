import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/utils/utils.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';

class Balance extends ConsumerWidget {
  const Balance({super.key, required this.account});
  final Map<String, dynamic> account;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PomboText().pomboMdText(
            text: getCurrencyAccount(account['currency']),
          ),
          PomboWhiteSpaces.hSpaceS,
          PomboText().pomboLgText(
            text:'${getCurrencyCoin(account['currency'])} ${account['balance'] == 0 ? '0,0' : account['balance']}',
            isBold: true
          ),
        ],
      ),
    );
  }
}

      //TODO: REFRESH EN OTRA
      // IconButton(r
      //   onPressed: () {},
      //   icon: const Icon(
      //     PomboIcons.refresh,
      //     color: PomboColors.pomboBlue,
      //   ),
      // )