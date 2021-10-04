import 'dart:ui';

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  VoidCallback onPressed;
  String content;
  ButtonWidget({Key? key, required this.onPressed, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
              colors: [Color(0xFF7265E3), Color(0xFF8B63E6)],
              begin: FractionalOffset.topRight,
              end: FractionalOffset.bottomLeft,
              stops: [0.0, 1.0],
              tileMode: TileMode.repeated),
        ),
        height: 48,
        child: Center(
          child: Text(
            content,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
