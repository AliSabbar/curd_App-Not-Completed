import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void defaultToast({
  required String message,
  required color,
}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}