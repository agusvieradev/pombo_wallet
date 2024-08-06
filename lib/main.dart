// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:pombo_wallet/app/pombo_wallet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(
    const ProviderScope(
      child: PomboWallet(),
    ),
  );
}
