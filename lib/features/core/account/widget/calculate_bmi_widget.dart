import 'package:flutter/material.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/text.dart';

class CalculateBMIWidget extends StatefulWidget {
  final VoidCallback onPressed;
  const CalculateBMIWidget({Key? key, required this.onPressed})
      : super(key: key);

  @override
  _CalculateBMIWidgetState createState() => _CalculateBMIWidgetState();
}

class _CalculateBMIWidgetState extends State<CalculateBMIWidget> {
  String sex = 'Nam';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          margin: const EdgeInsets.only(top: 20, left: 16, right: 16),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Chiều cao (cm)',
                style: text15xp4w,
              ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.right,
                  style: text17xp6w,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '160',
                    hintStyle: text17xp6w,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 56,
          margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cân nặng (Kg)',
                style: text15xp4w,
              ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.right,
                  style: text17xp6w,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '50',
                    hintStyle: text17xp6w,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 56,
          width: double.infinity,
          margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Đơn vị (Kg)',
                style: text15xp4w,
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                ),
                child: DropdownButton(
                  value: sex,
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (String? newValue) {
                    setState(() {
                      sex = newValue!;
                    });
                  },
                  underline: Container(),
                  items: <String>['Nam', 'Nữ']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 56,
          margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6), color: Colors.white),
          child: Center(
            child: TextField(
              style: text17xp6w,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Số đo 2 vòng',
                hintStyle: text15xp4w,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: widget.onPressed,
          child: Container(
            margin: const EdgeInsets.all(16),
            height: 48,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: mainGradiant,
                boxShadow: [shadowMain]),
            child: const Center(
              child: Text(
                'Tính BMI',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
