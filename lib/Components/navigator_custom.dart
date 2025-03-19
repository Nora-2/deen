import 'package:deen/core/utils/appcolors/app_colors.dart';
import 'package:deen/core/utils/appimage/app_images.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

//! custom bottom navigation bar
class NavigatioBarCustom extends StatelessWidget {
  final int indexpage;
  final Function(int) onPress;

  const NavigatioBarCustom({
    super.key,
    required this.indexpage,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Appcolors.transcolor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 20,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: CurvedNavigationBar(
        index: indexpage,
        color: Appcolors.whicolor,
        buttonBackgroundColor: Appcolors.whicolor,
        backgroundColor: Appcolors.transcolor,
        height: 50,
        // navigator icons
        items: [
          Image.asset(Appimage.learnnav, width: 30, height: 30),
          Image.asset(Appimage.videonav, width: 30, height: 30),
          Image.asset(Appimage.guiznav, width: 30, height: 30),
        ],
        // action
        onTap: onPress,
      ),
    );
  }
}
