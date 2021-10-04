import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/images.dart';
import 'package:nam_training/styles/images.dart';
import 'package:nam_training/styles/text.dart';

class BookerInforWidget extends StatefulWidget {
  const BookerInforWidget({Key? key}) : super(key: key);

  @override
  _BookerInforWidgetState createState() => _BookerInforWidgetState();
}

class _BookerInforWidgetState extends State<BookerInforWidget> {
  int count = 0;
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
          'Thông tin người đặt',
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
              margin: const EdgeInsets.only(top: 9, bottom: 20),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
              height: 200,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 77,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xffECECEC)))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 56,
                          width: 56,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: const DecorationImage(
                                  image: AssetImage(imageForyou),
                                  fit: BoxFit.cover)),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(
                                'Chi nhánh chính',
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
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Dịch vụ',
                            style: TextStyle(
                                color: Color(0xff616161),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                            width: 240,
                            child: Text(
                              'Trị mụn cơ bản, Trị nám, Chăm sóc da, Chăm sóc tóc, Spa toàn thân',
                              style: text15xp4w,
                              textAlign: TextAlign.right,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nhân viên',
                            style: TextStyle(
                                color: Color(0xff616161),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                            width: 240,
                            child: const Text(
                              'Trần Dương An',
                              textAlign: TextAlign.right,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 56,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Bạn đặt lịch cho',
                    style: text17xp6w,
                  ),
                  Container(
                    width: 109,
                    height: 44,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Color(0xffE7EAEB)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              count++;
                            });
                          },
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xffC4CACC)),
                            child: const Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                        Text(
                          count.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff455154).withOpacity(0.6)),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              count--;
                            });
                          },
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xffC4CACC)),
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 308,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thông tin người đặt',
                    style: text17xp6w,
                  ),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const InputInfor(
                        content: 'Họ và tên',
                      ),
                      const InputInfor(
                        content: 'Email',
                      ),
                      const InputInfor(
                        content: 'Số điện thoại',
                      ),
                      Container(
                        height: 73,
                        padding: const EdgeInsets.only(left: 16),
                        margin: const EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffF6F6F6)),
                        child: const TextField(
                          // keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          decoration: InputDecoration(
                              hintText: 'Ghi chú',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Color(0xff616161))),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: backgroundLogin,
                blurRadius: 2,
                offset: const Offset(-2, -2))
          ],
          color: Colors.white,
        ),
        height: 60,
        child: Center(
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                  gradient: mainGradiant,
                  borderRadius: BorderRadius.circular(23.5)),
              child: const Center(
                  child: Text(
                'Tiếp tục',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )),
            ),
          ),
        ),
      ),
    );
  }
}

class InputInfor extends StatelessWidget {
  final String content;
  const InputInfor({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.only(left: 16),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffF6F6F6)),
      child: TextField(
        decoration: InputDecoration(
            hintText: content,
            border: InputBorder.none,
            hintStyle: const TextStyle(color: Color(0xff616161))),
      ),
    );
  }
}
