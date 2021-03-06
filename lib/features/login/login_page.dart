import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nam_training/bloc/authentication/authentication_cubit.dart';
import 'package:nam_training/bloc/login/login_cubit.dart';
import 'package:nam_training/bloc/login/login_state.dart';
import 'package:nam_training/bloc/register/register_cubit.dart';
import 'package:nam_training/features/login/components/button_widget.dart';
import 'package:nam_training/features/login/components/input_widget.dart';
import 'package:nam_training/features/login/components/social_button_wigdet.dart';
import 'package:nam_training/features/login/register_page.dart';
import 'package:nam_training/model/api_model.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/images.dart';
import 'package:nam_training/repository/user_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginRequestModel requestModel = LoginRequestModel(
      username: '', password: '', grantType: '', userType: '');
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late AuthenticationCubit authenticationCubit;
  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  @override
  void initState() {
    authenticationCubit = context.read<AuthenticationCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLogin,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, loginState) {
          if (loginState is LoginStateLoading) {
            _showDialog();
          } else if (loginState is LoginStateSuccess) {
            authenticationCubit.loggedIn();
            Navigator.pop(context);
          } else if (loginState is LoginStateFailure) {
            Navigator.pop(context);
            Scaffold.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Login Failure'),
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
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 76, left: 55, right: 55),
                      child: Container(
                        child: SvgPicture.asset(
                          imageLogin,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    const Text(
                      'Xin ch??o b???n ?????n v???i Spa',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        'Nh???p s??? ??i???n tho???i ho???c ????ng nh???p b???ng ???ng d???ng th?? 3 ????? b???t ?????u s??? d???ng d???ch v???',
                        style: TextStyle(
                            color: Color(0xFF616161),
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputWidget(
                      hintText: 'S??? ??i???n tho???i',
                      numberEnable: true,
                      error: false,
                      controller: _phoneController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputWidget(
                      hintText: 'M???t kh???u',
                      numberEnable: false,
                      error: false,
                      controller: _passwordController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ButtonWidget(
                      onPressed: () {
                        requestModel.username = _phoneController.text;
                        requestModel.password = _passwordController.text;
                        requestModel.grantType = 'password';
                        requestModel.userType = 'player';
                        context
                            .read<LoginCubit>()
                            .loginButtonPressed(requestModel);
                      },
                      content: '????ng nh???p',
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(left: 20, right: 16),
                          child: const Divider(
                            color: Color(0xFFC7C7C7),
                          ),
                        )),
                        const Text(
                          'Ho???c',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF969FA2)),
                        ),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.only(left: 16, right: 20),
                          child: const Divider(
                            color: Color(0xFFC7C7C7),
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    SocialButtonWidget(
                      loginWith: '????ng nh???p b???ng Facebook',
                      icon: FontAwesomeIcons.facebook,
                      color: const Color(0xFF446AB5),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SocialButtonWidget(
                      loginWith: '????ng nh???p b???ng Google',
                      icon: FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SocialButtonWidget(
                      loginWith: '????ng nh???p b???ng Apple',
                      icon: FontAwesomeIcons.apple,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                            children: [
                          const TextSpan(text: 'B???n ch??a c?? t??i kho???n?'),
                          TextSpan(
                              text: ' ????ng k??',
                              style: const TextStyle(color: Color(0xFF7265E3)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BlocProvider(
                                            create: (context) => RegisterCubit(
                                                userRepository: RepositoryProvider
                                                    .of<UserRepositoryImplement>(
                                                        context)),
                                            child: const RegisterPage()),
                                      ));
                                })
                        ])),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              // Container(
              //      child: loginState is LoginStateLoading ? _showDialog : null,
              //     )
              // Container(
              //   child: loginState is LoginStateLoading
              //       ? Stack(
              //           children: [
              //             const Opacity(
              //               opacity: 0.3,
              //               child: ModalBarrier(
              //                   dismissible: false, color: Colors.grey),
              //             ),
              //             const Center(child: CircularProgressIndicator()),
              //           ],
              //         )
              //       : null,
              // )
            ],
          );
        },
      ),
    );
  }
}
