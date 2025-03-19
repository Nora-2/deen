import 'package:flutter/material.dart';


//! choice button generator for math screen
class MathChoiceButton extends StatelessWidget {
  //button feilds
  final String title;
  final Function onClick;
  final Color primary;

  //constructor
  const MathChoiceButton({
    super.key,
    required this.title,
    required this.onClick,
    required this.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        //button
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            elevation: 10,
          ),
          //action
          onPressed: onClick(),
          child: Text(
            title,
            style:const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
