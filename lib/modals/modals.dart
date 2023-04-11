




import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Modals {


  static void showToast({String message = 'Error'}){

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.red,
        fontSize: 16.0
    );
  }

}