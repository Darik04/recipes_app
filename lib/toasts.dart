import 'package:recipes_app/constants/colors/color_styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showAlertToast(String msg) {
  Fluttertoast.showToast(
      msg: '$msg',
      gravity: ToastGravity.TOP,
      backgroundColor: ColorStyles.red_failure,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 16,);
}

void showSuccessAlertToast(String msg) {
  Fluttertoast.showToast(
      msg: '$msg',
      timeInSecForIosWeb: 2,
      gravity: ToastGravity.TOP,
      backgroundColor: ColorStyles.green_accent,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 20,);
}