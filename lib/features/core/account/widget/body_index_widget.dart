import 'package:flutter/material.dart';
import 'package:nam_training/features/core/account/widget/body_fat_widget.dart';
import 'package:nam_training/features/core/account/widget/create_new_widget.dart';
import 'package:nam_training/features/core/account/widget/param_widget.dart';
import 'package:nam_training/features/core/head_switch_widget.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/text.dart';

class BodyIndexWidget extends StatefulWidget {
  const BodyIndexWidget({Key? key}) : super(key: key);

  @override
  _BodyIndexWidgetState createState() => _BodyIndexWidgetState();
}

class _BodyIndexWidgetState extends State<BodyIndexWidget> {
  bool current = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLogin,
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
          'Chỉ số cơ thể',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Icon(
            Icons.search,
            color: Colors.black,
          ),
          const SizedBox(
            width: 16,
          ),
        ],
        centerTitle: true,
        bottom: PreferredSize(
          // ignore: sort_child_properties_last
          child: Container(
            padding: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
            child: HeadSwitchWidget(
              current: current,
              colorTextLeft: current ? Colors.black : const Color(0xff616161),
              colorTextRight: current ? const Color(0xff616161) : Colors.black,
              textLeft: 'Chỉ số cơ bản',
              textRight: 'Thông số tính toán',
              bachgroundColor: const Color.fromRGBO(118, 118, 128, 0.12),
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
            ),
          ),
          preferredSize: const Size.fromHeight(44),
        ),
      ),
      body: current
          ? Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const IntemBody(
                        screen: BodyFatWidget(),
                        content: 'Body Fat',
                        percent: '19%',
                        color: Color(0xffFF9500),
                      ),
                      const IntemBody(
                        screen: BodyFatWidget(),
                        content: 'Water Weight',
                        percent: '32%',
                        color: Color(0xff79C7A5),
                      ),
                      const IntemBody(
                        screen: BodyFatWidget(),
                        content: 'Lean Weight',
                        percent: '19%',
                        color: Color(0xff5AC8FA),
                      ),
                      const IntemBody(
                        screen: BodyFatWidget(),
                        content: 'Healthy Habits',
                        percent: '32%',
                        color: Color(0xff5856D6),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateNewWidget()));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          height: 48,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: mainGradiant,
                              boxShadow: [shadowMain]),
                          child: const Center(
                            child: Text(
                              'Tạo mới',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 48,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white),
                        child: Center(
                          child: Text(
                            'Chỉnh sửa chỉ số nhanh',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ))
          : const ParamWidget(),
    );
  }
}

class IntemBody extends StatelessWidget {
  final Widget screen;
  final String content;
  final String percent;
  final Color color;
  const IntemBody(
      {Key? key,
      required this.screen,
      required this.percent,
      required this.content,
      required this.color})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Container(
        height: 80,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.white),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              child: Center(
                child: Container(
                    height: 44,
                    width: 44,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, color: color)),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        content,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff616161)),
                      ),
                      Text(
                        percent,
                        style: text17xp6w,
                      )
                    ],
                  ),
                  const Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Color(0xffC7C7C7),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
