import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/text.dart';

class CreateNewWidget extends StatefulWidget {
  const CreateNewWidget({Key? key}) : super(key: key);

  @override
  _CreateNewWidgetState createState() => _CreateNewWidgetState();
}

class _CreateNewWidgetState extends State<CreateNewWidget> {
  @override
  Widget build(BuildContext context) {
    String weightFormat = 'Kg';
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
          'Tạo mới',
          style: TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600),
        ),
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
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.right,
                        style: text17xp6w,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nhập tên chỉ số',
                          hintStyle: text17xp6w,
                        ),
                      ),
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
                    Theme(
                      data: Theme.of(context).copyWith(
                        canvasColor: Colors.white,
                      ),
                      child: DropdownButton(
                        value: weightFormat,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                        icon: const Icon(Icons.arrow_drop_down),
                        onChanged: (String? newValue) {
                          setState(() {
                            weightFormat = newValue!;
                          });
                        },
                        items: <String>['Kg', 'g']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
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
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.upload_file,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Mô tả',
                style: text15xp6w8e,
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.only(left: 10, right: 10),
                height: 96,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white),
                child: const TextField(
                  // keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: 'Nhập mô tả hình ảnh ',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Color(0xff616161))),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12, top: 12),
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: mainGradiant,
                      boxShadow: [shadowMain]),
                  child: const Center(
                    child: Text(
                      'Tạo mới',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
