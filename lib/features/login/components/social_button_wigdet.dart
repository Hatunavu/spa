import 'package:flutter/material.dart';

class SocialButtonWidget extends StatelessWidget {
  String loginWith;
  IconData icon;
  Color color;
  SocialButtonWidget(
      {Key? key,
      required this.loginWith,
      required this.icon,
      required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Icon(
                    icon,
                    color: color,
                  ),
                ),
              ],
            ),
            Center(
                child: Text(loginWith,
                    style: TextStyle(
                        color: Color(0xFF353535),
                        fontSize: 15,
                        fontWeight: FontWeight.w600))),
          ],
        ));
  }
}
