import 'package:flutter/material.dart';
import 'package:nam_training/features/login/components/button_widget.dart';
import 'package:nam_training/features/login/components/input_widget.dart';
import 'package:nam_training/features/login/components/otp_widget.dart';
import 'package:nam_training/styles/colors.dart';

class RetrievalPasswordWidget extends StatefulWidget {
  const RetrievalPasswordWidget({Key? key}) : super(key: key);

  @override
  _RetrievalPasswordWidgetState createState() =>
      _RetrievalPasswordWidgetState();
}

class _RetrievalPasswordWidgetState extends State<RetrievalPasswordWidget> {
  final TextEditingController _phoneController = TextEditingController();

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
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(children: [
          Padding(
              padding: const EdgeInsets.only(
                  left: 55, right: 55, top: 30, bottom: 30),
              child: const Text(
                'Nhập số điện thoại để bắt đầu sử dụng',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              )),
          InputWidget(
            hintText: 'Số điện thoại',
            numberEnable: true,
            error: false,
            controller: _phoneController,
          ),
        ]),
        SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                child: const Text(
                  'Lấy lại mật khẩu',
                  style: TextStyle(
                      color: Color(0xFF7B64E4),
                      fontWeight: FontWeight.w600,
                      fontSize: 15),
                ),
                onTap: () {
                  dialogRetrievalPassword('Lấy lại mật khẩu',
                      'Mã OTP sẽ được gửi về số điện thoại mà bạn đã đăng ký');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 38),
                child: ButtonWidget(onPressed: () {}, content: 'Đăng ký'),
              ),
            ],
          ),
        )
      ]),
    );
  }

  void dialogRetrievalPassword(String title, String description) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              child: Container(
                width: 270,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color(0xFF8E8E8E),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    color: Color(0xFFE7EAEB),
                    height: 1,
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    right:
                                        BorderSide(color: Color(0xFFE7EAEB)))),
                            alignment: Alignment.center,
                            height: 43,
                            child: const Text(
                              'Hủy',
                              style: TextStyle(
                                  color: Color(0xFF7B64E4),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OtpWidget()));
                          },
                          child: Container(
                            height: 43,
                            alignment: Alignment.center,
                            child: const Text(
                              'Đồng ý',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFF7B64E4),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ));
        });
  }
}
