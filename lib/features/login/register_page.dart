import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nam_training/bloc/authentication/authentication_cubit.dart';
import 'package:nam_training/bloc/register/register_cubit.dart';
import 'package:nam_training/bloc/register/register_state.dart';
import 'package:nam_training/features/login/components/button_widget.dart';
import 'package:nam_training/features/login/components/input_widget.dart';
import 'package:nam_training/features/login/components/otp_widget.dart';
import 'package:nam_training/styles/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool agree = false;
  late AuthenticationCubit authenticationCubit;
  late RegisterCubit registerCubit;
  @override
  void initState() {
    authenticationCubit = context.read<AuthenticationCubit>();
    registerCubit = context.read<RegisterCubit>();
    super.initState();
  }

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
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, loginState) {
          if (loginState is RegisterStateComplete) {
            authenticationCubit.loggedIn();
          } else if (loginState is RegisterStateException) {
            final String message = loginState.message;
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(message),
                    const Icon(
                      Icons.error,
                      color: Colors.white,
                    )
                  ],
                ),
                backgroundColor: Colors.red,
              ));
          }
        },
        builder: (context, loginState) {
          if (loginState is RegisterStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (loginState is RegisterStateComplete) {
            SchedulerBinding.instance!.addPostFrameCallback((_) {
              Navigator.pop(context);
            });
          } else if (loginState is RegisterStateOtpSent) {
            return const OtpWidget();
          } else if (loginState is RegisterStateException) {}
          return NumberInput(
            registerCubit: registerCubit,
          );
        },
      ),
    );
  }
}

class NumberInput extends StatelessWidget {
  late RegisterCubit registerCubit;
  NumberInput({Key? key, required this.registerCubit}) : super(key: key);
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding:
                    EdgeInsets.only(left: 55, right: 55, top: 30, bottom: 30),
                child:
                    // numberDemo.isEmpty || numberDemo == '000000000'
                    //     ?
                    Text(
                  'Nhập số điện thoại để bắt đầu sử dụng',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                )
                // : numberDemo.length == 9
                //     ? Column(
                //         // ignore: prefer_const_literals_to_create_immutables
                //         children: [
                //           const Text(
                //             'Số điện thoại của bạn chưa được tạo tài khoản',
                //             textAlign: TextAlign.center,
                //             style: TextStyle(
                //                 fontWeight: FontWeight.w600, fontSize: 20),
                //           ),
                //           const Text(
                //             'Đăng ký ngay số điện thoại này',
                //             textAlign: TextAlign.center,
                //             style: TextStyle(
                //                 fontWeight: FontWeight.w600, fontSize: 20),
                //           ),
                //         ],
                //       )
                //     : const Text(
                //         'Nhập số điện thoại để bắt đầu sử dụng',
                //         textAlign: TextAlign.center,
                //         style: TextStyle(
                //             fontWeight: FontWeight.w600, fontSize: 22),
                //       ),
                ),
            InputWidget(
                controller: _phoneController,
                hintText: 'Số điện thoại',
                numberEnable: true,
                error: false
                //  numberDemo.length != 9 ? true : false,
                ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20, top: 12, right: 20),
            //   child: numberDemo.length != 9
            //       ? const Text(
            //           'Số điện thoại của bạn không đúng',
            //           style: TextStyle(
            //               color: Colors.red,
            //               fontWeight: FontWeight.w400,
            //               fontSize: 15),
            //         )
            //       : numberDemo == '000000000'
            //           ? null
            //           : Row(
            //               children: [
            //                 Expanded(
            //                     flex: 1,
            //                     child: Center(
            //                       child: InkWell(
            //                         onTap: () {
            //                           setState(() {
            //                             agree = !agree;
            //                           });
            //                         },
            //                         child: Container(
            //                           height: 24,
            //                           width: 24,
            //                           decoration: BoxDecoration(
            //                             borderRadius:
            //                                 BorderRadius.circular(20),
            //                             border: Border.all(
            //                                 color: const Color(0xFF7265E3)),
            //                             color: agree
            //                                 ? const Color(0xFF7265E3)
            //                                 : Colors.white,
            //                           ),
            //                           child: const Icon(
            //                             Icons.arrow_back,
            //                             color: Colors.white,
            //                             size: 18,
            //                           ),
            //                         ),
            //                       ),
            //                     )),
            //                 const Expanded(
            //                     flex: 9,
            //                     child: Padding(
            //                       padding: EdgeInsets.only(left: 10),
            //                       child: Text(
            //                         'Tôi đã đọc và đồng ý với điều khoản sử dụng của Spa',
            //                         style: TextStyle(
            //                             fontWeight: FontWeight.w400,
            //                             fontSize: 15),
            //                       ),
            //                     ))
            //               ],
            //             ),
            // ),
          ],
        ),
        SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ButtonWidget(
                    onPressed: () {
                      registerCubit
                          .sentOtpEvent('+84${_phoneController.value.text}');
                    },
                    content: 'Tiếp tục'))),
      ],
    );
  }
}
