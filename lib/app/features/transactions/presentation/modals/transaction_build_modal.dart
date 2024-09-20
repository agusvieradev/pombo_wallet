import 'package:flutter/material.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';

class TransactionBuildModal {
  List<Widget> buildTransactionTypeModal(String transactionType) {
    switch (transactionType) {
      case 'deposit':
        return [
          PomboText().pomboLgText(text: 'Realizá tu deposito como vos quieras'),
          PomboWhiteSpaces.hSpaceM,
          PomboText().pomboSmText(
            text: 'Elegí la divisa con la que queres operar',
          ),
        ];
      case 'payment':
        return [
          PomboText().pomboLgText(text: 'Realizá tu cobro como vos quieras'),
          PomboWhiteSpaces.hSpaceM,
          PomboText().pomboSmText(
            text: 'Elegí la divisa con la que queres operar',
          ),
        ];
      case 'withdraw':
        return [
          PomboText().pomboLgText(text: 'Retirá tu dinero como vos quieras'),
          PomboWhiteSpaces.hSpaceM,
          PomboText().pomboSmText(
            text: 'Elegí la divisa con la que queres operar',
          ),
        ];
      default:
        return [];
    }
  }
}
