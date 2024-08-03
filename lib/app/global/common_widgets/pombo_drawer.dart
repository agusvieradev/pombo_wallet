import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class PomboSideBar extends ConsumerWidget {
  const PomboSideBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      elevation: 10.0,
      child: Container(
        width: 350,
        color: Colors.white,
        child: ListView(
          children: [
            SvgPicture.asset(
              'pombo_logo.svg',
              width: 220,
              height: 220,
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Color.fromARGB(255, 20, 149, 255),
                BlendMode.srcIn,
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Home'),
              onTap: () {
                // Handle the tap event here.
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle_rounded),
              title: Text('Settings'),
              onTap: () {
                // Handle the tap event here.
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
    );
  }
}
