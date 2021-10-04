import 'package:flutter/material.dart';
import 'package:nam_training/styles/text.dart';

class BookingManagerCard extends StatelessWidget {
  final String branch;
  final String image;
  final Color colorStatus;
  final String status;
  const BookingManagerCard(
      {Key? key,
      required this.branch,
      required this.image,
      required this.colorStatus,
      required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Column(
        children: [
          Container(
            height: 42,
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Đặt lịch: ',
                      style: textbooking4w,
                    ),
                    Text(
                      '14/06/2020, 09:00',
                      style: textbooking6w,
                    )
                  ],
                ),
                const Text(
                  '43534534',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 14),
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(6)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      branch,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(
                          Icons.location_pin,
                          size: 15,
                          color: Color(0xff8E8E8E),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Expanded(
                          child: Text(
                            'Chi nhánh chính: 225 Hai Bà Trưng, Phường 6, Quận 3, Hồ Chí Minh',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff616161)),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 15,
                          color: colorStatus,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(
                          status,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: colorStatus),
                        ))
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
