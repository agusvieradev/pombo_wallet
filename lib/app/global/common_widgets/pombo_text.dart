import 'package:flutter/material.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';

class PomboText {
  final String _fontFamily = 'Roboto';
  final String _secondaryFontFamily = 'Retrokia';

  Text pomboSmText({
    required String text,
    bool isBold = false,
    bool isPrimary = true,
    bool isLight = false,
    bool isSpaced = false,
    Color? color = PomboColors.pomboBlue,
  }) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        letterSpacing: isSpaced ? 0.5 : 0,
        fontFamily: isPrimary ? _fontFamily : _secondaryFontFamily,
        color: color,
        fontWeight: isBold
            ? FontWeight.w700
            : isLight
                ? FontWeight.w100
                : FontWeight.normal,
        fontSize: isPrimary ? 20.0 : 14.0,
      ),
    );
  }

  Text pomboMdText({
    required String text,
    bool isBold = false,
    bool isPrimary = true,
    bool isLight = false,
    bool isSpaced = false,
    Color? color = PomboColors.pomboBlue,
  }) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        letterSpacing: isSpaced ? 0.5 : 0,
        fontFamily: isPrimary ? _fontFamily : _secondaryFontFamily,
        color: color,
        fontWeight: isBold
            ? FontWeight.w700
            : isLight
                ? FontWeight.w100
                : FontWeight.normal,
        fontSize: isPrimary ? 22.0 : 16.0,
      ),
    );
  }

  Text pomboLgText({
    required String text,
    bool isBold = false,
    bool isPrimary = true,
    bool isLight = false,
    bool isSpaced = false,
    Color? color = PomboColors.pomboBlue,
  }) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        letterSpacing: isSpaced ? 0.5 : 0,
        fontFamily: isPrimary ? _fontFamily : _secondaryFontFamily,
        color: color,
        fontWeight: isBold
            ? FontWeight.w700
            : isLight
                ? FontWeight.w100
                : FontWeight.normal,
        fontSize: isPrimary ? 26.0 : 20.0,
      ),
    );
  }

  Text pomboXLText({
    required String text,
    bool isBold = false,
    bool isPrimary = true,
    bool isLight = false,
    bool isSpaced = false,
    Color? color = PomboColors.pomboBlue,
  }) {
    return Text(
      text,
      softWrap: true,
      style: TextStyle(
        letterSpacing: isSpaced ? 0.5 : 0,
        fontFamily: isPrimary ? _fontFamily : _secondaryFontFamily,
        color: color,
        fontWeight: isBold
            ? FontWeight.w700
            : isLight
                ? FontWeight.w100
                : FontWeight.normal,
        fontSize: isPrimary ? 36.0 : 28.0,
      ),
    );
  }
}
