import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nam_training/features/core/account/widget/compare_widget.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/images.dart';
import 'package:nam_training/styles/text.dart';

class BodyFatWidget extends StatelessWidget {
  const BodyFatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLogin,
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
          'BodyFat',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CompareWidget()));
              },
              child: Text(
                'So sánh',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: primaryColor),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thông tin chỉ số',
                style: text15xp6w8e,
              ),
              Container(
                height: 56,
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tên chỉ số',
                      style: text15xp4w,
                    ),
                    Text(
                      'BodyFat',
                      style: text17xp6w,
                    )
                  ],
                ),
              ),
              Container(
                height: 56,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Đơn vị (Kg)',
                      style: text15xp4w,
                    ),
                    Row(
                      children: [
                        Text(
                          'Kg',
                          style: text17xp6w,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.grey,
                          size: 15,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 56,
                margin: const EdgeInsets.only(top: 12, bottom: 20),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Thông số ',
                      style: text15xp4w,
                    ),
                    Container(
                      width: 126,
                      height: 56,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: primaryColor),
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          Text(
                            '0',
                            style: text17xp6w,
                          ),
                          Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: primaryColor),
                            child: const Icon(
                              FontAwesomeIcons.plus,
                              color: Colors.white,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Text(
                'Liên kết đến liệu trình',
                style: text15xp6w8e,
              ),
              Container(
                height: 52,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
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
                margin: const EdgeInsets.only(top: 12, bottom: 24),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
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
              Text(
                'HÌnh ảnh',
                style: text15xp6w8e,
              ),
              Container(
                margin: const EdgeInsets.only(top: 16, bottom: 26),
                height: 198,
                width: double.infinity,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(
                          imagebody,
                        ),
                        fit: BoxFit.cover)),
              ),
              Text(
                'Mô tả',
                style: text15xp6w8e,
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(10),
                height: 96,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white),
                child: Text(
                  'Thân hình hoàn toàn bình thường',
                  style: text17xp4w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
