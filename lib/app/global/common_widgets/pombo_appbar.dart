import 'package:flutter/material.dart';

class PomboAppBar extends AppBar {
  PomboAppBar({
    required this.appBarTitle,
    this.drawer,
    this.avatarImage,
    this.actionWidgets,
    super.key,
  }) : super(
          title: Text(
            appBarTitle,
          ),
          actions: actionWidgets,
          elevation: 3,
          automaticallyImplyLeading: true,
        );

  final String appBarTitle;
  final Widget? drawer;
  final ImageProvider? avatarImage;
  final List<Widget>? actionWidgets;
}
