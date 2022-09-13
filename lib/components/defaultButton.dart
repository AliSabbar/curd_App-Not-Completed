import 'package:flutter/material.dart';

Widget defaultButton({
  required Widget child,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: 180,
    height: 50,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      child:  child,
    ),
  );
}