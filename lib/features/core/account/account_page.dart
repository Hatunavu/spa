import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nam_training/bloc/authentication/authentication_cubit.dart';
import 'package:nam_training/bloc/response/response_cubit.dart';
import 'package:nam_training/bloc/response/response_state.dart';
import 'package:nam_training/features/core/account/widget/body_index_widget.dart';
import 'package:nam_training/features/core/account/widget/member_rank_widget.dart';
import 'package:nam_training/features/core/account/widget/noti_widget.dart';
import 'package:nam_training/features/core/account/widget/setting_widget.dart';
import 'package:nam_training/features/core/account/widget/update_profile_widget.dart';
import 'package:nam_training/features/core/account/widget/voucher_widget.dart';
import 'package:nam_training/model/response_model.dart';
import 'package:nam_training/repository/user_repository.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/images.dart';
import 'package:nam_training/styles/text.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  UserRepository userRepository = UserRepositoryImplement();
  late AuthenticationCubit authenticationCubit;
  late ResponseCubit responseCubit;

  @override
  void initState() {
    responseCubit = context.read<ResponseCubit>();
    responseCubit.fetchData();
    authenticationCubit = context.read<AuthenticationCubit>();
    super.initState();
  }

  FutureOr<dynamic> onGoBack(dynamic value) async {
    await responseCubit.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResponseCubit, ResponseState>(
        builder: (context, responseState) {
      if (responseState is ResponseStateLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (responseState is ResponseStateFailure) {
        authenticationCubit.loggedOut();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Load Data Failure'),
              Icon(
                Icons.error,
                color: Colors.white,
              )
            ],
          ),
          backgroundColor: Colors.red,
        ));
      }
      final responseModel =
          (responseState as ResponseStateSuccess).responseModel;
      final data = responseModel.data;
      return SafeArea(
        child: Container(
          width: double.infinity,
          color: backgroundLogin,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                height: 44,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Text(
                      'Tài khoản',
                      style: text22xp6w,
                    ),
                  ],
                ),
              ),
              // MainInfor(
              //   data: data,
              // ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => ResponseCubit(
                                    userRepository: context
                                        .read<UserRepositoryImplement>()),
                                child: UpdateProfileWidget(
                                  data: data,
                                ),
                              ))).then(onGoBack);
                },
                child: Container(
                  height: 112,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 88,
                                width: 88,
                                margin: const EdgeInsets.only(right: 16),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: data.avatar.isEmpty
                                        ? const DecorationImage(
                                            image: AssetImage(imageAvtdf),
                                            fit: BoxFit.cover)
                                        : DecorationImage(
                                            image: NetworkImage(
                                                '$imageUrl${data.avatar}'),
                                            fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name,
                                style: text17xp6w,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                data.mobile,
                                style: text15xp4w,
                              )
                            ],
                          )
                        ],
                      ),
                      const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 25,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Column(
                children: const [
                  ItemInfor(
                    content: 'Chỉ số cơ thể',
                    icon: Icons.ac_unit,
                    colorIcon: Colors.blue,
                    screen: BodyIndexWidget(),
                  ),
                  ItemInfor(
                    content: 'Hạng thành viên',
                    icon: Icons.stop_outlined,
                    colorIcon: Colors.red,
                    screen: MemberRankWidget(),
                  ),
                  ItemInfor(
                    content: 'Ưu đãi của tôi',
                    icon: Icons.money,
                    colorIcon: Colors.purple,
                    screen: VoucherWidget(),
                  ),
                  ItemInfor(
                    content: 'Thông báo',
                    icon: Icons.info_rounded,
                    colorIcon: Colors.yellow,
                    screen: NotiWidget(),
                  ),
                  ItemInfor(
                    content: 'Cài đặt',
                    icon: Icons.settings,
                    colorIcon: Colors.green,
                    screen: SettingWidget(),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Container(
                    height: 56,
                    width: 72,
                    color: Colors.white,
                    child: const Icon(
                      Icons.exit_to_app,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      authenticationCubit.loggedOut();
                    },
                    child: Container(
                      height: 56,
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        children: [
                          Text(
                            'Đăng xuất',
                            style: text17xp4w,
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}

class MainInfor extends StatelessWidget {
  final Data data;
  MainInfor({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider(
                      create: (context) => ResponseCubit(
                          userRepository:
                              context.read<UserRepositoryImplement>()),
                      child: UpdateProfileWidget(
                        data: data,
                      ),
                    )));
      },
      child: Container(
        height: 112,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 88,
                      width: 88,
                      margin: const EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: data.avatar.isEmpty
                              ? const DecorationImage(
                                  image: AssetImage(imageAvtdf),
                                  fit: BoxFit.cover)
                              : DecorationImage(
                                  image:
                                      NetworkImage('$imageUrl${data.avatar}'),
                                  fit: BoxFit.cover)),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style: text17xp6w,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      data.mobile,
                      style: text15xp4w,
                    )
                  ],
                )
              ],
            ),
            const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 25,
            )
          ],
        ),
      ),
    );
  }
}

class ItemInfor extends StatelessWidget {
  final String content;
  final IconData icon;
  final Color colorIcon;
  final Widget screen;
  const ItemInfor(
      {Key? key,
      required this.content,
      required this.icon,
      required this.colorIcon,
      required this.screen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Row(
        children: [
          Container(
            color: Colors.white,
            width: 72,
            height: 56,
            child: Icon(
              icon,
              color: colorIcon,
              size: 25,
            ),
          ),
          Expanded(
              child: Container(
            height: 56,
            padding: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                color: Colors.grey.withOpacity(0.2),
              )),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  content,
                  style: text17xp4w,
                ),
                const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                  size: 15,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
