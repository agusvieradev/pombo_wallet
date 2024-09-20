import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pombo_wallet/app/global/constants/pombo_colors.dart';
import 'package:pombo_wallet/app/global/common_widgets/pombo_text.dart';
import 'package:pombo_wallet/app/global/constants/pombo_white_spaces.dart';

class TransactionCard extends ConsumerStatefulWidget {
  const TransactionCard({
    super.key,
    required this.cardText,
    required this.cardImagePath,
    required this.cardAction,
    this.isSelected = false,
  });

  final bool isSelected;
  final String cardText;
  final String cardImagePath;
  final Function()? cardAction;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransactionCardState();
}

class _TransactionCardState extends ConsumerState<TransactionCard> {
  Color cardColor = PomboColors.pomboWhite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.cardAction,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) {
          setState(() {
            cardColor = PomboColors.pomboBlue.withOpacity(0.1);
          });
        },
        onExit: (event) {
          setState(() {
            cardColor = PomboColors.pomboWhite;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: PomboColors.pomboBlue, width: 2.0),
            color: cardColor,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  widget.cardImagePath,
                  width: 75,
                  height: 75,
                ),
              ),
              PomboWhiteSpaces.wSpaceM,
              PomboText().pomboMdText(text: widget.cardText)
            ],
          ),
        ),
      ),
    );
  }
}
