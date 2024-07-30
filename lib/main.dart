import 'package:flutter/material.dart';
import 'package:pombo_wallet/app/pombo_wallet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: PomboWallet(),
    ),
  );
}
