import 'package:flutter/material.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';

class PomboText {
  final String _fontFamily = 'Roboto';
  final String _secondaryFontFamily = 'Kiona';

  Text pomboSmText({
    required String text,
    bool isBold = false,
    bool isPrimary = true,
    bool isLight = false,
    Color? color = PomboColors.pomboPrimaryText,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: isPrimary ? _fontFamily : _secondaryFontFamily,
        color: color,
        fontWeight: isBold
            ? FontWeight.w900
            : isLight
                ? FontWeight.w100
                : FontWeight.normal,
        fontSize: 18.0,
      ),
    );
  }

  Text pomboMdText({
    required String text,
    bool isBold = false,
    bool isPrimary = true,
    bool isLight = false,
    Color? color = PomboColors.pomboPrimaryText,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: isPrimary ? _fontFamily : _secondaryFontFamily,
        color: color,
        fontWeight: isBold
            ? FontWeight.w900
            : isLight
                ? FontWeight.w100
                : FontWeight.normal,
        fontSize: 20.0,
      ),
    );
  }

  Text pomboLgText({
    required String text,
    bool isBold = false,
    bool isPrimary = true,
    bool isLight = false,
    Color? color = PomboColors.pomboPrimaryText,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: isPrimary ? _fontFamily : _secondaryFontFamily,
        color: color,
        fontWeight: isBold
            ? FontWeight.w900
            : isLight
                ? FontWeight.w100
                : FontWeight.normal,
        fontSize: 22.0,
      ),
    );
  }

  Text pomboXLText({
    required String text,
    bool isBold = false,
    bool isPrimary = true,
    bool isLight = false,
    Color? color = PomboColors.pomboPrimaryText,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: isPrimary ? _fontFamily : _secondaryFontFamily,
        color: color,
        fontWeight: isBold
            ? FontWeight.w900
            : isLight
                ? FontWeight.w100
                : FontWeight.normal,
        fontSize: 36.0,
      ),
    );
  }
}
