import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nam_training/features/core/course/widget/day_detail_widget.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/text.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Chi tiết liệu trình',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundLogin,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 130,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 10, bottom: 12),
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    'Thuỷ trị liệu đặc biệt Chăm sóc da mặt chuyên sâu Dermalogica',
                    style: text15xp6w,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Header(
                        icon: FontAwesomeIcons.calendarAlt,
                        firstString: 'Thực hiện',
                        secondString: '2/14 buổi',
                      ),
                      const Header(
                          icon: FontAwesomeIcons.clock,
                          firstString: 'Thời gian bắt đầu',
                          secondString: '12:00:56    04/08/2020')
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chi tiết các buổi',
                    style: text17xp6w,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Timeline(
                    day: 'Buổi 1',
                    done: true,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DayDetailWidget()));
                    },
                  ),
                  Timeline(
                    day: 'Buổi 2',
                    done: true,
                    onPressed: () {},
                  ),
                  Timeline(
                    day: 'Buổi 3',
                    done: false,
                    onPressed: () {},
                  ),
                  Timeline(
                    day: 'Buổi 4',
                    done: false,
                    onPressed: () {},
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

class Header extends StatelessWidget {
  final IconData icon;
  final String firstString;
  final String secondString;
  const Header(
      {Key? key,
      required this.icon,
      required this.firstString,
      required this.secondString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: const Color(0xffF7556C).withOpacity(0.9),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              firstString,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff616161)),
            ),
            Text(
              secondString,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff616161)),
            ),
          ],
        )
      ],
    );
  }
}

class Timeline extends StatelessWidget {
  final String day;
  final bool done;
  final VoidCallback onPressed;
  const Timeline(
      {Key? key,
      required this.day,
      required this.done,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10, top: 5),
            child: Column(
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff8E8E8E),
                  ),
                ),
                Container(
                  width: 1,
                  height: 140,
                  color: const Color(0xff8E8E8E),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  '22/12/2020',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff616161)),
                ),
                InkWell(
                  onTap: onPressed,
                  child: Container(
                    margin: const EdgeInsets.only(top: 12),
                    padding: const EdgeInsets.all(16),
                    height: 99,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              day,
                              style: text15xp6w,
                            ),
                            const Text(
                              'Lịch hẹn ngày 22/12/2020',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff616161)),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 16,
                                  width: 16,
                                  margin: const EdgeInsets.only(right: 6),
                                  decoration: done
                                      ? BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: colorDone)
                                      : null,
                                  child: done
                                      ? const Icon(
                                          Icons.done,
                                          size: 10,
                                          color: Colors.white,
                                        )
                                      : const Icon(
                                          Icons.money,
                                          size: 16,
                                          color: Colors.orange,
                                        ),
                                ),
                                done
                                    ? Text(
                                        'Đã thực hiện',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: colorDone),
                                      )
                                    : const Text(
                                        'Chưa thanh toán',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.orange),
                                      )
                              ],
                            )
                          ],
                        ),
                        const Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                          color: Color(0xff8E8E8E),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
