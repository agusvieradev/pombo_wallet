import 'package:flutter/material.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';

class PomboText {
  final String _fontFamily = 'Comfortaa';
  Text pomboSmText(String text, bool isBold) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _fontFamily,
        color: PomboColors.pomboPrimaryText,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: 18.0,
      ),
    );
  }

  Text pomboMdText(String text, bool isBold) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _fontFamily,
        color: PomboColors.pomboPrimaryText,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: 20.0,
      ),
    );
  }

  Text pomboLgText(String text, bool isBold) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _fontFamily,
        color: PomboColors.pomboPrimaryText,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: 22.0,
      ),
    );
  }

  Text pomboXLText(String text, bool isBold) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _fontFamily,
        color: PomboColors.pomboPrimaryText,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: 36.0,
      ),
    );
  }
}
