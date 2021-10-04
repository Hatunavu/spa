import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nam_training/bloc/response/response_cubit.dart';
import 'package:nam_training/bloc/response/response_state.dart';
import 'package:nam_training/model/response_model.dart';
import 'package:nam_training/repository/user_repository.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/images.dart';
import 'package:nam_training/styles/text.dart';

class UpdateProfileWidget extends StatefulWidget {
  final Data data;
  const UpdateProfileWidget({Key? key, required this.data}) : super(key: key);

  @override
  _UpdateProfileWidgetState createState() => _UpdateProfileWidgetState();
}

class _UpdateProfileWidgetState extends State<UpdateProfileWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  late ResponseCubit responseCubit;
  final UserRepository userRepository = UserRepositoryImplement();

  Data get data => widget.data;
  XFile? imagePicked;
  @override
  void initState() {
    super.initState();
    responseCubit = context.read<ResponseCubit>();
    _usernameController.text = data.name;
    _phoneNumberController.text = data.mobile;
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _alertDialog(String title, String message) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);

                    if (message == 'Cập nhật thành công') {
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Đóng'))
            ],
          );
        });
  }

  Future _openGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        imagePicked = image;
      });
    } catch (e) {
      throw Exception('Error');
    }
  }

  Future _openCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      setState(() {
        imagePicked = image;
      });
    } catch (e) {
      throw Exception('Error');
    }
  }

  Future<void> pickUpImage() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Chọn ảnh'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    onTap: () {
                      _openGallery();
                      Navigator.pop(context);
                    },
                    child: const Text('Thư viện'),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      _openCamera();
                      Navigator.pop(context);
                    },
                    child: const Text('Camera'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Cập nhật thông tin',
                style: TextStyle(color: Colors.black),
              ),
              leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            backgroundColor: backgroundLogin,
            body: BlocConsumer<ResponseCubit, ResponseState>(
              listener: (context, responseState) {
                if (responseState is ResponseStateLoading) {
                  _showDialog();
                } else if (responseState is ResponseStateUploadSuccess) {
                  _alertDialog('Cập nhật thông tin', 'Cập nhật thành công');
                  // Navigator.pop(context);
                  // setState(() {
                  //   imagePicked = null;
                  // });
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //   content: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: const [
                  //       Text('Cập nhật thành công'),
                  //     ],
                  //   ),
                  //   backgroundColor: Colors.green,
                  // ));
                } else if (responseState is ResponseStateFailure) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Cập nhật thất bại'),
                        Icon(
                          Icons.error,
                          color: Colors.white,
                        )
                      ],
                    ),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              builder: (context, responseState) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: imagePicked == null
                                  ? data.avatar.isNotEmpty
                                      ? Image.network(
                                          '$imageUrl${data.avatar}',
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          imageAvtdf,
                                          fit: BoxFit.cover,
                                        )
                                  : Image.file(
                                      File(
                                        imagePicked!.path,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: InkWell(
                              onTap: pickUpImage,
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Icon(
                                    Icons.camera_alt_sharp,
                                    color: Colors.grey.withOpacity(0.5),
                                  )),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      InputInfor(
                        controller: _usernameController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputInfor(controller: _phoneNumberController),
                      const SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          imagePicked != null
                              ? responseCubit.uploadAvt(imagePicked!.path)
                              : null;
                        },
                        child: Container(
                          height: 48,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            gradient: imagePicked != null ? mainGradiant : null,
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Center(
                            child: Text(
                              'Cập nhật',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )));
  }
}

class InputInfor extends StatelessWidget {
  final TextEditingController controller;
  const InputInfor({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.white),
      height: 48,
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 15),
            hintStyle: TextStyle(color: Color(0xFF8E8E8E))),
      ),
    );
  }
}
