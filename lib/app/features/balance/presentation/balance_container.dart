import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_container.dart';

class BalanceContainer extends ConsumerWidget {
  const BalanceContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PomboContainer(
      child: Column(
        children: [
          //Saludo
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
