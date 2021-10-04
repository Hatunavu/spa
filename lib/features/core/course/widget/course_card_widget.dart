import 'package:flutter/material.dart';
import 'package:nam_training/styles/images.dart';
import 'package:nam_training/styles/text.dart';

class CourseCardWidget extends StatelessWidget {
  const CourseCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      height: 160,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Column(
        children: [
          Container(
              height: 78,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(

                  // ignore: unnecessary_const
                  border: const Border(
                      // ignore: unnecessary_const

                      bottom:
                          // ignore: unnecessary_const
                          const BorderSide(color: const Color(0xffeeeeee)))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 64,
                    // margin: EdgeInsets.only(top: 0),
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(imageCurrent), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.grey),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Chăm Sóc Cơ Thể Giúp Cải Thiện Làn Da Tối Màu Và Quá Trình ',
                        style: text15xp6w,
                      ),
                    ),
                  )
                ],
              )),
          // ignore: prefer_const_constructors
          SizedBox(
            height: 11,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
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
              ),
              // ignore: prefer_const_constructors
              Center(
                // ignore: prefer_const_constructors
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 8,
                  color: const Color(0xff8E8E8E),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
