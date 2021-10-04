import 'package:flutter/material.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/text.dart';

class ExtensionWidget extends StatelessWidget {
  final String image;
  final String infor;
  final String time;
  ExtensionWidget(
      {Key? key, required this.image, required this.infor, required this.time});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, bottom: 24),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [shadowMain]),
      child: AspectRatio(
        aspectRatio: 1.34 / 1,
        child: Column(
          children: [
            Container(
              height: 146,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.vertical(
                      // ignore: unnecessary_const
                      top: const Radius.circular(8))),
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: 16, left: 15, right: 15, bottom: 11),
              child: Text(
                infor,
                style: text15xp6w,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 17,
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 10,
                  ),
                  Text(time,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff979797)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
