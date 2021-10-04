import 'package:flutter/material.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/text.dart';

class BookingInforCard extends StatelessWidget {
  final VoidCallback onPressed;
  final bool choose;
  final String content;
  const BookingInforCard(
      {Key? key,
      required this.onPressed,
      required this.choose,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 68,
        margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        padding: const EdgeInsets.only(left: 10, right: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: choose ? Colors.white : const Color(0xfff6f6f6),
            border: choose ? Border.all(color: primaryColor) : null),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: const Color(0xfff8e4c9),
                  ),
                ),
                Text(
                  content,
                  style: text17xp4w,
                )
              ],
            ),
            Container(
              height: 24,
              width: 24,
              child: Stack(
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                        border: choose ? null : Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(90),
                        color: choose ? primaryColor : Colors.white),
                  ),
                  Center(
                    child: choose
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 15,
                          )
                        : null,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
