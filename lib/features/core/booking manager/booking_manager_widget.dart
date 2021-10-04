import 'package:flutter/material.dart';
import 'package:nam_training/features/core/booking%20manager/widget/booking_manager_card.dart';
import 'package:nam_training/features/core/booking%20manager/widget/choose_location_widget.dart';
import 'package:nam_training/features/core/head_switch_widget.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/images.dart';

class BookingManagerWidget extends StatefulWidget {
  const BookingManagerWidget({Key? key}) : super(key: key);

  @override
  _BookingManagerWidgetState createState() => _BookingManagerWidgetState();
}

class _BookingManagerWidgetState extends State<BookingManagerWidget> {
  bool current = true;
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
          'Quản lý đặt lịch',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          // ignore: sort_child_properties_last
          child: Container(
            padding: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
            child: HeadSwitchWidget(
              current: current,
              colorTextLeft: current ? Colors.black : const Color(0xff616161),
              colorTextRight: current ? const Color(0xff616161) : Colors.black,
              textLeft: 'Hiện tại (1)',
              textRight: 'Lịch sử',
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
      backgroundColor: backgroundLogin,
      body: current ? const Current() : null,
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.white,
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChooseLocationWidget()));
            },
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                  gradient: mainGradiant,
                  borderRadius: BorderRadius.circular(23.5)),
              child: const Center(
                  child: Text(
                'Đặt lịch',
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

class Current extends StatelessWidget {
  const Current({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 16),
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const BookingManagerCard(
          branch: 'Chi nhánh chính',
          image: imageLivestream,
          colorStatus: Colors.orange,
          status: 'Chờ xử lý',
        ),
        const BookingManagerCard(
          branch: 'Chi nhánh 1',
          image: imageCurrent,
          colorStatus: Colors.green,
          status: 'Hoàn thành',
        ),
        const BookingManagerCard(
          branch: 'Chi nhánh 2',
          image: imageBackground,
          colorStatus: Colors.green,
          status: 'Hoàn thành',
        ),
        const BookingManagerCard(
          branch: 'Chi nhánh 3',
          image: imageCover,
          colorStatus: Colors.green,
          status: 'Hoàn thành',
        ),
        const BookingManagerCard(
          branch: 'Chi nhánh 4',
          image: imageForyou,
          colorStatus: Colors.green,
          status: 'Hoàn thành',
        ),
      ],
    );
  }
}
