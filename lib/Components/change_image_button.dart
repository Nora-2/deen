import 'package:flutter/material.dart';


//! Click to start button for alphabets page
Widget changeImageButton(
    {required String startButton, required Function changePic}) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    width: double.infinity,
    // button
    child: ElevatedButton(
    
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
      ),
        child: Text(
        startButton,
        style: const TextStyle(fontSize: 30),
      ),
      onPressed: () => {changePic()},
    ),
  );
}
