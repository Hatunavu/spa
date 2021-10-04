import 'package:flutter/material.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/text.dart';

class MakerCard extends StatelessWidget {
  final bool did;
  final bool choose;
  final String name;
  final String image;
  const MakerCard(
      {Key? key,
      required this.did,
      required this.choose,
      required this.name,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        border: choose ? Border.all(color: primaryColor) : null,
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: AspectRatio(
        aspectRatio: 0.75 / 1,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(90)),
            ),
            Text(
              name,
              style: text13xp4w,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 2,
            ),
            did
                ? Text(
                    'Đã làm',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: primaryColor),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
