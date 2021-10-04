import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nam_training/features/core/account/widget/voucher_card_widget.dart';
import 'package:nam_training/features/core/head_switch_widget.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/images.dart';
import 'package:nam_training/styles/text.dart';

class VoucherWidget extends StatefulWidget {
  const VoucherWidget({Key? key}) : super(key: key);

  @override
  _VoucherWidgetState createState() => _VoucherWidgetState();
}

class _VoucherWidgetState extends State<VoucherWidget> {
  late bool choose;
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
          'Ưu đãi của tôi',
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
              textLeft: 'Riêng cho bạn',
              textRight: 'Hạng của bạn',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 30,
              margin: const EdgeInsets.only(left: 16, top: 12, bottom: 18),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    margin: const EdgeInsets.only(right: 8),
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.2))),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.filter,
                          size: 13,
                          color: primaryColor,
                        ),
                        Text(
                          'demo',
                          style: text13xp4w,
                        ),
                      ],
                    ),
                  ),
                  const Item(choose: true, content: 'Chi nhánh'),
                  const Item(choose: false, content: 'Chi nhánh'),
                  const Item(choose: false, content: 'Thực phẩm'),
                  const Item(choose: false, content: 'Chi nhánh'),
                  const Item(choose: false, content: 'Thực phẩm'),
                ],
              ),
            ),
            const VouchetCardWidget(
              image: imageForyou,
            ),
            const VouchetCardWidget(
              image: imageCover,
            ),
            const VouchetCardWidget(
              image: imageCurrent,
            ),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final bool choose;
  final String content;
  const Item({Key? key, required this.choose, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(right: 8),
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: choose ? primaryColor : Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.2))),
      child: Center(
        child: Text(
          content,
          style: choose
              ? const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)
              : text13xp4w,
        ),
      ),
    );
  }
}
