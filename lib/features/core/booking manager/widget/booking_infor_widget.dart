import 'package:flutter/material.dart';
import 'package:nam_training/features/core/booking%20manager/widget/booking_infor_card.dart';
import 'package:nam_training/features/core/booking%20manager/widget/choose_location_card.dart';
import 'package:nam_training/features/core/booking%20manager/widget/choose_maker_widget.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/images.dart';
import 'package:nam_training/styles/text.dart';

class BookingInforWidget extends StatefulWidget {
  const BookingInforWidget({Key? key}) : super(key: key);

  @override
  _BookingInforWidgetState createState() => _BookingInforWidgetState();
}

class _BookingInforWidgetState extends State<BookingInforWidget> {
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
          'Thông tin đặt lịch',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
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
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChooseMakerWidget(
                            titleApbar: 'Chọn nhân viên',
                          )));
            },
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
      backgroundColor: backgroundLogin,
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 10,
          ),
          const ChooseLocationCard(
              image: imageCover, branch: 'Chi nhánh chính', infor: false),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Tôi quan tâm dịch vụ',
                    style: text17xp6w,
                  ),
                ),
                BookingInforCard(
                  content: 'Triệt lông',
                  choose: true,
                  onPressed: () {},
                ),
                BookingInforCard(
                  content: 'Trị mụn cơ bản',
                  choose: false,
                  onPressed: () {},
                ),
                BookingInforCard(
                  content: 'Trị mụn chuyên sâu',
                  choose: false,
                  onPressed: () {},
                ),
                BookingInforCard(
                  content: 'Hút chỉ thải độc tố',
                  choose: false,
                  onPressed: () {},
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
