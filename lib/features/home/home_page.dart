import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nam_training/bloc/response/response_cubit.dart';
import 'package:nam_training/features/core/account/account_page.dart';
import 'package:nam_training/features/core/course/course_page.dart';
import 'package:nam_training/features/core/schedule_page.dart';
import 'package:nam_training/features/core/support_page.dart';
import 'package:nam_training/features/home/widget/home_widget.dart';
import 'package:nam_training/repository/user_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final tabs = [
    const HomeWidget(),
    const SchedulePage(),
    const CoursePage(),
    SupportPage(),
    BlocProvider(
      create: (context) => ResponseCubit(
          userRepository: context.read<UserRepositoryImplement>()),
      child: const AccountPage(),
    )
  ];
  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: tabs[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 60,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            // ignore: prefer_const_constructors
            BottomNavigationBarItem(
                icon: const Icon(Icons.home, size: 20),
                // ignore: deprecated_member_use
                title: const Text(
                  'Trang chủ',
                  style: TextStyle(fontSize: 12),
                )),
            // ignore: prefer_const_constructors
            BottomNavigationBarItem(
                icon: const Icon(Icons.calendar_today, size: 20),
                // ignore: deprecated_member_use
                title: const Text('Lịch hẹn', style: TextStyle(fontSize: 12))),
            // ignore: prefer_const_constructors
            BottomNavigationBarItem(
                icon: const Icon(Icons.list_alt, size: 20),
                // ignore: deprecated_member_use
                title:
                    const Text('Liệu trình', style: TextStyle(fontSize: 12))),
            // ignore: prefer_const_constructors
            BottomNavigationBarItem(
                icon: const Icon(Icons.phone_in_talk, size: 20),
                // ignore: deprecated_member_use
                title: const Text('Hỗ trợ', style: TextStyle(fontSize: 12))),
            // ignore: prefer_const_constructors
            BottomNavigationBarItem(
                icon: const Icon(Icons.account_box, size: 20),
                // ignore: deprecated_member_use
                title: const Text('Tài khoản', style: TextStyle(fontSize: 12)))
          ],
          selectedItemColor: const Color(0xff745BD8),
          unselectedItemColor: const Color(0xffADB1B9),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
