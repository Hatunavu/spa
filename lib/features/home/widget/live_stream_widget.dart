import 'package:flutter/material.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/text.dart';

class LiveStreamWidget extends StatelessWidget {
  final String image;
  final String infor;
  const LiveStreamWidget({Key? key, required this.image, required this.infor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, bottom: 24),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [shadowMain]),
      child: AspectRatio(
        aspectRatio: 1.18 / 1,
        child: Column(
          children: [
            Container(
              height: 203,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(8)),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(top: 11, left: 15, right: 15),
              child: Text(
                infor,
                style: text15xp6w,
              ),
            )
          ],
        ),
      ),
    );
  }
}
