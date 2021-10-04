import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nam_training/features/core/booking%20manager/booking_manager_widget.dart';
import 'package:nam_training/features/home/widget/extension_widget.dart';
import 'package:nam_training/features/home/widget/live_stream_widget.dart';
import 'package:nam_training/styles/colors.dart';
import 'package:nam_training/styles/images.dart';
import 'package:nam_training/styles/text.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                        gradient: mainGradiant,
                        // ignore: prefer_const_constructors
                        image: DecorationImage(
                            image: const AssetImage(imageHead),
                            fit: BoxFit.cover)),
                  ),
                  const NotiIcon(),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [shadowMain]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Row(
                                children: [
                                  Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      height: 28,
                                      width: 28,
                                      child: SvgPicture.asset(
                                        imageCoin,
                                        fit: BoxFit.fill,
                                      )),
                                  // ignore: prefer_const_constructors
                                  Text(
                                    'Lê Thị Kim Thúy',
                                    style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 12),
                              width: 60,
                              height: 28,
                              decoration: BoxDecoration(
                                  color: const Color(0xffEFEEF3),
                                  borderRadius: BorderRadius.circular(24)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 16,
                                    width: 16,
                                    margin: const EdgeInsets.only(right: 6),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(90)),
                                    child: SvgPicture.asset(imageCoin),
                                  ),
                                  Text(
                                    '120',
                                    style: text15xp4w,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 36, right: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BookingManagerWidget()));
                      },
                      child: const Category(
                          icon: Icons.calendar_today, text: 'Đặt lịch')),
                  const Category(icon: Icons.qr_code, text: 'Sản phẩm'),
                  const Category(icon: Icons.room_service, text: 'Dịch vụ'),
                  const Category(icon: Icons.select_all, text: 'Dịch vụ'),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Cover(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 24, bottom: 12),
              child: Text(
                'Ưu đãi dành cho bạn',
                style: text20xp6w,
              ),
            ),
            Extention(
              image: imageForyou,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 12),
              child: Text(
                'Ưu đãi nổi bật',
                style: text20xp6w,
              ),
            ),
            Extention(image: imageNew),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 12),
              child: Row(
                children: [
                  // ignore: prefer_const_constructors
                  Icon(
                    Icons.circle,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Live Stream',
                    style: text20xp6w,
                  ),
                ],
              ),
            ),
            const LiveStream(),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 12),
              child: Text(
                'Tin tức',
                style: text20xp6w,
              ),
            ),
            Extention(image: imageAttention),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class NotiIcon extends StatelessWidget {
  const NotiIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ignore: prefer_const_constructors
        Positioned(
          right: 20,
          top: 40,
          // ignore: prefer_const_constructors
          child: Stack(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
              // ignore: prefer_const_constructors
              Positioned(
                  right: 0,
                  top: 0,
                  // ignore: prefer_const_constructors
                  child: Stack(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 16,
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        // ignore: unnecessary_const
                        // ignore: prefer_const_constructors
                        child: Center(
                          child: const Text(
                            '3',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        )
      ],
    );
  }
}

class Category extends StatelessWidget {
  final IconData icon;
  final String text;
  const Category({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 44,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  gradient: mainGradiant,
                  borderRadius: BorderRadius.circular(18)),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          text,
          style: text15xp4w,
        )
      ],
    );
  }
}

class Cover extends StatelessWidget {
  const Cover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 150,
        decoration: BoxDecoration(
            // ignore: prefer_const_constructors
            image: DecorationImage(
                image: const AssetImage(imageCover), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8)),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // ignore: prefer_const_literals_to_create_immutables
                gradient: LinearGradient(begin: Alignment.centerLeft, stops: [
                  0.1,
                  0.5
                ], colors: [
                  Colors.black.withOpacity(.3),
                  Colors.black.withOpacity(.1)
                ])),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 18, bottom: 16),
                    width: 160,
                    // ignore: prefer_const_constructors
                    child: Text(
                      'Những thói quen khiến da lão hóa',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 7),
                      width: 90,
                      height: 36,
                      decoration: BoxDecoration(
                          gradient: mainGradiant,
                          borderRadius: BorderRadius.circular(28)),
                      // ignore: prefer_const_constructors
                      child: Center(
                        // ignore: prefer_const_constructors
                        child: Text('Xem ngay',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            )),
                      ))
                ],
              ),
            )));
  }
}

// ignore: must_be_immutable
class Extention extends StatelessWidget {
  String image;
  Extention({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 264,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ExtensionWidget(
            image: image,
            infor: 'Sở hữu trang sức ngọc trai của Hoàng Gia Pearl ưu đãi 15% ',
            time: 'Có giá trị đến 08/07/2021',
          ),
          ExtensionWidget(
            image: image,
            infor: 'Sở hữu trang sức ngọc trai của Hoàng Gia Pearl ưu đãi 15% ',
            time: 'Có giá trị đến 08/07/2021',
          ),
          ExtensionWidget(
            image: image,
            infor: 'Sở hữu trang sức ngọc trai của Hoàng Gia Pearl ưu đãi 15% ',
            time: 'Có giá trị đến 08/07/2021',
          ),
        ],
      ),
    );
  }
}

class LiveStream extends StatelessWidget {
  const LiveStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // ignore: prefer_const_constructors
          LiveStreamWidget(
            image: imageLivestream,
            infor: 'Sở hữu trang sức ngọc trai của Hoàng Gia Pearl ưu đãi 15% ',
          ),
          // ignore: prefer_const_constructors
          LiveStreamWidget(
            image: imageLivestream,
            infor: 'Sở hữu trang sức ngọc trai của Hoàng Gia Pearl ưu đãi 15% ',
          ),
          // ignore: prefer_const_constructors
          LiveStreamWidget(
            image: imageLivestream,
            infor: 'Sở hữu trang sức ngọc trai của Hoàng Gia Pearl ưu đãi 15% ',
          )
        ],
      ),
    );
  }
}
