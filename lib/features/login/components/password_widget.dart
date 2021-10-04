import 'package:flutter/material.dart';
import 'package:nam_training/features/login/components/button_widget.dart';
import 'package:nam_training/features/login/components/change_pass_cplet.dart';
import 'package:nam_training/features/login/components/input_widget.dart';
import 'package:nam_training/styles/colors.dart';

class PasswordWidget extends StatefulWidget {
  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  bool error = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: backgroundLogin,
        ),
        backgroundColor: backgroundLogin,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Padding(
                    padding: EdgeInsets.only(
                        left: 55, right: 55, top: 30, bottom: 30),
                    child: Text(
                      'Nhập mật khẩu để bắt đầu sử dụng',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                    )),
                InputWidget(
                  hintText: 'Mật khẩu',
                  numberEnable: false,
                  error: false,
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 12,
                ),
                InputWidget(
                  hintText: 'Nhập lại mật khẩu',
                  numberEnable: false,
                  error: error ? true : false,
                  controller: _passwordConfirmController,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 12),
                  child: error
                      ? const Text(
                          'Mật khẩu không trùng nhau',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        )
                      : null,
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
                                builder: (context) => ChangePassCplet()));
                      },
                      content: 'Đăng ký')),
            )
          ],
        ));
  }
}
