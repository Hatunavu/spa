import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nam_training/features/home/home_page.dart';
import 'package:nam_training/features/login/components/button_widget.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/images.dart';

class ChangePassCplet extends StatelessWidget {
  const ChangePassCplet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLogin,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 100, left: 55, right: 55, bottom: 30),
                child: Container(
                  child: SvgPicture.asset(
                    imageChangePassCplet,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const Text(
                'Đổi mật khẩu thành công',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              )
            ],
          ),
          SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ButtonWidget(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      content: 'Về trang chủ'))),
        ],
      ),
    );
  }
}
