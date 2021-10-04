import 'package:flutter/material.dart';

class HeadSwitchWidget extends StatelessWidget {
  final VoidCallback onPressed1;
  final VoidCallback onPressed2;
  final String textLeft;
  final String textRight;
  final Color colorTextLeft;
  final Color colorTextRight;
  final Color bachgroundColor;
  final bool current;
  const HeadSwitchWidget({
    Key? key,
    required this.onPressed1,
    required this.onPressed2,
    required this.current,
    required this.textLeft,
    required this.textRight,
    required this.colorTextLeft,
    required this.colorTextRight,
    required this.bachgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.91),
        color: bachgroundColor,
      ),
      height: 30,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: onPressed1,
              child: Container(
                margin: const EdgeInsets.only(left: 2, top: 2, bottom: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.93),
                    color: current ? Colors.white : Colors.transparent),
                child: Center(
                  child: Text(textLeft,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: colorTextLeft)
                      // ignore: prefer_const_constructors

                      ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: InkWell(
                onTap: onPressed2,
                child: Container(
                  margin: const EdgeInsets.only(right: 2, top: 2, bottom: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.93),
                      color: current ? Colors.transparent : Colors.white),
                  // ignore: prefer_const_constructors
                  child: Center(
                    child: Text(
                      textRight,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: colorTextRight),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
