import 'package:flutter/material.dart';
import 'package:pomohabbit/screen/main/tab/s_calendar.dart';
import 'package:pomohabbit/screen/main/tab/s_home.dart';
import 'package:pomohabbit/screen/main/tab/s_mypage.dart';
import 'package:pomohabbit/screen/main/tab/s_timer.dart';

import '../../common/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabBarPage = [
    const Home(),
    const Timer(),
    const Calendar(),
    const MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _tabBarPage.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/timer.png")), label: "타이머"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/target.png")), label: "습관 달성률"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/calendar.png")), label: "주간캘린더"),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/images/mypage.png")), label: "마이 페이지"),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.black,
          selectedItemColor: AppColors.primaryColor),
    );
  }
}
