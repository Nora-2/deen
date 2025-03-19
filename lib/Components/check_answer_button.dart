
import 'package:flutter/material.dart';

//! check answer button for math screen
class CheckButton extends StatelessWidget {
  final Function onClick;

  const CheckButton({super.key, required this.onClick});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      //button
      child: ElevatedButton(
     
        style: ElevatedButton.styleFrom(
          elevation: 5, backgroundColor: Colors.green,
        ),
  
        onPressed: onClick(),
           child: const Text(
          "check",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
