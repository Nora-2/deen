import 'package:flutter/material.dart';

//! generate Custom color button for colors screen
class CustomColorButton extends StatelessWidget {
  // button variables
  final String title;
  final Color color;
  final String cImage;
  final String cVoice;
  final Color titleColor;
  final Function onClick;

  //button constructor
  const CustomColorButton({
    super.key,
    required this.title,
    required this.color,
    required this.cImage,
    required this.cVoice,
    this.titleColor = Colors.white,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      //button
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: titleColor, elevation: 5, backgroundColor: color,
        ),
        //action
        //! performs action (reperform build function in colors screen) when press on button
        onPressed: () => {onClick()},
        child: Text(
          title,
          style:const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
