import 'package:flutter/material.dart';
import 'package:nam_training/features/core/account/widget/calculate_bmi_widget.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/text.dart';

class ParamWidget extends StatefulWidget {
  const ParamWidget({Key? key}) : super(key: key);

  @override
  _ParamWidgetState createState() => _ParamWidgetState();
}

class _ParamWidgetState extends State<ParamWidget> {
  bool update = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(top: 1),
            height: 36,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: primaryColor))),
                        child: Center(
                          child: Text('BMI', style: text15xp6w),
                        ))),
                Expanded(
                    flex: 1,
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0xffEFF0F3)))),
                        child: Center(
                          child: Text('WHR', style: text15xp6w),
                        ))),
                Expanded(
                    flex: 1,
                    child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0xffEFF0F3)))),
                        child: Center(
                          child: Text('WHR', style: text15xp6w),
                        )))
              ],
            ),
          ),
          update
              ? CalculateBMIWidget(
                  onPressed: () {
                    setState(() {
                      update = !update;
                    });
                  },
                )
              : Column(
                  children: [
                    Container(
                      height: 126,
                      margin: const EdgeInsets.only(top: 3, bottom: 12),
                      color: Colors.white,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'BMI của bạn là',
                              style: text15xp4w,
                            ),
                            Text(
                              '23.2',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                  color: primaryColor),
                            ),
                            Text(
                              'Bình thường',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: primaryColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Giới thiệu chung',
                            style: text17xp6w,
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          Text(
                            bmi,
                            style: text15xp4w,
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thang đánh giá',
                            style: text17xp6w,
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Liên kết với liệu trình',
                            style: text17xp6w,
                          ),
                          Container(
                            height: 52,
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.2))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chọn liệu trình',
                                  style: text17xp4w,
                                ),
                                const Icon(
                                  Icons.arrow_back_ios,
                                  size: 12,
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 52,
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 12, bottom: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.2))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chọn buổi',
                                  style: text17xp4w,
                                ),
                                const Icon(
                                  Icons.arrow_back_ios,
                                  size: 12,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          update = !update;
                        });
                      },
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
                            'Tạo mới',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
