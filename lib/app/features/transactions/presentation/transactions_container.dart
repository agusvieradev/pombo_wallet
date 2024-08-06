import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';
import 'package:pombo_wallet/app/global/constants/pombo_text.dart';

class BalanceContainer extends ConsumerWidget {
  const BalanceContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PomboContainer(
      child: Column(
        children: [
          PomboText().pomboMdText('Tus movimientos', true),
          Row(
            children: [
              Row(
                children: [
                  //Balance
                  //Shadow balance
                ],
              ),
              // Refresh
            ],
          ),
          Row(
            children: [
              //Botones de retiro e ingreso
            ],
          )
        ],
      ),
    );
  }
}
