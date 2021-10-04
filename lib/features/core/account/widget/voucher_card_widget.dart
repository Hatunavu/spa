import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/text.dart';

class VouchetCardWidget extends StatelessWidget {
  final String image;
  const VouchetCardWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [shadowMain]),
      child: AspectRatio(
        aspectRatio: 1.4,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(8)),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Tặng voucher 200.000đ trải nghiệm nhà hàng Zota Capuda',
                        style: text15xp6w,
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(
                            FontAwesomeIcons.coins,
                            size: 18,
                            color: Colors.orange,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            '12 điểm',
                            style: text15xp4w,
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
