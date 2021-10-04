import 'package:flutter/material.dart';
import 'package:nam_training/features/core/booking%20manager/widget/choose_maker_widget.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/text.dart';

class DayDetailWidget extends StatefulWidget {
  const DayDetailWidget({Key? key}) : super(key: key);

  @override
  _DayDetailWidgetState createState() => _DayDetailWidgetState();
}

class _DayDetailWidgetState extends State<DayDetailWidget> {
  _alarmSetting() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16))),
                  height: 230,
                  child: Column(
                    children: [
                      Text(
                        'Tùy chỉnh nhắc nhở',
                        style: text17xp6w,
                      ),
                      Container(
                        height: 44,
                        margin: const EdgeInsets.only(top: 26, bottom: 20),
                        padding: const EdgeInsets.only(left: 16, bottom: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffF6F6F6)),
                        child: const TextField(
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Thời gian nhắc nhở'),
                        ),
                      ),
                      Row(
                        children: [
                          const CheckTime(
                            time: 'Phút',
                            isCheck: true,
                          ),
                          const CheckTime(
                            time: 'Giờ',
                            isCheck: false,
                          ),
                          const CheckTime(
                            time: 'Ngày',
                            isCheck: false,
                          ),
                          const CheckTime(
                            time: 'Tuần',
                            isCheck: false,
                          )
                        ],
                      ),
                      Container(
                        height: 44,
                        margin: const EdgeInsets.only(top: 16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23.5),
                            gradient: mainGradiant),
                        child: const Center(
                          child: Text(
                            'Xong',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 14,
                  right: 14,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffC7C7C7)),
                      child: const Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

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
          'Chi tiết buổi 1',
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
              width: double.infinity,
              margin: const EdgeInsets.only(top: 12, bottom: 12),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              height: 173,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Buổi 1',
                    style: text17xp6w,
                  ),
                  StatusHead(
                      topic: 'Trạng thái',
                      content: 'Đã thực hiện',
                      onPressed: () {},
                      isPress: false),
                  StatusHead(
                      topic: 'Lịch hẹn',
                      content: 'Tạo lịch hẹn',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChooseMakerWidget(
                                    titleApbar: 'Chọn lịch hẹn')));
                      },
                      isPress: true),
                  StatusHead(
                      topic: 'Nhắc nhở',
                      content: 'Cài đặt nhắc nhở',
                      onPressed: _alarmSetting,
                      isPress: true),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chi tiết liệu trình',
                    style: text17xp6w,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    course,
                    style: text15xp4w,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      const Check(content: 'Trị mụn cơ bản'),
                      const Check(content: 'Trị mụn chuyên sâu'),
                      const Check(content: 'Hút chỉ thải độc tố'),
                      const Check(content: 'Trị mụn cơ bản'),
                      const Check(content: 'Trị mụn chuyên sâu'),
                      const Check(content: 'Hút chỉ thải độc tố'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StatusHead extends StatelessWidget {
  final String topic;
  final String content;
  final VoidCallback onPressed;
  final bool isPress;
  const StatusHead(
      {Key? key,
      required this.topic,
      required this.content,
      required this.onPressed,
      required this.isPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          topic,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xff616161)),
        ),
        InkWell(
            onTap: onPressed,
            child: Text(
              content,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: isPress ? primaryColor : Colors.black),
            ))
      ],
    );
  }
}

class Check extends StatelessWidget {
  final String content;
  const Check({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Container(
        height: 68,
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.only(left: 10, right: 16, top: 8, bottom: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: const Color(0xffDADADA))),
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
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xff39C541)),
                  ),
                  const Center(
                      child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CheckTime extends StatelessWidget {
  final String time;
  final bool isCheck;
  const CheckTime({Key? key, required this.time, required this.isCheck})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 9),
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                  border: isCheck ? null : Border.all(color: Colors.grey),
                  shape: BoxShape.circle,
                  color: isCheck ? primaryColor : const Color(0xffF4F6FA)),
              child: isCheck
                  ? const Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 15,
                    )
                  : null,
            ),
            Text(
              time,
              style: text17xp4w,
            )
          ],
        ));
  }
}
