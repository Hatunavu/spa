import 'package:flutter/material.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/text.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

List<bool> _isOpen = [false, false];

class _DropDownWidgetState extends State<DropDownWidget> {
  bool down = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Expansion(
          content: 'Buổi 1: Điều trị, khám da mặt',
        ),
        const Expansion(
          content: 'Buổi 2: Bắt đầu tiền hành Spa',
        ),
        const Expansion(content: 'Buổi 3: Tiến hành điều trị toàn thana'),
        const Expansion(content: 'Buổi 4: Thang lọc cơ thể')
      ],
    );
  }
}

class ExpansionItem extends StatelessWidget {
  final String content;
  const ExpansionItem({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      margin: const EdgeInsets.only(bottom: 12, left: 10, right: 10),
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Row(
        children: [
          Container(
            height: 52,
            width: 52,
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xffffebd0)),
          ),
          Text(
            content,
            style: text17xp4w,
          )
        ],
      ),
    );
  }
}

class Expansion extends StatelessWidget {
  final String content;
  const Expansion({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      contentPadding: const EdgeInsets.only(right: 10),
      dense: true,
      child: ExpansionTile(
        backgroundColor: backgroundLogin,
        title: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xffEDEDED),
              ),
              color: Colors.white,
              boxShadow: [borderShadow]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                content,
                style: text15xp6w,
              ),
            ],
          ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const SizedBox(
            height: 10,
          ),
          const ExpansionItem(
            content: 'Trị mụn cơ bản',
          ),
          const ExpansionItem(
            content: 'Trị mụn chuyên sâu',
          ),
          const ExpansionItem(
            content: 'Hút chỉ thải độc tố',
          )
        ],
      ),
    );
  }
}
