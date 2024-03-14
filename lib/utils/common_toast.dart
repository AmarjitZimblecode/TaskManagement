import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

commonToast (BuildContext context, String message, Color backgroundColor) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: backgroundColor,));
}