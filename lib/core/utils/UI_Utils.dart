import 'package:evently_sun_online/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' show Fluttertoast, ToastGravity;

class UIUtils {
  static void showLoading(BuildContext context, { bool isDismissable = true}) {
    showDialog(
        barrierDismissible: isDismissable,
        context: context, builder: (context) =>
        PopScope(
          canPop: isDismissable,
          child: AlertDialog(content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: CircularProgressIndicator(),)
            ],),),
        ));
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }


  static void showMessageDialog(BuildContext context, String message) {
    showDialog(context: context,
        builder: (context) =>
            AlertDialog(content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Text(message,
                    style: TextStyle(fontSize: 16, color: ColorsManager.black),
                    ),),
              ],
            ),));
  }


  static void showToast(String message, Color bgColor){
    Fluttertoast.showToast(
        msg: message,

        gravity: ToastGravity.BOTTOM_RIGHT,

        backgroundColor:bgColor,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}