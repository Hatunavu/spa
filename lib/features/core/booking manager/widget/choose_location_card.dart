import 'package:flutter/material.dart';
import 'package:nam_training/styles/text.dart';

class ChooseLocationCard extends StatelessWidget {
  final String image;
  final String branch;
  final bool infor;
  const ChooseLocationCard(
      {Key? key,
      required this.image,
      required this.branch,
      required this.infor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 98,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16, left: 16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                border: infor
                    ? const Border(bottom: BorderSide(color: Color(0xffeeeeee)))
                    : null),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        branch,
                        style: text15xp6w,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Chi nhánh chính: 225 Hai Bà Trưng, Phường 6, Quận 3, Hồ Chí Minh',
                        style: text13xp4w,
                      )
                    ],
                  ),
                ),
                infor
                    ? const Padding(
                        padding: EdgeInsets.only(right: 16, left: 30),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                          size: 15,
                        ),
                      )
                    : Container(
                        width: 30,
                      ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
