import 'package:flutter/material.dart';
import 'package:nam_training/features/core/booking%20manager/widget/booking_infor_widget.dart';
import 'package:nam_training/features/core/booking%20manager/widget/choose_location_card.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/images.dart';
import 'package:nam_training/styles/text.dart';

class ChooseLocationWidget extends StatefulWidget {
  const ChooseLocationWidget({Key? key}) : super(key: key);

  @override
  _ChooseLocationWidgetState createState() => _ChooseLocationWidgetState();
}

class _ChooseLocationWidgetState extends State<ChooseLocationWidget> {
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
          'Chọn địa điểm',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: Container(
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            height: 36,
            decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(8)),
            child: Theme(
              data: Theme.of(context).copyWith(
                primaryColor: primaryColor,
              ),
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    contentPadding: EdgeInsets.only(top: 4),
                    hintText: 'Tìm kiếm',
                    hintStyle:
                        TextStyle(color: Color(0xFF8E8E8E), fontSize: 15)),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: backgroundLogin,
      body: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 8, bottom: 16),
                child: Text(
                  'Chọn địa điểm bạn muốn chọn',
                  style: text17xp6w,
                ),
              ),
              Expanded(
                child: ListView(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BookingInforWidget()));
                      },
                      child: const ChooseLocationCard(
                        image: imageCover,
                        branch: 'Chi nhánh chính',
                        infor: true,
                      ),
                    ),
                    const ChooseLocationCard(
                      image: imageBackground,
                      branch: 'Chi nhánh 1',
                      infor: true,
                    ),
                    const ChooseLocationCard(
                      image: imageCurrent,
                      branch: 'Chi nhánh 2',
                      infor: true,
                    ),
                    const ChooseLocationCard(
                      image: imageForyou,
                      branch: 'Chi nhánh 3',
                      infor: true,
                    ),
                    const ChooseLocationCard(
                      image: imageCover,
                      branch: 'Chi nhánh 4',
                      infor: true,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
