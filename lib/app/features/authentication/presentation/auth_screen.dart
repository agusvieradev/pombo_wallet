import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/authentication/presentation/auth_form.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_information.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: PomboColors.pomboBackground,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const Row(
        children: [
          AuthFormContainer(),
          PomboInformation(),
        ],
      ),
    );
  }
}
