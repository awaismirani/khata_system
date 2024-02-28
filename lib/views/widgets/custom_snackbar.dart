import 'package:flutter/material.dart';

class CustomSnackBar {
  showSnackBar(BuildContext context,String content){
    return ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
  content: Text(
  content.toString())));
}
}
