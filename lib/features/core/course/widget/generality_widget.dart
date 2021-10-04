import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nam_training/features/core/course/widget/detail_widget.dart';
import 'package:nam_training/features/core/course/widget/dropdown_widget.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/images.dart';
import 'package:nam_training/styles/text.dart';

class GeneralityWidget extends StatefulWidget {
  const GeneralityWidget({Key? key}) : super(key: key);

  @override
  _GeneralityWidgetState createState() => _GeneralityWidgetState();
}

class _GeneralityWidgetState extends State<GeneralityWidget> {
  late ScrollController scrollController;
  bool isScrool = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  scrollListener() {
    if (scrollController.offset > 160) {
      setState(() {
        isScrool = true;
      });
    } else {
      setState(() {
        isScrool = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLogin,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            backgroundColor: Colors.white,
            leading: AddLeading(
              isScrool: isScrool,
            ),
            expandedHeight: 233,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageCover), fit: BoxFit.cover)),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              height: 142,
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Thuỷ trị liệu đặc biệt Chăm sóc da mặt chuyên sâu Dermalogica',
                    style: text22xp6w,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.red,
                            size: 10,
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Thực hiện',
                            style: text13xp4w,
                          ),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '2/14 buổi',
                            style: text13xp6w,
                          ),
                        ],
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          // ignore: prefer_const_constructors
                          Icon(
                            Icons.alarm,
                            color: Colors.red,
                            size: 10,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Thời gian thực hiện',
                            style: text13xp4w,
                          ),
                          Text(
                            '12:00:56    04/08/2020',
                            style: text13xp6w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 42,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: primaryColor))),
                              child: Center(
                                child: Text(
                                  'Thông tin',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ))),
                      Expanded(
                          flex: 1,
                          child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xffEFF0F3)))),
                              child: const Center(
                                child: Text(
                                  'Chi tiết liệu trình',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ))),
                      Expanded(
                          flex: 1,
                          child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xffEFF0F3)))),
                              child: const Center(
                                child: Text(
                                  'Hiệu quả',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              )))
                    ],
                  ),
                )
              ],
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thông tin chi tiết',
                    style: text17xp6w,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    infor,
                    style: text17xp4w,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextAndButton(
                    icon: FontAwesomeIcons.clock,
                    textBotton: 'Xem chi tiết',
                    textHead: 'Chi tiết liệu trình',
                    content: course,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailWidget()));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(child: DropDownWidget()),
                  const SizedBox(
                    height: 20,
                  ),
                  TextAndButton(
                    icon: FontAwesomeIcons.print,
                    textBotton: 'Tải văn bản cam kết',
                    textHead: 'Hiệu quả cam kết',
                    content: course,
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}

class AddLeading extends StatelessWidget {
  final bool isScrool;
  const AddLeading({Key? key, required this.isScrool}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: isScrool ? Colors.black : Colors.white,
          ),
        )
      ],
    );
  }
}

class TextAndButton extends StatelessWidget {
  final IconData icon;
  final String textBotton;
  final String textHead;
  final String content;
  final VoidCallback onPressed;
  const TextAndButton(
      {Key? key,
      required this.icon,
      required this.textBotton,
      required this.textHead,
      required this.content,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textHead,
          style: text17xp6w,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          content,
          style: text17xp4w,
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: onPressed,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: const Color(0xff814CDF).withOpacity(0.1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: primaryColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  textBotton,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: primaryColor),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
