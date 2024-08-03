import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/features/authentication/presentation/auth_form.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_information.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: const Color.fromARGB(255, 236, 249, 250),
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