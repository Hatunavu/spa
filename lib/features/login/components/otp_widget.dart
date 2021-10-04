import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nam_training/bloc/register/register_cubit.dart';
import 'package:nam_training/features/login/components/button_widget.dart';
import 'package:nam_training/styles/colors.dart';

class OtpWidget extends StatefulWidget {
  const OtpWidget({Key? key}) : super(key: key);

  @override
  _OtpWidgetState createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  bool error = false;
  late Timer _timer;
  int _start = 30;
  late RegisterCubit registerCubit;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void initState() {
    registerCubit = context.read<RegisterCubit>();
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       size: 30,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   elevation: 0,
      //   backgroundColor: backgroundLogin,
      // ),
      backgroundColor: backgroundLogin,
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(left: 55, right: 55, top: 30, bottom: 15),
              child: Text(
                'Vui lòng nhập mã xác thực đã được gửi về số điện thoại',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textFieldOTP(
                    first: true, last: false, controller: _controller1),
                const SizedBox(
                  width: 15,
                ),
                _textFieldOTP(
                    first: false, last: false, controller: _controller2),
                const SizedBox(
                  width: 15,
                ),
                _textFieldOTP(
                    first: false, last: false, controller: _controller3),
                const SizedBox(
                  width: 15,
                ),
                _textFieldOTP(
                    first: false, last: false, controller: _controller4),
                const SizedBox(
                  width: 15,
                ),
                _textFieldOTP(
                    first: false, last: false, controller: _controller5),
                const SizedBox(
                  width: 15,
                ),
                _textFieldOTP(
                    first: false, last: false, controller: _controller6),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                child: error
                    ? const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Center(
                          child: Text(
                            'Mã OTP của bạn không đúng',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    : null),
            const Text(
              'Bạn không nhận được mã OTP?',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: Color(0xFF616161)),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'Gửi lại sau  00:${_start.toString()}',
              style: const TextStyle(
                  color: Color(0xFF7B64E4),
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Stack(
              children: [
                ButtonWidget(
                    onPressed: () {
                      registerCubit.veriifyOtp(_controller1.value.text +
                          _controller2.value.text +
                          _controller3.value.text +
                          _controller4.value.text +
                          _controller5.value.text +
                          _controller6.value.text);
                    },
                    content: 'Tiếp tục')
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget _textFieldOTP(
      {required bool first, last, required TextEditingController controller}) {
    return Container(
      height: 40,
      width: 40,
      // padding: const EdgeInsets.only(top: 35),123456
      decoration: BoxDecoration(
          border: error ? Border.all(color: Colors.red) : null,
          borderRadius: BorderRadius.circular(8),
          color: Colors.white),
      child: TextField(
        controller: controller,
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.length == 0 && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
            fillColor: Colors.white,
            // filled: true,
            counter: Offstage(),
            border: InputBorder.none),
      ),
    );
  }
}
