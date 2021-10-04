import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool numberEnable;
  final bool error;
  InputWidget(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.numberEnable,
      required this.error})
      : super(key: key);

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  String get hintText => widget.hintText;
  bool get numberEnable => widget.numberEnable;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          border: widget.error ? Border.all(color: Colors.red) : null,
          borderRadius: BorderRadius.circular(6),
          color: Colors.white),
      height: 48,
      child: TextField(
        controller: widget.controller,
        keyboardType: numberEnable ? TextInputType.number : null,
        // ignore: avoid_bool_literals_in_conditional_expressions
        obscureText: numberEnable ? false : true,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 15),
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFF8E8E8E))),
      ),
    );
  }
}
