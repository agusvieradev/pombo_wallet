import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';

Future<void> saveUserSession(User? user) async {
  final prefs = await SharedPreferences.getInstance();
  if (user != null) {
    await prefs.setBool('isLoggedIn', true);
  } else {
    await prefs.setBool('isLoggedIn', false);
  }
}

 popMultipleTimes(BuildContext context, int times) {
  for (int i = 0; i < times; i++) {
    if (GoRouter.of(context).canPop()) {
      context.pop();
    }
  }
}

void showErrorSnack(String title, BuildContext context) {
  final SnackBar erroSnackbar = SnackBar(
    content: PomboText().pomboSmText(
      text: title,
      color: PomboColors.pomboWhite,
    ),
    backgroundColor: PomboColors.pomboRed,
  );
  ScaffoldMessenger.of(context).showSnackBar(erroSnackbar);
}

void showSuccessSnack(String title, BuildContext context) {
  final SnackBar successSnackbar = SnackBar(
    content: PomboText().pomboSmText(
      text: title,
      color: PomboColors.pomboWhite,
    ),
    backgroundColor: PomboColors.pomboSuccess,
  );
  ScaffoldMessenger.of(context).showSnackBar(successSnackbar);
}

void startKYCFlow(String accessToken) {
  js.context.callMethod('initSumsub', [accessToken]);
}

getCurrencyCoin(String currency) {
  switch (currency) {
    case 'ARS':
      return 'AR\$';
    case 'EUR':
      return '€';
    case 'USD':
      return 'U\$D';
    case 'BRL':
      return 'R\$';
  }
}

getCurrencyAccount(String currency) {
  switch (currency) {
    case 'ARS':
      return 'Cuenta en Pesos (ARG)';
    case 'EUR':
      return 'Cuenta en Euros';
    case 'USD':
      return 'Cuenta en Dólares';
    case 'BRL':
      return 'Cuenta en Reales (BRA)';
  }
}
