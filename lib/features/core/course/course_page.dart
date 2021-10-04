import 'package:flutter/material.dart';
import 'package:nam_training/features/core/course/widget/course_card_widget.dart';
import 'package:nam_training/features/core/course/widget/generality_widget.dart';
import 'package:nam_training/features/core/head_switch_widget.dart';
import 'package:nam_training/styles/colors.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  bool current = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundLogin,
        body: Column(
          children: [
            Container(
              height: 132,
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
              width: double.infinity,
              color: primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    'Liệu trình',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  HeadSwitchWidget(
                      onPressed1: () {
                        setState(() {
                          current = true;
                        });
                      },
                      onPressed2: () {
                        setState(() {
                          current = false;
                        });
                      },
                      current: current,
                      textLeft: 'Hiện tại (1)',
                      textRight: 'Lịch sử',
                      colorTextLeft: current ? primaryColor : Colors.white,
                      colorTextRight: current ? Colors.white : primaryColor,
                      bachgroundColor: const Color(0xffa790de)),
                ],
              ),
            ),
            current ? const Current() : const History()
          ],
        ));
  }
}

class Current extends StatelessWidget {
  const Current({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.only(top: 16),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GeneralityWidget()));
              },
              child: const CourseCardWidget()),
          const CourseCardWidget(),
          const CourseCardWidget(),
          const CourseCardWidget(),
          const CourseCardWidget(),
          const CourseCardWidget(),
        ],
      ),
    );
  }
}

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // ignore: prefer_const_constructors
        child: Center(
          child: const Text('History'),
        ),
      ),
    );
  }
}
